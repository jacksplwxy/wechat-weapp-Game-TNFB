const { tunnel } = require('../qcloud')
const { mysql } = require('../qcloud')

const option = {
  MAX_SCORE_GAP: 10000,//匹配的玩家最大分差不能超过10000分
  MATCH_SPEED: 3000,//匹配的频率:每3秒遍历匹配一次
  QUESTION_NUMBER: 5,//答题数5个
  SEND_QUESTIONS_DELAY: 3500,//匹配完成后，间隔3.5S后开始向前端发题
  SEND_QUESTION_TIME: 16000,//发题的频率：每16秒发送一题
  PING_PONG_TIME: 6000,//PING-PONG响应的PING发送频率
  PING_PONG_OUT_TIME: 20000,//PING-PONG响应超时时间
  MAX_NUMBER_TUNNEL_RESEND: 3,//每个信道允许出现无效信道时重新发送的次数
}
const players = {} //用户信息存储对象：openId为key
const rooms = {}//房间存储对象：房间名为key
const fightingRecord = {}//每局比赛战绩存储对象：房间名为key，包含:openId_winner,openId_loser,score_winner,score_loser
const match = {//匹配对象：包含数据和函数
  queueData: [],
  init() {
    let finished = true
	function match_succ(player1,player2){
		//创建房间
        match.createRoom(player1.openId, player2.openId)
        //队列中删除匹配好的2个玩家
        tools.deleteQueueOpenId(player1.openId)
        tools.deleteQueueOpenId(player2.openId)
	}
    const loopMatch = setInterval(() => {
      if (finished) {
        finished = false
        for (let index1 = 0; index1 < this.queueData.length; index1++) {
          let player1 = players[this.queueData[index1]]
		  //排位赛匹配
          if (player1.friendsFightingRoom === undefined) {
            for (let index2 = index1; index2 < this.queueData.length; index2++) {
              let player2 = players[this.queueData[index2]]
              if (player2.friendsFightingRoom === undefined && player2.sortId === player1.sortId && Math.abs(player2.score - player1.score) < option.MAX_SCORE_GAP && player2.openId !== player1.openId) {
                match_succ(player1,player2)
				//结束该player1的匹配
                break
              }
            }
          }
		  //好友匹配
          if (player1.friendsFightingRoom !== undefined && player1.friendsFightingRoom !== null) {
            for (let index2 = index1; index2 < this.queueData.length; index2++) {
              let player2 = players[this.queueData[index2]]
              if (player2.friendsFightingRoom !== undefined && player2.friendsFightingRoom !== null && player2.friendsFightingRoom === player1.friendsFightingRoom && player2.openId !== player1.openId) {
                this.match_succ(player1,player2)
                //结束该player1的匹配
                break
              }
            }
          }
        }
        finished = true
      }
    }, option.MATCH_SPEED)
  },
  createRoom(openId1, openId2) {
    let roomName = new Date().getTime().toString() + parseInt(Math.random() * 10000000)//创建时间+随机数
    rooms[roomName] = {
      roomName,
      player1: openId1,
      player2: openId2,
      library: null,
      responseNumber: 0,//收到的响应次数
      finished: false,//是否完成了答题
    }
    players[openId1].roomName = roomName
    players[openId2].roomName = roomName
    console.info('创建后的总房间和玩家为:', rooms, players)
    //library,默认包含5道题目
    mysql('question_detail').where((players[openId1].sortId == 1) ? {} : { sort_id: players[openId1].sortId }).select('*').orderByRaw('RAND()').limit(option.QUESTION_NUMBER).then(res => {
      rooms[roomName].library = res  //将查询到的题目存到房间的题库library中
      //房间创建完成后通知前端匹配完成
      tools.broadcast([players[openId1].tunnelId, players[openId2].tunnelId], 'matchNotice', {
        'player1': {
          openId: openId1,
          nickName: players[openId1].nickName,
          avatarUrl: players[openId1].avatarUrl,
          roomName,
        },
        'player2': {
          openId: openId2,
          nickName: players[openId2].nickName,
          avatarUrl: players[openId2].avatarUrl,
          roomName,
        }
      })
      //向客户端发题
      tools.sendQuestionMain(roomName)
    },error=>{
         console.log(error)
    })
  },
}
match.init()
const tools = {//工具对象，包含常用数据和函数
  data: {
    timerSendQuestion: [],//每个房间的发题定时器
    numberTunnelResend: [],//key为信道ID，记录每个信道重复发送的次数
  },
  //广播到指定信道
  broadcast(tunnelIdsArray, type, content) {
    tunnel.broadcast(tunnelIdsArray, type, content)
      .then(result => {
        const invalidTunnelIds = result.data && result.data.invalidTunnelIds || []
        if (invalidTunnelIds.length) {
          console.error('======检测到无效的信道IDs======', invalidTunnelIds)
          invalidTunnelIds.forEach(tunnelId => {
            let number = this.data.numberTunnelResend[tunnelId] ? this.data.numberTunnelResend[tunnelId] : 0
            if (number < option.MAX_NUMBER_TUNNEL_RESEND) {//当发送次数不大于规定次数时，可以进行重发
              let timer = setTimeout(() => {//1.5S后重发一次数据
                this.data.numberTunnelResend[tunnelId] = ++number
                tools.broadcast([tunnelId], type, content)
                clearTimeout(timer)
              }, 2000)
            } else {
                 console.log('当前的numberTunnelResend长度为：', Object.keys(this.data.numberTunnelResend).length)
                 if (Object.keys(this.data.numberTunnelResend).length > 20) { //当累积未清理掉的无效信道达到20个时，清空一次数组
                this.data.numberTunnelResend = []
                console.info('清空后的numberTunnelResend为', this.data.numberTunnelResend)
              } else {
                this.clsTimeout(tunnelId, this.data.numberTunnelResend)
                console.info('删除后的numberTunnelResend为', this.data.numberTunnelResend)
              }
            }
          })
        }
         }, error => {
              console.log(error)
         })
  },
  //关闭指定信道
  closeTunnel(tunnelId) {
    console.info('开始关闭信道:' + tunnelId)
    tunnel.closeTunnel(tunnelId)
    let openId = this.getPlayersOpenId(tunnelId)
    if (players[openId]) {
      if (players[openId].roomName) {
        if (rooms[players[openId].roomName]) {
          if (!rooms[players[openId].roomName].finished) {//如果用户存在房号，则说明是战斗状态断线，视为逃跑
            tools.runAway(openId)
          }
        }
      }
      if (players[openId]) {
        if (players[openId].roomName) {
          this.clsTimeout(players[openId].roomName, tools.data.timerSendQuestion)//清除发题定时器
          delete rooms[players[openId].roomName]//删除房间
        }
        this.deleteQueueOpenId(openId)//删除匹配队列中的openId
        delete players[openId]//删除玩家信息
        console.info('信道关闭后的队列、玩家、房间和发题定时器为：', match.queueData, players, rooms, tools.data.timerSendQuestion)
      }
    }
  },
  //根据信道ID获取openId
  getPlayersOpenId(tunnelId) {
    for (let index in players) {
      if (players[index].tunnelId === tunnelId) {
        return index
      }
    }
    return null
  },
  //删除匹配队列中的指定openId
  deleteQueueOpenId(openId) {
    let index = match.queueData.indexOf(openId)
    if (~index) {
      match.queueData.splice(index, 1)
    }
  },
  //清除数组中延时定时器
  clsTimeout(index, arr) {
    clearTimeout(arr[index])
    delete arr[index]
  },
  //主控发题函数
  sendQuestionMain(roomName) {
    let sendQuestionsDelay = setTimeout(() => {
      this.sendQuestion(roomName)
      clearTimeout(sendQuestionsDelay)
    }, option.SEND_QUESTIONS_DELAY)
  },
  //发题函数
  sendQuestion(roomName) {
    try {
      let openId1 = rooms[roomName].player1
      let openId2 = rooms[roomName].player2
      this.clsTimeout(roomName, this.data.timerSendQuestion)
      tools.broadcast([players[openId1].tunnelId, players[openId2].tunnelId], 'sendQuestion', {
        question: rooms[roomName].library[0] ? rooms[roomName].library[0] : {},
        //choice = []//[openID:'',userChoose: '',//用户选择了第几个答案 answerColor: '',//用户是否答对 scoreMyself: 0,//用户总得分]
        choicePlayer1: players[openId1].choice,
        choicePlayer2: players[openId2].choice
      })
      console.info('已经向客户端发送一题')
      this.data.timerSendQuestion[roomName] = setTimeout(() => {
        this.sendQuestion(roomName)
      }, option.SEND_QUESTION_TIME)
      //当发送完{}时，清除掉定时器
      if (rooms[roomName].library[0] ? false : true) {
        this.clsTimeout(roomName, this.data.timerSendQuestion)
      }
      rooms[roomName].library.shift() //发送一个，原始题库就删除一个
      rooms[roomName].responseNumber = 0  //初始化房间响应次数
      players[openId1].choice[1] = ''//初始化用户选择状态:第几个答案
      players[openId1].choice[2] = ''//初始化用户选择状态:是否答对
      players[openId2].choice[1] = ''//初始化用户选择状态:第几个答案
      players[openId2].choice[2] = ''//初始化用户选择状态:是否答对
    } catch (error) {
      console.error('错误:' + error)
    }
  },
  //更新得分
  updateScore(openId, fightingResult) {
    mysql('cSessionInfo').where({ open_id: openId }).select('score').then(res => {//获取原始得分
      let score = res[0].score
      if (fightingResult === 1) {
        score = score + 10
      } else if (fightingResult === 0) {
        score = score - 10
        if (score < 0) {
          score = 0
        }
      } else {
        return
      }
      mysql('cSessionInfo').where({ open_id: openId }).update('score', score).then(res => {
        console.info(openId + '得分已更新:' + score)
      }, error => {
           //201803010019:此处添加数据库操作失败报错
           console.log(error)
      })
    })
  },
  //逃跑处理函数：
  runAway(openId) {
    //获取逃跑者和胜利者的openId
    console.info('开始执行逃跑函数')
    let openIdFail = openId, openIdWin
    let room = rooms[players[openIdFail].roomName]
    if (openIdFail === room.player1) {
      openIdWin = room.player2
    } else {
      openIdWin = room.player1
    }
    //更新得分
    this.updateScore(openIdWin, 1)
    this.updateScore(openIdFail, 0)
    //存储比赛结果
    this.storeFightingRecord(openIdWin, 1, true)
    this.storeFightingRecord(openIdFail, 0, true)
    //通知赢家对方已逃跑
    if (players[openId]) {
      if (players[openId].roomName) {
        rooms[players[openId].roomName].finished = true//先改变房间状态，再关闭，避免被认为逃跑行为
      }
    }
    this.broadcast([players[openIdWin].tunnelId], 'runawayNotice', {
      message: '对手已逃跑'
    })
    //有时出现无效信道ID，导致onclose无法删除用户信息，这里手工补充删除
    delete players[openId]//删除玩家信息
  },
  //保存战绩函数：
  //fightingResult： 0:表示输，1：表示赢,2:表示平手
  //runAway:true/false
  async storeFightingRecord(openId, fightingResult, runAway = false) {
    let roomName = players[openId].roomName
    try {
      if (fightingRecord[roomName] ? false : true) {
        fightingRecord[roomName] = {
          openId_winner: '',
          openId_loser: '',
          score_winner: 0,
          score_loser: 0,
        }
      }
      let myRecord = fightingRecord[roomName]
      //获取双方比赛数据
      if (fightingResult == 0) {//0为输
        myRecord.openId_loser = openId
        myRecord.score_loser = players[openId].choice[3]
      } else {
        myRecord.openId_winner = openId
        myRecord.score_winner = players[openId].choice[3]
      }
      //当获取到双方的数据时，开始存储到数据库
      if (myRecord.openId_winner && myRecord.openId_loser) {
        let room_name = roomName,
          run_away = runAway,
          open_id_winner = myRecord.openId_winner,
          open_id_loser = myRecord.openId_loser,
          score_winner = myRecord.score_winner,
          score_loser = myRecord.score_loser
        delete fightingRecord[room_name]
         try{
              await mysql('fighting_record').insert({ id: null, room_name, run_away, open_id_winner, open_id_loser, score_winner, score_loser, time: null })
         }catch(error){
              console.log(error)
         }
        console.log('清空后的fightingRecord为', fightingRecord)
      }
    } catch (error) {
      console.log(error)
    }
  },

}

/**
 * 实现 onConnect 方法
 * 在客户端成功连接 WebSocket 信道服务之后会调用该方法，
 */
function onConnect(tunnelId) {
  tools.broadcast([tunnelId], 'tunnelIdReplaced', {
    newTunnelId: tunnelId
  })
  //PING-PONG机制:发送PING
  clearTimeout(players[tools.getPlayersOpenId(tunnelId)].timer)
  tools.broadcast([tunnelId], 'PING', {})
}

/**
 * 实现 onClose 方法
 * 客户端关闭 WebSocket 信道或者被信道服务器判断为已断开后，
 * 会调用该方法，此时可以进行清理及通知操作
 */
function onClose(tunnelId) {
  console.info('onClose监听到信道' + tunnelId + '关闭')
  tools.closeTunnel(tunnelId)
}

/**
 * 实现 onMessage 方法
 * 客户端推送消息到 WebSocket 信道服务器上后，会调用该方法，此时可以处理信道的消息。
 */
function onMessage(tunnelId, type, content) {
  console.info('onMessage监听到新消息：', { tunnelId, type, content })
  // if (!(tunnelId in players)) {
  //   tools.closeTunnel(tunnelId)
  // }
  switch (type) {
    case 'PONG': //PING-PONG机制:监听PONG
      if (tunnelId) {
        let openId = content.openId
        clearTimeout(players[openId].timer)//清除掉定时器

        let timer = setTimeout(() => {
          if (players[openId]) {
            //再次设置一个定时器
            players[openId].timer = setTimeout(() => {//ping-pong机制：监听客户端是否离线
              console.log('开始执行PING-PONG定时器函数')
              tools.closeTunnel(tunnelId)//如果离线，则清空用户信息
            }, option.PING_PONG_OUT_TIME)
            //再次发送一个PING
            tools.broadcast([tunnelId], 'PING', {})
            console.log(tunnelId + '发送一个PING')
            clearTimeout(timer)
          }
        }, option.PING_PONG_TIME)
      }
      break

    case 'updateMatchInfo':
      if (tunnelId) {
        let openId = content.openId
        players[openId].sortId = content.sortId
        players[openId].friendsFightingRoom = content.friendsFightingRoom
        console.info('更新用户匹配条件信息：', players[openId])
      }
      break

    case 'answer':
      if (tunnelId) {
        tools.broadcast([tunnelId], 'getAnswer', {})//通知前端，后台已收到选项
        console.info('收到了' + players[content.choice.openId].nickName + '(' + tunnelId + ')的信息')
        let roomName = content.roomName
        let openId = content.choice.openId
        rooms[roomName].responseNumber = rooms[roomName].responseNumber + 1//房间获得了1次响应
        players[openId].choice[1] = content.choice.userChoose
        players[openId].choice[2] = content.choice.answerColor
        players[openId].choice[3] = content.choice.scoreMyself
        if (rooms[roomName].responseNumber === 2) {
          //当两位玩家都完成答题时，立刻向客户端发送下一题
          tools.sendQuestion(roomName)
        }
      }
      break

    case 'fightingResult': //用户答完题监听
      if (tunnelId) {
        console.info('进入fightingResult阶段')
        const fightingResult = content.fightingResult
        const openId = content.openId
        tools.updateScore(openId, fightingResult)//更新分数
        tools.storeFightingRecord(openId, fightingResult) //存储比赛详情数据
        if (rooms[players[openId].roomName]) {
          rooms[players[openId].roomName].finished = true//先改变房间状态，再关闭，避免被认为逃跑行为
        }
        tools.closeTunnel(tunnelId)//关闭信道连接
        console.info('战斗完成后的队列、玩家、房间和发题定时器为：', match.queueData, players, rooms, tools.data.timerSendQuestion)
      }
      break

    default:
      break
  }
}

module.exports = {
  get: async ctx => {//响应用户开始进行websocket连接，信道服务器连接成功后通知客户端
    //data:{tunnel:{tunnelId:xxx,connectUrl:xxx},userinfo:{openId:xxx.nickName:xxx,...}}
    let data = await tunnel.getTunnelUrl(ctx.req)//当用户发起信道请求的时候，会得到信道信息和用户信息
    let userinfo = data.userinfo
    let openId = userinfo.openId
    if (openId in players) {//如果已经存在openId,则说明只需更新信道ID
      players[openId].tunnelId = data.tunnel.tunnelId
      console.info('信道变化后的队列、玩家、房间和发题定时器为：', match.queueData, players, rooms, tools.data.timerSendQuestion)
    } else {
      let score = await mysql('cSessionInfo').where({ open_id: data.userinfo.openId }).select('score')//[{score:4324}]
      userinfo.score = score[0].score //number,在用户信息中加入得分
      userinfo.tunnelId = data.tunnel.tunnelId //在用户信息中加入tunnel_id属性
      userinfo.matchTime = new Date().getTime() //在用户信息中加入匹配的时间，如：1513670126897
      userinfo.roomName = null//在用户信息中加入当前战斗状态，默认为null，否则为对战房间号
      userinfo.friendsFightingRoom = null//初始值为null，匹配前会复制赋值为undefined或一个数字判断是排位赛还是好友匹配
      userinfo.sortId = null
      userinfo.choice = [openId, '', '', 0]//[openID:'',user_choose: '',//用户选择了第几个答案 answer_color: '',//用户是否答对 score_myself: '',//用户总得分]
      userinfo.timer = setTimeout(() => {//ping-pong机制：监听客户端是否离线
        //tools.closeTunnel(data.tunnel.tunnelId)//如果离线，则清空用户信息//暂时先取消此处定时器
      }, option.PING_PONG_OUT_TIME)
      players[openId] = userinfo  //将此用户作为合法用户，并将openId和用户信息(不包含得分，状态等数据)关联起来
      console.info('新信道加入后的队列、玩家、房间和发题定时器为：', match.queueData, players, rooms, tools.data.timerSendQuestion)

      //在匹配队列中压入一个openId,外套一个队列限制函数
      match.queueData.push(openId)

    }
    ctx.state.data = data.tunnel //返回信道信息给用户
  },

  post: async ctx => {//用来处理信道传递过来的消息
    const packet = await tunnel.onTunnelMessage(ctx.request.body) //onTunnelMessage:当用户消息发送到信道上时，使用该函数处理信道的消息
    switch (packet.type) {
      case 'connect': //用户开始进行websocket连接，信道服务器连接成功后通知服务端
        onConnect(packet.tunnelId)
        break
      case 'message':
        onMessage(packet.tunnelId, packet.content.messageType, packet.content.messageContent)
        break
      case 'close':
        onClose(packet.tunnelId)
        break
    }
  }
}

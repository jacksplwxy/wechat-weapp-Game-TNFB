const { tunnel } = require('../qcloud')

const connectedTunnelIds = [] // 保存当前已连接的 WebSocket 信道ID列表
const userMap = {}  //userinfo、'score'、'fighting_status'、'match_time'、'sort_id'、'tunnel_id'
const fighting_room = {}//定义匹配好的对战房间，包含：'fighting_room_name'、'tunnelId'→userMap、'tunnedId_longest'→userMap、'library'、'status_users'
const pingPongTimers = []//存储各个tunnelId对应的pingpong定时器
const responseTimeout = 2000//响应的超时时间，防止房间的玩家信道未更新完或者真实掉线的情况
const answerTimeout = 14000//回答的超时时间，防止一方掉线后另一方长时间等待


//封装广播
const $broadcast = (type, content) => {
  $broadcast_fighting(connectedTunnelIds, type, content)
  console.log('计算有效的信道连接数为:' + connectedTunnelIds.length)
}

//广播到匹配的对手，tunnelIds是需要广播的信道,array
const $broadcast_fighting = (tunnelIds, type, content) => {
  tunnel.broadcast(tunnelIds, type, content) //将消息广播到对战信道id
    .then(result => { //广播后清理断开连接的信道ID
      const invalidTunnelIds = result.data && result.data.invalidTunnelIds || []  //获取无效信道ID
      if (invalidTunnelIds.length) {  //如果存在无效信道ID
        invalidTunnelIds.forEach(tunnelId => {  // 从 userMap 和 connectedTunnelIds 中将无效的信道记录移除
          delete userMap[tunnelId]  //删除userMap中的无效信道ID
          const index = connectedTunnelIds.indexOf(tunnelId)
          if (~index) {
            connectedTunnelIds.splice(index, 1) //删除connectedTunnelIds中的无效信道ID
          }
        })
      }
    })
}

//封装关闭
const $close = (tunnelId) => {//封装关闭信道ID的方法
  tunnel.closeTunnel(tunnelId)
  delete userMap[tunnelId]//删除连接的信道的用户信息
  const index = connectedTunnelIds.indexOf(tunnelId)//删除连接中的信道ID
  if (~index) {
    connectedTunnelIds.splice(index, 1)
  }
  //先取消清除定时器，因为在短断网的情况下还需使用到老信道的定时器
  // if (pingPongTimers[tunnelId]) {
  //   clearPingPongTimer(tunnelId, 'response')//清理response定时器
  //   clearPingPongTimer(tunnelId, 'answer')//清理answer定时器
  //   const index_timer = pingPongTimers.indexOf(tunnelId)//删除连接中的信道ID
  //   if (~index_timer) {
  //     pingPongTimers.splice(index_timer, 1)
  //   }
  //   console.log('关闭信道，清理完的pingPongTimers为：', pingPongTimers)
  // }
}

//监听新信道连接回调函数
function onConnect(tunnelId) {
  if (tunnelId in userMap) {  //判断该信道ID是否在userMap中，只有在userMap中信道ID才是合法的
    //每次有新信道，都需定义pingPongTimers[tunnelId] = [],否则后续装二维数组answer和response会报错
    pingPongTimers[tunnelId] = []

    connectedTunnelIds.push(tunnelId) //将该合法的信道ID放入已连接信道数组中
    console.log('监听到新连接信道' + tunnelId + '，userMap为：', userMap[tunnelId])
    let newOpenId = userMap[tunnelId].openId
    let newMatch_time = userMap[tunnelId].match_time
    let oldUser
    let oldTunnelId
    for (let index in userMap) {
      //不等于newMatch_time是防止找到的老信道是自己
      if (userMap[index].openId === newOpenId && userMap[index].match_time !== newMatch_time) {
        oldTunnelId = index
        oldUser = userMap[oldTunnelId]
        break
      }
    }
    if (oldTunnelId) {//第一次新建信道的时候不存在老信道
      //开始对新旧对象不同的地方进行替换
      userMap[tunnelId].fromOpenId = oldUser.fromOpenId
      userMap[tunnelId].match_time = oldUser.match_time
      userMap[tunnelId].sort_id = oldUser.sort_id
      userMap[tunnelId].fighting_status = oldUser.fighting_status
      //考虑取消通知前端
      $broadcast_fighting([tunnelId], 'tunnelId_replaced', {
        newUser: userMap[tunnelId]
      })

      //因为fighting_room中的玩家指向的是一个信息对象地址
      //替换信道的房间信息
      let roomName = userMap[tunnelId].fighting_status
      if (fighting_room[roomName].tunnelId.openId === newOpenId) {
        delete fighting_room[roomName]['tunnelId']//因为是删除房间的某个属性，tunnelId要带引号
        fighting_room[roomName].tunnelId = userMap[tunnelId]
      } else {
        delete fighting_room[roomName]['tunnelId_longest']//因为是删除房间的某个属性，tunnelId_longest要带引号
        fighting_room[roomName].tunnelId_longest = userMap[tunnelId]
      }
      console.log('更新的房间信息:', fighting_room)

      //注意：老信道必须在房间替换完成后才能清理，否则短断线的情况下老定时器找不到信道ID会报错
      //完成替换后删除老信道对象

      // let timer=setTimeout(function(){
       
      //   clearTimeout(timer)
      // },2000)
      oldUser.fighting_status = 'no_fighting'//防止在状态转态关闭时，被判定为逃跑
      $close(oldTunnelId)
      

      console.log('断线重连后的usermap数据', connectedTunnelIds, userMap, )
    }
    //广播当前在线人数消息
    $broadcast('online', {
      'total': connectedTunnelIds.length
    })
  } else {  //不合法的信道ID将断开连接
    $close(tunnelId)
  }
}

//监听关闭回调函数
function onClose(tunnelId) {//客户端关闭 WebSocket 信道或者被信道服务器判断为已断开后，会调用该方法，此时可以进行清理及通知操作
  if (!(tunnelId in userMap)) { //非法用户直接断开
    $close(tunnelId)
    return
  }
  console.log('监听到信道' + tunnelId + '已关闭，属于' + userMap[tunnelId].nickName)
  if (userMap[tunnelId].fighting_status != 'no_fighting') {//不等于no_fighting，则说明在战斗中断开连接，判定输了
    console.log('此处监听到用户强制关闭')
    runaway(tunnelId)
  } else {
    $close(tunnelId)
  }
}

//监听消息
function onMessage(tunnelId, type, content) {//封装消息监听方法。tunnelId：发送消息的信道ID，type：消息类型，content：消息内容。 在本例中，我们处理 `speak` 类型的消息，该消息表示有用户发言。我们把这个发言的信息广播到所有在线的 WebSocket 信道上
  switch (type) {
    case 'sort_id': //获取sort_id后开始匹配其他用户
      if (tunnelId in userMap) {
        userMap[tunnelId].sort_id = content.sort_id //用户信息中再添加sort_id属性
        userMap[tunnelId].fromOpenId = content.fromOpenId //用户信息中再添加fromOpenId属性

        let userMap_except_me = {}  //定义除去当前信道的userMap对象
        extendDeepCopy(userMap, userMap_except_me)//深克隆对象
        delete userMap_except_me[tunnelId]  //克隆完成后删除当前信道的属性和方法)
        let userMap_filter = [], tunnelId_longest = '';//分别定义条件过滤的用户和等待最久的用户的信道
        if (Object.getOwnPropertyNames(userMap_except_me).length) {
          if (content.fromOpenId) {
            //过滤出满足条件的用户：匹配到转发的openid
            for (var i in userMap_except_me) {
              console.log('userMap_except_me[i]', userMap_except_me[i])
              if (userMap_except_me[i].fromOpenId == content.fromOpenId && userMap_except_me[i].sort_id == content.sort_id && userMap_except_me[i].fighting_status == 'no_fighting' && userMap_except_me[i].openId != userMap[tunnelId].openId) {
                userMap_filter[i] = userMap_except_me[i]  //找到符合条件的userMap
                break
              }
            }
          } else {
            //过滤出满足条件的用户：sort_id、on_fighting、分数差＜10000的用户
            let score_gap = 10000  //定义匹配对手之间的最大分差
            for (var i in userMap_except_me) {
              if (userMap_except_me[i].sort_id == content.sort_id && userMap_except_me[i].fighting_status == 'no_fighting' && Math.abs(userMap_except_me[i].score - userMap[tunnelId].score) < score_gap && userMap_except_me[i].openId != userMap[tunnelId].openId) {
                userMap_filter[i] = userMap_except_me[i]  //找到符合条件的userMap
              }
            }
          }

          //根据时间进行排序，优先等待时间长的用户匹配
          Object.keys(userMap_filter).sort()  //获取到排好序的keys(即信道)
          tunnelId_longest = Object.keys(userMap_filter).sort(function (a, b) {
            return userMap_filter[a].match_time - userMap_filter[b].match_time;//根据匹配等待时间进行排序
          });
          tunnelId_longest = tunnelId_longest[0];
        }
        if (tunnelId_longest) {
          fighting_room[tunnelId] = {//将匹配到的两个用户放到房间里,房间名就是主动匹配的信道ID
            fighting_room_name: tunnelId,//房间名  
            tunnelId: userMap[tunnelId],//用户1
            tunnelId_longest: userMap[tunnelId_longest],//用户2
            library: [],//题库
            status_users: []//{openid:'',user_choose: [],//用户选择了第几个答案answer_color: '',//用户是否答对score_myself: '',//用户总得分}
          }
          //设置匹配到的用户的状态为fighting的房间号(房间号而不是'fighting'是为了便于查找断开用户的fighting_room),这样其他匹配者将不会再匹配到他们
          userMap[tunnelId].fighting_status = tunnelId
          userMap[tunnelId_longest].fighting_status = tunnelId
          //将匹配完成的信息通知给两位匹配者，并进入战斗页面
          $broadcast_fighting([userMap[tunnelId].tunnel_id, userMap[tunnelId_longest].tunnel_id], 'has_matched', {
            'content': fighting_room[userMap[tunnelId].fighting_status]
          })
        }
      } else {
        $close(tunnelId)
      }
      break
    case 'has_ready':
      if (tunnelId in userMap) {
        console.log('匹配完成以后的usermap', userMap)
        const fighting_room_me = fighting_room[content.fighting_room_name]
        fighting_room_me.status_users.push(tunnelId)//将准备好的用户压入进去
        if (fighting_room_me.status_users.length === 2) {//如果两个用户都准备OK，则开始获取题目并存入房间题库中
          //服务器开始从数据库随机获取5道不一样的题目存入fighting_room_me.library
          //library包含5道题目
          const { mysql } = require('../qcloud')
          mysql('question_detail').where({ sort_id: fighting_room_me.tunnelId.sort_id }).select('*').orderByRaw('RAND()').limit(5).then(res => {
            fighting_room_me.library = res  //将查询到的题目存到房间的题库library中
            send_question(fighting_room_me)
          })
        }
      } else {
        $close(tunnelId)
      }
      break

    case 'answer':
      if (tunnelId in userMap) {
        console.log('收到了' + userMap[tunnelId].nickName + '(' + tunnelId + ')的信息')
        const fighting_room_me = fighting_room[content.fighting_room_name]
        console.log('测试fighting_room_me', fighting_room_me, fighting_room)
        $broadcast_fighting([tunnelId], 'getAnswer', {})//通知前端，后台已收到选项
        if (pingPongTimers[tunnelId]) {
          console.log('开始清除answer', tunnelId,pingPongTimers[tunnelId])
          clearPingPongTimer(tunnelId, 'answer')//清理answer定时器
          //fighting_room_me[tunnelId].getQuestionResponse=true
        }

        fighting_room_me.status_users.push(content.status_users)//将回答完的用户压入进去
        console.log('压入了' + fighting_room_me.status_users.length + '个状态')
        if (fighting_room_me.status_users.length === 2) {
          send_question(fighting_room_me)
        }
      } else {
        $close(tunnelId)
      }
      break

    case 'fighting_result': //用户答完题监听
      if (tunnelId in userMap) {
        console.log('进入fighting_result阶段')
        if (pingPongTimers[tunnelId]) {
          console.log('开始清除answer', tunnelId, pingPongTimers[tunnelId])
          clearPingPongTimer(tunnelId, 'answer')//清理answer定时器
          //fighting_room[userMap[tunnelId].fighting_status][tunnelId].getQuestionResponse = true
        }
        const fighting_result = content.fighting_result
        const openId = content.openId
        update_score(tunnelId, openId, fighting_result)
        if (fighting_room.hasOwnProperty(userMap[tunnelId].fighting_status)) {
          delete fighting_room[userMap[tunnelId].fighting_status]//删除对战房间,注意不能写成fighting_room[tunnelId]
        }
        userMap[tunnelId].fighting_status = 'no_fighting'//改变状态后再删除，以免被判定为逃跑
        $close(tunnelId)//关闭信道连接
        console.log('对战完成后的usemap', userMap)
        console.log('对战完成后的房间', fighting_room)
        console.log('对战完成后的PingPongTimer', pingPongTimer)
      } else {
        $close(tunnelId)
      }
      break

    case 'questionResponse': //监听用户是否收到问题
      if (tunnelId in userMap) {
        if (pingPongTimers[tunnelId]) {
          console.log('开始清除response', tunnelId,pingPongTimers[tunnelId])
          clearPingPongTimer(tunnelId, 'response')
        }
      } else {
        $close(tunnelId)
      }
      break

    case 'tunnelId_changed': //用户重连后更换了信道ID监听
      if (tunnelId in userMap) {
        // if (content.fighting_room_name) {//存在房间名，则说明该断线用户在战斗中
        //   let fighting_room_name = content.fighting_room_name
        //   let openId = content.openId
        //   let tunnelId_origin = content.tunnelId_origin
        //   //替换信道的用户信息
        //   let newUser = {}
        //   extendDeepCopy(userMap[tunnelId_origin], newUser)//深克隆对象
        //   newUser.tunnel_id = tunnelId
        //   newUser.fighting_status = content.fighting_room_name
        //   userMap[tunnelId] = newUser//将老信道的所有信息转移到新信道上

        //   // //替换信道ping-pong定时器
        //   // console.log('替换前的pingPongTimers', pingPongTimers)
        //   // pingPongTimers[tunnelId] = pingPongTimers[tunnelId_origin]
        //   // console.log('替换中的pingPongTimers', pingPongTimers)
        //   // const index = pingPongTimers.indexOf(tunnelId_origin)
        //   // if (~index) {
        //   //   pingPongTimers.splice(index, 1) //删除pingPongTimers中的老信道ID
        //   // }
        //   // console.log('替换后的pingPongTimers', pingPongTimers)

        //   //替换信道的房间信息
        //   if (fighting_room[fighting_room_name].tunnelId.openId === openId) {
        //     delete fighting_room[fighting_room_name]['tunnelId']//因为是删除房间的某个属性，tunnelId要带引号
        //     fighting_room[fighting_room_name].tunnelId = userMap[tunnelId]
        //   } else {
        //     delete fighting_room[fighting_room_name]['tunnelId_longest']//因为是删除房间的某个属性，tunnelId_longest要带引号
        //     fighting_room[fighting_room_name].tunnelId_longest = userMap[tunnelId]
        //   }
        //   userMap[tunnelId_origin].fighting_status = 'no_fighting'
        //   $close(tunnelId_origin)
        //   console.log('匹配阶段断线重连，清空断线前的信道后的数据', userMap, connectedTunnelIds)
        //   $broadcast_fighting([tunnelId], 'tunnelId_replaced', {
        //     tunnelId_new: tunnelId
        //   })
        // } else {//不存在房间名称则说明的是在匹配中
        //   let tunnelId_origin = content.tunnelId_origin
        //   //替换信道的用户信息
        //   let newUser = {}
        //   extendDeepCopy(userMap[tunnelId_origin], newUser)//深克隆对象
        //   newUser.tunnel_id = tunnelId
        //   userMap[tunnelId] = newUser//将老信道的所有信息转移到新信道上
        //   //通知前端已经清除完，可以再次发起匹配
        //   $broadcast_fighting([tunnelId], 'tunnelId_replaced', {
        //     tunnelId_new: tunnelId
        //   })
        // }
      } else {
        $close(tunnelId)
      }
      break

    default:
      break
  }
}


//发送题目到前端
function send_question(fighting_room_me) {
  let library_temp = fighting_room_me.library[0]//获取题目临时存储，以备未发送成功时使用
  let status_users_temp = fighting_room_me.status_users//获取答题状态临时存储，以备未发送成功时使用
  console.log('这时广播的信道是?', fighting_room_me.tunnelId.tunnel_id, fighting_room_me.tunnelId_longest.tunnel_id)
  $broadcast_fighting([fighting_room_me.tunnelId.tunnel_id, fighting_room_me.tunnelId_longest.tunnel_id], 'question', {
    'data': {
      'question': fighting_room_me.library[0] ? fighting_room_me.library[0] : {},
      'status_users': fighting_room_me.status_users
    }
  })
  fighting_room_me.library.shift() //发送一个，原始题库就删除一个
  fighting_room_me.status_users = []//发送成功后将用户状态清空

  //setPingPongTimer(fighting_room_me.tunnelId.tunnel_id, library_temp, status_users_temp, fighting_room_me)
  //setPingPongTimer(fighting_room_me.tunnelId_longest.tunnel_id, library_temp, status_users_temp, fighting_room_me)
}
function setPingPongTimer(tunnelId, library_temp, status_users_temp, fighting_room_me) {
  let oldOpenId = userMap[tunnelId].openId
  console.log('pingPongTimers[tunnelId]', pingPongTimers[tunnelId])
  //此定时器依赖questionResponse监听清除
  pingPongTimers[tunnelId]['response'] = setTimeout(() => {
    console.log('是否进入2S定时器')
    //发送给最新的信道ID
    let newestTunnelId
    console.log('fighting_room_me', fighting_room_me)
    for (let index in fighting_room_me) {
      fighting_room_me[index].openId = oldOpenId
      newestTunnelId = fighting_room_me[index].tunnel_id
    }
    console.log('newestTunnelId', newestTunnelId)
    //注意：断线重连时注意不要更新pingPongTimers中的信道id
    console.log('客户端未响应，触发定时器未响应函数，再次发送数据', userMap[tunnelId].tunnel_id, userMap[tunnelId].nickName)
    console.log('再次接收数据的信道是?', tunnelId)
    $broadcast_fighting([newestTunnelId], 'question', {
      'data': {
        'question': library_temp ? library_temp : {},
        'status_users': status_users_temp
      }
    })
    //此定时器依赖answer监听清除
    pingPongTimers[newestTunnelId]['response'] = setTimeout(() => {//如果还未得到响应，则判定为逃跑
      console.log('触发定时器未回答函数，视为逃跑', userMap[tunnelId].tunnel_id, userMap[tunnelId].nickName)
      if (userMap[newestTunnelId]) {
        console.log('此处监听到用户没有正确连接到服务器')
        runaway(newestTunnelId)
      }//超时未获取pong响应，则判定对手逃跑
    }, answerTimeout)
  }, answerTimeout)

  pingPongTimers[tunnelId]['answer'] = setTimeout(() => {
    console.log('触发定时器未回答函数，视为逃跑', userMap[tunnelId].tunnel_id, userMap[tunnelId].nickName)
    if (userMap[tunnelId]) {
      console.log('此处监听到用户长时间没有回答')
      runaway(tunnelId)
    }//超时未获取pong响应，则判定对手逃跑
  }, answerTimeout)
}
//清除ping-pong定时器
function clearPingPongTimer(tunnelId, type) {
  clearTimeout(pingPongTimers[tunnelId][type])
  // const index = pingPongTimers[tunnelId].indexOf(type)
  // if (~index) {
  //   pingPongTimers[tunnelId].splice(index, 1) //删除pingPongTimers[tunnelId]中的定时器type
  // }
}

//定义对象深克隆方法
function extendDeepCopy(obj, newObj) {
  var newObj = newObj || {}
  for (var i in obj) {
    if (typeof obj[i] == 'Object') {
      newObj[i] = (obj[i].constructor === Array) ? [] : {};
      extendDeepCopy(obj[i], newObj[i])
    } else {
      newObj[i] = obj[i]
    }
  }
  return newObj
}

//更新得分
function update_score(tunnelId, openId, fighting_result) {
  const { mysql } = require('../qcloud')
  mysql('cSessionInfo').where({ open_id: openId }).select('score').then(res => {//获取原始得分
    let score
    if (fighting_result) {
      score = res[0].score + 10
    } else {
      score = res[0].score - 10
      if (score < 0) {
        score = 0
      }
    }
    const { mysql } = require('../qcloud')
    mysql('cSessionInfo').where({ open_id: openId }).update('score', score).then(res => {//获取原始得分
    })//更新最新得分
  })
}

//定义逃跑判定函数
function runaway(tunnelId) {
  console.log('userMap[tunnelId]', userMap[tunnelId])
  //逃跑者减分
  let tunnelId_runaway = tunnelId
  let tunnelId_winner
  let fighting_result_runaway = false
  let fighting_result_winner = true
  //胜利者加分,UI上得到通知对方对手已逃跑，删除房间和胜利者连接信息
  if (tunnelId_runaway == fighting_room[userMap[tunnelId_runaway].fighting_status].tunnelId_longest.tunnel_id) {
    console.log(' fighting_room[userMap[tunnelId_runaway].fighting_status]报错：', fighting_room[userMap[tunnelId_runaway].fighting_status])
    tunnelId_winner = fighting_room[userMap[tunnelId_runaway].fighting_status].tunnelId.tunnel_id
  } else {
    tunnelId_winner = fighting_room[userMap[tunnelId_runaway].fighting_status].tunnelId_longest.tunnel_id
  }
  let openId_runaway = userMap[tunnelId_runaway].openId
  let openId_winner = userMap[tunnelId_winner].openId
  console.log('逃跑者：', tunnelId, userMap[tunnelId])
  console.log('胜利者：', tunnelId_winner, userMap[tunnelId_winner], )
  update_score(tunnelId_runaway, openId_runaway, fighting_result_runaway)//逃跑者减分
  update_score(tunnelId_winner, openId_winner, fighting_result_winner)//胜利者加分

  //注意处理删除顺序:先删除对战房间
  delete fighting_room[userMap[tunnelId_runaway].fighting_status]//删除对战房间
  //再删除usermap和定时器
  userMap[tunnelId_winner].fighting_status = 'no_fighting'
  userMap[tunnelId_runaway].fighting_status = 'no_fighting'
  $broadcast_fighting([tunnelId_winner], 'notice_runaway', {
    'tunnel_Id': [tunnelId_winner],
    'data': '对手逃跑!'
  })
  //$close(tunnelId_winner)
  $close(tunnelId_runaway)
  console.log('逃跑后的usermap、fighting_room房间信息和定时器pingPongTimers', userMap, fighting_room, pingPongTimers)
}

module.exports = {
  get: async ctx => {//响应用户开始进行websocket连接，信道服务器连接成功后通知客户端
    //data:{tunnel:{tunnelId:xxx,connectUrl:xxx},userinfo:{openId:xxx.nickName:xxx,...}}
    const data = await tunnel.getTunnelUrl(ctx.req)//当用户发起信道请求的时候，会得到信道信息和用户信息
    const tunnelInfo = data.tunnel  //提取信道信息
    const userinfo = data.userinfo
    const { mysql } = require('../qcloud')
    let score = await mysql('cSessionInfo').where({ open_id: data.userinfo.openId }).select('score')//[{score:4324}]
    userinfo.score = score[0].score //在用户信息中加入得分
    userinfo.fighting_status = 'no_fighting'//在用户信息中加入当前战斗状态，默认为no_fighting，另一个选项是fighting
    userinfo.match_time = new Date().getTime() //在用户信息中加入匹配的时间，如：1513670126897
    userinfo.tunnel_id = tunnelInfo.tunnelId //在用户信息中加入tunnel_id属性
    userMap[tunnelInfo.tunnelId] = userinfo  //将此用户作为合法用户，并将信道ID和用户信息(不包含得分，状态等数据)关联起来
    ctx.state.data = tunnelInfo //返回信道信息给用户
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

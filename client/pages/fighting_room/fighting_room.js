const qcloud = require('../../vendor/wafer2-client-sdk/index')
const config = require('../../config')
const util = require('../../utils/util.js')
const app = getApp();
Page({
  data: {
    fighting_room_name: '',//对战房间号
    userInfo_me: '', //本人用户信息
    userInfo_others: '',//对手用户信息
    countdown: 10,//倒计时
    question: '',//websocket服务器传过来的问题及答案
    has_click: false,//判断是否已选答案，不能重新选择
    local_click: false,//是否本地单击的答案
    tunnelId_replacing: 0,//tunnelId_replacing存在2种转态：0表示不存在信道替换，1表示信道正在替换中:禁止发送数据
    click_index: '',//判断用户选择了哪个答案
    answer_color: '',//根据选择正确与否给选项添加背景颜色
    score_myself: 0,//自己的总分
    status_users_others: {
      openId: '', //对手的openid
      user_choose: '',//对手选择了第几项
      answer_color: '',//对手是否选择正确
    },//对手的答题状态
    score_others: 0,//对手的总分
    game_over: false,  //判断此次PK是否结束
    win: false,  //判断当前用户是否胜利
    sendNumber:0//每一轮的答题次数不能超过1次
  },
  onLoad: function (options) {
    app.appData.fromClickId = options.currentClickId
    app.upDateUser_networkFromClickId = require('../../utils/upDateUser_networkFromClickId.js').upDateUser_networkFromClickId
    wx.showShareMenu({
      withShareTicket: true
    })
    this.setData({
      fighting_room_name: options.fighting_room_name,
      userInfo_me: wx.getStorageSync('user_me'),
      userInfo_others: wx.getStorageSync('user_others')
    })
    wx.removeStorageSync('user_me')//清理缓存
    wx.removeStorageSync('user_others')//清理缓存
    this.startAnimate()//定义开始动画
    this.fighting_ready(options.fighting_room_name) //通知服务器我已准备好了
    this.exceptional_listener()  //监听异常情况，如断线重新连接  
  },
  onShareAppMessage: function (res) {
    const that = this;
    return {
      title: '谁才是头脑王者？比比看吧！',
      path: '/pages/entry/entry?currentClickId=' + app.appData.currentClickId,
      success: function (res) {
        //转发时向用户关系表中更新一条转发记录(个人为person，群为GId)。
        require('../../utils/upDateShareInfoToUser_network.js').upDateShareInfoToUser_network(app, that, res)
        wx.redirectTo({
          url: '../entry/entry'
        })
      }
    }
  },
  fighting_ready(fighting_room_name) { //通知服务器我已准备好了
    const that = this
    const tunnel = this.tunnel = app.tunnel
    tunnel.emit('has_ready', { fighting_room_name });//通知服务器，已经准备好可以答题了

    //监听逃跑者的信息
    tunnel.on('notice_runaway', (res) => {
      util.showSuccess(res.data)
      that.setData({
        game_over: true,
        win: true,
      })
      app.tunnel.close()
    })
    //监听后台是否收到前端发送的选项
    tunnel.on('getAnswer', (res) => {
      that.setData({//答题后将has_click设置为true,防止重新选择答案
        has_click: true
      })
    })

    //监听是否在重连,若是，则禁止发送数据到后台
    app.tunnelReconnectingCallback = () => {
      that.setData({
        tunnelId_replacing: 1,//tunnelId_replacing存在2种转态：0表示不存在信道替换，1表示信道正在替换中 
      })
    }
    //监听服务器端发送过来的问题
    let get_next_questions, timer_countdown, timer_reset  //定义倒计时定时器，定义重置定时器(注意：只有将timer_countdown定义在最外边才能清除掉上一个定时器)
    tunnel.on('question', (res) => {
      //收到问题立刻给服务器一个响应，表明服务器已发送题目成功(ping-pong机制)
      that.tunnel.emit('questionResponse', {})

      let question = res.data.question
      if (Object.getOwnPropertyNames(question).length) {
        question.answer = JSON.parse(question.answer)//将答案转换为js对象
      }
      if (res.data.status_users.length) { //显示对手的答题状态
        for (let i = 0; i < res.data.status_users.length; i++) {
          if (res.data.status_users[i].openId != that.data.userInfo_me.openId) {//判断传过来的用户信息哪个是对手的
            that.setData({
              status_users_others: res.data.status_users[i],
              score_others: res.data.status_users[i].score_myself//对手总分单独拎出来，不更新
            })
            break
          }
        }
      }

      clearTimeout(get_next_questions)
      if (Object.getOwnPropertyNames(question).length) {
        get_next_questions = setTimeout(function () { //先等待2s查看对方的选择状态，再开始下一题
          reset(that)//运行重置函数  
        }, 2000)
      } else {  //当question中无问题时,即回答完所有问题
        get_next_questions = setTimeout(function () { //答完题显示战果
          if (that.data.score_myself > that.data.score_others || that.data.score_myself == that.data.score_others) {
            that.setData({
              game_over: true,
              win: true,
            })
          } else {
            that.setData({
              game_over: true,
              win: false,
            })
          }
          //将当前用户的比赛结果发送给服务器
          tunnel.emit('fighting_result', {
            openId: that.data.userInfo_me.openId,
            fighting_result: that.data.win
          })
        }, 1000)
      }
      function reset(that) {//定义重置函数
        that.setData({ question })//更新题目
        //获取新题目后,倒计时归为10，将click_index清空，has_click改为未选择.
        that.setData({
          countdown: 10,
          local_click: false,
          has_click: false,
          click_index: '',
          answer_color: '',
          //score_myself: 0,
          status_users_others: {
            openId: '',
            user_choose: '',
            answer_color: '',
            //score_myself: 0,
          },
          sendNumber:0
        })
        //（重新）开始倒计时
        clearInterval(timer_countdown)//获取新题目后,倒计时定时器清空(注意：只有将timer_countdown定义在最外边才能清除掉上一个定时器)
        let countdown = that.data.countdown;
        timer_countdown = setInterval(function () {
          countdown--
          that.setData({
            countdown
          })
          if (countdown == 0) {
            clearInterval(timer_countdown)
          }
        }, 1000)
        //（重新）设置定时器，若用户未选择答案，10s后也将用户结果发给服务器
        clearTimeout(timer_reset);
        timer_reset = setTimeout(function () {
          console.log('自动发送题目')
          if (!that.data.local_click && !that.data.has_click) {
            that.sendAnswer(that)
          }
        }, 11000)
      }
    })
  },
  answer(e) {//开始答题
    const that = this
    if (!that.data.local_click) {  //防止重新选择答案
      if (e.currentTarget.dataset.right) {//判断答案是否正确
        that.setData({
          click_index: e.currentTarget.dataset.index,
          answer_color: 'right'
        })
        //答对了则加分，时间越少加分越多,总分累加
        that.setData({
          score_myself: that.data.score_myself + that.data.countdown * 10
        })
      } else {
        that.setData({
          click_index: e.currentTarget.dataset.index,
          answer_color: 'error'
        })
      }
      that.setData({
        local_click: true//本地已经点击,若has_click仍未false，则说明没有发送数据出去
      })
      that.sendAnswer(that)
    }
  },
  sendAnswer(that) {//若存在信道替换，且信道替换还未完成，则不发送数据到后台，但是本地还是算点击一次,
    if (that.data.sendNumber>0){
      return
    }
    if (that.data.tunnelId_replacing == 1 || !(app.appData.tunnel_status == 'connect' || app.appData.tunnel_status == 'reconnect')) {//当信道正在替换中时，禁止发送数据
      console.log('正在替换')
      return
    }
    console.log('已发送')
    that.tunnel.emit('answer', {  //将选项、是否正确、总分3项发送给服务器，若双方都已发送，服务器直接返回下一题
      fighting_room_name: that.data.fighting_room_name,
      status_users: {
        openId: that.data.userInfo_me.openId,
        user_choose: that.data.click_index,
        answer_color: that.data.answer_color,
        score_myself: that.data.score_myself,
      }
    })
    let sendNumber = that.data.sendNumber+1//保证每一轮发送次数不能大于1，至于为什么会大于1，暂时不清楚原因
    that.setData({
      sendNumber,
    })
  },
  //异常处理：重新连接、网络错误
  exceptional_listener() {
    const that = this
    const tunnel = this.tunnel = app.tunnel
    //重新连接后，信道id会改变,通知服务器信道id已改变，待接收到服务器端信道ID已替换的通知后再将选项发送给服务器
    app.tunnelReconnectCallback = () => {
      //重连成功，通知服务端清除断线前的干扰信道ID,将房号和信道改变的openid及断线前的信道id发给服务器
      that.tunnel.emit('tunnelId_changed', {
        fighting_room_name: that.data.fighting_room_name,
        openId: that.data.userInfo_me.openId,
        tunnelId_origin: that.data.userInfo_me.tunnel_id
      })

      //信道id完成替换后，将本地的userInfo_me中的tunnel_id进行更新
      tunnel.on('tunnelId_replaced', (res) => {//监听信道替换成功
        that.setData({//更新当前用户的信道idh和信道替换状态
          userInfo_me: res.newUser,
          tunnelId_replacing: 0
        })
        //BUG：此处不注销会重发发送，原因？补丁：通过sendNumber保证发送次数不大于1
        if (that.data.local_click && !that.data.has_click) {//如果本地已点击过，并且还没发送成功，则向服务器再次发送数据
          that.sendAnswer(that)
        }
      })
    }

    //监听到错误时，发送各自openId给服务器进行加、减分
    app.tunnelErrorCallback = (error) => {
      // that.tunnel.emit('error', {
      //   fighting_room_name: that.data.fighting_room_name,
      //   openId_me: userInfo_me.openId,
      //   openId_others: userInfo_others.openId,
      // })
      // //直接将堆放用户的比赛结果(胜利)发送给服务器
      // tunnel.emit('fighting_result', {
      //   openId: userInfo_others.openId,
      //   fighting_result: true
      // })
    }
  },
  continue_fighting() {
    wx.redirectTo({
      url: '../entry/entry'
    })
  },
  startAnimate() {
    const that = this
    that.setData({
      zoomIn: 'zoomIn'
    })
    setTimeout(function () {
      that.setData({
        zoomOut: 'zoomOut'
      })
    }, 1500)
  }
})
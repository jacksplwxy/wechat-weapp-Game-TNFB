/**
 * @fileOverview 微信小程序的入口文件
 */

var qcloud = require('./vendor/wafer2-client-sdk/index');
var config = require('./config');
var util = require('./utils/util.js')

App({
  // 小程序初始化时执行，我们初始化客户端的登录地址，以支持所有的会话操作
  appData: {
    appId: config.service.appId,
    baseUrl: `${config.service.host}/weapp/`,
    tunnelStatus: 'close',//统一管理唯一的信道连接的状态：connect、close、reconnecting、reconnect、error
    friendsFightingRoom:undefined,//好友对战时创建的唯一房间名,作为好友匹配的标识
  },
  onLaunch(opt) {
    this.appData.opt = opt
    qcloud.setLoginUrl(config.service.loginUrl);  //设置登录地址
    this.doLogin();
  },
  onShow(opt) {
    this.storeUser_network(opt)//每次打开程序都启动存储用户关系表
  },
  doLogin() { //登录
    let that = this
    util.showBusy('正在登录');
    qcloud.login({
      success(result) {//此处的result竟然不包含openid,所以res取缓存中的数据
        util.showSuccess('登录成功')
        let res = wx.getStorageSync('user_info_F2C224D4-2BCE-4C64-AF9F-A6D872000D1A');
        if (that.userInfoReadyCallback) {
          that.userInfoReadyCallback(res)
        }
      },
      fail(error) {
        util.showModel('登录失败', error);
      }
    });
  },
  pageGetUserInfo(page, openIdReadyCallback) { //在page中获取用户信息
    const userInfo = wx.getStorageSync('user_info_F2C224D4-2BCE-4C64-AF9F-A6D872000D1A')
    if (userInfo) {
      page.setData({
        userInfo,
        openId: userInfo.openId
      })
      this.appData.openId = userInfo.openId
      if (openIdReadyCallback) {
        openIdReadyCallback(userInfo.openId)
      }
    } else {
      this.userInfoReadyCallback = (userInfo) => {  //获取用户信息后的回调函数
        page.setData({  //每个page都会自动存储userInfo和openId
          userInfo,
          openId: userInfo.openId
        })
        if (openIdReadyCallback) {  //如果设置了openid的回调函数，则调用回调
          openIdReadyCallback(userInfo.openId)
        }
      }
    }
  },
  //tunnel:由于一个小程序只能同时连接一个信道而且设计页面跳转后信道对象会销毁问题，所以将其放在app.js中统一管理
  tunnelCreate() {//创建一个新信道，并监听相关数据的变化
    const that = this
    const tunnel = that.tunnel = new qcloud.Tunnel(config.service.tunnelUrl)  //放在app对象下供全局使用
    tunnel.open()
    tunnel.on('connect', () => {//监听信道连接
      console.info("tunnelStatus = 'connect'")
      this.appData.tunnelStatus = 'connect' //改变信道状态为已连接
      if (that.tunnelConnectCallback) {//设置回调
        that.tunnelConnectCallback()
      }
    })
    tunnel.on('close', () => {//监听信道断开
      console.info("tunnelStatus = 'close'")
      this.appData.tunnelStatus = 'close' //改变信道状态为已断开
      if (that.tunnelCloseCallback) {//设置回调
        that.tunnelCloseCallback()
      }
    })
    tunnel.on('reconnecting', () => {//监听信道重新链接
      console.info("tunnelStatus = 'reconnecting'")
      this.appData.tunnelStatus = 'reconnecting' //改变信道状态为重新连接中
      if (that.tunnelReconnectingCallback) {//设置回调
        that.tunnelReconnectingCallback()
      }
    })
    tunnel.on('reconnect', () => {//监听信道重新连接成功
      console.info("tunnelStatus = 'reconnect'")
      console.info('重连后的信道为:' + tunnel.socketUrl.slice(tunnel.socketUrl.indexOf('tunnelId=') + 9, tunnel.socketUrl.indexOf('&')))
      this.appData.tunnelStatus = 'reconnect' //改变信道状态为重新连接成功
      if (that.tunnelReconnectCallback) {//设置回调
        that.tunnelReconnectCallback()
      }
    })
    tunnel.on('error', () => {//监听信道发生错误
      console.info("tunnelStatus = 'error'")
      this.appData.tunnelStatus = 'error' //改变信道状态为发生错误
      util.showSuccess('您已断线，请检查联网')
      wx.navigateBack({
        url: '../entry/entry'
      })
      if (that.tunnelErrorCallback) {//设置回调
        that.tunnelErrorCallback()
      }
    })
    tunnel.on('PING', () => {//PING-PONG机制:监听服务器PING
      console.info("接收到PING")
      tunnel.emit('PONG', {//给出回应
        openId: this.appData.openId
      })
      console.info("发出了PONG")
    })
    
  },

  /******************用户关系点击表操作******************/
  //注意1：所有从分享中启动的页面onLoad都添加：  
  /*
    app.appData.fromClickId = opt.currentClickId
    app.upDateUser_networkFromClickId = require('../../utils/upDateUser_networkFromClickId.js').upDateUser_networkFromClickId
    wx.showShareMenu({
      withShareTicket: true
    })
  */
  //注意2：所有分享页面路径都添加：?currentClickId=' + app.appData.currentClickId,
  //注意3：所有分享页面的分享成功回调都添加： require('../../utils/upDateShareInfoToUser_network.js').upDateShareInfoToUser_network(app,that,res)

  storeUser_network(opt) {
    const that = this
    const userInfo = wx.getStorageSync('user_info_F2C224D4-2BCE-4C64-AF9F-A6D872000D1A')
    if (userInfo) {//已缓存的用户数据直接用
      getGId(that, userInfo, opt)
    } else {
      this.userInfoReadyCallback = (userInfo) => {  //获取用户信息后的回调函数
        getGId(that, userInfo, opt)
      }
    }
    function getGId(that, userInfo, opt) {
      //判断是否是从微信群内打开该程序的
      wx.getShareInfo({
        shareTicket: opt.shareTicket,
        //含GId的情况
        success: (res) => {
          qcloud.request({
            login: false,
            data: {
              appId: that.appData.appId,
              openId: userInfo.openId,
              encryptedData: res.encryptedData,
              iv: res.iv
            },
            url: `${that.appData.baseUrl}getGId`,
            success: (res) => {
              let GId = res.data.data
              store(that, userInfo, opt, GId)
            }
          })
        },
        //不含GId的情况
        fail: function (res) {
          store(that, userInfo, opt)
        }
      })
    }
    function store(that, userInfo, opt, GId = '') {  //参数内要写that：that作为一个对象不能凭空产生
      let data = {
        //clickId:自动生成的数据,
        fromClickId: that.appData.fromClickId ? that.appData.fromClickId : 0,//从哪个clickId那里打开的
        appId: that.appData.appId,
        openId: userInfo.openId,
        fromGId: GId,
        scene: opt.scene,
        //time:自动生成的数据,
        //param_1:转发时才会更新当前clickId中的param_1数据
      }
      //将数据存储到数据库点击表中,同时将得到的clickId放在全局变量供page分享时调用
      qcloud.request({
        login: false,
        data,
        url: `${that.appData.baseUrl}storeUser_network`,
        success: (res) => {
          let currentClickId = res.data.data
          that.appData.currentClickId = currentClickId//设置当前新插入的clickId为全局fromClickId
          let fromClickId = that.appData.fromClickId
          if (that.upDateUser_networkFromClickId && fromClickId) {//存在fromClickId，则进行数据库更新
            that.upDateUser_networkFromClickId(that, currentClickId, fromClickId)
          }
        }
      });
    }
  },
  /******************用户关系点击表操作******************/
});
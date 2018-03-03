const util = require('./util.js')

function match(page, app, opt) {
  const that = page
  if (app.appData.tunnelStatus !== 'close') {
    app.tunnel.close()
  }
  app.tunnelCreate()//新建信道，并监听相关变化
  const tunnel = app.tunnel
  function getCurrentTunnelId() {
    return app.tunnel.socketUrl.slice(app.tunnel.socketUrl.indexOf('tunnelId=') + 9, app.tunnel.socketUrl.indexOf('&'))
  }
  app.tunnelConnectCallback = () => {
    let userInfo = that.data.userInfo
    userInfo.tunnelId = getCurrentTunnelId()
    that.setData({
      status: '已连接，对手匹配中...',
      userInfo,//用户信息存储当前的信道ID
    })
    tunnel.emit('updateMatchInfo', {//发起匹配
      openId: that.data.openId,
      sortId: opt.sortId,
      friendsFightingRoom: opt.friendsFightingRoom//匹配者含friendsFightingRoom则说明是好友之间的匹配
    })
  }

  app.tunnelCloseCallback = () => {
    that.setData({ status: '连接已关闭' })
    //util.showSuccess('连接已断开')
  }

  app.tunnelReconnectCallback = () => {
    util.showSuccess('已重新连接')
    let userInfo = that.data.userInfo
    userInfo.tunnelId = getCurrentTunnelId()
    that.setData({
      status: '网络已重连，匹配中...',
      userInfo,
    })
    tunnel.emit('updateMatchInfo', {//发起匹配
      openId: that.data.openId,
      sortId: opt.sortId,
      friendsFightingRoom: opt.friendsFightingRoom//匹配者含friendsFightingRoom则说明是好友之间的匹配
    })
  }

  app.tunnelReconnectCallback = () => {
    util.showSuccess('已重新连接')
    let userInfo = that.data.userInfo
    userInfo.tunnelId =  getCurrentTunnelId()
    that.setData({
      status: '网络重连成功，对手匹配中...',
      userInfo,
    })
  }

  app.tunnelErrorCallback = (error) => {
    that.setData({ status: '信道发生错误：' + error })
    util.showSuccess('连接错误')
  }

  tunnel.on('matchNotice', (res) => {//监听匹配成功
    console.log('res', res)
    let user_me, user_others
    if (res.player1.openId === that.data.openId){
      user_me = res.player1
      user_others=res.player2
    }else{
      user_me = res.player2
      user_others = res.player1
    }
    wx.setStorageSync('user_me', user_me)
    wx.setStorageSync('user_others', user_others)
    that.setData({ status: user_me.nickName + ' VS ' + user_others.nickName })
    setTimeout(goto_fighting_room, 2000)//延迟1s跳转到战队页面
    function goto_fighting_room() {
      wx.redirectTo({ //navigateTo不会会卸载该页面，只是将当前页面隐藏了,redirectTo会销毁当前页面
				url: `../fighting_room/fighting_room?roomName=${res.player1.roomName}`
      })
    }
  })
}
module.exports = { match }
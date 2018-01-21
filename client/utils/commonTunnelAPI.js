const util = require('./util.js')
function match(page, app, sort_id, fromOpenId = undefined) {
  const that = page
  if (app.appData.tunnel_status === 'connect' || app.appData.tunnel_status === 'reconnecting') {
    app.tunnel.close()
  }
  app.tunnel_create()//新建信道，并监听相关变化
  const tunnel = app.tunnel
  app.tunnelConnectCallback = () => {
    let userInfo = that.data.userInfo
    userInfo.tunnelId = app.tunnel.socketUrl.slice(app.tunnel.socketUrl.indexOf('tunnelId=') + 9, app.tunnel.socketUrl.indexOf('&'))
    that.setData({
      status: '已连接，对手匹配中...',
      userInfo,//用户信息存储当前的信道ID
    })
    tunnel.emit('sort_id', {//发起匹配
      sort_id,
      fromOpenId//匹配者含fromOpenId则说明是好友之间的匹配
    })
  }
  app.tunnelCloseCallback = () => {
    that.setData({ status: 'WebSocket 信道已断开' })
    //util.showSuccess('连接已断开')
  }
  app.tunnelReconnectingCallback = () => {
    that.setData({ status: '信道正在重连...' })
    util.showSuccess('正在重连...')
  }
  app.tunnelReconnectCallback = () => {
    that.setData({ status: 'WebSocket 信道重连成功' })
    util.showSuccess('已重新连接')
    app.tunnel.emit('tunnelId_changed', {//重连成功，通知服务端替换断线前的干扰信道ID
      tunnelId_origin: that.data.userInfo.tunnelId
    })
    //BUG:当连续断网连接时，userInfo.tunnelId可能不是最新的tunnelId_new
    tunnel.on('tunnelId_replaced', (res) => {//监听信道替换成功,再次发起匹配
      let userInfo = that.data.userInfo
      userInfo.tunnelId = res.tunnelId_new
      that.setData({
        status: '已连接，对手匹配中...',
        userInfo,//用户信息存储当前的信道ID
      })
    })
  }
  app.tunnelErrorCallback = (error) => {
    that.setData({ status: '信道发生错误：' + error })
    util.showSuccess('连接错误')
  }
  app.tunnelHas_matchedCallback = (res) => {
    console.log('res',res)
    let user_me, user_others
    for (let i in res.content) {
      if (res.content[i].openId) {
        if (res.content[i].openId == that.data.openId) {  //判断传过来的用户信息哪个是自己的
          user_me = res.content[i]
        } else {
          user_others = res.content[i]
        }
      }
    }
    wx.setStorageSync('user_me', user_me)
    wx.setStorageSync('user_others', user_others)
    that.setData({ status: user_me.nickName + ' VS ' + user_others.nickName })
    setTimeout(goto_fighting_room, 2000)//延迟1s跳转到战队页面
    function goto_fighting_room() {
      wx.redirectTo({ //navigateTo不会会卸载该页面，只是将当前页面隐藏了,redirectTo会销毁当前页面
        url: '../fighting_room/fighting_room?fighting_room_name=' + res.content.fighting_room_name
      })
    }
  }

}
module.exports = { match }
//index.js
var qcloud = require('../../vendor/wafer2-client-sdk/index')
var config = require('../../config')
var util = require('../../utils/util.js')
const app = getApp();
Page({
  data: {
    score: 0,
  },
  onLoad: function (opt) {
    app.appData.fromClickId = opt.currentClickId
    app.upDateUser_networkFromClickId = require('../../utils/upDateUser_networkFromClickId.js').upDateUser_networkFromClickId
    wx.showShareMenu({
      withShareTicket: true
    })
    app.pageGetUserInfo(this, this.getScore)
  },
  onShow: function () {
    if (this.data.openId){
      this.getScore(this.data.openId)
    }
    this.close_tunnel()//当信道连接或者重连了时，关闭已连接的信道
  },
  onShareAppMessage: function (res) {
    const that = this;
    return {
      title: '谁才是头脑王者？比比看吧！',
      path: '/pages/entry/entry?currentClickId=' + app.appData.currentClickId,
      success: (res) => { 
        //转发时向用户关系表中更新一条转发记录(个人为person，群为GId)。
        require('../../utils/upDateShareInfoToUser_network.js').upDateShareInfoToUser_network(app,that,res)
      }
    }
  },
  getScore(openId) {
    if (openId){
      qcloud.request({
        login: false,
        url: app.appData.baseUrl + 'get_score',
        data: {
          openId
        },
        success: (res) => {
          let score = res.data.data;
          this.setData({
            score
          })
        },
        fail(error) {
          util.showModel('请求失败', error);
        },
      });
    }
  },
  gotoFighting: function () {
    wx.navigateTo({
      url: '../fighting_sort/fighting_sort'
    })
  },
  gotoFriends: function () {
    wx.navigateTo({
      url: '../friends_sort/friends_sort'
    })
  },
  gotoCustomRoom: function () {
    wx.navigateTo({
      url: '../custom_room/custom_room'
    })
  },
  gotoRank: function () {
    wx.navigateTo({
      url: '../rank/rank'
    })
  },
  get_qr_address() {
    qcloud.request({
      login: false,
      url: app.appData.baseUrl + 'qr_address',
      success: (res) => {},
    });
  },
  close_tunnel() {
    //当信道连接或者重连了时，关闭已连接的信道
    if (app.appData.tunnel_status == 'connect' || app.appData.tunnel_status == 'reconnect') {
      app.tunnel.close();
    }
  }
})

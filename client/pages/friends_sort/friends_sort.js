let qcloud = require('../../vendor/wafer2-client-sdk/index')
let config = require('../../config')
let util = require('../../utils/util.js')

const app = getApp();
Page({
  data: {
    question_sort: [],
    sortId: '',
    sortName: '',
    choosed: true,
  },
  onLoad: function (opt) {
    app.appData.fromClickId = opt.currentClickId
    app.upDateUser_networkFromClickId = require('../../utils/upDateUser_networkFromClickId.js').upDateUser_networkFromClickId
    wx.showShareMenu({
      withShareTicket: true
    })
    app.pageGetUserInfo(this)
    this.getFriends_sort()
  },
  onShow: function () {
    this.close_tunnel()//当信道连接或者重连了时，关闭已连接的信道
  },
  onShareAppMessage: function (res) {
    const that = this;
    console.log('that.data.openId', that.data.openId)
    return {
      title: '谁才是' + this.data.sortName + '领域的王者？比比看吧！',
      path: '/pages/friends_match/friends_match?scene=1044&fromOpenId=' + that.data.openId + '&sortid=' + that.data.sortId + '&sortname=' + that.data.sortName + '&currentClickId=' + app.appData.currentClickId,
      success: function (res) {
        //转发时向用户关系表中更新一条转发记录(个人为person，群为GId)。
        require('../../utils/upDateShareInfoToUser_network.js').upDateShareInfoToUser_network(app, that, res)
        wx.navigateTo({
          url: '../friends_match/friends_match?scene=1044&fromOpenId=' + that.data.openId + '&sortid=' + that.data.sortId + '&sortname=' + that.data.sortName + '&currentClickId=' + app.appData.currentClickId,
        })
      }
    }
  },
  close_tunnel() {
    //当信道连接或者重连了时，关闭已连接的信道
    if (app.appData.tunnel_status == 'connect' || app.appData.tunnel_status == 'reconnect') {
      app.tunnel.close();
    }
  },
  getFriends_sort() {
    //util.showBusy('正在请求');
    qcloud.request({
      login: false,
      url: app.appData.baseUrl + 'question_sort',
      success: (res) => {
        // util.showSuccess('请求成功完成');
        let data0 = res.data.data;
        this.setData({
          question_sort: data0
        })
      },
      fail(error) {
        util.showModel('请求失败', error);
        console.log('request fail', error);
      },
    });
  },
  getShareInfo(e) {
    this.setData({
      choosed: false,
      sortId: e.target.dataset.sortid,
      sortName: e.target.dataset.sortname,
    })
  },
})
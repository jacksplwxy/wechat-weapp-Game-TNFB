let qcloud = require('../../vendor/wafer2-client-sdk/index')
let config = require('../../config')
let util = require('../../utils/util.js')

const app = getApp();
Page({
  data: {
    question_sort: [],
    sortId: '',
    sortName: '',
    showShareButton:false
  },
  onLoad (opt) {
    app.appData.fromClickId = opt.currentClickId
    app.upDateUser_networkFromClickId = require('../../utils/upDateUser_networkFromClickId.js').upDateUser_networkFromClickId
    wx.showShareMenu({
      withShareTicket: true
    })
    app.pageGetUserInfo(this)
    this.getFriends_sort()
  },
  onShow () {
    this.closeTunnel()//当信道连接或者重连了时，关闭已连接的信道
  },
  onShareAppMessage (res) {
    const that = this;
    app.appData.friendsFightingRoom = new Date().getTime().toString() + parseInt(Math.random() * 10000000)//创建:时间+随机数
    return {
      title: '谁才是' + this.data.sortName + '领域的王者？比比看吧！',
      path: '/pages/friends_match/friends_match?scene=1044&fromOpenId=' + that.data.openId + '&sortId=' + that.data.sortId + '&sortName=' + that.data.sortName + '&currentClickId=' + app.appData.currentClickId + '&friendsFightingRoom=' + app.appData.friendsFightingRoom,
      success: function (res) {
        that.setData({ showShareButton:false})
        //转发时向用户关系表中更新一条转发记录(个人为person，群为GId)。
        require('../../utils/upDateShareInfoToUser_network.js').upDateShareInfoToUser_network(app, that, res)
        wx.navigateTo({
             url: '../friends_match/friends_match?scene=1044&fromOpenId=' + that.data.openId + '&sortId=' + that.data.sortId + '&sortName=' + that.data.sortName + '&currentClickId=' + app.appData.currentClickId + '&friendsFightingRoom=' + app.appData.friendsFightingRoom,
        })
      }
    }
  },
  closeTunnel() {
    //当信道连接或者重连了时，关闭已连接的信道
    if (app.appData.tunnelStatus == 'connect' || app.appData.tunnelStatus == 'reconnect') {
      app.tunnel.close()
    }
  },
  getFriends_sort() {
    //util.showBusy('正在请求');
    qcloud.request({
      login: false,
      url: `${app.appData.baseUrl}question_sort`,
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
      sortId: e.target.dataset.sortid,
      sortName: e.target.dataset.sortname,
      showShareButton:true
    })
  },
  closeShareButton(){
    this.setData({
      showShareButton: false
    })
  }
})
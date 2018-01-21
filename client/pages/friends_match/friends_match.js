
var qcloud = require('../../vendor/wafer2-client-sdk/index')
var config = require('../../config')
var util = require('../../utils/util.js')
const match = require('../../utils/commonTunnelAPI.js').match//引入匹配函数
const app = getApp();
Page({
  data: {
    status: '初始化...',
    opt: '',
  },
  onLoad: function (opt) {
    app.appData.fromClickId = opt.currentClickId
    app.upDateUser_networkFromClickId = require('../../utils/upDateUser_networkFromClickId.js').upDateUser_networkFromClickId
    wx.showShareMenu({
      withShareTicket: true
    })
    this.setData({ opt })
    if (opt.scene == 1044) {  //打开页面，若含opt.scene == 1044,则表示改页面来自转发
      app.pageGetUserInfo(this, this.storeFriensNetwork)
    } else {
      app.pageGetUserInfo(this)
    }
    console.log('opt', opt)
    app.pageGetUserInfo(this, match(this, app, opt.sortid, opt.fromOpenId))//开始匹配
  },
  onShareAppMessage: function (res) {
     const that=this
    return {
      title: '我才是' + this.data.opt.sortname + '领域的王者,敢来挑战吗?',
      path: '/pages/friends_match/friends_match?scene=1044&fromOpenId=' + this.data.openId + '&sortid=' + this.data.opt.sortid + '&sortname=' + this.data.opt.sortname + '&currentClickId=' + app.appData.currentClickId,
      success: (res) => {
        //转发时向用户关系表中更新一条转发记录(个人为person，群为GId)。
        require('../../utils/upDateShareInfoToUser_network.js').upDateShareInfoToUser_network(app, that, res)
      }
    }
  },
  storeFriensNetwork: function () {
    const that = this;
    let [page, app] = [this, getApp()];
    let baseData = {
      openId: this.data.openId,
      appId: app.appData.appId,
      fromOpenId: this.data.opt.fromOpenId,
      fromGId: ''
    }
    wx.getShareInfo({
      shareTicket: app.appData.opt.shareTicket,  //当是从后台打开转发小程序，这时无法获取群信息
      success: (res) => {
        if (app.appData.gId) {
          baseData.fromGId = app.appData.gId
          storeFriendsNetwork(baseData)
        } else {
          app.gIdReadyCallback = (gId) => {
            baseData.fromGId = gId
            storeFriendsNetwork(baseData)
          }
        }
      },
      fail: function (res) {
        storeFriendsNetwork(baseData)
      }
    })
    function storeFriendsNetwork(data) {
      const that = this;
      qcloud.request({
        login: false,
        url: app.appData.baseUrl + 'storeFriendsNetwork',
        data,
        success(res) {
          console.info('【storeFriensNetwork】：存储finalData和clickId成功')
        },
        fail(error) {
          util.showModel('请求失败', error);
          console.log('request fail', error);
        },
      });
    }
  },
  goback() {
    wx.redirectTo({
      url: '../entry/entry',
    })
  },
})

var qcloud = require('../../vendor/wafer2-client-sdk/index')
var config = require('../../config')
var util = require('../../utils/util.js')
const app = getApp();
Page({
  data: {
    currentTab: 0,
    friendsData: [],
    globalData: [],
    loadNumber: 0//全球排名数据加载次数
  },
  onLoad: function (opt) {
    wx.showShareMenu({
      withShareTicket: true
    })
    app.pageGetUserInfo(this)
    this.getRankGlobalData();
  },
  onShow() {
    this.getRankFriendsData();
  },
  onReachBottom: function () {//下拉加载
    const that = this
    if (that.data.currentTab) {
      that.getRankGlobalData()
    }
  },
  getRankGlobalData() {//加载全球排名的数据
    const that = this
    qcloud.request({
      login: false,
      url: app.appData.baseUrl + 'getRankGlobalData',
      data: {
        loadNumber: that.data.loadNumber
      },
      success: (res) => {
        that.setData({
          globalData: that.data.globalData.concat(res.data.data),//数据叠加
          loadNumber: that.data.loadNumber+1
        })
      },
      fail(error) {
        util.showModel('请求失败', error);
        console.log('request fail', error);
      },
    })
  },
  getRankFriendsData: function () {
    const that = this
    qcloud.request({
      login: false,
      url: app.appData.baseUrl + 'getRankFriendsData',
      data: {
        openId: this.data.openId
      },
      success: (res) => {
        this.setData({
          friendsData: res.data.data
        })
      },
      fail(error) {
        util.showModel('请求失败', error);
        console.log('request fail', error);
      },
    });
  },
  swichNav(e) {
    var that = this;
    that.setData({
      currentTab: e.target.dataset.current,
    })
  },
})
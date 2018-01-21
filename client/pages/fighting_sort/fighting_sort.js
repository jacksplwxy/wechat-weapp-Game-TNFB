let qcloud = require('../../vendor/wafer2-client-sdk/index')
let config = require('../../config')
let util = require('../../utils/util.js')

let app = getApp();
Page({
  data: {
    question_sort: [],
  },
  onLoad: function (options) {
    this.getFighting_sort()
  },
  onShow:function(){
    this.close_tunnel()//当信道连接或者重连了时，关闭已连接的信道
  },
  getFighting_sort() {
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
  gotoFighting_match(e) {
    wx.redirectTo({
      url: '../fighting_match/fighting_match?sortId=' + e.target.dataset.sortid
    })
  },
  close_tunnel(){
    //当信道连接或者重连了时，关闭已连接的信道
    if (app.appData.tunnel_status == 'connect' || app.appData.tunnel_status == 'reconnect' ){
      app.tunnel.close();
    }
  }
})
let qcloud = require('../../vendor/wafer2-client-sdk/index')
let config = require('../../config')
let util = require('../../utils/util.js')
let app = getApp()

Page({
  data: {
    question_sort: [],
  },
  onLoad (options) {
    this.getFightingSort()
  },
  onShow(){
    this.closeTunnel()//当信道连接或者重连了时，关闭已连接的信道
  },
  getFightingSort() {
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
  gotoFightingMatch(e) {
    wx.redirectTo({
			url: `../fighting_match/fighting_match?sortId=${e.target.dataset.sortid} `
    })
  },
  closeTunnel(){
    //当信道连接或者重连了时，关闭已连接的信道
    if (app.appData.tunnelStatus === 'connect' || app.appData.tunnelStatus === 'reconnect' ){
      app.tunnel.close();
    }
  }
})
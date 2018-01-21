const qcloud = require('../../vendor/wafer2-client-sdk/index')
const config = require('../../config')
const util = require('../../utils/util.js')
const match = require('../../utils/commonTunnelAPI.js').match//引入匹配函数
const app = getApp();
Page({
  data: {
    status: '初始化...',
    number: 0,
  },
  onLoad: function (options) {
    app.pageGetUserInfo(this, match(this, app, options.sortId))//开始匹配
    this.match_time_run()
  },
  match_time_run() {
    let number = 1;
    let time = setInterval(() => {
      this.setData({
        number
      })
      number++
    }, 1000)
  },
})
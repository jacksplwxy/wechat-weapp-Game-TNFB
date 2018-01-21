//用于转发时向用户关系表中更新一条从哪个clickId打开的记录
const qcloud = require('../vendor/wafer2-client-sdk/index')
let upDateUser_networkFromClickId = (app,currentClickId, fromClickId) => {
  qcloud.request({
    login: false,
    data: {
      currentClickId,
      fromClickId
    },
    url: app.appData.baseUrl + 'upDateUser_networkFromClickId',
    success: (res) => { }
  })
}

module.exports = {upDateUser_networkFromClickId}
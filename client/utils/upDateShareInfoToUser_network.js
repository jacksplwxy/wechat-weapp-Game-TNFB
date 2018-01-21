//用于转发时向用户关系表中更新一条转发记录(个人为person，群为GId)
const qcloud = require('../vendor/wafer2-client-sdk/index')
function upDateShareInfoToUser_network(app, page, share_res) {
  let upDate = (content, clickId) => {
    qcloud.request({
      login: false,
      data: {
        clickId,
        content,
      },
      url: app.appData.baseUrl + 'upDateShareInfoToUser_network',
      success: (res) => { }
    })
  }
  const shareTickets = share_res.shareTickets
  if (!shareTickets) {
    //IOS转发给个人的时候shareTickets为null
    upDate('person', app.appData.currentClickId)
  } else {
    wx.getShareInfo({
      shareTicket: shareTickets[0],
      success: (res) => {
        qcloud.request({
          login: false,
          data: {
            appId: app.appData.appId,
            openId: page.data.openId,
            encryptedData: res.encryptedData,
            iv: res.iv
          },
          url: app.appData.baseUrl + 'getGId',
          success: (res) => {
            let GId = res.data.data
            upDate(GId, app.appData.currentClickId)
          }
        })
      },
      fail: (res) => {
        //Android转发给个人的时候shareTickets不为null,而是判断为fail
        upDate('person', app.appData.currentClickId)
      }
    })
  }
}

module.exports = { upDateShareInfoToUser_network }
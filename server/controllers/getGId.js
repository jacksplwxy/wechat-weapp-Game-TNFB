const WXBizDataCrypt = require('../tools/WXBizDataCrypt')
module.exports = async (ctx, next) => {
  if (ctx.state.$wxInfo.loginState === 1) {
    const query = ctx.query
    let appId = query.appId
    const { mysql } = require('../qcloud')
    let sessionKey = await mysql('cSessionInfo').where({ open_id: query.openId }).select('session_key')
    sessionKey = sessionKey[0].session_key
    let encryptedData = query.encryptedData
    let iv = query.iv
    let pc = new WXBizDataCrypt(appId, sessionKey)
    let data = pc.decryptData(encryptedData, iv)
    ctx.state.data = data.openGId
  } else {
    ctx.state.code = -1
  }
}
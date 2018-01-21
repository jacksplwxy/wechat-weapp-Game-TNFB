module.exports = async (ctx, next) => {
  if (ctx.state.$wxInfo.loginState === 1) {
    const query = ctx.query
    const { mysql } = require('../qcloud')
    let res = await mysql('user_network').insert({ clickId: null, fromClickId: query.fromClickId, appid: query.appId, openid: query.openId, fromGId: query.fromGId, scene: query.scene, time: null, param_1: '' }).returning('*')
    //let res = await mysql('user_network').select('clickId').orderBy('clickId', 'desc').limit(1)
    ctx.state.data = res[0]
  } else {
    ctx.state.code = -1
  }
}
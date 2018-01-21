module.exports = async (ctx, next) => {
  if (ctx.state.$wxInfo.loginState === 1) {
    const query = ctx.query
    const { mysql } = require('../qcloud')
    await mysql('friendsnetwork').insert({ id: null, openId: query.openId, appId: query.appId, fromOpenId: query.fromOpenId, fromGId: query.fromGId, time: null}).returning('*').then(res => {
    })
  } else {
    ctx.state.code = -1
  }
}
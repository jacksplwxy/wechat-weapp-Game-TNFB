module.exports = async (ctx, next) => {
  if (ctx.state.$wxInfo.loginState === 1) {
    const { mysql } = require('../qcloud')
    let res = await mysql('user_network').where({ clickId: ctx.query.currentClickId }).update({
      fromClickId: ctx.query.fromClickId
    })
  } else {
    ctx.state.code = -1
  }
}
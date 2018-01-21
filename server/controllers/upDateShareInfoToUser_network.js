module.exports = async (ctx, next) => {
  if (ctx.state.$wxInfo.loginState === 1) {
    const { mysql } = require('../qcloud')
    let res = await mysql('user_network').where({ clickId: ctx.query.clickId }).update({
      param_1: ctx.query.content
    })
  } else {
    ctx.state.code = -1
  }
}
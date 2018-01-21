module.exports = async (ctx, next) => {
  if (ctx.state.$wxInfo.loginState === 1) {
    const { mysql } = require('../qcloud')
    await mysql('cSessionInfo').where({open_id: ctx.query.openId}).select('score').then(res => {//获取原始得分
      ctx.state.data = res[0].score;
    })
  } else {
    ctx.state.code = -1
  }
}
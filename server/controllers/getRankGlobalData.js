module.exports = async (ctx, next) => {
  if (ctx.state.$wxInfo.loginState === 1) {
    const query = ctx.query
    const { mysql } = require('../qcloud')
    await mysql('cSessionInfo').select('user_info', 'score').orderBy('score', 'desc').limit(10).offset(query.loadNumber * 10).then(res => {//获取原始得分
      let arr = []
      res.forEach(function (val, i) {
        let value = JSON.parse(val.user_info)
        value.score = val.score
        arr[i] = value
      })
      ctx.state.data = arr
    })
    
  } else {
    ctx.state.code = -1
  }
}
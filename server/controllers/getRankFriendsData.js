module.exports = async (ctx, next) => {
  if (ctx.state.$wxInfo.loginState === 1) {
    const query = ctx.query
    const { mysql } = require('../qcloud')
    let res0 = await mysql('friendsnetwork').where({ fromOpenId: ctx.query.openId }).select('cSessionInfo.user_info', 'cSessionInfo.score').leftJoin('cSessionInfo', 'friendsnetwork.openId', 'cSessionInfo.open_id')
    let res1 = await mysql('friendsnetwork').where({ openId: ctx.query.openId }).select('cSessionInfo.user_info', 'cSessionInfo.score').leftJoin('cSessionInfo', 'friendsnetwork.fromOpenId', 'cSessionInfo.open_id') //注意：friendsnetwork.fromOpenId为undefined的情况
    let res_me = await mysql('cSessionInfo').where({ open_id: ctx.query.openId }).select('user_info','score')
    let res2 = res0.concat(res1.concat(res_me))
    let arr = []
    res2.forEach(function (val, i) {
      let value = JSON.parse(val.user_info)
      value.score = val.score
      arr[i] = value
    })
    function hashRemoveRepeat(arr) {  //去重函数
      var hash = {},
        len = arr.length,
        result = [];
      for (var i = 0; i < len; i++) {
        if (!hash[arr[i].openId]) {
          hash[arr[i].openId] = true;
          result.push(arr[i]);
        }
      }
      return result;
    }
    arr = hashRemoveRepeat(arr)
    arr.sort(function (a, b) {
      return b.score - a.score
    })
    ctx.state.data = arr;
  } else {
    ctx.state.code = -1
  }
}
var axios = require('axios');
var fs = require('fs');

module.exports = async (ctx, next) => {
  if (ctx.state.$wxInfo.loginState === 1) {
    /* async await和koa的执行顺序问题？？？？？*/
    let secret = require('../config.js').appSecret,
      appId = require('../config.js').appId
    console.log('appId', appId)
    // let url_access_token = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=' + appId+'&secret=' + secret, access_token
    // axios.get(url_access_token)
    //   .then(function (res) {
    //     access_token = res.data.access_token
    //     console.log('access_token', access_token)
    //     let url_qr = 'https://api.weixin.qq.com/cgi-bin/wxaapp/createwxaqrcode?access_token=' + access_token
    //     axios({
    //       method: "POST",
    //       url: url_qr,
    //       data: { path: "pages/web_view/web_view" },
    //       responseType: 'arraybuffer' //必须要写！
    //     }).then((res) => {
    //       console.log('res', res);
    //       var originBuffer = res.data
    //       console.log(Buffer.isBuffer(originBuffer));
    //       fs.writeFile('./qr.jpg', originBuffer, function (err) { //此段代码写在本地吧，让图片在本地生成，在手工上传到服务器上
    //         if (err) { console.log(err) }
    //       });
    //     });
    //   })

  } else {
    ctx.state.code = -1
  }
}
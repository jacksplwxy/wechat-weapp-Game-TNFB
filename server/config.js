
/*开发版*/

const CONF = {
  port: '5757',
  rootPathname: '',
  // 微信小程序 App ID
  appId: 'wx472e8ad45bbfcb79',
  // 微信小程序 App Secret
  appSecret: 'f486d093aaed727eab7453463c222d88',
  // 是否使用腾讯云代理登录小程序
  useQcloudLogin: true,
  /**
   * MySQL 配置，用来存储 session 和用户信息
   * 若使用了腾讯云微信小程序解决方案
   * 开发环境下，MySQL 的初始密码为您的微信小程序 appid
   */
  mysql: {
    host: 'localhost',
    port: 3306,
    user: 'root',
    db: 'cAuth',
    pass: 'wx472e8ad45bbfcb79',
    char: 'utf8mb4'
  },
  cos: {
    /**
     * 区域
     * @查看 https://cloud.tencent.com/document/product/436/6224
     */
    region: 'ap-guangzhou',
    // Bucket 名称
    fileBucket: 'wximg',
    // 文件夹
    uploadFolder: ''
  },
  // 微信登录态有效期
  wxLoginExpires: 7200
}
module.exports = process.env.NODE_ENV === 'local' ? Object.assign({}, CONF, require('./config.local')) : CONF;



/*生产版*/

// const CONF = {
//   port: '5757',
//   rootPathname: '',
//   // 微信小程序 App ID
//   appId: 'wx472e8ad45bbfcb79',
//   // 微信小程序 App Secret
//   appSecret: 'f486d093aaed727eab7453463c222d88',
//   // 是否使用腾讯云代理登录小程序
//   useQcloudLogin: true,
//   /**
//    * MySQL 配置，用来存储 session 和用户信息
//    * 若使用了腾讯云微信小程序解决方案
//    * 开发环境下，MySQL 的初始密码为您的微信小程序 appid
//    */
//   mysql: {
//     host: '172.16.0.9',
//     port: 3306,
//     user: 'root',
//     db: 'cAuth',
//     pass: 'hnch88778188',
//     char: 'utf8mb4'
//   },
//   cos: {
//     /**
//      * 地区简称
//      * @查看 https://cloud.tencent.com/document/product/436/6224
//      */
//     region: 'ap-guangzhou',
//     // Bucket 名称
//     fileBucket: 'qcloudtest',
//     // 文件夹
//     uploadFolder: ''
//   },
//   // 微信登录态有效期
//   wxLoginExpires: 7200,
//   wxMessageToken: 'abcdefgh',
//   qcloudAppId: '12559253720',
//   qcloudSecretId: 'AKIDnX9lIhybBcFj7N9sGbptmYPFxoZ9ZqkZ',
//   qcloudSecretKey: '772LXbZP7g4KuOp8GEPTUFwUr21qZGqG',
// }
// module.exports = CONF

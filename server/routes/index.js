/**
 * ajax 服务路由集合
 */
const router = require('koa-router')({
    prefix: '/weapp'   // 定义所有路由的前缀都已 /weapp 开头
})
const controllers = require('../controllers')

// 从 sdk 中取出中间件
// 这里展示如何使用 Koa 中间件完成登录态的颁发与验证
const { auth: { authorizationMiddleware, validationMiddleware } } = require('../qcloud')

// --- 登录与授权 Demo --- //
// 登录接口 /weapp/login
router.get('/login', authorizationMiddleware, controllers.login)
// 用户信息接口（可以用来验证登录态） /weapp/user
router.get('/user', validationMiddleware, controllers.user)

// --- 图片上传 Demo --- //
// 图片上传接口，小程序端可以直接将 url 填入 wx.uploadFile 中 /weapp/upload
router.post('/upload', controllers.upload)

// --- 信道服务接口 Demo --- //
// GET  用来响应请求信道地址的 /weapp/tunnel
router.get('/tunnel', controllers.tunnel.get)
// POST 用来处理信道传递过来的消息
router.post('/tunnel', controllers.tunnel.post)

// --- 客服消息接口 Demo --- //
// GET  用来响应小程序后台配置时发送的验证请求 /weapp/message
router.get('/message', controllers.message.get)
// POST 用来处理微信转发过来的客服消息
router.post('/message', controllers.message.post)


/***********************业务请求路由 start***************************/
//获取群ID
router.get('/getGId', validationMiddleware, controllers.getGId)

//请求得分数
router.get('/get_score', validationMiddleware, controllers.get_score)

//请求二维码图片地址
router.get('/qr_address', validationMiddleware, controllers.qr_address)

//请求题目分类
router.get('/question_sort', validationMiddleware, controllers.question_sort)

//存储用户分享后的信息(排行榜)
router.get('/storeFriendsNetwork', validationMiddleware, controllers.storeFriendsNetwork)

//获取好友用户关系表(排行榜)
router.get('/getRankFriendsData', validationMiddleware, controllers.getRankFriendsData)

//获取全球用户关系表(排行榜)
router.get('/getRankGlobalData', validationMiddleware, controllers.getRankGlobalData)

//存储用户关系点击表
router.get('/storeUser_network', validationMiddleware, controllers.storeUser_network)

//更新用户关系点击表中的fromClickId
router.get('/upDateUser_networkFromClickId', validationMiddleware, controllers.upDateUser_networkFromClickId)


//更新用户关系点击表中的param_1
router.get('/upDateShareInfoToUser_network', validationMiddleware, controllers.upDateShareInfoToUser_network)

/***********************业务请求路由 end***************************/

module.exports = router

const qcloud = require('../../vendor/wafer2-client-sdk/index')
const config = require('../../config')
const util = require('../../utils/util.js')
const app = getApp()
const option = {
	CHOICE_DELAY_SHOW: 1500,//选项延时1.5S显示
}

Page({
	data: {
		roomName: '',//对战房间号
		userInfo_me: '', //本人用户信息
		userInfo_others: '',//对手用户信息
		countdown: 10,//倒计时
		question: '',//websocket服务器传过来的问题及答案
		hasClick: false,//判断是否已选答案，不能重新选择
		localClick: false,//是否本地单击的答案
		tunnelIdReplacing: 0,//tunnelIdReplacing存在2种转态：0表示不存在信道替换，1表示信道正在替换中:禁止发送数据
		clickIndex: '',//判断用户选择了哪个答案
		answerColor: '',//根据选择正确与否给选项添加背景颜色
		scoreMyself: 0,//自己的总分
		status_users_others: {
			openId: '', //对手的openid
			userChoose: '',//对手选择了第几项
			answerColor: '',//对手是否选择正确
		},//对手的答题状态
		score_others: 0,//对手的总分
		game_over: false,  //判断此次PK是否结束
		win: 2,  //0:表示输，1：表示赢,2:表示平手
		sendNumber: 0,//每一轮的答题次数不能超过1次
	},
	onLoad(options) {
		app.appData.fromClickId = options.currentClickId
		app.upDateUser_networkFromClickId = require('../../utils/upDateUser_networkFromClickId.js').upDateUser_networkFromClickId
		wx.showShareMenu({
			withShareTicket: true
		})
		this.setData({
			roomName: options.roomName,
			userInfo_me: wx.getStorageSync('user_me'),
			userInfo_others: wx.getStorageSync('user_others'),
		})
		wx.removeStorageSync('user_me')//清理缓存
		wx.removeStorageSync('user_others')//清理缓存
		this.startAnimate()//定义开始动画
		this.fightingReady(options.roomName) //通知服务器我已准备好了
		this.exceptionalListener()  //监听异常情况，如断线重新连接  
	},
	onShareAppMessage(res) {
		const that = this;
		return {
			title: '谁才是头脑王者？比比看吧！',
			path: `/pages/entry/entry?currentClickId=${app.appData.currentClickId}`,
			success(res) {
				//转发时向用户关系表中更新一条转发记录(个人为person，群为GId)。
				require('../../utils/upDateShareInfoToUser_network.js').upDateShareInfoToUser_network(app, that, res)
				wx.redirectTo({
					url: '../entry/entry'
				})
			}
		}
	},
	fightingReady(roomName) { //通知服务器我已准备好了
		const that = this
		const tunnel = this.tunnel = app.tunnel
		//tunnel.emit('has_ready', { roomName })//通知服务器，已经准备好可以答题了

		//监听后台是否收到前端发送的选项
		tunnel.on('getAnswer', (res) => {
			that.setData({//答题后将hasClick设置为true,防止重新选择答案
				hasClick: true
			})
		})
		//监听是否在重连,若是，则禁止发送数据到后台
		app.tunnelReconnectingCallback = () => {
			that.setData({
				tunnelIdReplacing: 1,//tunnelIdReplacing存在2种转态：0表示不存在信道替换，1表示信道正在替换中 
			})
		}
		//监听逃跑者的信息
		tunnel.on('runawayNotice', (res) => {
			console.log('对手已逃跑')
			util.showSuccess(res.message)
			that.setData({
				game_over: true,
				win: 1,
			})
			app.tunnel.close()
		})
		//监听服务器端发送过来的问题
		let getNextQuestions, timerCountdown, timerReset  //定义倒计时定时器，定义重置定时器(注意：只有将timer_countdown定义在最外边才能清除掉上一个定时器)
		tunnel.on('sendQuestion', (res) => {
			console.log('收到题目', res)
			let question = res.question
			if (Object.getOwnPropertyNames(question).length) {
				question.answer = JSON.parse(question.answer)//将答案转换为js对象
			}
			//显示对手的答题状态
			if (res.choicePlayer1[0] !== that.data.userInfo_me.openId) {
				that.setData({
					status_users_others: {
						openId: res.choicePlayer1[0],
						userChoose: res.choicePlayer1[1],
						answerColor: res.choicePlayer1[2],
					},
					score_others: res.choicePlayer1[3],//对手总分单独拎出来，不更新
					animate_rightAnswer: 'right',//显示正确答案
				})
			} else {
				that.setData({
					status_users_others: {
						openId: res.choicePlayer2[0],
						userChoose: res.choicePlayer2[1],
						answerColor: res.choicePlayer2[2],
					},
					score_others: res.choicePlayer2[3],//对手总分单独拎出来，不更新
					animate_rightAnswer: 'right',//显示正确答案
				})
			}

			clearTimeout(getNextQuestions)
			if (Object.getOwnPropertyNames(question).length) {
				getNextQuestions = setTimeout(function () { //先等待2s查看对方的选择状态，再开始下一题
					reset(that)//运行重置函数  
				}, 2000)
			} else {  //当question中无问题时,即回答完所有问题
				getNextQuestions = setTimeout(function () { //答完题显示战果
					if (that.data.scoreMyself > that.data.score_others) {
						that.setData({
							game_over: true,
							win: 1,
						})
					} else if (that.data.scoreMyself < that.data.score_others) {
						that.setData({
							game_over: true,
							win: 0,
						})
					}
					else {
						that.setData({
							game_over: true
						})
					}
					//将当前用户的比赛结果发送给服务器
					tunnel.emit('fightingResult', {
						openId: that.data.userInfo_me.openId,
						fightingResult: that.data.win
					})
				}, 2000)
			}
			function reset(that) {//定义重置函数
				//获取新题目后,倒计时归为10，将clickIndex清空，hasClick改为未选择.
				that.setData({
					question,//更新题目
					animate_showChoice: '',
					countdown: 10,
					localClick: false,
					hasClick: false,
					clickIndex: '',
					answerColor: '',
					//scoreMyself: 0,
					status_users_others: {
						openId: '',
						userChoose: '',
						answerColor: '',
						//scoreMyself: 0,
					},
					sendNumber: 0,
					animate_rightAnswer: '',
				})

				//（重新）开始倒计时
				clearInterval(timerCountdown)//获取新题目后,倒计时定时器清空(注意：只有将timer_countdown定义在最外边才能清除掉上一个定时器)
				let countdown = that.data.countdown;
				setTimeout(() => {//2S后显示选项和开始倒计时
					that.setData({ animate_showChoice: 'fadeIn' })
					timerCountdown = setInterval(function () {
						countdown--
						that.setData({
							countdown
						})
						if (countdown == 0) {
							clearInterval(timerCountdown)
						}
					}, 1000)
				}, option.CHOICE_DELAY_SHOW)

				//（重新）设置定时器，若用户未选择答案，10s后也将用户结果发给服务器
				clearTimeout(timerReset);
				timerReset = setTimeout(() => {
					if (!that.data.localClick && !that.data.hasClick) {
						that.sendAnswer(that)
					}
				}, 11000)
			}
		})
	},
	answer(e) {//开始答题
		const that = this
		if (!that.data.localClick) {  //防止重新选择答案
			if (e.currentTarget.dataset.right) {//判断答案是否正确
				that.setData({
					clickIndex: e.currentTarget.dataset.index,
					answerColor: 'right'
				})
				//答对了则加分，时间越少加分越多,总分累加
				that.setData({
					scoreMyself: that.data.scoreMyself + that.data.countdown * 10
				})
			} else {
				that.setData({
					clickIndex: e.currentTarget.dataset.index,
					answerColor: 'error'
				})
			}
			that.setData({
				localClick: true//本地已经点击,若hasClick仍未false，则说明没有发送数据出去
			})
			that.sendAnswer(that)
		}
	},
	//ping-pong机制，监听前端是否与服务端保持长连接,防止答题期间的卡死问题
	sendAnswer(that) {//若存在信道替换，且信道替换还未完成，则不发送数据到后台，但是本地还是算点击一次,
		if (that.data.sendNumber > 0) {
			return
		}
		if (that.data.tunnelIdReplacing == 1 || !(app.appData.tunnelStatus == 'connect' || app.appData.tunnelStatus == 'reconnect')) {//当信道正在替换中时，禁止发送数据
			return
		}
		that.tunnel.emit('answer', {  //将选项、是否正确、总分3项发送给服务器，若双方都已发送，服务器直接返回下一题
			roomName: that.data.roomName,
			choice: {
				openId: that.data.userInfo_me.openId,
				userChoose: that.data.clickIndex,
				answerColor: that.data.answerColor,
				scoreMyself: that.data.scoreMyself,
			}
		})
		let sendNumber = that.data.sendNumber + 1//BUG:保证每一轮发送次数不能大于1，至于为什么会大于1，暂时不清楚原因
		that.setData({
			sendNumber,
		})
	},
	//异常处理：重新连接、网络错误
	exceptionalListener() {
		const that = this
		const tunnel = this.tunnel = app.tunnel
		//重新连接后，信道id会改变,通知服务器信道id已改变，待接收到服务器端信道ID已替换的通知后再将选项发送给服务器
		app.tunnelReconnectCallback = () => {
			//信道id完成替换后，将本地的userInfo_me中的tunnel_id进行更新
			tunnel.on('tunnelIdReplaced', (res) => {//监听信道替换成功
				let userInfo_me = that.data.userInfo_me
				userInfo_me.tunnel_id = res.newTunnelId
				that.setData({//更新当前用户的信道idh和信道替换状态
					userInfo_me,
					tunnelIdReplacing: 0
				})
				if (that.data.localClick && !that.data.hasClick) {//如果本地已点击过，并且还没发送成功，则向服务器再次发送数据
					that.sendAnswer(that)
				}
			})
		}
	},
	continue_fighting() {
		wx.reLaunch({
			url: '../entry/entry',
		})
	},
	startAnimate() {
		const that = this
		that.setData({
			zoomIn: 'zoomIn'
		})
		setTimeout(function () {
			that.setData({
				zoomOut: 'zoomOut'
			})
		}, 1500)
	}
})
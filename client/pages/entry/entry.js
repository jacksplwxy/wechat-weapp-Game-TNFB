//index.js
var qcloud = require('../../vendor/wafer2-client-sdk/index')
var config = require('../../config')
var util = require('../../utils/util.js')
const app = getApp();
Page({
	data: {
		score: 0,
	},
	onLoad(opt) {
		app.appData.fromClickId = opt.currentClickId
		app.upDateUser_networkFromClickId = require('../../utils/upDateUser_networkFromClickId.js').upDateUser_networkFromClickId
		wx.showShareMenu({
			withShareTicket: true
		})
		app.pageGetUserInfo(this, this.getScore)
	},
	onShow() {
		if (this.data.openId) {
			this.getScore(this.data.openId)
		}
		this.closeTunnel()//当信道连接或者重连了时，关闭已连接的信道
	},
	onShareAppMessage(res) {
		const that = this;
		return {
			title: '谁才是头脑王者？比比看吧！',
			path: `/pages/entry/entry?currentClickId=${app.appData.currentClickId}`,
			success: (res) => {
				//转发时向用户关系表中更新一条转发记录(个人为person，群为GId)。
				require('../../utils/upDateShareInfoToUser_network.js').upDateShareInfoToUser_network(app, that, res)
			}
		}
	},
	getScore(openId) {
		if (openId) {
			qcloud.request({
				login: false,
				url: `${app.appData.baseUrl}get_score`,
				data: {
					openId
				},
				success: (res) => {
					let score = res.data.data;
					this.setData({
						score
					})
				},
				fail(error) {
					util.showModel('请求失败', error);
				},
			});
		}
	},
	gotoFighting() {
		wx.navigateTo({
			url: '../fighting_sort/fighting_sort'
		})
	},
	gotoFriends() {
		wx.navigateTo({
			url: '../friends_sort/friends_sort'
		})
	},
	gotoCustomRoom() {
		wx.navigateTo({
			url: '../custom_room/custom_room'
		})
	},
	gotoRank() {
		wx.navigateTo({
			url: '../rank/rank'
		})
	},
	get_qr_address() {
		qcloud.request({
			login: false,
			url: `${app.appData.baseUrl}qr_address`,
			success: (res) => { },
		});
	},
	closeTunnel() {
		//当信道连接或者重连了时，关闭已连接的信道
		if (app.appData.tunnelStatus == 'connect' || app.appData.tunnelStatus == 'reconnect') {
			app.tunnel.close();
		}
	}
})

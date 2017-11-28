// var express = require('express')
// var router = express.Router()

// router.use((req, res, next) => {
// 	res.setHeader('Access-Control-Allow-Origin', '*')
// 	next()
// })
// router.get('/login', (req, res) => {
// 	res.sendFile(__dirname + '/' + 'login.html')
// })
// router.get('/addUser', (req, res) => {
// 	res.sendFile(__dirname + '/' + 'addUser.html')
// })
// var login = require('./login')
// router.use(login)
// var user = require('./user')
// router.use(user)
// var part = require('./part')
// router.use(part)
// var role = require('./role')
// router.use(role)

// module.exports = router

var express = require('express');
var cors = require('cors');
var app = express();
app.use(cors())

// 页面
var page = require('./page')
app.use(page)
// 登录注册
var login = require('./login')
app.use(login)
// 用户
var user = require('./user')
app.use(user)
// 部门
var part = require('./part')
app.use(part)
// 角色
var role = require('./role')
app.use(role)

var server = app.listen(3000, function () {
 
  var host = server.address().address
  var port = server.address().port
 
  console.log("应用实例，访问地址为 http://%s:%s", host, port)
 
})



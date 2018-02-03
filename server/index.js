var express = require('express');
var cors = require('cors');
var app = express();
app.use(cors())

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
// 菜单
var menu = require('./menu')
app.use(menu)
// 购物车
var shop = require('./shop')
app.use(shop)
// 收藏
var collect = require('./collect')
app.use(collect)
// 订单
var order = require('./order')
app.use(order)

var server = app.listen(3000, function () {
// var server = app.listen(8000, function () {
 
  var host = server.address().address
  var port = server.address().port
 
  console.log("应用实例，访问地址为 http://%s:%s", host, port)
 
})



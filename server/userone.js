var router = require('./router')
var pool = require('./pool')

var {getListOneTable, addLine} = require('./api')
// 注册/新增用户(phone, name, password)
// user/add
addLine('/user/add', 'user', 'null, ?, ?, ?, "商户", null, null, null, null', {errMsg: '手机号已经注册过了'})

module.exports = router
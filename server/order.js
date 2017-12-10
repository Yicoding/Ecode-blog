var express = require('express')
var router = express.Router()
var mysql = require('mysql')
var bodyParser = require('body-parser')
var pool  = mysql.createPool({
	host: 'localhost',
	user: 'root',
	password: 'root',
	port: '3306',
	database: 'myblog'
})
router.use(bodyParser.json())
router.use(bodyParser.urlencoded({ extended: false }))


// order
// order/add
router.post('/api/order/add', (req, res) => {
	var sql = 'insert into orderlist values(null,?,?,0,null,null,?,?,?)'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.body.user_id, req.body.createdTime, req.body.content, req.body.menuNum, req.body.priceAll], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})

// ordermennu/add
router.post('/api/ordermenu/add', (req, res) => {
	var sql = 'insert into ordermenu values(null,?,?)'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.body.menu_id, req.body.total], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})

// /order/findall
router.get('/api/order/findall', (req, res) => {
	var sql = 'select * from orderlist where user_id=? order by createdTime DESC'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.query.user_id], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})
// order/findByType
router.get('/api/order/findByType', (req, res) => {
	var sql = 'select * from orderlist where user_id=? and status=? order by createdTime DESC'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.query.user_id, req.query.status], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})
// 再来一单
router.post('/api/shop/addArr', (req, res) => {
	let sql = 'insert into shop(id, user_id, menu_id, total, isCheck) values'
	console.log(JSON.stringify(req.body.content))
	let content = req.body.content
	for (let k = 0; k < content.length-1; k ++) {
		sql += '(null,' + req.body.user_id + ',' + content[k].menu_id + ',' + content[k].total + ',"true"),'
	}
	sql += '(null,' + req.body.user_id + ',' + content[content.length-1].menu_id + ',' + content[content.length-1].total + ',"true")'
	pool.getConnection(function(err, connection) {
		connection.query(sql, (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})

// order/root/findAll
router.get('/api/order/root/findAll', (req, res) => {
	var sql = 'select * from orderlist order by createdTime DESC'
	pool.getConnection(function(err, connection) {
		connection.query(sql, (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})
// order/root/findByType
router.get('/api/order/root/findByType', (req, res) => {
	var sql = 'select * from orderlist where status=? order by createdTime DESC'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.query.status], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})
// 确认发货
router.put('/api/order/surepost', (req, res) => {
	var sql = 'update orderlist set status=1, acceptTime=? where id=?'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.body.acceptTime, req.body.id], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})

// 确认收货
router.put('/api/order/surearrive', (req, res) => {
	var sql = 'update orderlist set status=2, completeTime=? where id=?'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.body.completeTime, req.body.id], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})
// 新增评论rate
router.post('/api/rate/add', (req, res) => {
	var sql = 'insert into ratelist values(null,?,?,?,?,?,?)'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.body.menu_id, req.body.content, req.body.star, req.body.time, req.body.user_id, req.body.picture], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})
// 修改订单字段（改为已评价）
router.put('/api/order/hasRate', (req, res) => {
	var sql = 'update orderlist set content=? where id=?'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.body.content, req.body.id], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})
// 查看自己的评价
router.get('/api/ratelist/mine', (req, res) => {
	var sql = 'select * from ratelist where user_id=? order by time DESC'
	console.log(sql)
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.query.user_id], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})

module.exports = router
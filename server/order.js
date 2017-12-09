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
// order/surelist
router.get('/api/order/surelist', (req, res) => {
	var sql = 'select s.id, s.menu_id, s.total, s.isCheck, m.name, m.price, m.type_id, m.desc, m.picture from shop s inner join menu m on s.menu_id=m.id where s.user_id=? and isCheck="true"'
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

// /order/put
router.put('/api/order/put', (req, res) => {
	var searchsql = 'select 1 from order where menu_id=? and user_id=? limit 1'
	pool.getConnection((err, connection) => {
		connection.query(searchsql, [req.body.menu_id, req.body.user_id], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data[0])
				let num
				for (let k in data[0]) {
					num = data[0][k]
				}
				console.log(num)
				if (num == 1) {
					console.log('更新数据')
					let sql
					req.body.action == 'add' ? sql = 'update order set total=total+1 where menu_id=? and user_id=?' : sql = 'update order set total=total-1 where menu_id=? and user_id=?'
					connection.query(sql, [req.body.menu_id, req.body.user_id], (error, result) => {
						if (error) {
							res.status(500).send(error)
						} else {
							res.status(200).send({code: 'ok'})
						}
						connection.release();
					})
				} else {
					console.log('新增')
					let sql = 'insert into order values(null, ?, ?, 1, "false")'
					connection.query(sql, [req.body.user_id, req.body.menu_id], (error, result) => {
						if (error) {
							res.status(500).send(error)
						} else {
							res.status(200).send({code: 'ok'})
						}
						connection.release();
					})
				}
			} 
		})
	})
})
// order/delete
router.delete('/api/order/remove', (req, res) => {
	var searchsql = 'select total from order where menu_id=? and user_id=?'
	pool.getConnection((err, connection) => {
		connection.query(searchsql, [req.query.menu_id, req.query.user_id], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data)
				if (data[0].total > 1) {
					let sql = 'update order set total=total-1 where menu_id=? and user_id=?'
					connection.query(sql, [req.query.menu_id, req.query.user_id], (error, result) => {
						if (error) {
							res.status(500).send(error)
						} else {
							res.status(200).send({code: 'ok'})
						}
						connection.release();
					})
				} else {
					let sql = 'delete from order where menu_id=? and user_id=?'
					connection.query(sql, [req.query.menu_id, req.query.user_id], (error, result) => {
						if (error) {
							res.status(500).send(error)
						} else {
							res.status(200).send({code: 'ok'})
						}
						connection.release();
					})
				}
			} 
		})
	})
})

// order/multiple
router.put('/api/order/multiple', (req, res) => {
	var sql = 'update order set isCheck=? where user_id=?'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.body.isCheck, req.body.user_id], (err, data) => {
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
// order/changeone
router.put('/api/order/changeone', (req, res) => {
	var sql = 'update order set isCheck=? where user_id=? and menu_id=?'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.body.isCheck, req.body.user_id, req.body.menu_id], (err, data) => {
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

// order/deleteCheck
router.delete('/api/order/deleteCheck', (req, res) => {
	var sql = 'delete from order where id in (?) and user_id=?'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.query.data, req.query.user_id], (err, data) => {
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
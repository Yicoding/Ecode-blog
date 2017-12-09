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


// shop
// /shop/findall
router.get('/api/shop/findall', (req, res) => {
	var sql = 'select s.id, s.menu_id, s.total, s.isCheck, m.name, m.price, m.type_id, m.desc, m.picture from shop s inner join menu m on s.menu_id=m.id where s.user_id=?'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.query.uid], (err, data) => {
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
// /shop/put
router.put('/api/shop/put', (req, res) => {
	var searchsql = 'select 1 from shop where menu_id=? and user_id=? limit 1'
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
					req.body.action == 'add' ? sql = 'update shop set total=total+1 where menu_id=? and user_id=?' : sql = 'update shop set total=total-1 where menu_id=? and user_id=?'
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
					let sql = 'insert into shop values(null, ?, ?, 1, "false")'
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
// shop/delete
router.delete('/api/shop/remove', (req, res) => {
	var searchsql = 'select total from shop where menu_id=? and user_id=?'
	pool.getConnection((err, connection) => {
		connection.query(searchsql, [req.query.menu_id, req.query.user_id], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data)
				if (data[0].total > 1) {
					let sql = 'update shop set total=total-1 where menu_id=? and user_id=?'
					connection.query(sql, [req.query.menu_id, req.query.user_id], (error, result) => {
						if (error) {
							res.status(500).send(error)
						} else {
							res.status(200).send({code: 'ok'})
						}
						connection.release();
					})
				} else {
					let sql = 'delete from shop where menu_id=? and user_id=?'
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

// shop/multiple
router.put('/api/shop/multiple', (req, res) => {
	var sql = 'update shop set isCheck=? where user_id=?'
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
// shop/changeone
router.put('/api/shop/changeone', (req, res) => {
	var sql = 'update shop set isCheck=? where user_id=? and menu_id=?'
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

// shop/deleteCheck
router.delete('/api/shop/deleteCheck', (req, res) => {
	var sql = 'delete from shop where menu_id in (' + req.query.data + ') and user_id=?'
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
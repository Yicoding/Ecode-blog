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

// menu
// /menu/findall
router.get('/api/menu/findall/:type/:order', (req, res) => {
	var sql = 'select * from menu order by ' + req.params.type + ' ' + req.params.order
	// console.log(req.params.type + ',' + req.params.order)
	pool.getConnection(function(err, connection) {
		connection.query(sql, (err, data, fields) => {
			if (err) {
				res.status(500).send(err)
			} else {
				res.send(data)
				console.log(data)
			}
			connection.release();
		})
	})
	// connection.end()
})
// menu/findone
router.get('/api/menu/findone', (req, res) => {
	var sql = 'select * from menu where id=' + req.query.id
	pool.getConnection(function(err, connection) {
		connection.query(sql, (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				res.send(data[0])
			}
			connection.release();
		})
	})
})
// menu/like(模糊查询)
router.get('/api/menu/like', (req, res) => {
	let sql = 'select * from menu where name like "%' + req.query.name + '%"' + ' order by ' + req.query.type + ' ' + req.query.order
	pool.getConnection((err, connection) => {
		connection.query(sql, (err, data, fields) => {
			if (err) {
				console.log(err)
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release()
		})
	})
})
// menu/add
router.post('/api/menu/add', (req, res) => {
	// res.send({name: req.body.name, fullname: req.body.fullname})
	if (!req.body.name) {
		res.status(500).send({'message':'角色不能为空'})
	} else if (!req.body.fullname) {
		res.status(500).send({'message':'角色名不能为空'})
	} else {
		var sql = 'insert into menu values(null,?,?)'
		pool.getConnection(function(err, connection) {
			connection.query(sql, [req.body.name, req.body.fullname], (err, data, fields) => {
				if (err) {
					res.status(500).send(err)
				} else {
					res.send(data)
					console.log(data)
				}
				connection.release();
			})
		})
		// connection.end()		
	}
})
// menu/put
router.put('/api/menu/put', (req, res) => {
	if (!req.body.name) {
		res.status(500).send([{'message':'角色不能为空'}])
	} else if (!req.body.fullname) {
		res.status(500).send({'message':'角色名不能为空'})
	} else {
		var sql = 'update menu set name=?,fullname=? where id=' + req.body.id
		pool.getConnection(function(err, connection) {
			connection.query(sql, [req.body.name, req.body.fullname], (err, data, fields) => {
				if (err) {
					res.status(500).send(err)
				} else {
					res.send(data)
					console.log(data)
				}
				connection.release();
			})
		})
	}
})
// menu/delete
router.delete('/api/menu/:id', (req, res) => {
	var sql = 'delete from menu where id=' + req.params.id
	pool.getConnection(function(err, connection) {
		connection.query(sql, (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				res.send(data)
				console.log(data)
			}
			connection.release();
		})
	})
})

// rate
// rate/find
router.get('/api/rate/:type', (req, res) => {
	let sql
	if (req.params.type == 'all') {
		sql = 'select r.id, r.star, r.time, r.content, u.name as user_name from ratelist r inner join user u on r.user_id=u.id where menu_id=? order by star DESC'
	} else if (req.params.type == 'great') {
		sql = 'select r.id, r.star, r.time, r.content, u.name as user_name from ratelist r inner join user u on r.user_id=u.id where star>3 and menu_id=? order by star DESC'
	} else if (req.params.type == 'good') {
		sql = 'select r.id, r.star, r.time, r.content, u.name as user_name from ratelist r inner join user u on r.user_id=u.id where star=3 and menu_id=? order by star DESC'
	} else {
		sql = 'select r.id, r.star, r.time, r.content, u.name as user_name from ratelist r inner join user u on r.user_id=u.id where star<3 and menu_id=? order by star DESC'
	}
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.query.menu_id], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				res.send(data)
				console.log(data)
			}
			connection.release();
		})
	})
})
// rate
// /greatNum/rate
router.get('/api/greatNum/rate', (req, res) => {
	let sql = 'select count(*) as greatNum from ratelist where menu_id=? and star>3'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.query.menu_id], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				res.send(data[0])
				console.log(data)
			}
			connection.release();
		})
	})
})

// rate
// /rateAllNum/rate
router.get('/api/rateAllNum/rate', (req, res) => {
	let sql = 'select count(*) as rateAllNum from ratelist where menu_id=?'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.query.menu_id], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				res.send(data[0])
				console.log(data)
			}
			connection.release();
		})
	})
})

// saleNum
router.get('/api/menu/saleNum', (req, res) => {
	var sql = 'select sum(num) as nums from ordermenu where menu_id=?'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.query.menu_id], (err, data, fields) => {
			if (err) {
				res.status(500).send(err)
			} else {
				res.send(data[0])
				console.log(data)
			}
			connection.release();
		})
	})
})
// imgArr
router.get('/api/menu/imgArr', (req, res) => {
	var sql = 'select * from menuimg where menu_id=?'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.query.menu_id], (err, data, fields) => {
			if (err) {
				res.status(500).send(err)
			} else {
				res.send(data)
				console.log(data)
			}
			connection.release();
		})
	})
})



module.exports = router
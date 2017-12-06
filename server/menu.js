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
module.exports = router
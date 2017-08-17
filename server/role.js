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
// role
// /role/findall
router.get('/api/role/findall', (req, res) => {
	var sql = 'select * from role'
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
// role/findone
router.get('/api/role/findone', (req, res) => {
	var sql = 'select * from role where id=' + req.query.id
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
// role/add
router.post('/api/role/add', (req, res) => {
	// res.send({name: req.body.name, fullname: req.body.fullname})
	if (!req.body.name) {
		res.status(500).send({'message':'角色不能为空'})
	} else if (!req.body.fullname) {
		res.status(500).send({'message':'角色名不能为空'})
	} else {
		var sql = 'insert into role values(null,?,?)'
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
// role/put
router.put('/api/role/put', (req, res) => {
	if (!req.body.name) {
		res.status(500).send([{'message':'角色不能为空'}])
	} else if (!req.body.fullname) {
		res.status(500).send({'message':'角色名不能为空'})
	} else {
		var sql = 'update role set name=?,fullname=? where id=' + req.body.id
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
// role/delete
router.delete('/api/role/:id', (req, res) => {
	var sql = 'delete from role where id=' + req.params.id
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
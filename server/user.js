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

// 查看个人信息
router.get('/api/user/loginname', (req, res) => {
	var sql = 'select * from user where name=?'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.query.name], (err, data, fields) => {
			if (err) {
				console.log(err)
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data[0])
			}
			connection.release();
		})
	})
})
// user
// /user/findall
router.get('/api/user/findall', (req, res) => {
	var sql = 'select user.id, user.name, user.age, user.password, role.id as roleId, role.name as roleName, role.fullname as rolefullName, part.id as partId, part.name as partName from user join role on user.role_id=role.id join part on user.part_id=part.id'
	pool.getConnection(function(err, connection) {
		connection.query(sql, (err, data, fields) => {
			if (err) {
				res.status(500).send(err)
			} else {
				// res.send(data)
				// console.log(data)
				var result = []
				for (var k = 0; k < data.length; k ++) {
					result.push({
						id: data[k].id,
						name: data[k].name,
						age: data[k].age,
						password: data[k].password,
						role: {
							id: data[k].roleId,
							name: data[k].roleName,
							fullname: data[k].rolefullName
						},
						part: {
							id: data[k].partId,
							name: data[k].partName
						}
					})
				}
				res.send(result)
			}
			connection.release();
		})
	})
})
// user/findone
router.get('/api/user/findone', (req, res) => {
	var sql = 'select * from user where id=' + req.query.id
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

// user/add
router.post('/api/user/rootadd', (req, res) => {
	if (!req.body.name) {
		res.send({code: 500, message:'姓名不能为空'})
	} else if (!req.body.age) {
		res.send({code: 500, message: '年龄不能为空'})
	} else if (!req.body.password) {
		res.send({code: 500, message: '密码不能为空'})
	} else if (req.body.part_id == 0) {
		res.send({code: 500, message: '请选择一个部门'})
	} else {
		var sql = 'insert into user values(null,?,?,?,?,?)'
		pool.getConnection((err, connection) => {
			connection.query(sql, [req.body.name, req.body.age, req.body.password, req.body.role_id, req.body.part_id], (err, data) => {
				if (err) {
					res.status(500).send(err)
				} else {
					res.send(data)
				}
				connection.release();
			})
		})
		// connection.end()		
	}
})
// user/put
router.put('/api/user/rootput', (req, res) => {
	if (!req.body.name) {
		res.send({code: 500, message: '姓名不能为空'})
	} else if (!req.body.age) {
		res.send({code: 500, message: '年龄不能为空'})
	} else if (!req.body.password) {
		res.send({code: 500, message: '密码不能为空'})
	} else {
		var sql = 'update user set name=?, age=?, password=?, part_id=? where id=' + req.body.id
		pool.getConnection((err, connection) => {
			connection.query(sql, [req.body.name, req.body.age, req.body.password, req.body.part_id], (err, data, fields) => {
				if (err) {
					res.status(500).send(err)
				} else {
					console.log(data)
					res.send({code: 200, message: '修改成功'})
				}
				connection.release();
			})
		})
	}
})
// user/delete
router.delete('/api/user/:id', (req, res) => {
	var sql = 'delete from user where id=' + req.params.id
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

// 根据部门id查询用户
router.get('/api/part/:id/users', (req, res) => {
	var sql = 'select * from user where part_id=?'
	pool.getConnection((error, connection) => {
		connection.query(sql, [req.params.id], (err, data, fields) => {
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
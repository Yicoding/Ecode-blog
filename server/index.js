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
router.use((req, res, next) => {
	res.setHeader('Access-Control-Allow-Origin', '*')
	next()
})

// /user/findByName
router.get('/api/user/findByName', (req, res) => {
	var sql = 'select *  from user where name=? and password=?'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.query.name, req.query.password], (err, data) => {
			if (err) {
				res.send(err)
			} else {
				// res.send(data[0])
				console.log(data)
				if (data.length > 0) {
					connection.query('select * from loginfo where name=?', [data[0].name], (err, todo) => {
						if (todo.length > 0) {
							console.log(todo[0])
							res.send({code: 200, message: '登陆成功'})
						} else {
							connection.query('insert into loginfo values (null, ?, ?, ?, ?)', [data[0].name, data[0].age, data[0].password, data[0].role_id], (err, result) => {
								if (err) {
									res.send(err)
								} else {
									res.send({code: 200, message: '登陆成功'})
									setTimeout(() => {
										connection.query('delete from loginfo where name=?',[data[0].name], (err, result) => {

										})
									},1200000)
								}
							})
						}
					})
				} else {
					res.json({code: 500, message: '用户名或密码不正确'})
				}
			}
			connection.release();
		})
	})
})
// /user/add
router.post('/api/user/add', (req, res) => {
	var sql = 'insert into user values(null, ?, ?, ?, ?)'
	pool.getConnection((err, connection) => {
		connection.query('select * from user where name=?', [req.body.name], (err, result) => {
			if (result.length > 0) {
				res.status(500).send('用户名已存在')
			} else {
				connection.query(sql, [req.body.name, req.body.age, req.body.password, req.body.role_id], (err, data) => {
					if (err) {
						res.send(err)
					} else {
						res.send(data)
					}
					connection.release()
				})
			}
		})
	}) 
})
// /user/put
router.put('/api/user/put', (req, res) => {
	var sql = 'select * from user where name=?'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.body.name], (err, data) => {
			if (err) {
				res.send(err)
			} else {
				console.log(data[0])
				if (data[0].password == req.body.oldpwd) {
					connection.query('update user set password=? where name=?', [req.body.newpwd, req.body.name], (err, result) => {
						if (err) {
							res.send(err)
						} else {
							res.send({code: 200, message: '修改成功'})
						}
					})
				} else {
					res.json({code: 500, message: '旧密码不正确'})
				}
			}
			connection.release()
		})
	}) 
})
// /user/loginfo
router.get('/api/user/loginfo', (req, res) => {
	// var sql = 'select * from loginfo where name=?'
	var sql = 'select l.id, l.name, l.age, r.name rolename, r.fullname from loginfo l inner join role r on l.rid=r.id where l.name=?'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.query.name], (err, data) => {
			if (err) {
				res.send(err)
			} else {
				console.log(data[0].loginname)
				if (data.length > 0) {
					res.send({
						id: data[0].id,
						name: data[0].name,
						age: data[0].age,
						role: {
							name: data[0].rolename,
							fullname: data[0].fullname
						}

					})
				} else {
					res.status(500).send({code: 500, message: '请重新登陆'})
				}
			}
			connection.release();
		})
	})
})
// /user/logout
router.get('/api/loginfo/logout', (req, res) => {
	pool.getConnection(function(err, connection) {
		connection.query('delete from loginfo where name=?', [req.query.name], (err, data) => {
			if (err) {
				res.send(err)
			} else {
				res.send(data)
				console.log(data)
			}
			connection.release();
		})
	})
})
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
	// res.send({name: req.body.name, fullname: req.body.fullName})
	if (!req.body.name) {
		res.status(500).send({'message':'角色不能为空'})
	} else if (!req.body.fullName) {
		res.status(500).send({'message':'角色名不能为空'})
	} else {
		var sql = 'insert into role values(null,?,?)'
		pool.getConnection(function(err, connection) {
			connection.query(sql, [req.body.name, req.body.fullName], (err, data, fields) => {
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
	} else if (!req.body.fullName) {
		res.status(500).send({'message':'角色名不能为空'})
	} else {
		var sql = 'update role set name=?,fullName=? where id=' + req.body.id
		pool.getConnection(function(err, connection) {
			connection.query(sql, [req.body.name, req.body.fullName], (err, data, fields) => {
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




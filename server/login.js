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
							connection.query('insert into loginfo values (?, ?, ?, ?, ?, ?)', [data[0].id, data[0].name, data[0].age, data[0].password, data[0].role_id, data[0].part_id], (err, result) => {
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
	var sql = 'insert into user values(null, ?, ?, ?, 3, 5)'
	pool.getConnection((err, connection) => {
		connection.query('select * from user where name=?', [req.body.name], (err, result) => {
			if (result.length > 0) {
				res.status(500).send('用户名已存在')
			} else {
				connection.query(sql, [req.body.name, req.body.age, req.body.password], (err, data) => {
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
	var sql = 'select l.id, l.name, l.age, r.id rid, r.name rolename, r.fullname, p.id pid, p.name pname from loginfo l inner join role r on l.rid=r.id join part p on l.pid=p.id where l.name=?'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.query.name], (err, data) => {
			if (err) {
				res.send(err)
			} else {
				// console.log(data[0].loginname)
				if (data.length > 0) {
					res.send({
						id: data[0].id,
						name: data[0].name,
						age: data[0].age,
						role: {
							id: data[0].rid,
							name: data[0].rolename,
							fullname: data[0].fullname
						},
						part: {
							id: data[0].pid,
							name: data[0].pname
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
module.exports = router

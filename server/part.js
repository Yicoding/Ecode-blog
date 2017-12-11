var router = require('./router.js')
var pool = require('./pool.js')

// part
// /part/findall
router.get('/api/part/findall', (req, res) => {
	var sql = 'select * from part'
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
// part/findone
router.get('/api/part/findone', (req, res) => {
	var sql = 'select * from part where id=' + req.query.id
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

// part/add
router.post('/api/part/add', (req, res) => {
	if (!req.body.name) {
		res.send({code: 500, message:'部门名不能为空'})
	} else if (!req.body.admin) {
		res.send({code: 500, message: '管理员用户名不能为空'})
	} else if (!req.body.age) {
		res.send({code: 500, message: '年龄不能为空'})
	} else {
		var sql = 'insert into part values(null,?,?)'
		pool.getConnection(function(err, connection) {
			connection.query(sql, [req.body.name, req.body.admin], (err, data) => {
				if (err) {
					res.status(500).send(err)
				} else {
					console.log(data)
					var usersql = 'insert into user values(null, ?, ?, 123, 2, ?)'
					connection.query(usersql, [req.body.admin, req.body.age, data.insertId], (error, result) => {
						if (error) {
							res.status(500).send(error)
						} else {
							res.send({code: 200, id: data.insertId, name: req.body.name, admin: req.body.admin})
						}
					})
				}
				connection.release();
			})
		})
		// connection.end()		
	}
})
// part/put
router.put('/api/part/put', (req, res) => {
	if (!req.body.name) {
		res.status(500).send([{'message':'部门名不能为空'}])
	} else {
		if (req.body.admin == req.body.newadmin) {
			var sql = 'update part set name=? where id=' + req.body.id
			pool.getConnection(function(err, connection) {
				connection.query(sql, [req.body.name], (err, data, fields) => {
					if (err) {
						res.status(500).send(err)
					} else {
						res.send(data)
						console.log(data)
					}
					connection.release();
				})
			})
		} else {
			var sql = 'update part set name=?, admin=? where id=' + req.body.id
			pool.getConnection((err, connection) => {
				connection.query(sql, [req.body.name, req.body.newadmin], (err, data, fields) => {
					if (err) {
						res.status(500).send(err)
					} else {
						// res.send(data)
						console.log(data)
						var usersql = 'update user set role_id=3 where name=?'
						connection.query(usersql, [req.body.admin], (err, data, fields) => {
							if (err) {
								res.status(500).send(err)
							} else {
								console.log(data)
								var adminsql = 'update user set role_id=2 where name=?'
								connection.query(adminsql, [req.body.newadmin], (err, data, fields) => {
									if (err) {
										res.status(500).send(err)
									} else {
										console.log(data)
										res.send({code: 200, message: '修改成功'})
									}
									connection.release();
								})
							}
						})
					}
				})
			})
		}
	}
})
// part/delete
router.delete('/api/part/:id', (req, res) => {
	var usersql = 'select * from user where part_id=?'
	pool.getConnection((err, connection) => {
		connection.query(usersql, [req.params.id], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				// res.send(data)
				console.log(data)
				if (data.length > 1) {
					res.send({code: 500, message: '该部门存在其他用户，不能删除'})
				} else {
					var sql = 'delete from part where id=?'
					connection.query(sql, [req.params.id], (err, dataA, fields) => {
						if (err) {
							res.status(500).send(err)
						} else {
							console.log(dataA)
							// res.send({code: 200, message: '删除成功'})
							var deluser = 'delete from user where part_id=?'
							connection.query(deluser, [req.params.id], (err, dataB, fields) => {
								if (err) {
									res.status(500).send(err)
								} else {
									console.log(dataB)
									res.send({code: 200, message: '删除成功'})
								}
								connection.release();
							})
						}
					})
				}
			}
		})
	})
})
module.exports = router
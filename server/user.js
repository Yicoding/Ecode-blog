var router = require('./router.js')
var pool = require('./pool.js')

// 查看个人信息
router.get('/api/user/loginname', (req, res) => {
	var sql = 'select user.id, user.name, user.age, user.password, role.id as roleId, role.name as roleName, role.fullname as rolefullName, part.id as partId, part.name as partName from user join role on user.role_id=role.id join part on user.part_id=part.id where user.name=?'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.query.name], (err, data, fields) => {
			if (err) {
				console.log(err)
				res.status(500).send(err)
			} else {
				console.log(data)
				// res.send(data[0])
				var result = {
					id: data[0].id,
					name: data[0].name,
					age: data[0].age,
					password: data[0].password,
					role: {
						id: data[0].roleId,
						name: data[0].roleName,
						fullname: data[0].rolefullName
					},
					part: {
						id: data[0].partId,
						name: data[0].partName
					}
				}
				res.send(result)

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

// root添加人员
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
// root修改人员
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
// admin添加人员
router.post('/api/user/adminadd', (req, res) => {
	if (!req.body.name) {
		res.send({code: 500, message:'姓名不能为空'})
	} else if (!req.body.age) {
		res.send({code: 500, message: '年龄不能为空'})
	} else if (!req.body.password) {
		res.send({code: 500, message: '密码不能为空'})
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
// admin修改人员
router.put('/api/user/adminput', (req, res) => {
	if (!req.body.name) {
		res.send({code: 500, message:'姓名不能为空'})
	} else if (!req.body.age) {
		res.send({code: 500, message: '年龄不能为空'})
	} else if (!req.body.password) {
		res.send({code: 500, message: '密码不能为空'})
	} else {
		var sql = 'update user set name=?, age=?, password=? where id=?'
		pool.getConnection((err, connection) => {
			connection.query(sql, [req.body.name, req.body.age, req.body.password, req.body.id], (err, data) => {
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
// 管理员查询自己部门的成员
router.get('/api/part/:id/admin', (req, res) => {
	var sql = 'select u.id, u.name, u.age, u.password, r.id rid, r.name rname, r.fullname rfullname, p.id pid, p.name pname from user u inner join role r on u.role_id=r.id join part p on u.part_id=p.id where part_id=?'
	pool.getConnection((error, connection) => {
		connection.query(sql, [req.params.id], (err, data, fields) => {
			if (err) {
				res.status(500).send(err)
			} else {
				// res.send(data)
				console.log(data)
				var result = []
				for (var k = 0; k < data.length; k ++) {
					var item = data[k]
					result.push({
						id: item.id,
						name: item.name,
						age: item.age,
						password: item.password,
						role: {
							id: item.rid,
							name: item.rname,
							fullname: item.rfullname
						},
						part: {
							id: item.pid,
							name: item.pname
						}
					})
				}
				res.send(result)
			}
			connection.release();
		})
	})
})
module.exports = router
var router = require('./router.js')
var pool = require('./pool.js')

// 登录(点击登录验证账号是否存在)
router.get('/api/user/login', (req, res) => {
	let sql = 'select u.id, u.name, u.age, u.password, u.minesign, u.artsign, u.avatar, r.id rid, r.name rolename, r.fullname, p.id pid, p.name pname from user u inner join role r on u.role_id=r.id join part p on u.part_id=p.id where u.name=? and u.password=?'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.query.name, req.query.password], (err, data) => {
			if (err) {
				res.send(err)
			} else {
				console.log(data)
				if (data.length > 0) {
					res.status(200).send({
						id: data[0].id,
						name: data[0].name,
						age: data[0].age,
						password: data[0].password,
						role: {
							id: data[0].rid,
							name: data[0].rolename,
							fullname: data[0].fullname
						},
						part: {
							id: data[0].pid,
							name: data[0].pname
						},
						minesign: data[0].minesign,
						artsign: data[0].artsign,
						avatar: data[0].avatar
					})
				} else {
					res.status(500).send({code: 500, message: '用户名或密码不正确'})
				}
			}
		})
	})
})

// 注册
// /user/add
router.post('/api/user/add', (req, res) => {
	var sql = 'insert into user values(null, ?, ?, ?, 3, 5, null, null, null)'
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
// header用户自行修改密码
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
// // 退出
// // /user/logout
// router.get('/api/loginfo/logout', (req, res) => {
// 	pool.getConnection(function(err, connection) {
// 		connection.query('delete from loginfo where name=?', [req.query.name], (err, data) => {
// 			if (err) {
// 				res.send(err)
// 			} else {
// 				res.send(data)
// 				console.log(data)
// 			}
// 			connection.release();
// 		})
// 	})
// })
module.exports = router

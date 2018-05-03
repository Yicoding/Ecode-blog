var router = require('./router.js')
var pool = require('./pool.js')

// collect
// /collect/findall
router.get('/api/collect/findall', (req, res) => {
	var sql = 'select c.id, c.menu_id, m.name, m.price, m.descript, m.picture from collect c inner join menu m on c.menu_id=m.id where c.user_id=? order by id DESC'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.query.user_id], (err, data, fields) => {
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
// collect/iscollect
router.get('/api/collect/iscollect', (req, res) => {
	var sql = 'select 1 from collect where menu_id=? and user_id=? limit 1'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.query.menu_id, req.query.user_id], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				// res.send(data[0])
				console.log(data[0])
				let iscollect
				if (data[0]) {
					for (let k in data[0]) {
						iscollect = data[0][k]
					}
					res.status(200).send({iscollect: iscollect})
				} else {
					res.status(200).send({iscollect: 0})
				}
			}
			connection.release();
		})
	})
})
// collect/add
router.post('/api/collect/add', (req, res) => {
	var sql = 'insert into collect values(null,?,?)'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.body.menu_id, req.body.user_id], (err, data, fields) => {
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
// collect/delete
router.delete('/api/collect/remove', (req, res) => {
	var sql = 'delete from collect where menu_id=? and user_id=?'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.query.menu_id, req.query.user_id], (err, data) => {
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
	let factor
	if (req.params.type == 'all') {
		factor = 'menu_id=?'
	} else if (req.params.type == 'great') {
		factor = 'star>3 and menu_id=?'
	} else if (req.params.type == 'good') {
		factor = 'star=3 and menu_id=?'
	} else {
		factor = 'star<3 and menu_id=?'
	}
	let sql = `select r.id, r.star, r.time, r.content, u.name as user_name from ratelist r inner join user u on r.user_id=u.id where ${factor} order by star DESC`
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
router.get('/api/collect/saleNum', (req, res) => {
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
router.get('/api/collect/imgArr', (req, res) => {
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
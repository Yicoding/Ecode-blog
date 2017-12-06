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


// shop
// /shop/findall
router.get('/api/shop/findall', (req, res) => {
	var sql = 'select s.id, s.menu_id, s.total, s.isCheck, m.name, m.price, m.type_id, m.desc, m.num, m.picture from shop s inner join menu m on s.menu_id=m.id where s.user_id=?'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.query.uid], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})


module.exports = router
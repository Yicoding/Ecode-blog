var router = require('./router.js')
var pool = require('./pool.js')
var express = require('express')
var fs = require("fs");
var multer  = require('multer');

router.use(express.static('public'));
router.use(multer({ dest: '/dd'}).array('image'));
// menu
// /menu/findall
router.get('/api/menu/findall/:type/:order', (req, res) => {
	var sql = 'select * from menu order by ' + req.params.type + ' ' + req.params.order
	// console.log(req.params.type + ',' + req.params.order)
	pool.getConnection(function(err, connection) {
		connection.query(sql, (err, data, fields) => {
			if (err) {
				res.status(500).send(err)// //777777777777777777`7`7`74527`////7`7`777`77`777777775565
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
// menu/like(模糊查询)
router.get('/api/menu/like', (req, res) => {
	let sql = 'select * from menu where name like "%' + req.query.name + '%"' + ' order by ' + req.query.type + ' ' + req.query.order
	pool.getConnection((err, connection) => {
		connection.query(sql, (err, data, fields) => {
			if (err) {
				console.log(err)
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release()
		})
	})
})
// menu/add
router.post('/api/menu/add', (req, res) => {
	var sql = 'insert into menu values(null,?,?,1,?,?,?)'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.body.name, req.body.price, req.body.descript, req.body.picture, req.body.createTime], (err, data) => {
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
// menu/put
router.put('/api/menu/edit', (req, res) => {
	var sql = 'update menu set name=?, price=?, descript=?, picture=? where id=?'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.body.name, req.body.price, req.body.descript, req.body.picture, req.body.id], (err, data) => {
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

// rate
// rate/find
router.get('/api/rate/:type', (req, res) => {
	let sql
	if (req.params.type == 'all') {
		sql = 'select r.id, r.star, r.time, r.content, u.name as user_name from ratelist r inner join user u on r.user_id=u.id where menu_id=? order by star DESC'
	} else if (req.params.type == 'great') {
		sql = 'select r.id, r.star, r.time, r.content, u.name as user_name from ratelist r inner join user u on r.user_id=u.id where star>3 and menu_id=? order by star DESC'
	} else if (req.params.type == 'good') {
		sql = 'select r.id, r.star, r.time, r.content, u.name as user_name from ratelist r inner join user u on r.user_id=u.id where star=3 and menu_id=? order by star DESC'
	} else {
		sql = 'select r.id, r.star, r.time, r.content, u.name as user_name from ratelist r inner join user u on r.user_id=u.id where star<3 and menu_id=? order by star DESC'
	}
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
router.get('/api/menu/saleNum', (req, res) => {
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
router.get('/api/menu/imgArr', (req, res) => {
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

// 上传商品封面图片
router.post('/api/img/menucover', function (req, res) {
  let nowDate = new Date();
  console.log(req.files[0]);  // 上传的文件信息

  // var des_file = __dirname + "/tmp/img/" + nowDate.getTime() + req.files[0].originalname;
  var des_file = "../static/menucover/" + nowDate.getTime() + req.files[0].originalname;
  fs.readFile( req.files[0].path, function (err, data) {
    fs.writeFile(des_file, data, function (err) {
      if( err ){
        console.log( err );
      } else {
        response = {
          message:'File uploaded successfully', 
          filename:nowDate.getTime() + req.files[0].originalname
        };
      }
      // console.log( response );
      console.log( response.filename );
      // res.end( JSON.stringify( response ) );
      // res.end(response);
      res.status(200).send({filename: response.filename});
    });
  });
})
 

// 上传商品列表图片
router.post('/api/img/menulist', function (req, res) {
  let nowDate = new Date();
  console.log(req.files[0]);  // 上传的文件信息

  // var des_file = __dirname + "/tmp/img/" + nowDate.getTime() + req.files[0].originalname;
  var des_file = "../static/menulist/" + nowDate.getTime() + req.files[0].originalname;
  fs.readFile( req.files[0].path, function (err, data) {
    fs.writeFile(des_file, data, function (err) {
      if( err ){
        console.log( err );
      } else {
        response = {
          message:'File uploaded successfully', 
          filename:nowDate.getTime() + req.files[0].originalname
        };
      }
      // console.log( response );
      console.log( response.filename );
      // res.end( JSON.stringify( response ) );
      // res.end(response);
      // res.status(200).send({filename: response.filename});
      var sql = 'insert into menuimg values(null,?,?)'
      let src = 'static/menulist/' + response.filename
		pool.getConnection(function(err, connection) {
			connection.query(sql, [req.body.menu_id, src], (err, data) => {
				if (err) {
					res.status(500).send(err)
				} else {
					res.send(data)
					console.log(data)
				}
				connection.release();
			})
		})
    });
  });
})
// 删除商品列表图片
router.delete('/api/imgArr/remove', (req, res) => {
	var sql = 'delete from menuimg where src="' + req.query.src + '"'
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
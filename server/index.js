var express = require('express')
var router = express.Router()

router.use((req, res, next) => {
	res.setHeader('Access-Control-Allow-Origin', '*')
	next()
})
router.get('/login', (req, res) => {
	res.sendFile(__dirname + '/' + 'login.html')
})
router.get('/addUser', (req, res) => {
	res.sendFile(__dirname + '/' + 'addUser.html')
})
var login = require('./login')
router.use(login)
var user = require('./user')
router.use(user)
var part = require('./part')
router.use(part)
var role = require('./role')
router.use(role)

module.exports = router




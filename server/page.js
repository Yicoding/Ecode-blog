var express = require('express')
var router = express.Router()
router.get('/', (req, res) => {
	res.sendFile(__dirname + '/' + 'login.html')
})
router.get('/addUser', (req, res) => {
	res.sendFile(__dirname + '/' + 'addUser.html')
})
module.exports = router

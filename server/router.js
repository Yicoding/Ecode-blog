var express = require('express')
var router = express.Router()
// var fs = require("fs");
var bodyParser = require('body-parser');
// var multer  = require('multer');

// router.use(express.static('public'));
router.use(bodyParser.json())
router.use(bodyParser.urlencoded({ extended: false }))
// router.use(multer({ dest: '/'}).array('image'));

module.exports = router
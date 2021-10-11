const mysql = require('mysql')
var connection = mysql.createConnection({
  host: 'donkeycargo.cjk3v7n6yyff.us-east-1.rds.amazonaws.com',
  user: 'donkey',
  password: 'Donkey2021',
  database: 'donkeycargo',
  multipleStatements: true
})

module.exports = connection

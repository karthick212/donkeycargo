var mysql = require('mysql');
var connection = mysql.createConnection({
  host: 'donkeycargo.cjk3v7n6yyff.us-east-1.rds.amazonaws.com',
  user: 'donkey',
  password: 'Donkey2021',
  database: 'donkeycargo',
  multipleStatements: true

  // host: 'sql169.main-hosting.eu',
  // user: 'u886875923_boobo',
  // password: 'booboo123',
  // database: 'u886875923_boobo',
  // multipleStatements: true

  // host: 'localhost',
  // user: 'root',
  // password: '',
  // database: 'donkeycargo'
});

module.exports = connection;

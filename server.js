const express = require("express");
const body_parser = require("body-parser");
const cors = require("cors");
const morgan = require("morgan");
const jwt = require('jsonwebtoken');
const path = require('path');
const app = express(),
config = require('./config/db'),
itemRoutes = require('./server/expressRoutes/itemRoutes');
commonRoutes = require('./server/expressRoutes/commonRoutes');
parcelRoutes = require('./server/expressRoutes/parcelRoutes');
sharingRoutes = require('./server/expressRoutes/sharingRoutes');
rentalRoutes = require('./server/expressRoutes/rentalRoutes');
advancedRoutes = require('./server/expressRoutes/advancedRoutes');
agentRoutes = require('./server/expressRoutes/agentRoutes');
const apiadmin = require('./server/routes/admin')
const apidriver = require('./server/routes/driver')
const apicourier = require('./server/routes/courier')
const apiuser = require('./server/routes/user')
const apiparcel = require('./server/routes/parcel')
const apirental = require('./server/routes/rental')
const apimoney = require('./server/routes/donkeymoney')

config.connect(function(err) {
  if (err) throw err
  console.log('You are now connected...')
})
      app.use(function(req,res,next){
        res.header("Access-Control-Allow-Origin","*");
        res.header("Access-Control-Allow-Headers","Origin, X-Requested-With, Content-Type, Accept, Authorization, sid");
        res.header("Access-Control-Allow-Methods","GET, POST, PUT, OPTIONS, DELETE");
        next();
      })
      //app.use(express.bodyParser());
      app.use(express.static('public'));
      //app.use('/static', express.static(path.join(__dirname, 'public')))
      // app.use(body_parser.json());
      // app.use(body_parser.urlencoded({ extended: true }));
      app.use(body_parser.json({limit: '50mb'}));
      app.use(body_parser.urlencoded({limit: '50mb'}));
      app.use(cors());
      app.use('/courier', itemRoutes);
      app.use('/parcel', parcelRoutes);
      app.use('/sharing', sharingRoutes);
      app.use('/rental', rentalRoutes);
      app.use('/common', commonRoutes);
      app.use('/advanced', advancedRoutes);
      app.use('/agent', agentRoutes);
      app.use('/api/admin/', apiadmin)
      app.use('/api/driver/', apidriver)
      app.use('/api/courier/', apicourier)
      app.use('/api/user/', apiuser)
      app.use('/api/parcel/', apiparcel)
      app.use('/api/rental/', apirental)
      app.use('/api/money/', apimoney)
      app.engine('html', require('ejs').renderFile);
      app.set('view engine', 'html');
      app.set('view engine', 'ejs');
      const port = process.env.PORT || 4000;

      const server = app.listen(port, function(){
        console.log('Listening on port ' + port);
      });

//const api_admin = require("./server/routes/admin");
// const api_driver = require("./routes/driver");


// app.use(morgan("combine"));

//app.use(express.static((__dirname, './dist/')));

// app.use(bodyParser.urlencoded({ extended: true }));
//app.use(body_parser.json());
//app.use(cors());

//app.use('/api/admin/', api_admin);

/*app.get('*',(req,res) => {
    res.sendfile(__dirname + "/dist/index.html")

});*/


// app.use('/api/diver',api_driver);

//app.listen(process.env.PORT || 8080);

var express = require('express');
var app = express();
var itemRoutes = express.Router();
var dbconfig = require('../config/db');
//var tbl_RentalCompany = require('../server/controller/admin-Controller');

//Rental Rate
itemRoutes.route('/Agent').get(function(req,res,err){
//tbl_agentmaster.FetchAllDetails((err,result,fields)=>{
dbconfig.query("select * from tbl_agentmaster",(err,result,fields)=>{
if(err){
  res.json(err);
}else{
  res.json(result);
}  
});  
});

itemRoutes.route('/Agent/Auto').get(function(req,res,err){
var itemss=  dbconfig.query("select ifnull(max(Agentid),0)+1 as id from tbl_agentmaster",function(err,result,fields){
if(err){
  res.json(err);
}else{
  res.json(result);
}  
});  
});

itemRoutes.route('/Agent/Del/:id').get(function(req,res,err){
var id = req.params.id;  
  var qry="Delete from tbl_agentmaster where Agentid="+id; 
var itemss=  dbconfig.query(qry,function(err,result,fields){
if(err){
  res.json(err);
}else{
  res.json(result);
}  
});  
});
 
 itemRoutes.route('/Agent/add').post(function(req,res,err){
  var qry="INSERT INTO tbl_agentmaster(`AgentId`, `AgentName`, `Gender`, `FatherName`, `DOB`, `Address`, `MobileNo`, `Email`, `isActive`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);"
  var itm= dbconfig.query(qry, [req.body.id, req.body.aname, req.body.gender, req.body.fname, req.body.dob, req.body.add, req.body.mobno, req.body.email, 1]);
  //adminActivity.RegisterAdmin(req.body, (err, count) => {
        if (err) {
             res.json(err);
         }
         else {
             res.json(req.body);
         }
    //})
});

 itemRoutes.route('/Agent/update').post(function(req,res,err){
  var qry="update tbl_agentmaster set AgentName=?, Gender=?, FatherName=?, DOB=?, Address=?, MobileNo=?, Email=?  where Agentid=?";
  var itm= dbconfig.query(qry, [req.body.aname, req.body.gender, req.body.fname, req.body.dob, req.body.add, req.body.mobno, req.body.email,req.body.id]);
  //adminActivity.RegisterAdmin(req.body, (err, count) => {
         if (err) {
             res.json(err);
         }
         else {
             res.json(req.body);
         }
    //})
});

itemRoutes.route('/Agent/edit/:id').get(function(req,res,err){
  var id = req.params.id;  
  var qry="select * from tbl_agentmaster where id="+id; 
var itemss=  dbconfig.query(qry,function(err,result,fields){
if(err){
  res.json(err);
}else{
  res.json(result);
}  
});  
});

module.exports = itemRoutes;


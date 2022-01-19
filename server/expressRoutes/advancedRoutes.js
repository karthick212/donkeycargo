var express = require('express');
var app = express();
var itemRoutes = express.Router();
const common = require('../controller/common-Controller')
var dbconfig = require('../config/db');
var multer = require('multer')
var progress = require('progress-stream'); // to have a progress bar during upload
//var tbl_RentalCompany = require('../server/controller/admin-Controller');
const fs = require('fs');

var storage5 = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'upload')
  },
  filename: function (req, file, cb) {
    if(file==undefined)
      cb(null, undefined);
    else
      cb(null, 'testJSON.json');
  }
});

// var upload5 = multer({ storage: storage5 })

// itemRoutes.post('/fullthrottle/json',upload.any(),function(req,res,err){
//   fs.readFile('upload/testJSON.json', (err, data) => {
//     if (err) throw err;
//     res.json(JSON.parse(data))
// });
// })

//Complaints
itemRoutes.route('/Complaints').get(function(req,res,err){
//tbl_Complaints.FetchAllDetails((err,result,fields)=>{
  dbconfig.query("select *,DATE_FORMAT(DateTime,'%d/%m/%Y %h:%i:%s %p') as Datee,case when Status=0 then 'Pending' else 'Resolved' end as Status1 from tbl_complaints",(err,result,fields)=>{
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/Complaints/statusChange/:id').get(function(req,res,err){
  var id = req.params.id; 
  common.QueryExecute("update tbl_complaints set Status=1 where id=?",[id]).then(ress=>{
    return res.json(ress)
  }).catch(err=>{return err;})  
});

itemRoutes.route('/Complaints/Auto').get(function(req,res,err){
  var itemss=  dbconfig.query("select ifnull(max(id),0)+1 as id from tbl_complaints",function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/Complaints/Del/:id').get(function(req,res,err){
  var id = req.params.id;  
  var qry="Delete from tbl_complaints where id="+id; 
  var itemss=  dbconfig.query(qry,function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/Complaints/add').post(function(req,res,err){
  let dateString = new Date().toISOString().slice(0, 10);
  var timeString = new Date().toLocaleTimeString("en-US", {timeZone:"Asia/Kolkata",hour12 : false,hour:  "2-digit",minute: "2-digit",second: "2-digit"});  
  var datetime=dateString+" "+timeString

  var qry="INSERT INTO tbl_complaints VALUES (?,?,?,?,?,?,?,?,?,?);"
  common.QueryExecute(qry,[req.body.id, req.body.bookingid, datetime, req.body.callername, req.body.callermobile, req.body.priority, req.body.summary, req.body.description,1,0]).then(ress=>{
    if(ress.affectedRows>0)
    {
      return common.MessageTemplate("COMPLAINT").then(ress=>{
        let temp=ress.replace('$bid$',req.body.bookingid);
        temp=temp.replace('$cno$',req.body.id);
        return common.SendSMS(req.body.callermobile,temp).then(ress=>{
          return res.json(req.body);
        })
      }).catch(err=>{return res.json(err);})
    }
  }).catch(err=>{return res.json(err);});
});

itemRoutes.route('/Complaints/update').post(function(req,res,err){
  var qry="update tbl_complaints set BookingID=?,CallerName=?,CallerMobile=?,Priority=?,Summary=?,Description=? where id=?";
  var itm= dbconfig.query(qry, [req.body.bookingid, req.body.callername, req.body.callermobile, req.body.priority, req.body.summary, req.body.description, req.body.id]);
  //adminActivity.RegisterAdmin(req.body, (err, count) => {
   if (err) {
     res.json(err);
   }
   else {
     res.json(req.body);
   }
    //})
  });

itemRoutes.route('/Complaints/edit/:id').get(function(req,res,err){
  var id = req.params.id;  
  var qry="select * from tbl_complaints where id="+id; 
  var itemss=  dbconfig.query(qry,function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});


//MessageTemplate
itemRoutes.route('/MessageTemplate').get(function(req,res,err){
//tbl_messagetemplate.FetchAllDetails((err,result,fields)=>{
  dbconfig.query("select * from tbl_messagetemplate",(err,result,fields)=>{
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/MessageTemplate/Auto').get(function(req,res,err){
  var itemss=  dbconfig.query("select ifnull(max(id),0)+1 as id from tbl_messagetemplate",function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/MessageTemplate/Del/:id').get(function(req,res,err){
  var id = req.params.id;  
  var qry="Delete from tbl_messagetemplate where id="+id; 
  var itemss=  dbconfig.query(qry,function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/MessageTemplate/add').post(function(req,res,err){
  var qry="INSERT INTO tbl_messagetemplate VALUES (?,?,?,?,?);"
  var itm= dbconfig.query(qry, [req.body.id, req.body.mcode, req.body.mname, req.body.note,1]);
  //adminActivity.RegisterAdmin(req.body, (err, count) => {
    if (err) {
     res.json(err);
   }
   else {
     res.json(req.body);
   }
    //})
  });

itemRoutes.route('/MessageTemplate/update').post(function(req,res,err){
  var qry="update tbl_messagetemplate set MessageCode=?,MessageName=?,MessageTemplate=? where id=?";
  var itm= dbconfig.query(qry, [req.body.mcode, req.body.mname, req.body.note, req.body.id]);
  //adminActivity.RegisterAdmin(req.body, (err, count) => {
   if (err) {
     res.json(err);
   }
   else {
     res.json(req.body);
   }
    //})
  });

itemRoutes.route('/MessageTemplate/edit/:id').get(function(req,res,err){
  var id = req.params.id;  
  var qry="select * from tbl_messagetemplate where id="+id; 
  var itemss=  dbconfig.query(qry,function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

//All
itemRoutes.route('/CommonOffers/All').get(function(req,res,err){
//tbl_CommonOffers.FetchAllDetails((err,result,fields)=>{
  dbconfig.query("select ServiceCity,Type,OfferCode,OfferRate,Content,filePath from tbl_commonoffersnew",(err,result,fields)=>{
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

//Offers
itemRoutes.route('/CommonOffers/Offers').get(function(req,res,err){
//tbl_CommonOffers.FetchAllDetails((err,result,fields)=>{
  //SELECT * FROM tbl_commonoffersnew WHERE Type='offers' and (SELECT isoffer FROM tbl_userdetails where userid='11')='true'
  dbconfig.query("select ServiceCity,OfferCode,OfferRate,Content,filePath from tbl_commonoffersnew where Type='Offers'",(err,result,fields)=>{
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

//Updates
itemRoutes.route('/CommonOffers/Updates').get(function(req,res,err){
//tbl_CommonOffers.FetchAllDetails((err,result,fields)=>{
  dbconfig.query("select ServiceCity,OfferCode,OfferRate,Content,filePath from tbl_commonoffersnew where Type='Updates'",(err,result,fields)=>{
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

//CommonOffersNew
itemRoutes.route('/CommonOffers').get(function(req,res,err){
//tbl_CommonOffers.FetchAllDetails((err,result,fields)=>{
  dbconfig.query("select * from tbl_commonoffersnew",(err,result,fields)=>{
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/CommonOffers/Auto').get(function(req,res,err){
  var itemss=  dbconfig.query("select ifnull(max(id),0)+1 as id from tbl_commonoffersnew",function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/CommonOffers/Del/:id').get(function(req,res,err){
  var id = req.params.id;  
  var qry="Delete from tbl_commonoffersnew where id="+id; 
  var itemss=  dbconfig.query(qry,function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

function getExtension(file) {
    // this function gets the filename extension by determining mimetype. To be exanded to support others, for example .jpeg or .tiff
    var res = '';
    if (file.mimetype === 'image/jpeg') res = '.jpg';
    if (file.mimetype === 'image/png') res = '.png';
    return res;
  }

  var storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, 'upload/offers')
    },
    filename: function (req, file, cb) {
      if(file==undefined)
        cb(null, undefined);
      else
        cb(null, file.originalname + '-' + Date.now() + getExtension(file));
    }
  });

  var upload = multer({ storage: storage })
// .fields([ // fields to accept multiple types of uploads
//     { name: "image", maxCount: 1 } // in <input name='fileName' />
//]);


itemRoutes.post('/CommonOffers/add',upload.any(),function(req,res,err){
  console.log(req.files[0].path);
  var qry="INSERT INTO tbl_commonoffersnew VALUES (?,?,?,?,?,?,?,?,?,?);"
  var itm= dbconfig.query(qry, [req.body.id, req.body.selectedcity, req.body.selectedType, req.body.offercode, req.body.offerrate, req.body.note, req.files[0].originalname, '/upload/offers/'+req.files[0].filename, req.files[0].mimetype,1]);
  //adminActivity.RegisterAdmin(req.body, (err, count) => {
    if (err) {
     res.json(err);
   }
   else {
     res.json(req.body);
   }
    //})
    //console.log(itm)
  });

itemRoutes.post('/CommonOffersOld/add',function(req,res,err){

  var qry="INSERT INTO tbl_commonoffersnew VALUES (?,?,?,?,?,?,?,?);"
  var itm= dbconfig.query(qry, [req.body.id, req.body.selectedcity, req.body.selectedType, req.body.offercode, req.body.offerrate, req.body.note, req.body.image,1]);
  //adminActivity.RegisterAdmin(req.body, (err, count) => {
    if (err) {
     res.json(err);
   }
   else {
     res.json(req.body);
   }
    //})
  });

itemRoutes.post('/CommonOffers/update',upload.any(),function(req,res,err){
  console.log(req.files[0]);
  var qry="update tbl_commonoffersnew set ServiceCity=?,Type=?,OfferCode=?,OfferRate=?,Content=? where id=?";
  if(req.files[0]!=undefined)
  { 
    qry="update tbl_commonoffersnew set ServiceCity=?,Type=?,OfferCode=?,OfferRate=?,Content=?,fileName=?,filePath=?,fileFormat=? where id=?";
    dbconfig.query(qry, [req.body.selectedcity, req.body.selectedType, req.body.offercode, req.body.offerrate, req.body.note,req.files[0].originalname, '/upload/offers/'+req.files[0].filename, req.files[0].mimetype, req.body.id]);
  }
  else
    dbconfig.query(qry, [req.body.selectedcity, req.body.selectedType, req.body.offercode, req.body.offerrate, req.body.note, req.body.id]);
  //adminActivity.RegisterAdmin(req.body, (err, count) => {
   if (err) {
     res.json(err);
   }
   else {
     res.json(req.body);
   }
    //})
  });

itemRoutes.route('/CommonOffersNew/update').post(function(req,res,err){
  var qry="update tbl_commonoffers set ServiceCity=?,Type=?,OfferCode=?,OfferRate=?,Content=?,image=? where id=?";
  var itm= dbconfig.query(qry, [req.body.selectedcity, req.body.selectedType, req.body.offercode, req.body.offerrate, req.body.note, req.body.image, req.body.id]);
  //adminActivity.RegisterAdmin(req.body, (err, count) => {
   if (err) {
     res.json(err);
   }
   else {
     res.json(req.body);
   }
    //})
  });

itemRoutes.route('/CommonOffers/edit/:id').get(function(req,res,err){
  var id = req.params.id;  
  var qry="select * from tbl_commonoffersnew where id="+id; 
  var itemss=  dbconfig.query(qry,function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/CommonOffersNew/edit/:id').get(function(req,res,err){
  var id = req.params.id;  
  var qry="select * from tbl_commonoffers where id="+id; 
  var itemss=  dbconfig.query(qry,function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

var storage1 = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'upload/sharepass')
  },
  filename: function (req, file, cb) {
    if(file==undefined)
      cb(null, undefined);
    else
      cb(null, file.originalname + '-' + Date.now() + getExtension(file));
  }
});

var upload1 = multer({ storage: storage1 })
//'/var/www/html/upload/sharepass'

//SharePass
itemRoutes.route('/SharePass').get(function(req,res,err){
//tbl_sharepass.FetchAllDetails((err,result,fields)=>{
  dbconfig.query("select * from tbl_sharepassnew base",(err,result,fields)=>{
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/SharePass/Auto').get(function(req,res,err){
  var itemss=  dbconfig.query("select ifnull(max(id),0)+1 as id from tbl_sharepassnew",function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/SharePass/Del/:id').get(function(req,res,err){
  var id = req.params.id;  
  var qry="Delete from tbl_sharepassnew where id="+id; 
  var itemss=  dbconfig.query(qry,function(err,result,fields){
    if(err){
      res.json(err);
    }
    else{
      res.json(result);
    }  
  });  
});

itemRoutes.post('/SharePass/add',upload1.any(),function(req,res,err){
  console.log(req.files[0].path);
  var qry="INSERT INTO tbl_sharepassnew VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);"
  var itm= dbconfig.query(qry, [req.body.id, req.body.selectedcity, req.body.selectedkms, req.body.selectedsize, req.body.rides, req.body.days, req.body.maxprice, req.body.disprice, req.body.flat, req.body.offerp, req.body.desc, req.files[0].originalname, '/upload/sharepass/'+req.files[0].filename, req.files[0].mimetype,1]);
  //adminActivity.RegisterAdmin(req.body, (err, count) => {
    if (err) {
     res.json(err);
   }
   else {
     res.json(req.body);
   }
    //})
  });

itemRoutes.route('/SharePassOld/add').post(function(req,res,err){
  var qry="INSERT INTO tbl_sharepass VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);"
  var itm= dbconfig.query(qry, [req.body.id, req.body.selectedcity, req.body.selectedkms, req.body.selectedsize, req.body.rides, req.body.days, req.body.maxprice, req.body.disprice, req.body.flat, req.body.offerp, req.body.desc, req.body.image,1]);
  //adminActivity.RegisterAdmin(req.body, (err, count) => {
    if (err) {
     res.json(err);
   }
   else {
     res.json(req.body);
   }
    //})
  });

itemRoutes.post('/SharePass/update',upload1.any(),function(req,res,err){
  console.log(req.files[0]);
  var qry="update tbl_sharepassnew set ServiceCity=?,KMs=?,Size=?,Rides=?,Days=?,MaxPrice=?,DispPrice=?,FlatPrice=?,OfferP=?,Description=? where id=?";
  if(req.files[0]!=undefined)
  { 
    qry="update tbl_sharepassnew set ServiceCity=?,KMs=?,Size=?,Rides=?,Days=?,MaxPrice=?,DispPrice=?,FlatPrice=?,OfferP=?,Description=?,fileName=?,filePath=?,fileFormat=? where id=?";
    dbconfig.query(qry, [ req.body.selectedcity, req.body.selectedkms, req.body.selectedsize, req.body.rides, req.body.days, req.body.maxprice, req.body.disprice, req.body.flat, req.body.offerp, req.body.desc,req.files[0].originalname, '/upload/sharepass/'+req.files[0].filename, req.files[0].mimetype, req.body.id]);
  }
  else
    dbconfig.query(qry, [ req.body.selectedcity, req.body.selectedkms, req.body.selectedsize, req.body.rides, req.body.days, req.body.maxprice, req.body.disprice, req.body.flat, req.body.offerp, req.body.desc, req.body.id]);

  //var qry="update tbl_sharepassnew set ServiceCityCode=?,KMs=?,Size=?,Rides=?,Days=?,MaxPrice=?,DispPrice=?,FlatPrice=?,OfferP=?,Description=?,fileName=?,filePath=?,fileFormat=? where id=?";
  //var itm= dbconfig.query(qry, [ req.body.selectedcity, req.body.selectedkms, req.body.selectedsize, req.body.rides, req.body.days, req.body.maxprice, req.body.disprice, req.body.flat, req.body.offerp, req.body.desc,req.files[0].originalname, '/upload/sharepass/'+req.files[0].filename, req.files[0].mimetype, req.body.id]);
  if (err) {
   res.json(err);
 }
 else {
   res.json(req.body);
 }
});

itemRoutes.route('/SharePassOld/update').post(function(req,res,err){
  var qry="update tbl_sharepass set ServiceCityCode=?,KMs=?,Size=?,Rides=?,Days=?,MaxPrice=?,DispPrice=?,FlatPrice=?,OfferP=?,Description=?,Picture=? where id=?";
  var itm= dbconfig.query(qry, [ req.body.selectedcity, req.body.selectedkms, req.body.selectedsize, req.body.rides, req.body.days, req.body.maxprice, req.body.disprice, req.body.flat, req.body.offerp, req.body.desc, req.body.image, req.body.id]);
  //adminActivity.RegisterAdmin(req.body, (err, count) => {
   if (err) {
     res.json(err);
   }
   else {
     res.json(req.body);
   }
    //})
  });

itemRoutes.route('/SharePass/edit/:id').get(function(req,res,err){
  var id = req.params.id;  
  var qry="select * from tbl_sharepassnew where id="+id; 
  var itemss=  dbconfig.query(qry,function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

//For App
itemRoutes.route('/SharePass/ServiceCity').get(function(req,res,err){
//tbl_sharepass.FetchAllDetails((err,result,fields)=>{
  dbconfig.query("select distinct ServiceCity from tbl_sharepassnew base",(err,result,fields)=>{
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/SharePass/KMS').get(function(req,res,err){
//let bdy=req.body;
let bdy=req.query;
//tbl_sharepass.FetchAllDetails((err,result,fields)=>{
  dbconfig.query("select id,DispPrice,Description,filePath,Rides from tbl_sharepassnew base where ServiceCity=? and Size=? and KMs=?",[bdy.servicecity,bdy.size,bdy.kms],(err,result,fields)=>{
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });
});

itemRoutes.route('/SharePass/SavePass').post(function(req,res,err){
  let bdy=req.body;
//let bdy=req.query;
var date = new Date();
let todate = new Date().toISOString().slice(0, 10);
var hours = date.getHours() > 12 ? date.getHours() - 12 : date.getHours();
hours = hours < 10 ? "0" + hours : hours;
var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
time = hours + ":" + minutes + ":" + seconds;

dbconfig.query("select count(*) as cnt from vw_sharepassbalance where MobileNo=? and SharepassCode=? and Balance>0",[bdy.mobno,bdy.passcode],(err,res1)=>{
  if(res1[0].cnt>0)
  {
    res.json({msg:"exist"});
  }
  else
  {
    var qry="INSERT INTO tbl_sharepassmembers(`UserId`, `Mobileno`, `PassCode`, `PassAmt`, `Date`, `Time`, `RefNo`, `isActive`) VALUES (?,?,?,?,?,?,?,?);"
    var itm= dbconfig.query(qry, [        bdy.userid  ,bdy.mobno, bdy.passcode,bdy.passamt,todate, time, bdy.refno, 1],(err,result,fields)=>{
      if(err){
        res.json(err);
      }else{
        if(result.affectedRows>0)
          var arr=[todate,time,bdy.userid,bdy.mobno,bdy.passcode,bdy.rides]
        dbconfig.query("INSERT INTO `tbl_sharepassdetails` (`Date`, `Time`, `UserId`, `MobileNo`, `SharepassCode`, `Debit`, `Credit`, `isActive`) VALUES (?, ?, ?, ?, ?, ?, 0, 1)",arr);
        var msg={}
        msg.msg="success"  
        res.json(msg);
      }  
    })  
  }
})

});

itemRoutes.route('/SharePass/ApplySharepass').get(function(req,res,err){
//let bdy=req.body;
let bdy=req.query;
//tbl_sharepass.FetchAllDetails((err,result,fields)=>{
  dbconfig.query("select SharepassCode,ServiceCity,Size,KMs,Remaining from vw_sharepassbalance where MobileNo=?",[bdy.mobno],(err,result,fields)=>{
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });
});


//FAQ
itemRoutes.route('/FAQ').get(function(req,res,err){
//tbl_faq.FetchAllDetails((err,result,fields)=>{
  dbconfig.query("select * from tbl_faq",(err,result,fields)=>{
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

//FAQ-Question
itemRoutes.route('/FAQ/User/Question').get(function(req,res,err){
//tbl_faq.FetchAllDetails((err,result,fields)=>{
  dbconfig.query("select QuestionBody from tbl_faq where isUser='true'",(err,result,fields)=>{
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

//FAQ-Answer
itemRoutes.route('/FAQ/User/Answer').get(function(req,res,err){
//tbl_faq.FetchAllDetails((err,result,fields)=>{
  dbconfig.query("select QuestionLink,Description from tbl_faq where isUser='true' and QuestionBody=?",[req.query.question],(err,result,fields)=>{
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

//FAQ-Question
itemRoutes.route('/FAQ/Driver/Question').get(function(req,res,err){
//tbl_faq.FetchAllDetails((err,result,fields)=>{
  dbconfig.query("select QuestionBody from tbl_faq where isDriver='true'",(err,result,fields)=>{
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

//FAQ-Answer
itemRoutes.route('/FAQ/Driver/Answer').get(function(req,res,err){
//tbl_faq.FetchAllDetails((err,result,fields)=>{
  dbconfig.query("select QuestionLink,Description from tbl_faq where isDriver='true' and QuestionBody=?",[req.query.question],(err,result,fields)=>{
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/FAQ/Auto').get(function(req,res,err){
  var itemss=  dbconfig.query("select ifnull(max(id),0)+1 as id from tbl_faq",function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/FAQ/Del/:id').get(function(req,res,err){
  var id = req.params.id;  
  var qry="Delete from tbl_faq where id="+id; 
  var itemss=  dbconfig.query(qry,function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/FAQ/add').post(function(req,res,err){
  var qry="INSERT INTO tbl_faq VALUES (?,?,?,?,?,?,?);"
  var itm= dbconfig.query(qry, [req.body.id, req.body.ques, req.body.link, req.body.desc, req.body.cuser, req.body.cdriver,1]);
  //adminActivity.RegisterAdmin(req.body, (err, count) => {
    if (err) {
     res.json(err);
   }
   else {
     res.json(req.body);
   }
    //})
  });

itemRoutes.route('/FAQ/update').post(function(req,res,err){
  var qry="update tbl_faq set QuestionBody=?,QuestionLink=?,Description=?,isUser=?,isDriver=? where id=?";
  var itm= dbconfig.query(qry, [ req.body.ques, req.body.link, req.body.desc, req.body.cuser, req.body.cdriver, req.body.id]);
  //adminActivity.RegisterAdmin(req.body, (err, count) => {
   if (err) {
     res.json(err);
   }
   else {
     res.json(req.body);
   }
    //})
  });

itemRoutes.route('/FAQ/edit/:id').get(function(req,res,err){
  var id = req.params.id;  
  var qry="select * from tbl_faq where id="+id; 
  var itemss=  dbconfig.query(qry,function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});


//Reason
itemRoutes.route('/Reason').get(function(req,res,err){
//tbl_reason.FetchAllDetails((err,result,fields)=>{
  dbconfig.query("select * from tbl_reason",(err,result,fields)=>{
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/Reason/Auto').get(function(req,res,err){
  var itemss=  dbconfig.query("select ifnull(max(id),0)+1 as id from tbl_reason",function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/Reason/Del/:id').get(function(req,res,err){
  var id = req.params.id;  
  var qry="Delete from tbl_reason where id="+id; 
  var itemss=  dbconfig.query(qry,function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/Reason/add').post(function(req,res,err){
  var qry="INSERT INTO tbl_reason VALUES (?,?,?,?,?);"
  var itm= dbconfig.query(qry, [req.body.id, req.body.reason, req.body.cuser, req.body.cdriver,1]);
  //adminActivity.RegisterAdmin(req.body, (err, count) => {
    if (err) {
     res.json(err);
   }
   else {
     res.json(req.body);
   }
    //})
  });

itemRoutes.route('/Reason/update').post(function(req,res,err){
  var qry="update tbl_reason set Reason=?,isUser=?,isDriver=? where id=?";
  var itm= dbconfig.query(qry, [ req.body.reason, req.body.cuser, req.body.cdriver, req.body.id]);
  //adminActivity.RegisterAdmin(req.body, (err, count) => {
   if (err) {
     res.json(err);
   }
   else {
     res.json(req.body);
   }
    //})
  });

itemRoutes.route('/Reason/edit/:id').get(function(req,res,err){
  var id = req.params.id;  
  var qry="select * from tbl_reason where id="+id; 
  var itemss=  dbconfig.query(qry,function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});


//Coupon
itemRoutes.route('/Coupon').get(function(req,res,err){
//tbl_CommonOffers.FetchAllDetails((err,result,fields)=>{
  dbconfig.query("select * from tbl_couponmaster",(err,result,fields)=>{
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/Coupon/Auto').get(function(req,res,err){
  var itemss=  dbconfig.query("select ifnull(max(id),0)+1 as id from tbl_couponmaster",function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/Coupon/Del/:id').get(function(req,res,err){
  var id = req.params.id;  
  var qry="Delete from tbl_couponmaster where id="+id; 
  var itemss=  dbconfig.query(qry,function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

var storage2 = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'upload/coupon')
  },
  filename: function (req, file, cb) {
    if(file==undefined)
      cb(null, undefined);
    else
      cb(null, file.originalname + '-' + Date.now() + getExtension(file));
  }
});

var upload2 = multer({ storage: storage2 })
// .fields([ // fields to accept multiple types of uploads
//     { name: "image", maxCount: 1 } // in <input name='fileName' />
//]);

itemRoutes.post('/Coupon/add',upload2.any(),function(req,res,err){
  var qry="INSERT INTO tbl_couponmaster(`id`,`ServiceCity`,`ServiceType`,`CouponType`,`CouponCode`,`CouponAmt`,`Description`,`fileName`,`filePath`,`fileFormat`,`Validity`,`MonthlyLimit`,`isActive`,`start_date`,`entry_date`,`user_mobile`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);"
  var currentDate = new Date();

  if(req.files[0]==undefined)
  {
    dbconfig.query(qry, [req.body.id, req.body.selectedcity, req.body.selectedType, req.body.couponType, req.body.offercode, req.body.offerrate, req.body.note, '', '/upload/coupon/', '', req.body.offervalidity, req.body.monthly,1, req.body.start_date, currentDate, req.body.user_mobile]);
  }
  else
    dbconfig.query(qry, [req.body.id, req.body.selectedcity, req.body.selectedType, req.body.couponType, req.body.offercode, req.body.offerrate, req.body.note, req.files[0].originalname, '/upload/coupon/'+req.files[0].filename, req.files[0].mimetype, req.body.offervalidity, req.body.monthly,1,req.body.start_date, currentDate, req.body.user_mobile]);
  //adminActivity.RegisterAdmin(req.body, (err, count) => {
    if (err) {
     res.json(err);
   }
   else {
     res.json(req.body);
   }
    //})
    //console.log(itm)
  });

itemRoutes.post('/Coupon/update',upload2.any(),function(req,res,err){
  //console.log(req.files[0]);
  var qry="update tbl_couponmaster set ServiceCity=?,ServiceType=?,CouponType=?,CouponCode=?,CouponAmt=?,Description=?,Validity=?,MonthlyLimit=?,start_date=?,user_mobile=? where id=?";
  if(req.files[0]!=undefined)
  { 
    qry="update tbl_couponmaster set ServiceCity=?,ServiceType=?,CouponType=?,CouponCode=?,CouponAmt=?,Description=?,Validity=?,MonthlyLimit=?,fileName=?,filePath=?,fileFormat=?,start_date=?,user_mobile=? where id=?";
    dbconfig.query(qry, [req.body.selectedcity, req.body.selectedType, req.body.couponType, req.body.offercode, req.body.offerrate, req.body.note, req.body.offervalidity, req.body.monthly,req.files[0].originalname, '/upload/coupon/'+req.files[0].filename, req.files[0].mimetype, req.body.start_date, req.body.user_mobile, req.body.id]);
  }
  else
    dbconfig.query(qry, [req.body.selectedcity, req.body.selectedType, req.body.couponType, req.body.offercode, req.body.offerrate, req.body.note, req.body.offervalidity, req.body.monthly, req.body.start_date,req.body.user_mobile, req.body.id]);
  //adminActivity.RegisterAdmin(req.body, (err, count) => {
   if (err) {
     res.json(err);
   }
   else {
     res.json(req.body);
   }
    //})
  });

itemRoutes.route('/Coupon/edit/:id').get(function(req,res,err){
  var id = req.params.id;  
  var qry="select * from tbl_couponmaster where id="+id; 
  var itemss=  dbconfig.query(qry,function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

itemRoutes.route('/Coupon/ApplyCoupon').get(function(req,res,err){
  //let bdy=req.body;
  let bdy=req.query;
  let ctype=bdy.couriertype
  let stype=bdy.servicetype
  dbconfig.query("select count(*) from vw_couponbalance where Mobileno=?",[bdy.mobno],(err,res1)=>{
    if(stype.indexOf('cou')>=0&&ctype.indexOf('loc')==0)
      res.json();
    else if(res1.length>0)
    {
      //and curdate()<=date_add(Date,INTERVAL Validity day) for Future Check Validity Days
      dbconfig.query("select Couponid,CouponType,CouponCode,CouponAmt,Description,filePath from vw_coupondetails base where Mobileno=?",[bdy.mobno],(err,result,fields)=>{
        if(err){
          res.json(err);
        }else{
          res.json(result);
        }  
      });  
    }
    else
    {
    //and curdate()<=date_add(Date,INTERVAL Validity day) for Future Check Validity Days
    dbconfig.query("select id as Couponid,CouponType,CouponCode,CouponAmt,Description,filePath from tbl_couponmaster base where MonthlyLimit=? and ServiceCity=? and ServiceType=? and CouponType='Business'",[500,bdy.servicecity,bdy.servicetype],(err,result,fields)=>{
      if(err){
        //res.json(err);
      }else{
        //res.json(result);
      }  
    });       
  }
})

});

module.exports = itemRoutes;


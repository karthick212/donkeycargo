const express = require('express')
const router = express.Router()
const Request = require('request')
const { parse } = require('querystring')
var multer = require('multer')
// var upload = multer({ dest: 'upload/driver' })
var FormData = require('form-data')
var form = new FormData()
// var jsonParser = body_parser.urlencoded()
const driverActivity = require('../controller/driver-Controller')
const jwt = require('jsonwebtoken')
var dbconfig = require('../config/db')
const common = require('../controller/common-Controller')

// login
router.post('/login', function (req, res, next) {
  driverActivity.DriverLogin(req.body, (err, rows) => {
    if (err) {
      res.send('Server Error')
    } else {
      if (rows) {
        rows.map(data => {
          console.log(data)
        })
      }
      if (rows.length > 0) {
        let token = jwt.sign({ data: rows }, SECRET_KEY, { expiresIn: '10s' })
        let result = {
          status: true,
          username: rows[0].driver_name,
          token: token
        }
        res.send(result)
      } else {
        let result = {
          'message': 'Please Enter Valid Username & Password'
        }
        res.send(result)
      }
    }
  })
})

// router.get('/FetchAllDetails', function (req, res, next) {
//   driverActivity.FetchAllDetails((err, rows) => {
//     if (err) {
//       res.json(err)
//     } else {
//       res.json(rows)
//     }
//   })
// })

// router.get('/detail', function (req, res, next) {
//   console.log('di')
// })

// OTP-API
router.post('/checkMobno', (request, response) => {
  let Mobilenum = request.body.mobno
  let Role = request.body.role
  let imeino = request.body.imeino
  let ResMsg = {}
  driverActivity.checkMobno(Mobilenum,Role, (err, rows, otp) => {
    if (rows=='Exist') {
      if(Role.toLowerCase()==='user') {
        common.MessageTemplate("LOGINOTP").then(res2=>{
          let temp=res2.replace('$loginotp$',otp);
          return common.SendSMS(Mobilenum,temp).then(res3=>{
            return 1;
          })  
        })  
      }
      else if(Role.toLowerCase()==='driver') {
        common.MessageTemplate("DRLOGINOTP").then(res2=>{
          let temp=res2.replace('$otp$',otp);
          return common.SendSMS(Mobilenum,temp).then(res3=>{
            return 1;
          })  
        })  
      }      

      ResMsg.otp=otp
      ResMsg.status = 'success'
        //ResMsg.token = tokens
      } else {
        ResMsg.status = 'failed'
      }
      ResMsg.message = rows
      response.json(ResMsg)
    })
})

// OTP-API
router.post('/otp', (request, response) => {
  let Mobilenum = request.body.mobno
  let Role = request.body.roll
  let imeino = request.body.imeino
  let ResMsg = {}
  driverActivity.DriverOtp(Mobilenum, Role, imeino, (err, rows, otp) => {
    if (err) throw err
      if (rows) {
        const smsCont =
        'Dear Customer, your OTP for SMS notification registration is ' +
        otp +
        '. Use this OTP to register.';
        //var Otpurl = 'http://manage.rkadsindia.in/SendSMS/sendmsg.php?uname=DCARGO&pass=123456&send=DCARGO&dest=' + Mobilenum + '&msg=' + smsCont
        //var Otpurl = 'http://manage.rkadsindia.in/SendSMS/sendmsg.php?uname=DCARGO&pass=123456&send=DCARGO&dest=' + Mobilenum + '&msg=' + smsCont
        //var Otpurl = 'http://msg.spyderinfotech.com/app/smsapi/index.php?key=5befcba7d1a4d&type=text&contacts='+ Mobilenum +'&senderid=DCARGO&msg='+ smsCont
        var Otpurl = 'https://sms.nettyfish.com/vendorsms/pushsms.aspx?apikey=84c52596-d40a-4ecd-aab9-5b275c01f828&clientId=10c06444-221b-463e-a9c1-bcbe4d418b88&msisdn='+Mobilenum+'&sid=DCARGO&msg='+smsCont+'&fl=0&gwid=2'

        let tokens = jwt.sign({ data: rows }, SECRET_KEY, { expiresIn: '10s' })
        Request.get(Otpurl)
        ResMsg.otp=otp
        ResMsg.status = 'success'
        ResMsg.token = tokens
      } else {
        ResMsg.message = 'Invalid Mobile Number'
        ResMsg.status = 'fail'
      }
      response.json(ResMsg)
    })
})

// checkotp
router.post('/checkotp', (req, res) => {
  driverActivity.checkOtp(req.body, (err, row, status) => {
    if (err) throw err
      console.log(row)
    if (row.length) {
      let result = {'message': 'OTP VERIFIED','status':status,'drivertype':row[0].drivertype }
      res.send(result)
    } else {
      let result = {'message': 'Wrong OTP','status':'' }
      res.send(result)
    }
  })
})

// create Profile
router.post('/AddDriver', (req, res) => {
  let type="S";
  if((req.body.drivertype).toLowerCase()=='driver') type="D";
  driverActivity.DriverNoGen((results)=>{
    req.body.driverid = type+(results[0].cnt+10000);
    driverActivity.Createprofiledetails(req.body, (err, count) => {
      (err) ? res.json(err) : res.json('success');
    })
  })
})

// update driver
router.post('/updateDriver', (req, res) => {
  driverActivity.updateDriver(req.body, (err, count) => {
    (err) ? res.json(err) : res.json('success');
  })
})

// delete driver
router.post('/deleteDriver', (req, res) => {
  let user=req.body
  let qry="update tbl_driver_general_detail set isactive=0 where driver_phone=?"
  let qry1="Delete from tbl_driverstatus where Mobileno=?"
  let qry2="Delete from tbl_otplist where Mobile=? and role='driver'"
  dbconfig.query(qry,[user.mobno], (err, result) => {
    if(err) res.json(err)
      else {
        dbconfig.query(qry1,[user.mobno], (err1, result1) => {
          if(err) res.json(err)
            else {
              dbconfig.query(qry2,[user.mobno], (err2, result2) => {
                (err2) ? res.json(err2) : res.json(result2);        
              })  
            }
          })
      }
    })
})

// view driver
router.get('/viewDriver1', (req, res) => {
  let user=req.query
  let qry="select * from tbl_driver_general_detail where id=?"
  dbconfig.query(qry,[user.id], (err, result) => {
    (err) ? res.json(err) : res.json(result);
  })
})

var storage = multer.diskStorage(
{
  destination: '',
  filename: function (req, file, cb) {
    if(file==undefined)
      {  console.log(req.body);
        cb(null, undefined);
      }
      else
        {console.log(req.body);
          cb(null,Date.now() + '_' + file.originalname);
        }
      }
    }
    );
var upload = multer({ storage: storage });

// Profile Image
// var cpUpload = upload.fields([{ name: 'driver_image', maxCount: 1, path }, { name: 'driver_aadhar', maxCount: 1 }])
router.post('/AddDriverImage', upload.any(), (req, res) => {
  //console.log(req.files)
//console.log(req.body.)
let did=req.body.driver_id;
let header;
if (req.headers['driver_id']) {
  header = req.headers['driver_id']
}
let driver = [];
let driverfield = [];
console.log(req.files)
req.files.map((res, index) => {
  driver[index] = res.filename;
  driverfield[index] = res.fieldname;
})
console.log(driver)
  // return driver
  driverActivity.CreatprofilImages(driver, did, (err, result) => {
    if (err) throw err;
    console.log(result);
    if (result) {
      let result = { 'message': 'success' }
      res.send(result)
    }
  });
})

//view Driver
router.get('/viewDriver',function(req,res,err){
  let reqq=req.query;
  let arr=[reqq.mobno]
  let cond=""
  if(reqq.mobno!=undefined)
    {arr=[reqq.mobno]
      cond=" and driver_phone=?"
    }
    if(reqq.range!=undefined)
    {
      cond=" and (latitude!='' or longitude!='') and (latitude!='0.0' or longitude!='0.0')"
    }
    if(reqq.assign!=undefined)
    {
      cond+=" and DriverStatus='Approved'"
    }
    var itemss=  dbconfig.query("select * from vw_driver where id!='0'"+cond,arr,function(err,result,fields){
      if(err){
        res.json(err);
      }else{
        res.json(result);
      }  
    });  
  });

//Student Duty Status
router.get('/StudentStatus',function(req,res,err){
  var itemss=  dbconfig.query("select isMadmoney from tbl_driverstatus where Mobileno=?",[req.query.mobno],function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

//Driver Duty Status
router.get('/DriverStatus',function(req,res,err){
  var itemss=  dbconfig.query("select isShare,isHire,isRental from tbl_driverstatus where Mobileno=?",[req.query.mobno],function(err,result,fields){
    if(err){
      res.json(err);
    }else{
      res.json(result);
    }  
  });  
});

//Change Duty Status
router.post('/ChangeStatus',function(req,res,err){
  //var resp=req.query;
  var request=req.body;
  var date = new Date();
  let todate = new Date().toISOString().slice(0, 10);
  var hours = date.getHours() > 12 ? date.getHours() - 12 : date.getHours();
  hours = hours < 10 ? "0" + hours : hours;
  var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
  var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
  time = hours + ":" + minutes + ":" + seconds;

  request.isMadmoney=request.isMadmoney==undefined?'Off':request.isMadmoney;
  request.isShare=request.isShare==undefined?'Off':request.isShare;
  request.isHire=request.isHire==undefined?'Off':request.isHire;
  request.isRental=request.isRental==undefined?'Off':request.isRental;

  var itemss=  dbconfig.query("update tbl_driverstatus set isMadmoney=?,isShare=?,isHire=?,isRental=?,latitude=?,longitude=? where Mobileno=?",[request.isMadmoney,request.isShare,request.isHire,request.isRental,request.lat,request.long,request.mobno],function(err,result,fields){
    let btype="";
    if(request.isMadmoney=='Req')
      btype="Madmoney";
    else if(request.isShare=='Req')
      btype="Share";
    else if(request.isHire=='Req')
      btype="Hire";
    else if(request.isRental=='Req')
      btype="Rental";
    var arr=[request.mobno,todate,time,btype,date];
    qry="Insert into tbl_driverstatuslog(Driverid,Date,Time,BookingType,SDate) values(?,?,?,?,?)";
    if(btype=="")
    {
      qry="update tbl_driverstatus set isMadmoney=?,isShare=?,isHire=?,isRental=? where Mobileno=?";
      arr=[request.isMadmoney,request.isShare,request.isHire,request.isRental,request.mobno];
    }
    dbconfig.query(qry,arr,function(err,result1,fields){
      if(err){
        res.json(err);
      }
      else
      {
        if(result1.affectedRows>0)
          res.json("changed");
        else
          res.json(err);
      }
    })      
  });  
});

//Assign Booking
router.get('/AssignBooking',function(req,res,err){
 //let reqq=request.body;
 let reqq=req.query;
 let arr=[reqq.mobno]
 let cond=""
 if(reqq.bookingtype!=undefined)
  {arr=[reqq.mobno,reqq.bookingtype]
    cond=" and BookingType=?"
  }
  var itemss=  dbconfig.query("select id,BookingId,BookingType,Name,FromAddress,Case when isPickup=0 then UserMobileNo else RecMobile end as UserMobileNo,noi,FromLatitude,FromLongitude,Drivermobile,case when paymentMode='online' then 'online' else 'cash' end paymentMode,NetTotal as Amount,toaddress,tolatitude,tolongitude,isPickup from vw_assignbooking where Drivermobile=? and isAccept='0' and isReject='0'"+cond+" order by id",arr,function(err,result,fields){
    if(err){
      res.json(err);
    }else {
      res.json(result);
    }  
  });  
});

//Assign Booking
router.get('/NoAssignBooking',function(req,res,err){
 //let reqq=request.body;
 let reqq=req.query;
 let arr=[reqq.mobno]
 let cond=""
 if(reqq.couriertype!=undefined)
  {arr=[reqq.couriertype]
    cond=" and CourierType=?"
  }
  if(reqq.bookingid!=undefined)
    {arr=[reqq.bookingid]
      cond=" and BookingId=?"
    }
    if(reqq.cancel!=undefined)
    {
      cond=" and (isReject=1 or isActive=0)"
    }
    if(reqq.incomplete!=undefined)
    {
      cond=" and isActive<>0 and (isDrop=0 or isPickup=0) and isReject=0"
    }
    if(reqq.complete!=undefined)
    {
      cond=" and isActive<>0 and isDrop=1 and isPickup=1"
    }
    if(reqq.drop!=undefined)
    {
      cond=" and isActive<>0 and (isDrop=0 or isDrop is null)"
    }
    var itemss=  dbconfig.query("select * from vw_courierbookingassign where BookingId<>'' "+cond+" order by BookingSerial",arr,function(err,result,fields){
      if(err){
        res.json(err);
      }else{
        res.json(result);
      }  
    });  
  });

//Drivers in Map
router.get('/DriverMap',function(req,res,err){
 //let user=req.body;
 // console.log(req.protocol);
 // console.log(req.originalUrl);
 // console.log(req.url);
 // console.log(req.path);
 let user=req.query;
 let cond=" and (isMadMoney='Req' or isShare='Req' or isHire='Req' or isRental='Req')";
 if(user.type=='courier')
  cond=" and isMadMoney='Req'"
else if(user.type=='parcel')
  cond=" and (isShare='Req' or isHire='Req')"
else if(user.type=='rental')
  cond=" and (isRental='Req')"
console.log(user)
let dqry="SELECT id,Driverid,Mobileno,latitude,longitude, ( 3959 * acos( cos( radians(?) ) * cos( radians( Latitude ) ) * cos( radians( longitude ) - radians(?) ) + sin( radians(?) ) * sin( radians( Latitude ) ) ) ) AS distance FROM tbl_driverstatus where id<>0 "+cond+" HAVING distance < 10 ORDER BY distance LIMIT 0 , 10"
dbconfig.query(dqry,[user.fromlat,user.fromlong,user.fromlat],(err,result)=>{
  if(err){
    res.json(err);
  }else{
    res.json(result);
  }  
});  
});

//Accept/Reject Booking
router.post('/BookingAction',function(req,res,err){
 let reqq=req.body;
 //let reqq=req.query;

 let itemss2=dbconfig.query("select * from vw_assignbooking where id=?",[reqq.id],(err,result2)=>{
  let btype=''
  if(result2.length>0)
  {
    if(result2[0].bookingtype.toLowerCase()=='courier')
      btype="isMadmoney='On'"
    else if(result2[0].bookingtype.toLowerCase()=='share')
      btype="isShare='On'"
    else if(result2[0].bookingtype.toLowerCase()=='hire')
      btype="isHire='On'"
    else if(result2[0].bookingtype.toLowerCase()=='rental')
      btype="isRental='On'"

    let qry="update tbl_assignbooking set isAccept=1,isReject=0 where id=? ";
    if(reqq.action.toLowerCase()!='accept')
      qry="update tbl_assignbooking set isReject=1,isAccept=0 where id=?";
    var itemss=  dbconfig.query(qry,[reqq.id],function(err,result,fields){
      if(reqq.action.toLowerCase()=='accept')
      {
        let itemss1=dbconfig.query("update tbl_driverstatus set "+btype+" where Driverid=?",[result2[0].DriverId],(err,result1)=>{
          res.json('accept');
        })
      }
      else
      {
        let items2=common.QueryExecute("select count(*) as cnt,max(drivermobile) as drivermobile,ifNull((SELECT COUNT(*) from vw_assignbooking WHERE isdrop=0 and drivermobile=base.Drivermobile),0) as dCount from vw_assignbooking base where id=? ",[reqq.id]).then(data=>{
         return common.QueryExecute("delete from tbl_assignbooking where id=?",[reqq.id]).then(rej=>{

          if (data[0].dCount<=1) {
            common.QueryExecute("update tbl_driverstatus set isMadmoney='OFF' where Mobileno=?",[data[0].drivermobile])
          }

          return common.MessageTemplate("CRBKCAN").then(res2=>{
            let temp=res2.replace('$bid$',result2[0].BookingId);
            return common.SendSMS(result2[0].UserMobileno,temp).then(res3=>{
              res.json('reject');
            })  
          })

        })
       }).catch(err=>{
        console.log(err)
      })
     }
   })
  }
  else res.json(null);
});
});

//Pickup
router.post('/DriverPickup',function(req,res,err){
 let reqq=req.body;
 //let reqq=req.query;
 let itemss1=dbconfig.query("select count(*) as cnt,BookingId,Recmobile,recotp,Drivermobile from vw_assignbooking where id=? and OTP=?",[reqq.id,reqq.otp],(err,result2)=>{
  if(result2[0].cnt>0)
    {dbconfig.query("update tbl_assignbooking set isPickup=1 where id=?",[reqq.id],(err,result1)=>{        
      dbconfig.query("update tbl_driverstatus set isMadmoney='ON' where Mobileno=? ",[result2[0].Drivermobile])
      if(result2[0].Recmobile!='')
      {
        common.MessageTemplate("CRBKOTP1").then(res4=>{
          let temp=res4;
          temp=temp.replace('$bid$',result2[0].BookingId);
          temp=temp.replace('$otp$',result2[0].recotp);

          common.SendSMS(result2[0].Recmobile,temp).then(res5=>{
            if(res5!='success')
              return callback(null,results)
          })
          
        })       
      }

      if(err){
        res.json(err);
      }else{
        res.json({"msg":"success"});
      }
    })
}
else
  res.json({"msg":"invalid OTP"});
})
});

//drop
router.post('/DriverDrop',function(req,res,err){
 let reqq=req.body;
 let data={};
 //let reqq=req.query;
 common.QueryExecute("select count(*) as cnt,max(drivermobile) as drivermobile,ifNull((SELECT COUNT(*) from vw_assignbooking WHERE isdrop=0 and drivermobile=base.Drivermobile),0) as dCount from vw_assignbooking base where id=? and (recotp=? or recotp='')",[reqq.id,reqq.otp]).then(res1=>{
  data=res1
  if(data[0].cnt>0)
  {
    return common.QueryExecute("update tbl_assignbooking set isDrop=1,Remarks=? where id=?",[reqq.otp,reqq.id]).then(res2=>{
      if (data[0].dCount===1) {
        return common.QueryExecute("update tbl_driverstatus set isMadmoney='OFF' where Mobileno=?",[data[0].drivermobile])
      }
    }).then(res3=>{return res.json({"msg":"success"}) })
  }
  else return res.json({"msg":"invalid OTP"})
}).catch(err=>{
  return err;
})

});

//Pickup
router.get('/DriverDirection',function(req,res,err){
 //let reqq=req.body;
 let reqq=req.query;
 dbconfig.query("select * from tbl_assignbooking where id=?",[reqq.id],(err,result2)=>{
  if(result2[0].isPickup=='0')
  {
    dbconfig.query("select id,BookingId,BookingType,Name,FromAddress,UserMobileNo,FromLatitude,FromLongitude from vw_assignbooking where id=?",[reqq.id],(err,result3)=>{
      if(err){
        res.json(err);
      }else{
        res.json(result3);
      }
    });
  }
  else
  {
    dbconfig.query("select id,BookingId,BookingType,Name,toaddress FromAddress,UserMobileNo,tolatitude FromLatitude,tolongitude FromLongitude from vw_assignbooking where id=?",[reqq.id],(err,result3)=>{
      if(err){
        res.json(err);
      }else{
        res.json(result3);
      }
    }); 
  }
})
});

//Booking Timeout
router.post('/BookingTimeout',function(req,res,err){
 let reqq=req.body;
 //let reqq=req.query;
 let qry="select * from vw_assignbooking where id=?";
 var itemss=  dbconfig.query(qry,[reqq.id],function(err,result,fields){
  if(result.length>0)
  {
    let user={}
    user.fromlat=result[0].FromLatitude
    user.fromlong=result[0].FromLongitude
    user.bid=result[0].BookingId
    user.userid=result[0].Userid
    user.mobno=result[0].Mobileno
    
    let itemss1=common.NearestDriver(user,result[0].bookingtype,result[0].DriverId,(ress)=>{
      if(ress=='success')
      {
        let itemss1=dbconfig.query("update tbl_assignbooking set isReject=1,isAccept=0 where id=?",[reqq.id],(err,result1)=>{      
          res.json("success");
        })    
      }
      else res.json(ress);
    })      
  }
});  
});

//Driver Report
router.post('/DriverReport',function(req,res,err){
 let reqq=req.body;
 //let reqq=req.query;
 let cond="";
 if(reqq.fromdate==undefined&&reqq.todate==undefined)
   res.json({"message":"Choose FromDate and ToDate"});
 let arr=[];
 if(reqq.mobno!=undefined&&reqq.bookingtype!=undefined)
 {
  cond=" and Drivermobile='"+reqq.mobno+"' and BookingType='"+reqq.bookingtype+"' and BookingDate between '"+reqq.fromdate+"' and '"+reqq.todate+"'"
  arr=[reqq.mobno,reqq.bookingtype,reqq.fromdate,reqq.todate]
}
else if(reqq.mobno!=undefined)
{
  cond=" and Drivermobile='"+reqq.mobno+"' and BookingDate between '"+reqq.fromdate+"' and '"+reqq.todate+"'"
  arr=[reqq.mobno,reqq.fromdate,reqq.todate]
}
else if(reqq.drop!=undefined)
{
  cond=" and isDrop=1"
}
else 
{
 cond=" and BookingDate between '"+reqq.fromdate+"' and '"+reqq.todate+"'"
 arr=[reqq.fromdate,reqq.todate] 
}
dbconfig.query("select DriverId,Drivermobile,UserId,bookingType,BookingId,BookingDate,BookingTime,UserMobileno,NetTotal,NetTotal as driverEarnings,Name,driver_name,BDate,BTime,paymentMode from vw_assignbooking where isDrop=1"+cond,arr,(err,result2)=>{
  if(err){
    res.json(err);
  }else{
    res.json(result2);
  }
})
}); 

//Driver Report
router.post('/DriverPaymentReport',function(req,res,err){
 let reqq=req.body;
 //let reqq=req.query;
 let cond="";
 if(reqq.fromdate==undefined&&reqq.todate==undefined)
   res.json({"message":"Choose FromDate and ToDate"});
 let arr=[];
 if(reqq.mobno!=undefined&&reqq.bookingtype!=undefined)
 {
  cond=" and Drivermobile='"+reqq.mobno+"' and BookingType='"+reqq.bookingtype+"' and BookingDate between '"+reqq.fromdate+"' and '"+reqq.todate+"'"
  arr=[reqq.mobno,reqq.bookingtype,reqq.fromdate,reqq.todate]
}
else if(reqq.mobno!=undefined)
{
  cond=" and Drivermobile='"+reqq.mobno+"' and BookingDate between '"+reqq.fromdate+"' and '"+reqq.todate+"'"
  arr=[reqq.mobno,reqq.fromdate,reqq.todate]
}
dbconfig.query("select DriverId,Drivermobile,BookingDate,sum(NetTotal) as NetTotal,sum(NetTotal) as driverEarnings from vw_assignbooking where isDrop=1"+cond+" group by DriverId,BookingDate",arr,(err,result2)=>{
  if(err){
    res.json(err);
  }else{
    res.json(result2);
  }
})
}); 

module.exports = router;

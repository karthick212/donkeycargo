const dbconfig = require('../config/db')
const Request = require("request");
var CommonController = {
 MessageTemplate(msgcode,cb){  
  let qry='select MessageTemplate from tbl_messagetemplate where MessageCode=?';
  return this.QueryExecute(qry,[msgcode]).then(res=>{
    return res[0].MessageTemplate
  }).catch(cat=>{
    return null;
  })  
},
QueryExecute(qry,args)
{
  return new Promise((res,rej)=>{
    dbconfig.query(qry,args,(err,rows)=>{
      if (err) return rej(err);
      else res(rows);
    })
  })
},
SendSMS(mobno,msg,cb){
     //var Otpurl = 'http://manage.rkadsindia.in/SendSMS/sendmsg.php?uname=DCARGO&pass=123456&send=DCARGO&dest=' + mobno + '&msg=' + msg
     var Otpurl = 'https://sms.nettyfish.com/vendorsms/pushsms.aspx?apikey=84c52596-d40a-4ecd-aab9-5b275c01f828&clientId=10c06444-221b-463e-a9c1-bcbe4d418b88&msisdn='+mobno+'&sid=DCARGO&msg='+msg+'&fl=0&gwid=2'
     return new Promise((res,rej)=>{
      var dd = Request.get(encodeURI(Otpurl),(err,results)=>{        
       if(results.statusCode=='200'){
        return res('success')
      }
      else
      {
        return rej(err)
      }
    })    

    })
   },
   NearestDriver(user,booktype,d_id,cb){
    let didCond=" and isMadmoney='Req'";
    if(d_id!='')
      didCond+=" and Driverid not in ('"+d_id+"') "

    let dqry="SELECT id,Driverid,latitude,longitude, ( 3959 * acos( cos( radians(?) ) * cos( radians( Latitude ) ) * cos( radians( longitude ) - radians(?) ) + sin( radians(?) ) * sin( radians( Latitude ) ) ) ) AS distance,Mobileno FROM tbl_driverstatus where id<>0 and mobileno in (SELECT driver_phone FROM tbl_driver_general_detail WHERE driverstatus='approved')"+didCond+" HAVING distance < 10 ORDER BY distance LIMIT 0 , 1 "
      //HAVING distance < 25 
      dbconfig.query(dqry,[user.fromlong,user.fromlat,user.fromlong],(err,rows)=>{
        if(rows.length>0)
        {
          let qry='Insert into tbl_assignbooking(`BookingType`, `BookingId`, `Userid`, `Mobileno`, `DriverId`, `isAccept`, `isReject`, `Drivermobile`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)'
          dbconfig.query(qry,[booktype,user.bid,user.userid,user.mobno,rows[0].Driverid,'0','0',rows[0].Mobileno],(err,results)=>{
            if (results.affectedRows > 0) {
              return cb({status:"success",drivermobno:rows[0].Mobileno});
            }
            else return cb("error");
          })
        }
        else return cb("driver not found");
      });    
    },     
  };
  module.exports = CommonController;


const dbconfig = require('../config/db')
const Request = require('request')
const common = require('../controller/common-Controller')

var driverController = {
 checkMobno(mobno,role,callback)
 {
  let query = 'SELECT count(*) as cnt  FROM tbl_userdetails WHERE Mobile = ?'
  if(role.toLowerCase()=='driver')
     query = 'SELECT count(*) as cnt  FROM tbl_driver_general_detail WHERE driver_phone = ?'
  return dbconfig.query(query, [mobno], (err, rows) => {
    if(err) throw err;
    if (rows[0].cnt>0)
    {
      var date = new Date();
      var hours = date.getHours() > 12 ? date.getHours() - 12 : date.getHours();
      hours = hours < 10 ? "0" + hours : hours;
      var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
      var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
      time = hours + ":" + minutes + ":" + seconds
      let todate = new Date().toISOString().slice(0, 10);

      let RandomOtp = Math.floor(100000 + Math.random() * 900000)
      let status = 'verified'
      let todate1 = new Date().toISOString().slice(0, 10);
      let updateQry = "UPDATE tbl_otplist SET otp = '" + RandomOtp + "', date = '" + todate + "', time = '" + time + "'  WHERE mobile ='" + mobno + "' and role='"+ role +"'"
      return dbconfig.query(updateQry, (err, results) => {
        console.log(results)
       if (err) throw err;
       if (results.affectedRows > 0) {
        return callback(null, "Exist", RandomOtp)
      } 
    })
    }
    else
    {
      return callback(null,"New","")
    }
  })
},

  // OTP
  DriverOtp(otp, role, imeino, callback) {
    var date = new Date();
    var hours = date.getHours() > 12 ? date.getHours() - 12 : date.getHours();
    hours = hours < 10 ? "0" + hours : hours;
    var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
    var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
    time = hours + ":" + minutes + ":" + seconds
    let RandomOtp = Math.floor(100000 + Math.random() * 900000)
    let status = 'verified'
    let todate = new Date().toISOString().slice(0, 10);
    let updateQry = "UPDATE tbl_otplist SET otp = '" + RandomOtp + "', date = '" + todate + "', time = '" + time + "', imeino = '" + imeino + "'  WHERE mobile ='" + otp + "' and role='"+ role +"'"
    return dbconfig.query(updateQry, (err, results) => {
      // if (err) throw err;
      if (results.affectedRows > 0) {
        return callback(null, results, RandomOtp)
      } else {

        let insertQuery = 'INSERT INTO `tbl_otplist` (mobile, otp, date, time, role, imeino)VALUES (?,?,?,?,?,?)'
        return dbconfig.query(insertQuery, [otp, RandomOtp, todate, time, role, imeino], callback(null, results, RandomOtp))
      }
    })
  },
  // OTP Check
  checkOtp(userdata, cb) {
    let query = "SELECT count(*) as cnt,ifnull((SELECT count(*) FROM tbl_userdetails WHERE isActive<>0 and Mobile=tbl_otplist.mobile),0) as usermob,ifnull((SELECT count(*) FROM tbl_driver_general_detail WHERE driver_phone=tbl_otplist.mobile),0) as drivermob,ifnull((SELECT drivertype FROM tbl_driver_general_detail WHERE driver_phone=tbl_otplist.mobile limit 1),'') as drivertype FROM tbl_otplist WHERE otp = ? and mobile = ? and role = ?"
    return dbconfig.query(query, [userdata.otp, userdata.mobno, userdata.role], (err, rows) => {
      console.log(rows)
      if (rows[0].cnt > 0)
      {
        if(rows[0].usermob>0&&userdata.role==='user')
          return cb(null,rows,"Exist")
        else if(rows[0].drivermob>0&&userdata.role!=='user')
          return cb(null,rows,"Exist")
        else
          return cb(null,rows,"New")
      }
      else{
        return cb(null,0,"")        
      }
    })
  },
  // Driver Login
  DriverLogin(data, callback) {
    var username = data.username
    var password = data.password
    let query = 'SELECT * FROM tbl_driver_login WHERE driver_name = ? AND driver_password=?'
    dbconfig.query(query, [username, password], callback)
  },
  // driver List
  FetchAllDetails(callback) {
    return dbconfig.query('select * from driver', callback)
  },
  // Create Driver Profile
  Createprofiledetails(profileData, callback) {
    //let querys = 'INSERT INTO tbl_driver_general_detail SET ?'
    var date = new Date();
  var hours = date.getHours() > 12 ? date.getHours() - 12 : date.getHours();
  hours = hours < 10 ? "0" + hours : hours;
  var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
  var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
  time = hours + ":" + minutes + ":" + seconds
  let todate1 = new Date().toISOString().slice(0, 10);
  let RandomOtp = Math.floor(100000 + Math.random() * 900000)

    var arr1=[profileData.driverid, profileData.drivermobileno]
    let insertQuery = "INSERT INTO `tbl_driverstatus`(Driverid,Mobileno,isMadmoney, isShare, isHire, isRental,isActive) VALUES(?,?,'Off','Off','Off','Off',1) "
    dbconfig.query(insertQuery, arr1, (err, results) => {      

      let querys = 'INSERT INTO `tbl_driver_general_detail` (`driver_id`, `drivertype`,`driver_name`, `driver_email`, `driver_phone`, `driver_lan`,    `driver_address`,        `year_experience`,      `vehicle_width`,          `vehicle_height`,           `vehicle_depth`,           `vehicle_model`,         `vehicle_number`, `vehicle_type`, `driverstatus`, `isactive`, `Remarks`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)'
      let datas = [profileData.driverid, profileData.drivertype, profileData.drivername, profileData.driveremail, profileData.drivermobileno, profileData.driverlan, profileData.driveraddress, profileData.experience, profileData.vehiclewidth, profileData.vehicleheight, profileData.vehicledepth, profileData.vehiclemodel, profileData.vehiclenumber, profileData.vehicletype, 'Pending', 1, '']
      return dbconfig.query(querys, datas , (err,results1)=>{
        let insertQuery = 'INSERT INTO `tbl_otplist` (mobile, otp, date, time, role, imeino)VALUES (?,?,?,?,?,?)'
    return dbconfig.query(insertQuery, [profileData.drivermobileno, RandomOtp, todate1, time, 'driver', profileData.imeino], (err, results1) => {
    
      let ss= common.MessageTemplate("DRSNOTP").then(res2=>{
        let temp=res2.replace('$otp$',RandomOtp);
        return common.SendSMS(profileData.drivermobileno,temp).then(res3=>{
          return 1;
        })  
      })  
      
      if (results.affectedRows > 0) {
        results.otp=RandomOtp
        return callback(null, results)
      }
      else {
        return callback(null, results)  
      }
    })
      })
    })
    //return dbconfig.query(querys, profileData , callback())
  },  
  updateDriver(user,callback)
  {
      let updateQry = "UPDATE tbl_driver_general_detail SET `driver_name`=?,`driver_email`=?,`driver_phone`=?, `driver_address`=?,`year_experience`=?,`vehicle_number`=?, `vehicle_type`=?, `driverstatus`=?, `Remarks`=? where id =?";
      let param=[profileData.drivername, profileData.driveremail, profileData.drivermobileno, profileData.driveraddress, profileData.experience, profileData.vehiclenumber, profileData.vehicletype, profileData.driverstatus, profileData.remarks, profileData.id ]
      dbconfig.query(updateQry,param,(err,res)=>{
        if (err) throw err;
        if(res.affectedRows>0) callback(null,res);
        else callback(null,err)
      })
  },
  // FIle Uplaod
  CreatprofilImages(ImageData, header, callback) {
    if (ImageData) {
      let updateQry = "UPDATE tbl_driver_general_detail SET driver_image = '" + ImageData[0] + "', driver_full_image = '" + ImageData[1] + "', driver_aadhar = '" + ImageData[2] + "', driver_license = '" + ImageData[3] + "', driver_voterId = '" + ImageData[4] + "', driver_vehicleImage = '" + ImageData[5] + "', driver_ration_gas_book = '" + ImageData[6] + "', driver_owner_proof = '" + ImageData[6] + "'  WHERE driver_id ='" + header + "'";
      return dbconfig.query(updateQry, callback)
    } else {
      return 'no-data'
    }
  }, 
  DriverNoGen(cb){
    let qry='select ifnull(max(id),0)+1 as cnt from tbl_driver_general_detail';
    dbconfig.query(qry,(err,results) => {
      //console.log(results);
      return cb(results)
    })
  }

}

module.exports = driverController
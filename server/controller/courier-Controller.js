const dbconfig = require('../config/db')
const Request = require("request");
const common = require('../controller/common-Controller')
var distance = require('google-distance');
distance.apiKey = 'AIzaSyDZYpk5JAy91rb9XO86-HIGjXJjfiEBxg8';
var geodist = require('geodist')
var moment = require('moment')
const { signIn, verifyToken, welcome } = require("./handler");
const adminmobnos = '9069064005,9444555194'
// const adminmobnos = '9095204586'

//var Distance = require('geo-distance');

var UserController = {
  courierDetails (otpdata, callback) {
    let resp;
    let RandomOtp = Math.floor(100000 + Math.random() * 900000);
    let smsCont =
      "Dear Customer, your OTP for SMS notification registration is " +
      RandomOtp +
      ". Use this OTP to register.";
    let sendMsg =
      "http://manage.rkadsindia.in/SendSMS/sendmsg.php?uname=DCARGO&pass=123456&send=DCARGO&dest=" +
      otpdata.mob +
      "&msg=" +
      smsCont;
    return dbconfig.query(
      "UPDATE tbl_otplist SET otp = '" +
      RandomOtp +
      "' WHERE mob ='" +
      otpdata.mob +
      "'",
      function (error, results, fields) {
        if (results > 0) {
          // Request.get(sendMsg);
          resp = [{ otp: RandomOtp }];
          callback(null, success)
        } else {
          let insertQuery = "INSERT INTO tbl_otplist VALUES (?,?,?)";
          dbconfig.query(
            insertQuery,
            [otpdata.id, otpdata.mob, RandomOtp],
            callback
          );
          // Request.get(sendMsg);
          resp = [{ otp: RandomOtp }];
          callback(null, success)
        }
      }
    );
  },
  AmountCalc (res, cb) {
    //let res = {}
    //flat,flong,fs,ts,ctype,cname,DL1,DB1,DL2,DB2,BL1,BB1,BH1,BL2,BB2,BH2,tlat,tlong,offercode,city
    let ResMsg = {};
    let flat = res.flat
    let flong = res.flong
    let fs = res.fromstate;
    let ts = res.tostate;
    let ctype = res.couriertype;
    let cname = res.couriername;
    let DL1 = res.DL1;
    let DB1 = res.DB1;
    let DL2 = res.DL2;
    let DB2 = res.DB2;
    let BL1 = res.BL1;
    let BB1 = res.BB1;
    let BH1 = res.BH1;
    let BL2 = res.BL2;
    let BB2 = res.BB2;
    let BH2 = res.BH2;
    let tlat = res.tlat;
    let tlong = res.tlong;
    let couponcode = res.couponcode;
    let city = res.city;

    let query1 = "select ifnull(CouponAmt,0) as CouponAmt from tbl_couponmaster where isActive<>'0' and CouponCode=?"
    dbconfig.query(query1, [couponcode], (err, rows) => { try { ResMsg.CouponAmt = rows[0].CouponAmt } catch (e) { ResMsg.CouponAmt = 0; } })

    var date = new Date();
    var weekday = new Array(7);
    weekday[0] = "Sunday";
    weekday[1] = "Monday";
    weekday[2] = "Tuesday";
    weekday[3] = "Wednesday";
    weekday[4] = "Thursday";
    weekday[5] = "Friday";
    weekday[6] = "Saturday";
    var day = weekday[date.getDay()];
    query1 = "select Discount from tbl_dailydiscount where ServiceType='courier' and isActive<>'0' and ServiceArea=? and day=? "
    dbconfig.query(query1, [city, day], (err, rows) => { try { ResMsg.SplDisc = rows[0].Discount } catch (e) { ResMsg.SplDisc = 0; } })

    let BT1 = (BL1 * BB1 * BH1) / 5000;
    let BT2 = (BL2 * BB2 * BH2) / 5000;

    if (ctype.indexOf('loc') != 0) {
      let query = 'select Oprice from tbl_courierrate where DocumentLength=? and DocumentBreadth=? and CourierType=? and FromState like ? and ToState like ? and CourierName like ?'
      dbconfig.query(query, [DL1, DB1, 'Document', '%' + fs + '%', '%' + ts + '%', cname], (err, rows) => { try { ResMsg.DAmt1 = rows[0].Oprice } catch (e) { ResMsg.DAmt1 = 0; } })
      dbconfig.query(query, [DL2, DB2, 'Document', '%' + fs + '%', '%' + ts + '%', cname], (err, rows) => { try { ResMsg.DAmt2 = rows[0].Oprice } catch (e) { ResMsg.DAmt2 = 0; } })

      query = 'select Oprice from tbl_courierrate where  BoxWeight>? and CourierType=? and FromState like ? and ToState like ?  and CourierName like ? and BoxWeight>0 order by BoxWeight'
      if (BT1 > 0) { dbconfig.query(query, [BT1, 'Box', '%' + fs + '%', '%' + ts + '%', cname], (err, rows) => { try { ResMsg.BAmt1 = rows[0].Oprice; ResMsg.BWgt1 = BT1; } catch (e) { ResMsg.BAmt1 = 0; ResMsg.BWgt1 = 0; } }) } else { ResMsg.BAmt1 = 0; ResMsg.BWgt1 = 0; }
      if (BT2 > 0) { dbconfig.query(query, [BT2, 'Box', '%' + fs + '%', '%' + ts + '%', cname], (err, rows) => { try { ResMsg.BAmt2 = rows[0].Oprice; ResMsg.BWgt2 = BT2; } catch (e) { ResMsg.BAmt2 = 0; ResMsg.BWgt2 = 0; } }) } else { ResMsg.BAmt2 = 0; ResMsg.BWgt2 = 0; }
    }

    let dqry = 'SELECT id,latitude,longitude,Area, ( 3959 * acos( cos( radians(?) ) * cos( radians( Latitude ) ) * cos( radians( longitude ) - radians(?) ) + sin( radians(?) ) * sin( radians( Latitude ) ) ) ) AS distance FROM tbl_courierlink where isActive<>0 HAVING distance < 25 ORDER BY distance LIMIT 0 , 1'
    dbconfig.query(dqry, [flat, flong, flat], (err, rows) => {
      //let gqry='https://maps.googleapis.com/maps/api/distancematrix/json?origins='+res.flat+','+res.flong+'&destinations='+rows[0].latitude+','+rows[0].longitude+'&mode=driving&language=en-EN&sensor=false&key=AIzaSyCZsnc36jrvx7sdu0iHfhAbtGGZXFOJ2nA'
      let Amt = 0;
      let tolat = rows[0].latitude
      let tolong = rows[0].longitude
      if (ctype.indexOf('loc') >= 0) {
        tolat = tlat
        tolong = tlong
        ResMsg.DAmt1 = 0
        ResMsg.DAmt2 = 0
        ResMsg.BAmt1 = 0
        ResMsg.BAmt2 = 0
      }

      distance.get({ origin: flat + ',' + flong, destination: tolat + ',' + tolong }, (err, rowss) => {
        let query = 'select * from tbl_courierconfig'
        var dist = geodist({ lat: tolat, lon: tolong }, { lat: flat, lon: flong }, { exact: true, unit: 'km' })

        //let dist=rowss.distanceValue/1000
        dbconfig.query(query, (err, rows) => {
          try {
            let firstkm = rows[0].studentMinRate + rows[0].DMinRate
            let secndkm = rows[0].studentAddlRate + rows[0].DAddlRate
            if (ctype.indexOf('loc') >= 0) {
              firstkm = rows[0].LSminRate + rows[0].LDminRate
              secndkm = rows[0].LSaddlRate + rows[0].LDaddlRate
            }
            Amt = firstkm;
            let diff = dist - 1.5
            if (Math.sign(diff) != -1) {
              for (var i = 0; i < parseInt(Math.round(diff)); i++)
                Amt += secndkm
            }
            ResMsg.SAmt = Amt
            ResMsg.localdist = dist
            ResMsg.tolat = tolat
            ResMsg.tolong = tolong
            return cb(null, ResMsg)
          }
          catch (e) { }
        })
      })
    });

    //return cb(null,ResMsg)
  },
  // AddBooking (user, callback) {
  //   let todate = new Date().toISOString().slice(0, 10);
  //   var currentTime = new Date();
  //   var currentOffset = currentTime.getTimezoneOffset();
  //   var ISTOffset = 750;   // IST offset UTC +5:30
  //   var date = new Date(currentTime.getTime() + (ISTOffset + currentOffset) * 60000);

  //   time = date.toISOString().slice(11, 19);
  //   let RandomOtp = Math.floor(1000 + Math.random() * 9000)
  //   let RandomOtp2 = Math.floor(1000 + Math.random() * 9000)
  //   const body = { body: { ...user, pickupOTP: RandomOtp, dropOTP: RandomOtp2 } }
  //   const token = signIn(body)

  //   let insertQuery = 'INSERT INTO `tbl_courierbooking` (`BookingId`, `BookingSerial`, `BookingDate`, `BookingTime`, `FromLatitude`,`FromLongitude`, `ToLatitude`, `ToLongitude`, `FromAddress`, `ToAddress`, `CourierType`, `CourierName`, `ProductType`, `LocalAdd1`, `LocalAdd2`, `LocalAdd3`,          `DL1`,      `DB1`,    `DAmt1`,   `DL2`,   `DB2`,  `DAmt2`,    `BL1`,   `BB1`,  `BH1`,   `BW1`,  `BAmt1`,   `BL2`,   `BB2`,  `BH2`,    `BW2`, `BAmt2`,     `Total`, `PaymentMode`, `CouponCode`, `CouponAmt`,     `NetTotal`,   `isCancel`, `isActive`, `MobileNo`, `OTP`, `BankRefNo`, `UserID`, `RecName`, `RecMobile`, `Remarks`, `LocalDistance`, `SAmt`, `RecOTP`, `NOI`, `clatitude`, `clongitude`, `PersonalMobno`, `token`) VALUES (?)';
  //   let params = [user.bid, user.bserial, todate, time, user.fromlat, user.fromlong, user.tolat, user.tolong, user.fromadd, user.toadd, user.ctype, user.cname, user.product, user.localadd1, user.localadd2, user.localadd3, user.dl1, user.db1, user.damt1, user.dl2, user.db2, user.damt2, user.bl1, user.bb1, user.bh1, user.bw1, user.bamt1, user.bl2, user.bb2, user.bh2, user.bw2, user.bamt2, user.total, user.paymode, user.couponcode, user.couponamt, user.nettotal, user.iscancel, '1', user.mobno, RandomOtp, user.bankrefno, user.userid, user.recname, user.recmobile, user.remarks, user.localdistance, user.samt, RandomOtp2, user.noi, user.clat, user.clong, user.personal, token]
  //   return common.QueryExecute(insertQuery, params).then(res1 => {
  //     if (res1.affectedRows > 0) {
  //       common.NearestDriver(user, 'Courier', '', (res) => {
  //         if (res.status == "success") {
  //           common.MessageTemplate("CRBKOTP").then(res2 => {
  //             let temp = res2.replace('$bid$', user.bid);
  //             temp = res2.replace('$otp$', RandomOtp);
  //             return common.SendSMS(user.mobno, temp).then(res3 => {
  //               return 1;
  //             })
  //           })

  //           let sr = common.MessageTemplate("CRBKDR").then(res1 => {
  //             let temp = res1.replace('$bid$', user.bid);
  //             temp = temp.replace('$hno$', user.localadd1)
  //             temp = temp.replace('$area$', user.localadd2)
  //             return common.SendSMS(res.drivermobno, temp).then(res3 => {
  //               return 1;
  //             })
  //           })

  //           if (user.personal != '') {
  //             common.MessageTemplate("CRBKOTP").then(res2 => {
  //               let temp = res2.replace('$bid$', user.bid);
  //               temp = res2.replace('$otp$', RandomOtp);
  //               return common.SendSMS(user.personal, temp).then(res3 => {
  //                 return 1;
  //               })
  //             })
  //           }
  //           return callback(null, 'success')
  //         }
  //         else callback(null, 'success');
  //       })
  //     }
  //     else {
  //       return callback(null, "error")
  //     }
  //   })
  // },
  AddBooking (user, callback) {
    //var date = new Date();
    let todate = new Date().toISOString().slice(0, 10);
    var currentTime = new Date();
    var currentOffset = currentTime.getTimezoneOffset();
    var ISTOffset = 750;   // IST offset UTC +5:30
    var date = new Date(currentTime.getTime() + (ISTOffset + currentOffset) * 60000);

    time = moment().utcOffset(330).format("HH:mm:ss"); //date.toISOString().slice(11, 19);
    let RandomOtp = Math.floor(1000 + Math.random() * 9000)
    let RandomOtp2 = Math.floor(1000 + Math.random() * 9000)
    let token = Math.random().toString(36).substr(2, 6)
    // const body = { body: { ...user, pickupOTP: RandomOtp, dropOTP: RandomOtp2 } }
    // const token = this.encryptToken(signIn(body).token)

    let insertQuery = 'INSERT INTO `tbl_courierbooking` (`BookingId`, `BookingSerial`, `BookingDate`, `BookingTime`, `FromLatitude`,`FromLongitude`, `ToLatitude`, `ToLongitude`, `FromAddress`, `ToAddress`, `CourierType`, `CourierName`, `ProductType`, `LocalAdd1`, `LocalAdd2`, `LocalAdd3`,          `DL1`,      `DB1`,    `DAmt1`,   `DL2`,   `DB2`,  `DAmt2`,    `BL1`,   `BB1`,  `BH1`,   `BW1`,  `BAmt1`,   `BL2`,   `BB2`,  `BH2`,    `BW2`, `BAmt2`,     `Total`, `PaymentMode`, `CouponCode`, `CouponAmt`,     `NetTotal`,   `isCancel`, `isActive`, `MobileNo`, `OTP`, `BankRefNo`, `UserID`, `RecName`, `RecMobile`, `Remarks`, `LocalDistance`, `SAmt`, `RecOTP`, `NOI`, `clatitude`, `clongitude`, `PersonalMobno`, token) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
    return dbconfig.query(insertQuery, [user.bid, user.bserial, todate, time, user.fromlat, user.fromlong, user.tolat, user.tolong, user.fromadd, user.toadd, user.ctype, user.cname, user.product, user.localadd1, user.localadd2, user.localadd3, user.dl1, user.db1, user.damt1, user.dl2, user.db2, user.damt2, user.bl1, user.bb1, user.bh1, user.bw1, user.bamt1, user.bl2, user.bb2, user.bh2, user.bw2, user.bamt2, user.total, user.paymode, user.couponcode, user.couponamt, user.nettotal, user.iscancel, '1', user.mobno, RandomOtp, user.bankrefno, user.userid, user.recname, user.recmobile, user.remarks, user.localdistance, user.samt, RandomOtp2, user.noi, user.clat, user.clong, user.personal, token], async (err, results) => {
      if(err) throw err;
      if (results.affectedRows > 0) {
        const [couponData]=await common.QueryExecute("select * from tbl_couponmaster where CouponCode=?",[user.couponcode])
        if(couponData) {
          const couponQry = " INSERT INTO `tbl_coupondetails` (`Date`, `UserId`, `Mobileno`, `Couponid`, `Debit`, `Credit`, `isActive`, `couponcode`) VALUES (?,?,?,?,?,?,?,?)"
          const params=[todate, user.userid, user.mobno, couponData.id, couponData.CouponAmt,0,1, user.couponcode]
          const couponCreate = await common.QueryExecute(couponQry, params)  
        }
        
        let sms = common.MessageTemplate("ADMINALERT").then(res2 => {
          let temp = res2.replace('$bid$', user.bid);
          return common.SendSMS(adminmobnos, temp).then(res3 => {
            return 1;
          })
        })

        return callback(null, "success")
      }
      else {
        return callback(null, results)
      }
    })
  },
  BillNoGen (cb) {
    let qry = 'select ifnull(max(BookingSerial),0)+1 as cnt from tbl_courierbooking';
    dbconfig.query(qry, (err, results) => {
      return cb(results)
    })
  },
  myOrders (user, callback) {
    let cond = ""
    var param = []
    if (user.mobno != undefined) {
      cond = " and UserMobileno=?";
      param = user.mobno
    }

    let insertQuery = "select * from vw_assignbooking where isReject=0 and isDrop=0 " + cond + " order by BookingId"
    return dbconfig.query(insertQuery, param, (err, results) => {
      if (err) {
        return callback(null, err)
      }
      else
        return callback(null, results)
    })
  },
  getCoupon (user, callback) {
    let cond = ""
    var param = []
    if (user.mobno != undefined && user.couponcode != undefined) {
      cond = " and Mobileno=? and CouponCode=?";
      param = [user.mobno, user.couponcode]
    }

    let insertQuery = "select * from vw_couponbalance where Credit='0' " + cond
    return dbconfig.query(insertQuery, param, (err, results) => {
      if (err) {
        return callback(null, err)
      }
      else
        return callback(null, results)
    })
  },
  getUserCoupon (user, callback) {
    let cond = ""
    var param = []
    if (user.mobno != undefined) {
      cond = " and Mobileno=?";
      param = [user.mobno, user.mobno]
    }

    let getQuery = "select * from tbl_couponmaster where id not in (select id from vw_usercoupons where isActive<>'0' " + cond+") and (CouponType<>'Individual' or user_mobile=?) and DATE_ADD(start_date, INTERVAL Validity DAY)>=CURDATE()"
    return dbconfig.query(getQuery, param, (err, results) => {
      if (err) {
        return callback(null, err)
      }
      else
        return callback(null, results)
    })
  },
  updatePaymode (user, callback) {
    let cond = ""
    var param = [user.paymode, user.refno, user.id]

    let insertQuery = "update tbl_courierbooking set PaymentMode=?,BankRefNo=? where BookingId=? "
    return dbconfig.query(insertQuery, param, (err, results) => {
      if (err) {
        return callback(null, err)
      }
      else
        return callback(null, results)
    })
  },
  cancelBooking (user, callback) {
    var param = []

    let insertQuery = "update tbl_courierbooking set isActive=0,LocalAdd3=?,userID=? where BookingId=? "
    if (user.ctype) {
      param = [user.usertype, user.ctype, user.bid]
      if (user.ctype === "ND")
        insertQuery = "update tbl_courierbooking set isActive=1,LocalAdd3=?,userID=? where BookingId=? "
    }
    else if (user.usertype)
      param = [user.usertype, '', user.bid]
    else param = ['', '', user.bid]

    return dbconfig.query("select count(*) as cnt,max(drivermobile) as drivermobile,ifNull((SELECT COUNT(*) from vw_assignbooking WHERE isdrop=0 and drivermobile=base.Drivermobile),0) as dCount from vw_assignbooking base where BookingId=? ", [user.bid], (err, data) => {
      return dbconfig.query(insertQuery, param, (err, results) => {
        return dbconfig.query("select NetTotal from tbl_courierbooking where BookingId=?", [user.bid], (err, results2) => {
          return dbconfig.query("select Drivermobile from tbl_assignbooking where BookingId=?", [user.bid], (err, results1) => {
            if (data[0].dCount <= 1) {
              dbconfig.query("update tbl_driverstatus set isMadmoney='OFF' where Mobileno=?", [data[0].drivermobile])
            }

            if(user.usertype!=='admin') {
              const link = common.MessageTemplate("ADMINALERTUSERCANCEL").then(res2 => {
                let temp = res2.replace('$bid$', user.bid);
                return common.SendSMS(adminmobnos, temp).then(res3 => {
                  // return 1;
                })
              })
            }

            if (results2.length)
              results.rs = results2[0].NetTotal
            else results.rs = "0"
            if (results1.length) {
              results.drivermob = results1[0].Drivermobile
              return callback(null, results)
            }
            else {
              if (err) {
                return callback(null, err)
              }
              else
                return callback(null, results)
            }
          })
        })
      })
    })
  },
  test () {
    return "c";
  },
  DriverAssign (user, cb) {
    if (user != undefined) {
      let RandomOtp = Math.floor(1000 + Math.random() * 9000)
      let qry1 = 'Select count(*) as cnt from tbl_assignbooking where BookingId=?'
      let token = Math.random().toString(36).substr(2, 6)
      common.QueryExecute(qry1, [user.bid]).then(res => {
        return res[0].cnt;
      }).then(res => {
        if (res === 0 && user.drivermobile !== '') {

          let qry = 'Insert into tbl_assignbooking(`BookingType`, `BookingId`, `Userid`, `Mobileno`, `DriverId`, `isAccept`, `isReject`, `Drivermobile`, `drivertoken`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)'
          return common.QueryExecute(qry, [user.booktype, user.bid, user.userid, user.mobno, user.driverid, '0', '0', user.drivermobile, token]).then(res1 => {
            if (res1.affectedRows > 0) return 1;
            else return 0;
          })
        } else return 0;
      }).then(res => {
        if (res > 0) {
          let qry = 'Update tbl_courierbooking set OTP=? where BookingID=?'
          common.QueryExecute(qry, [RandomOtp, user.bid]).then(res1 => {
            return common.MessageTemplate("CRBKOTP").then(res2 => {
              let temp = res2.replace('$bid$', user.bid);
              temp = temp.replace('$otp$', RandomOtp);
              return common.SendSMS(user.mobno, temp).then(res3 => {
                return 1;
              })
            })
          })
          
          let link = common.MessageTemplate("BKDRIVERALERT").then(res2 => {
            let url = new URL('https://donkeycargo.com/Booking/#/driver/' + token)
            let temp = res2.replace('$bid$', user.bid);
            temp = temp.replace('$link1$', url.href.substring(0, 29));
            temp = temp.replace('$link2$', url.href.substring(29, url.href.length + 1));

            return common.SendSMS(user.drivermobile, temp).then(res3 => {
              return cb('success');
            })
          })

          //return 1
        }
        else return 0;
      })
        // .then(res => {
        //   if (res > 0) {
        //     let qry = 'select PersonalMobno from tbl_courierbooking where BookingID=?'
        //     return common.QueryExecute(qry, [user.bid]).then(res1 => {
        //       if (res1.length) {
        //         return common.MessageTemplate("CRBKOTP").then(res2 => {
        //           let temp = res2.replace('$bid$', user.bid);
        //           temp = res2.replace('$otp$', RandomOtp);
        //           return common.SendSMS(res1[0].PersonalMobno, temp).then(res3 => {
        //             return 1;
        //           })
        //         })
        //       }
        //       return cb('success');
        //     })
        //   }
        //   else return cb('success');
        // })
        .catch(err => {
          console.log(err)
        })
    }
    else return cb("driver not found");
  },
  DriverAssign1 (user, cb) {
    if (user != undefined) {
      let qry1 = 'Select count(*) as cnt from tbl_assignbooking where BookingId=?'
      dbconfig.query(qry1, [user.bid], (err, res1) => {
        if (res1[0].cnt === 0) {
          let qry = 'Insert into tbl_assignbooking(`BookingType`, `BookingId`, `Userid`, `Mobileno`, `DriverId`, `isAccept`, `isReject`, `Drivermobile`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)'
          dbconfig.query(qry, [user.booktype, user.bid, user.userid, user.mobno, user.driverid, '0', '0', user.drivermobile], (err, results) => {
            if (err) throw err;
            if (results.affectedRows > 0) {
              //For Messages
              common.MessageTemplate("CRBKOTP", (results) => {
                let temp = results;
                temp = temp.replace('$bid$', user.bid);
                temp = temp.replace('$otp$', RandomOtp);

                //Send SMS
                common.SendSMS(user.mobno, temp, (results) => {
                  if (results != 'success')
                    return cb(null)
                });
              });

              if (user.personal != '') {
                common.MessageTemplate("CRBKOTP2", (results) => {
                  let temp = results;
                  temp = temp.replace('$bid$', user.bid);
                  temp = temp.replace('$otp$', RandomOtp);

                  //Send SMS
                  common.SendSMS(user.recmobile, temp, (results) => {
                    if (results != 'success')
                      return cb(null)
                  });
                });
              }
              return cb("success");
            }
            else return cb("error");
          })
        }
      })
    }
    else return cb("driver not found");
  },
  DriverRating (user, callback) {
    let insertQuery = 'insert into tbl_rating(`BookingID`, `UserMobile`, `DriverMobile`, `Rating`, `Remarks`, `isIgnore`) VALUES (?, ?, ?, ?, ?, ?)'
    return dbconfig.query(insertQuery, [user.bookingid, user.usermobile, user.drivermobile, user.rating, user.remarks, user.isignore], (err, results) => {
      if (err) throw err;
      if (results.affectedRows > 0) {
        return callback(results)
      }
      else {
        return callback(results)
      }
    })
  },
  checkRating (user, callback) {
    let cond = ""
    var param = []
    if (user.usermobile != undefined) {
      cond = " and Mobileno=? ";
      param = [user.usermobile]
    }

    let insertQuery = "select * from vw_checkrating where BookingID!='' " + cond
    return dbconfig.query(insertQuery, param, (err, results) => {
      if (err) {
        return callback(null, err)
      }
      else
        return callback(null, results)
    })
  }

};
module.exports = UserController;

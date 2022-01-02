const express = require("express");
const { get, first } = require("lodash");
const router = express.Router();
const courierActivity = require("../controller/courier-Controller");
const common = require("../controller/common-Controller");
const { sendResult, sendResponse, encryptToken } = require("../controller/common-Controller");
const { signIn, verifyToken, welcome } = require("../controller/handler");

// OTP-API
router.post("/otp", function (request, response) {
  let otpdata = { mob: request.body.number };

  let ResMsg;
  if (otpdata != null) {
    courierActivity.courierDetails(otpdata, (err, row, fields) => {
      if (err) {
        response.json(err);
      } else {
        response.json(row);
      }
    });
  }
});

// Courier Calculation
router.get("/Calc", function (request, response) {
  let ResMsg = {};
  //if (otpdata != null) 
  // var flat=request.param('flat');
  // var flong=request.param('flong');
  // var fs=request.param('fromstate');
  // var ts=request.param('tostate');
  // var ctype=request.param('couriertype');
  // var cname=request.param('couriername');
  // var DL1=request.param('DL1');
  // var DB1=request.param('DB1');
  // var DL2=request.param('DL2');
  // var DB2=request.param('DB2');
  // var BL1=request.param('BL1');
  // var BB1=request.param('BB1');
  // var BH1=request.param('BH1');
  // var BL2=request.param('BL2');
  // var BB2=request.param('BB2');
  // var BH2=request.param('BH2'); 

  let reqq = request.query;
  //let reqq=request.query;

  //courierActivity.AmountCalc(flat,flong,fs,ts,ctype,cname,DL1,DB1,DL2,DB2,BL1,BB1,BH1,BL2,BB2,BH2,request.param('tlat'),request.param('tlong'), (err, res) =>{
  courierActivity.AmountCalc(reqq, (err, res) => {

    if (err) {
      response.json(err);
    } else {
      //        debugger;
      //console.log(row);        
      let ress = []

      let doc = 'Document(1)';
      let docamt = res.DAmt1 + res.DAmt2;
      if (res.DAmt1 == 0 && res.DAmt2 == 0) doc = 'Document'; else if (res.DAmt1 != 0 && res.DAmt2 != 0) doc = 'Document(2)';
      let box = 'Box(1)';
      let boxamt = res.BAmt1 + res.BAmt2;
      if (res.BAmt1 == 0 && res.BAmt2 == 0) box = 'Box'; else if (res.BAmt1 != 0 && res.BAmt2 != 0) box = 'Box(2)';

      let gross = res.DAmt1 + res.DAmt2 + res.BAmt1 + res.BAmt2 + res.SAmt;
      let Total1 = res.DAmt1 + res.DAmt2 + res.BAmt1 + res.BAmt2 + res.SAmt;

      let disc = 0;
      let offerHeader = '';
      if (res.CouponAmt > 0) {
        res.SplDisc = 0;
        disc = res.CouponAmt;
        offerHeader = 'Flat Rs.' + disc + ' Offer'
      }
      else if (res.SplDisc > 0) {
        disc = Math.round(Total1 * res.SplDisc / 100, 0);
        offerHeader = 'Flat ' + res.SplDisc + '% Offer'
      }

      let Total = Total1 - disc;
      ress[0] = { 'damt1': res.DAmt1, 'damt2': res.DAmt2, 'bamt1': res.BAmt1, 'bamt2': res.BAmt2, 'samt': res.SAmt, 'Total': Total, 'gross': gross, 'bwgt1': res.BWgt1, 'bwgt2': res.BWgt2, 'localdist': res.localdist, 'splDisc': res.SplDisc, 'CouponAmt': res.CouponAmt, 'docHeader': doc, 'boxHeader': box, 'docamt': docamt, 'boxamt': boxamt, 'disc': disc, 'offerHeader': offerHeader, 'clatitude': res.tolat, 'clongitude': res.tolong }
      ResMsg.data = ress;
      response.json(ResMsg);
    }
  });
  //}
});

// Courier Booking
router.post('/AddBooking', (request, response) => {
  let ResMsg;
  let RetVal = {};
  //if (otpdata != null) 
  {
    courierActivity.BillNoGen((results) => {
      request.body.bserial = results[0].cnt;
      request.body.bid = 'C' + FormatNumberLength(request.body.bserial, 5);
      //console.log(results);
      courierActivity.AddBooking(request.body, (err, res) => {
        if (err) {
          response.json(err);
        } else {
          //console.log(row);        
          //res.Total=res.BAmt1+res.BAmt2+res.DAmt1+res.DAmt2;          
          response.json('success');
        }
      })
    })
  }
});

router.get('/getTokenData', (request, response) => {
  let res = request.query
  const data = welcome({ token: res.token })
  response.json(data)
});

function FormatNumberLength (num, length) {
  var r = "" + num;
  while (r.length < length) {
    r = "0" + r;
  }
  return r;
}

// View Myorder
router.get('/myorders', (request, response) => {
  let ResMsg = {}
  let res = request.query
  var mobno = res.mobno;
  var id = res.id;
  courierActivity.myOrders(res, (err, rows) => {
    if (err) throw err
    if (rows.length > 0) {
      ResMsg.status = 'success'
      ResMsg.message = 'list of orders'
      ResMsg.data = rows
    } else {
      ResMsg.message = 'There are no records found'
      ResMsg.status = 'failed'
    }
    response.json(ResMsg)
    //response.send(JSON.stringify(ResMsg))
  })
})

// View coupon
router.get('/getCoupon', (request, response) => {
  let ResMsg = {}
  let res = request.query
  var mobno = res.mobno;
  var id = res.id;
  courierActivity.getCoupon(res, (err, rows) => {
    if (err) throw err
    if (rows.length > 0) {
      ResMsg.status = 'success'
      ResMsg.message = 'list of orders'
      ResMsg.data = rows
    } else {
      ResMsg.message = 'There are no records found'
      ResMsg.status = 'failed'
    }
    response.json(ResMsg)
    //response.send(JSON.stringify(ResMsg))
  })
})

router.post('/updatePaymode', (request, response) => {
  let ResMsg = {}
  let res = request.body
  var mobno = res.mobno;
  var id = res.id;
  courierActivity.updatePaymode(res, (err, rows) => {
    if (err) throw err
    if (rows.affectedRows > 0) {
      ResMsg.status = 'success'
      ResMsg.data = rows
    } else {
      ResMsg.status = 'failed'
    }
    response.json(ResMsg)
    //response.send(JSON.stringify(ResMsg))
  })
})

router.post('/cancelBooking', (req, res) => {
  let ResMsg = {}
  let user = req.body
  courierActivity.cancelBooking(user, (err, rows) => {
    if (err) throw err

    if (rows.affectedRows > 0) {
      if (user.ctype) {
        let mesHead = ''
        if (user.ctype === 'ND') mesHead = 'CRBKCANTUND'
        else mesHead = 'CRBKCANTUNS'
        let ss = common.MessageTemplate(mesHead).then(res2 => {
          let temp = res2.replace('$bid$', user.bid);
          common.SendSMS(user.mobno, temp)
        })
      } else {
        let ss = common.MessageTemplate("CRBKCANTU").then(res2 => {
          let temp = res2.replace('$bid$', user.bid);
          temp = temp.replace('$rs$', rows.rs);
          common.SendSMS(user.mobno, temp)
        })
      }

      if (!user.ctype&&rows.drivermob) {
        let sd = common.MessageTemplate("CRBKCANTD").then(res2 => {
          let temp = res2.replace('$bid$', user.bid);
          common.SendSMS(rows.drivermob, temp)
        })
      }

      ResMsg.status = 'success'
      ResMsg.data = rows
      res.json(ResMsg)
    }
    else {
      ResMsg.status = 'failed'
      res.json(ResMsg)
    }
    //response.send(JSON.stringify(ResMsg))
  })
})

router.post('/DriverAssign', (request, response) => {
  let ResMsg = {}
  let res = request.body
  var mobno = res.mobno;
  var id = res.id;
  courierActivity.DriverAssign(res, (rows) => {
    if (rows == 'success') {
      ResMsg.status = 'success'
      ResMsg.data = rows
    } else {
      ResMsg.status = 'failed'
    }
    response.json(ResMsg)
    //response.send(JSON.stringify(ResMsg))
  })
})

router.post('/DriverRating', (request, response) => {
  let ResMsg = {}
  let res = request.body
  var mobno = res.mobno;
  var id = res.id;
  courierActivity.DriverRating(res, (rows) => {
    if (rows.affectedRows > 0) {
      ResMsg.status = 'success'
      ResMsg.data = rows
    } else {
      ResMsg.status = 'failed'
    }
    response.json(ResMsg)
    //response.send(JSON.stringify(ResMsg))
  })
})

// check Rating
router.get('/checkRating', (request, response) => {
  let ResMsg = {}
  let res = request.query
  var mobno = res.mobno;
  var id = res.id;
  courierActivity.checkRating(res, (err, rows) => {
    if (err) throw err
    if (rows.length > 0) {
      ResMsg.status = 'success'
      ResMsg.message = 'list of orders'
      ResMsg.data = rows
    } else {
      ResMsg.message = 'There are no records found'
      ResMsg.status = 'failed'
    }
    response.json(ResMsg)
    //response.send(JSON.stringify(ResMsg))
  })
})

router.get("/test", (request, response) => {
  let a = courierActivity.test();
  response.json(a);
});

router.get("/checkstatus", async (request, response) => {
  const data = request.query
  let getQuery = "select * from vw_assignbooking where drivertoken=?"
  let bookinghistory = await common.QueryExecute(getQuery, [data.token])
  const token = encryptToken(signIn({ body: first(bookinghistory) }).token)

  let result = await common.QueryExecute("select *  from tbl_assignbooking where drivertoken=?", [data.token]);
  if (result.length)
    sendResult(response, { token, ...first(result) })
  else sendResult(response, null)
});

router.get("/checkuser", async (request, response) => {
  const data = request.query
  let getQuery = "select * from vw_assignbooking where token=?"
  let bookinghistory = await common.QueryExecute(getQuery, [data.token])
  const token = encryptToken(signIn({ body: first(bookinghistory) }).token)

  if (bookinghistory.length)
    sendResult(response, { token })
  else sendResult(response, null)
});

// function intervalFunc() {
//   console.log('Cant stop me now!');
// }

// setInterval(intervalFunc, 3000);

module.exports = router;

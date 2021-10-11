-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: donkeycargo.cmc4nhmz7bua.us-east-1.rds.amazonaws.com:3306
-- Generation Time: Oct 25, 2020 at 12:39 PM
-- Server version: 5.7.22-log
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `donkeycargo`
--

-- --------------------------------------------------------

--
-- Table structure for table `sample`
--

CREATE TABLE `sample` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sample`
--

INSERT INTO `sample` (`id`, `name`, `price`) VALUES
(1, 'hello', '123');

-- --------------------------------------------------------

--
-- Table structure for table `tbllogs`
--

CREATE TABLE `tbllogs` (
  `id` int(11) NOT NULL,
  `UserID` varchar(10) NOT NULL,
  `LogDate` datetime NOT NULL,
  `PageName` varchar(20) NOT NULL,
  `PrimaryCode` varchar(10) NOT NULL,
  `Action` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbllogs`
--

INSERT INTO `tbllogs` (`id`, `UserID`, `LogDate`, `PageName`, `PrimaryCode`, `Action`) VALUES
(21, '1', '2020-09-13 13:12:46', 'Users', '1', 'Add'),
(22, '1', '2020-09-13 13:15:05', 'Users', '22', 'worker'),
(23, '1', '2020-09-15 11:31:16', 'Users', '1', 'Add'),
(24, '1', '2020-10-01 23:02:47', 'Users', '1', 'Add'),
(25, '1', '2020-10-01 23:09:00', 'Users', '1', 'Add'),
(26, '1', '2020-10-13 22:55:13', 'Requesters', '3', 'Add'),
(27, '1', '2020-10-13 23:23:04', 'Requesters', '2', 'update'),
(28, '1', '2020-10-19 08:19:11', 'Works', '2', 'Add'),
(29, '1', '2020-10-19 22:17:09', 'Works', '2', 'update'),
(30, '1', '2020-10-19 22:19:44', 'Works', '3', 'Add'),
(31, '1', '2020-10-19 22:22:57', 'Works', '4', 'Add'),
(32, '1', '2020-10-20 22:38:45', 'Requesters', '2', 'update'),
(33, '1', '2020-10-20 22:39:26', 'Works', '5', 'Add'),
(34, '1', '2020-10-20 23:09:34', 'Requesters', '2', 'update'),
(35, '1', '2020-10-20 23:12:11', 'Users', '26', 'Add'),
(36, '1', '2020-10-20 23:12:42', 'Users', '26', 'worker'),
(37, '1', '2020-10-20 23:12:46', 'Users', '26', 'worker'),
(38, '1', '2020-10-22 10:51:26', 'Users', '27', 'Add'),
(39, '1', '2020-10-24 11:40:03', 'Users', '28', 'Add'),
(40, '1', '2020-10-24 11:40:32', 'Users', '28', 'worker'),
(41, '1', '2020-10-24 11:40:38', 'Users', '28', 'worker');

-- --------------------------------------------------------

--
-- Table structure for table `tblrequester`
--

CREATE TABLE `tblrequester` (
  `ID` int(20) NOT NULL,
  `RequesterName` varchar(100) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Reward` decimal(4,2) NOT NULL,
  `TimeAllotted` varchar(20) NOT NULL,
  `WorkerType` varchar(20) NOT NULL,
  `isActive` int(10) NOT NULL,
  `sdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblrequester`
--

INSERT INTO `tblrequester` (`ID`, `RequesterName`, `Title`, `Description`, `Reward`, `TimeAllotted`, `WorkerType`, `isActive`, `sdate`) VALUES
(1, '', '', '', '0.00', '', '', 0, '0000-00-00 00:00:00'),
(2, 'sgr', 'page typing', 'type the given below page', '0.05', '5 min', '', 1, '2020-10-20 23:09:34'),
(3, 's', 'd', 'd', '0.00', 'd', 'work1', 1, '2020-10-13 22:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Country` varchar(20) NOT NULL,
  `Fullname` varchar(100) NOT NULL,
  `Address1` varchar(100) NOT NULL,
  `Address2` varchar(100) NOT NULL,
  `Address3` varchar(100) NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  `Zipcode` varchar(7) NOT NULL,
  `Mobile` varchar(20) NOT NULL,
  `HearAbout` varchar(50) NOT NULL,
  `PrimaryReason` varchar(50) NOT NULL,
  `isActive` int(10) NOT NULL,
  `Sdate` datetime NOT NULL,
  `WorkerID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `Name`, `Email`, `Password`, `Country`, `Fullname`, `Address1`, `Address2`, `Address3`, `City`, `State`, `Zipcode`, `Mobile`, `HearAbout`, `PrimaryReason`, `isActive`, `Sdate`, `WorkerID`) VALUES
(21, 'karthic', 'spyderinfotech2017@gmail.coms', '123456', '', '', '', '', '', '', '', '', '', '', '', 1, '2020-09-13 12:32:32', ''),
(22, 'karthick', 'spyderinfotech2017@gmail.com', '123456', 'India', 'sdl', 'madurai', '', '', 'mdu', 'tn', '634003', '2309343242', 'News or magazine article', 'I want to earn rewards', 1, '2020-09-13 13:12:46', ''),
(23, 'sdfg', 'sdffg@gmail.com', '123456', '', '', '', '', '', '', '', '', '', '', '', 1, '2020-09-15 11:31:16', ''),
(24, 'karthick', 'msd@gmai.com', '123456', '', '', '', '', '', '', '', '', '', '', '', 1, '2020-10-01 23:02:47', ''),
(25, 'spyder', 'msd@gmail.com', '123456', '', '', '', '', '', '', '', '', '', '', '', 1, '2020-10-01 23:09:00', ''),
(26, 'gowthamrajsoundarrajan', 'gowthamrajsoundarrajan@gmail.com', 'gowthamrajsoundarraj', 'India', 'gowtham raj', 'no adsljfal', 'ldfjalj', 'adfa', 'adfadsfads', 'dasfa', '5623', '62323', 'Online search', 'I want to earn rewards', 1, '2020-10-20 23:12:11', ''),
(27, 'gowthamrajsoundarrajan', 'gowthamrajsoundarrajan@gmail.com', 'gowthamrajsoundarraj', '', '', '', '', '', '', '', '', '', '', '', 1, '2020-10-22 10:51:26', ''),
(28, 'gowthamraj', 'gowthamrajsoundarrajan@gmail.com', 'gowthamrajsoundarraj', 'India', 'dsafas', 'dasads', 'daaf', 'adsda', 'asdfasd', 'aadf', 'dfadfs', '25255258', 'Online search', 'I want to earn rewards', 1, '2020-10-24 11:40:02', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblwork`
--

CREATE TABLE `tblwork` (
  `id` int(11) NOT NULL,
  `requesterid` int(20) NOT NULL,
  `startDate` datetime NOT NULL,
  `expireDate` datetime NOT NULL,
  `fileName` varchar(50) NOT NULL,
  `filePath` varchar(200) NOT NULL,
  `isActive` int(10) NOT NULL,
  `isFinish` int(10) NOT NULL,
  `isAccept` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblwork`
--

INSERT INTO `tblwork` (`id`, `requesterid`, `startDate`, `expireDate`, `fileName`, `filePath`, `isActive`, `isFinish`, `isAccept`) VALUES
(1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', 0, 0, 0),
(2, 2, '2020-10-18 21:18:21', '2020-10-18 21:18:21', '1.jpg', '/images/work/1.jpg', 0, 0, 0),
(3, 2, '2020-10-19 16:49:31', '2020-10-19 16:49:31', '2.jpg', '/images/work/2.jpg', 0, 0, 0),
(4, 2, '2020-10-19 16:52:35', '2020-10-19 16:52:35', '3.jpg', '/images/work/3.jpg', 1, 0, 0),
(5, 2, '2020-10-20 17:09:11', '2020-10-20 17:09:11', '4.jpg', '/images/work/4.jpg', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_agentmaster`
--

CREATE TABLE `tbl_agentmaster` (
  `AgentId` int(20) NOT NULL,
  `AgentName` varchar(200) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `FatherName` varchar(200) NOT NULL,
  `DOB` date NOT NULL,
  `Address` varchar(200) NOT NULL,
  `MobileNo` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assignbooking`
--

CREATE TABLE `tbl_assignbooking` (
  `id` int(20) NOT NULL,
  `BookingType` varchar(10) NOT NULL,
  `BookingId` varchar(20) NOT NULL,
  `Userid` varchar(20) NOT NULL,
  `Mobileno` varchar(12) NOT NULL,
  `DriverId` varchar(20) NOT NULL,
  `Drivermobile` varchar(12) NOT NULL,
  `isAccept` int(2) NOT NULL,
  `isReject` int(2) NOT NULL,
  `isPickup` int(10) NOT NULL,
  `isDrop` int(10) NOT NULL,
  `Remarks` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_assignbooking`
--

INSERT INTO `tbl_assignbooking` (`id`, `BookingType`, `BookingId`, `Userid`, `Mobileno`, `DriverId`, `Drivermobile`, `isAccept`, `isReject`, `isPickup`, `isDrop`, `Remarks`) VALUES
(4, 'Courier', 'C00002', '', '9994860454', 'S10001', '9444555194', 0, 0, 0, 0, ''),
(5, 'Courier', 'C00003', '', '9790378394', 'S10001', '9444555194', 0, 0, 0, 0, ''),
(11, 'Courier', 'C00019', '', '8122995721', '', '8122995721', 0, 0, 1, 1, '9374'),
(12, 'Courier', 'C00025', '', '9444555194', 'S10001', '9444555194', 0, 0, 0, 0, ''),
(13, 'Courier', 'C00026', '', '9444555194', 'S10001', '9444555194', 0, 0, 1, 1, '1598'),
(14, 'Courier', 'C00028', '', '8122995721', '', '9976683704', 0, 0, 0, 0, ''),
(15, 'Courier', 'C00029', '', '8122995721', 'S10023', '9976683704', 0, 0, 0, 0, ''),
(18, 'Courier', 'C00016', '', '9095204586', '', '8667052467', 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(20) NOT NULL,
  `Category` varchar(200) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `isActive` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `Category`, `Description`, `isActive`) VALUES
(1, 'Micro ', '', 1),
(2, 'Macro', '', 1),
(3, 'Mini', '', 1),
(4, 'EIcher', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_city`
--

CREATE TABLE `tbl_city` (
  `id` int(10) NOT NULL,
  `State` varchar(200) NOT NULL,
  `City` varchar(200) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_city`
--

INSERT INTO `tbl_city` (`id`, `State`, `City`, `Description`, `isActive`) VALUES
(1, 'Tamilnadu (TN)', 'Chennai', 'hgf ghfh gfh', 1),
(2, 'Tamilnadu (TN)', 'Madurai', '', 1),
(3, 'Tamilnadu (TN)', 'Dindigul', 'vhgv', 1),
(4, 'Tamilnadu (TN)', 'Theni', '', 1),
(5, 'Tamilnadu (TN)', 'Nagercoil ', '', 1),
(6, 'Tamilnadu (TN)', 'Coimbatore', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_commonoffers`
--

CREATE TABLE `tbl_commonoffers` (
  `id` int(50) NOT NULL,
  `ServiceCity` varchar(200) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `OfferCode` varchar(20) NOT NULL,
  `OfferRate` float NOT NULL,
  `Content` varchar(500) NOT NULL,
  `image` blob NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_commonoffersnew`
--

CREATE TABLE `tbl_commonoffersnew` (
  `id` int(50) NOT NULL,
  `ServiceCity` varchar(200) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `OfferCode` varchar(20) NOT NULL,
  `OfferRate` float NOT NULL,
  `Content` varchar(500) NOT NULL,
  `fileName` varchar(100) NOT NULL,
  `filePath` varchar(200) NOT NULL,
  `fileFormat` varchar(20) NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaints`
--

CREATE TABLE `tbl_complaints` (
  `id` int(11) NOT NULL,
  `BookingID` varchar(10) NOT NULL,
  `DateTime` datetime NOT NULL,
  `CallerName` varchar(50) NOT NULL,
  `CallerMobile` varchar(15) NOT NULL,
  `Priority` varchar(10) NOT NULL,
  `Summary` varchar(100) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `isActive` int(10) NOT NULL,
  `Status` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_complaints`
--

INSERT INTO `tbl_complaints` (`id`, `BookingID`, `DateTime`, `CallerName`, `CallerMobile`, `Priority`, `Summary`, `Description`, `isActive`, `Status`) VALUES
(1, '3', '0000-00-00 00:00:00', 'd', 'd', 'High', 'd', 'd', 1, 1),
(2, 'C00234k', '2020-06-20 16:53:15', 's', '9095204586', 'High', 'sd', 'gd', 1, 1),
(3, 'sdg', '2020-06-20 16:56:36', 'sddg', '9095204586', 'High', 'sdg', 'dsg', 1, 1),
(4, 'C00234', '2020-06-20 17:06:14', 'sd', '902342342', 'High', 'sdg', 'sdg', 1, 1),
(5, 'sds', '2020-08-05 12:44:55', '23', '32', 'High', 'sd', 'ds', 1, 1),
(6, 'C0001', '2020-09-22 18:58:10', 'Kesav', '9444555194', 'High', 'Refund - 45rs', 'I booked parcel, it got cancelled by driver so I lost my money.', 1, 1),
(7, 'C0004', '2020-09-30 22:54:58', 'Kesav', '9444555194', 'High', 'Refund ', 'Placed order and it got cancelled by driver 45rs', 1, 0),
(8, 'c0005', '2020-10-01 22:44:24', 'kesav', '9444555194', 'High', 'refund - 45', 'refund', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupondetails`
--

CREATE TABLE `tbl_coupondetails` (
  `id` int(20) NOT NULL,
  `Date` date NOT NULL,
  `UserId` varchar(30) NOT NULL,
  `Mobileno` varchar(12) NOT NULL,
  `Couponid` int(10) NOT NULL,
  `Debit` int(10) NOT NULL,
  `Credit` int(10) NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_coupondetails`
--

INSERT INTO `tbl_coupondetails` (`id`, `Date`, `UserId`, `Mobileno`, `Couponid`, `Debit`, `Credit`, `isActive`) VALUES
(1, '2020-09-01', '9', '9095204586', 1, 50, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_couponmaster`
--

CREATE TABLE `tbl_couponmaster` (
  `id` int(20) NOT NULL,
  `ServiceCity` varchar(30) NOT NULL,
  `ServiceType` varchar(10) NOT NULL,
  `CouponType` varchar(10) NOT NULL,
  `CouponCode` varchar(10) NOT NULL,
  `CouponAmt` float NOT NULL,
  `Description` varchar(200) NOT NULL,
  `fileName` varchar(100) NOT NULL,
  `filePath` varchar(200) NOT NULL,
  `fileFormat` varchar(20) NOT NULL,
  `Validity` int(10) NOT NULL,
  `MonthlyLimit` double NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_couponmaster`
--

INSERT INTO `tbl_couponmaster` (`id`, `ServiceCity`, `ServiceType`, `CouponType`, `CouponCode`, `CouponAmt`, `Description`, `fileName`, `filePath`, `fileFormat`, `Validity`, `MonthlyLimit`, `isActive`) VALUES
(1, '', '', 'Referral', 'DONKEY50', 50, 'offer for first orders', 'orange.png', '/upload/coupon/orange.png-1575090574350.png', 'image/png', 30, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_courierbooking`
--

CREATE TABLE `tbl_courierbooking` (
  `id` int(50) NOT NULL,
  `BookingId` varchar(20) NOT NULL,
  `BookingSerial` int(10) NOT NULL,
  `BookingDate` date NOT NULL,
  `BookingTime` time NOT NULL,
  `FromLatitude` varchar(20) NOT NULL,
  `FromLongitude` varchar(20) NOT NULL,
  `ToLatitude` varchar(20) NOT NULL,
  `ToLongitude` varchar(20) NOT NULL,
  `FromAddress` varchar(200) NOT NULL,
  `ToAddress` varchar(200) NOT NULL,
  `CourierType` varchar(10) NOT NULL,
  `CourierName` varchar(50) NOT NULL,
  `ProductType` varchar(50) NOT NULL,
  `LocalAdd1` varchar(200) NOT NULL,
  `LocalAdd2` varchar(200) NOT NULL,
  `LocalAdd3` varchar(200) NOT NULL,
  `DL1` float NOT NULL,
  `DB1` float NOT NULL,
  `DAmt1` float NOT NULL,
  `DL2` float NOT NULL,
  `DB2` float NOT NULL,
  `DAmt2` float NOT NULL,
  `BL1` float NOT NULL,
  `BB1` float NOT NULL,
  `BH1` float NOT NULL,
  `BW1` float NOT NULL,
  `BAmt1` float NOT NULL,
  `BL2` float NOT NULL,
  `BB2` float NOT NULL,
  `BH2` float NOT NULL,
  `BW2` float NOT NULL,
  `BAmt2` float NOT NULL,
  `Total` double NOT NULL,
  `PaymentMode` varchar(20) NOT NULL,
  `CouponCode` varchar(20) NOT NULL,
  `CouponAmt` double NOT NULL,
  `NetTotal` double NOT NULL,
  `isCancel` bit(10) NOT NULL DEFAULT b'0',
  `isActive` int(10) NOT NULL,
  `Mobileno` varchar(25) NOT NULL,
  `OTP` varchar(10) NOT NULL,
  `BankRefNo` varchar(50) NOT NULL,
  `UserID` varchar(50) NOT NULL,
  `RecName` varchar(200) NOT NULL,
  `RecMobile` varchar(20) NOT NULL,
  `Remarks` varchar(200) NOT NULL,
  `LocalDistance` float NOT NULL,
  `SAmt` float NOT NULL,
  `RecOTP` varchar(10) NOT NULL,
  `NOI` int(20) NOT NULL,
  `clatitude` varchar(20) NOT NULL,
  `clongitude` varchar(20) NOT NULL,
  `PersonalMobno` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_courierbooking`
--

INSERT INTO `tbl_courierbooking` (`id`, `BookingId`, `BookingSerial`, `BookingDate`, `BookingTime`, `FromLatitude`, `FromLongitude`, `ToLatitude`, `ToLongitude`, `FromAddress`, `ToAddress`, `CourierType`, `CourierName`, `ProductType`, `LocalAdd1`, `LocalAdd2`, `LocalAdd3`, `DL1`, `DB1`, `DAmt1`, `DL2`, `DB2`, `DAmt2`, `BL1`, `BB1`, `BH1`, `BW1`, `BAmt1`, `BL2`, `BB2`, `BH2`, `BW2`, `BAmt2`, `Total`, `PaymentMode`, `CouponCode`, `CouponAmt`, `NetTotal`, `isCancel`, `isActive`, `Mobileno`, `OTP`, `BankRefNo`, `UserID`, `RecName`, `RecMobile`, `Remarks`, `LocalDistance`, `SAmt`, `RecOTP`, `NOI`, `clatitude`, `clongitude`, `PersonalMobno`) VALUES
(1, 'C00001', 1, '2020-10-01', '16:00:55', '9.921855606130697', '78.1185389827974', '9.92647747533071', '78.1182528802842', '18, Vidwan Ponnusamy Pillai Lane, Madurai Main, Madurai, Tamil Nadu 625001, India', '68, Workshop Rd, Simmakkal, Madurai Main, Poondhotam, Tamil Nadu 625001, India', 'Local', '', 'Food Products', '5, workshop road', 'Near to bus stop', 'admin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 'cash', '', 0, 25, b'0000110000', 0, '7010289063', '1274', '', 'NS', 'Gowtham', '7010289063', 'Sweets', 0.51, 25, '1286', 1, '9.92647747533071', '78.1182528802842', ''),
(2, 'C00002', 2, '2020-10-01', '22:03:59', '10.2862987', '77.9127784', '10.252893736376128', '77.5016554063705', 'Ramanathapuram Rd, Chinnalapatti, Tamil Nadu 624301, India', 'Kurinji Andavar Temple Road, Kodaikanal, Tamil Nadu 624101, India', 'Local', '', 'Food Products', '1/2/3', 'Mettupatti', 'user', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 245, 'cash', '', 0, 245, b'0000110000', 0, '9994860454', '3613', '', '', 'SANJAY', '8610396221', 'Noodles (50rs)', 45.14, 245, '4048', 1, '10.252893736376128', '77.5016554063705', ''),
(3, 'C00003', 3, '2020-10-01', '22:05:19', '10.2863011', '77.9127806', '10.283195282768215', '77.91919892530234', 'Ramanathapuram Rd, Chinnalapatti, Tamil Nadu 624301, India', 'MDR687, Poonjolai, Chinnalapatti, Tamil Nadu 624301, India', 'Local', '', 'Food Products', '12/78 sami street', 'Mettupatti', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 'online', '', 0, 25, b'0000110000', 0, '9790378394', '8082', '', '', 'Sanjay', '9790378394', 'Dosa', 0.78, 25, '2979', 1, '10.283195282768215', '77.91919892530234', ''),
(4, 'C00004', 4, '2020-10-01', '22:20:35', '10.2863007', '77.9127804', '10.287771015137352', '77.91306203107627', 'Ramanathapuram Rd, Chinnalapatti, Tamil Nadu 624301, India', 'MDR687, Chinnalapatti, Tamil Nadu 624301, India', 'Local', '', 'Document', '17/08 govind street', 'Mettupatti', 'admin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 'cash', '', 0, 25, b'0000110000', 0, '9095204586', '5846', '', '', 'Sanjay', '9790378394', 'School certificate', 0.17, 25, '5028', 1, '10.287771015137352', '77.91306203107627', ''),
(5, 'C00005', 5, '2020-10-02', '09:45:30', '10.006923350534958', '77.48522290681586', '9.993010194045052', '77.4589630621669', '24, Allinagaram, NRT Nagar, Theni Allinagaram, Tamil Nadu 625531, India', 'Kollam -Theni Hwy, MRR Nagar, Palani Chettipatti, Tamil Nadu 625531, India', 'Local', '', 'Textile / Garments / Fashion Accessories  ', 'Gah', 'Ha', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35, 'cash', '', 0, 35, b'0000110000', 0, '8122995721', '8936', '', '', 'Krish', '8122995721', 'Hello', 3.27, 35, '4882', 2, '9.993010194045052', '77.4589630621669', ''),
(6, 'C00006', 6, '2020-10-02', '11:22:42', '10.28784394956257', '77.91259776499021', '10.275725029475195', '77.9208804264282', '12/8/4, Veeranan St, Mettupatti, Chinnalapatti, Tamil Nadu 624301, India', 'State Bank St, Ambathurai, Chinnalapatti, Tamil Nadu 624301, India', 'Local', '', 'Electrical / Electronics / Home Appliances  ', 'Plot No 19', 'Hospital', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 'cash', '', 0, 25, b'0000110000', 0, '7299041906', '3799', '', '', 'Linga', '7299060419', 'Electronic - 3', 1.62, 25, '5984', 3, '10.275725029475195', '77.9208804264282', ''),
(7, 'C00007', 7, '2020-10-02', '13:13:18', '10.010572', '77.3496708', '10.0103658', '77.4768115', 'Bodinayakanur, Tamil Nadu, India', 'Theni Allinagaram, Tamil Nadu, India', 'Local', '', 'Machines / Equipments / Spare Parts / Metals ', '£456 ward3 mal survey', 'kurunji nagar', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 85, 'cash', '', 0, 85, b'0000110000', 0, '9444555194', '7329', '', '', 'guna ', '9790378394', 'gear 5000rs', 13.92, 85, '5948', 2, '10.0103658', '77.4768115', ''),
(8, 'C00008', 8, '2020-10-02', '13:15:06', '10.0103658', '77.4768115', '10.003012126146539', '77.46904382269287', 'Theni Allinagaram, Tamil Nadu, India', 'R.M.T.C Shed, Kochi-Madurai-Tondi Point Rd, RMTC Colony, Theni Allinagaram, Tamil Nadu 625531, India', 'Local', '', 'Electrical / Electronics / Home Appliances  ', '$78 jeeva street', 'gandhi nagar', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 'cash', '', 0, 25, b'0000110000', 0, '9444555194', '9563', '', '', 'sanjay', '9894861366', 'wire 600rs', 1.18, 25, '5628', 2, '10.003012126146539', '77.46904382269287', ''),
(9, 'C00009', 9, '2020-10-02', '13:35:15', '9.922982896781097', '78.11556351849366', '9.927294749355456', '78.11607850262452', '5, N Masi St, Madurai Main, Madurai, Tamil Nadu 625001, India', '25-2/8, Workshop Rd, VP Square, Madurai Main, Poondhotam, Tamil Nadu 625001, India', 'Local', '', 'Textile / Garments / Fashion Accessories  ', 'rytui', 'hghtyh', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 'cash', '', 0, 25, b'0000110000', 0, '9444555194', '6003', '', '', ' efeth', '8122995721', 'gghj', 0.48, 25, '1095', 2, '9.927294749355456', '78.11607850262452', ''),
(10, 'C00010', 10, '2020-10-02', '14:23:18', '9.91017382226443', '78.11398345378483', '9.911849445879763', '78.12459524704398', '65-21, 1st Main Rd, Solaialagu Puram, Madurai, Tamil Nadu 625011, India', '42, Chairman Thulasi Rajan 1st St, Mahalipatti, Tamil Nadu 625001, India', 'Local', '', 'Food Products', 'Gah', 'Ha', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 'cash', '', 0, 25, b'0000110000', 0, '8122995721', '1478', '', '', 'Krish', '8122995721', 'Hahai', 1.18, 25, '5267', 2, '9.911849445879763', '78.12459524704398', ''),
(11, 'C00011', 11, '2020-10-02', '17:38:39', '10.007914593886627', '77.4843216852417', '10.002758548216171', '77.46891507666015', '24, Allinagaram, NRT Nagar, Theni Allinagaram, Tamil Nadu 625531, India', 'R.M.T.C Shed, Kochi-Madurai-Tondi Point Rd, RMTC Colony, Theni Allinagaram, Tamil Nadu 625531, India', 'Local', '', 'Electrical / Electronics / Home Appliances  ', 'hjjk', 'hffg', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 'cash', '', 0, 25, b'0000110000', 0, '9444555194', '7051', '', '', 'kritik', '8122995721', 'hai100', 1.78, 25, '1737', 2, '10.002758548216171', '77.46891507666015', ''),
(12, 'C00012', 12, '2020-10-02', '17:50:50', '9.918713261335256', '78.1141473121338', '9.923532449776006', '78.12217248150635', '30, Town Hall Rd, Opposite Roshan Bags, Madurai Main, Madurai, Tamil Nadu 625001, India', '211, N Masi St, Madurai Main, Madurai, Tamil Nadu 625001, India', 'Local', '', 'Machines / Equipments / Spare Parts / Metals ', 'jbh', 'jl', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 'cash', '', 0, 30, b'0000110000', 0, '9444555194', '7554', '', '', 'j,', 'jh,lhjvub,', 'j,.;\'jhk', 1.03, 30, '8507', 2, '9.923532449776006', '78.12217248150635', ''),
(13, 'C00013', 13, '2020-10-04', '16:24:13', '9.92666616224833', '78.11858807591263', '9.93311975754539', '78.1232515428833', '17, Workshop Rd, Simmakkal, Madurai Main, Poondhotam, Tamil Nadu 625001, India', 'Raj Complex, Ahimsapuram Main Rd, Sellur, Madurai, Tamil Nadu 625002, India', 'Local', '', 'Food Products', 'No 12 Hello street ', 'Guna cave ', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 'cash', '', 10, 20, b'0000110000', 0, '9444555194', '7059', '', '', 'Mathew ', '9894861366', 'Maggie 100rs', 0.88, 30, '5570', 2, '9.93311975754539', '78.1232515428833', ''),
(14, 'C00014', 14, '2020-10-04', '16:24:21', '9.921957185375623', '78.11551507670585', '9.927255684862686', '78.12564411645508', '43/15, VadugaKaval Kooda Street, Near North Masi Street Vadugakaval, Kaaval Kooda St, Madurai Main, Madurai, Tamil Nadu 625001, India', 'AV Bridge, Albert Victor Bridge, Simmakkal, Alwarpuram, Madurai, Tamil Nadu 625001, India', 'Local', '', 'Textile / Garments / Fashion Accessories  ', 'Gah', 'Ha', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 'cash', '', 10, 20, b'0000110000', 0, '8122995721', '6293', '', '', 'Krish', '8122995721', 'Hai', 1.26, 30, '6834', 2, '9.927255684862686', '78.12564411645508', ''),
(15, 'C00015', 15, '2020-10-04', '16:30:17', '9.933246572654408', '78.12408123997513', '9.94215175661948', '78.12137757263328', '31, 5th St, Sellur, Madurai, Tamil Nadu 625002, India', '820, Satyamurthy 5th Cross St, Poonthamalli Nagar, Madurai, Tamil Nadu 625002, India', 'Local', '', 'Electrical / Electronics / Home Appliances  ', '40z street', 'Nehru nagar', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 'cash', '', 10, 20, b'0000110000', 0, '9488666184', '9285', '', '', 'Guna', '9894861366', 'Empty', 1.03, 30, '9432', 2, '9.94215175661948', '78.12137757263328', ''),
(16, 'C00016', 16, '2020-10-04', '18:57:25', '9.91951646433194', '78.11848176190186', '9.920023749420572', '78.11723721691895', 'West Tower, W Chitrai St, Madurai Main, Madurai, Tamil Nadu 625001, India', '14, Mela Avani Moola St, opp. leeladevi bhawan, Madurai Main, Madurai, Tamil Nadu 625001, India', 'Local', '', 'Document', 'd', 'd', 'admin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 'online', '', 10, 20, b'0000110000', 0, '9095204586', '2100', '234', 'NS', 'd', '9092342342', 'sd', 0.15, 30, '7604', 1, '9.920023749420572', '78.11723721691895', ''),
(17, 'C00017', 17, '2020-10-04', '19:31:45', '9.93242931349214', '78.12215004882957', '13.06965312352491', '80.16318005927735', '9-1-2, Sellur, Madurai, Tamil Nadu 625002, India', 'Flat No 3, 4th Floor, H4 Block, VGN Minerva, VGN Nagar, Adayalampattu Village Rd, Nolambur, Chinna Nolambur, Chennai, Tamil Nadu 600095, India', 'Local', '', 'Paper / Packaging / Printed Material', '4c ABC street', 'Old police station', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2090, 'cash', '', 711, 1379, b'0000110000', 0, '9488666184', '1942', '', '', 'Guna ', '9488666184', 'Hsjj', 413.69, 2090, '6916', 2, '13.06965312352491', '80.16318005927735', ''),
(18, 'C00018', 18, '2020-10-04', '19:36:57', '9.929140656187032', '78.12467587636864', '9.92940838215935', '78.1242467235811', 'Sri Meenakshi Government Arts College for Women at Madurai, Kalpalam Rd, Sellur, Madurai, Tamil Nadu 625002, India', '12, Kumaran Salai, Sellur, Madurai, Tamil Nadu 625002, India', 'Local', '', 'Paper / Packaging / Printed Material', '4c ABC street', 'Old police station', 'admin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 'cash', '', 10, 20, b'0000110000', 0, '9488666184', '8890', '', 'NS', 'Karthi', '9488666184', '5yy', 0.06, 30, '3067', 2, '9.92940838215935', '78.1242467235811', ''),
(19, 'C00019', 19, '2020-10-04', '19:59:24', '10.008886626111563', '77.47453698675537', '9.843980291092441', '77.38536794393309', '1008 cumbam road, Bathra Kaliyamman, Konduraja Line, Theni Allinagaram, Tamil Nadu 625531, India', 'Ponnagaram Road, Chinnamanur, Tamil Nadu 625515, India', 'Local', '', 'Machines / Equipments / Spare Parts / Metals ', 'gjgyg', 'jmhvmh', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 125, 'cash', '', 43, 82, b'0000110000', 1, '8122995721', '6346', '', '', 'hardik', '8122995721', 'hi', 20.78, 125, '9374', 1, '9.843980291092441', '77.38536794393309', ''),
(20, 'C00020', 20, '2020-10-04', '20:29:39', '9.931226095714614', '78.12599194714356', '9.941596729204619', '78.12313092430348', '26, Kurivikaran St, Sellur, Madurai, Tamil Nadu 625002, India', '2, Muniyandi Kovil St, Marudhu Pandiar Nager, Poonthamalli Nagar, Madurai, Tamil Nadu 625002, India', 'Local', '', 'Books / Stationery / toys / Gifts', '4c ABC street', 'Old police station', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 'cash', '', 10, 20, b'0000110000', 0, '9444555194', '5096', '', '', 'Karthi', '9488666184', 'Dguu', 1.19, 30, '7092', 2, '9.941596729204619', '78.12313092430348', ''),
(21, 'C00021', 21, '2020-10-04', '20:31:00', '9.929535199754838', '78.12450421499169', '9.928478385548981', '78.11363232783923', '19/7, Mudaliar 2nd St, Sellur, Madurai, Tamil Nadu 625002, India', '18, Kumarasamy 1st St, Ponnagaram, Arappalayam, Ponnagaram Colony, Tamil Nadu 625016, India', 'Local', '', 'Paper / Packaging / Printed Material', '4c ABC street', 'Old police station', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 'cash', '', 10, 20, b'0000110000', 0, '9444555194', '8110', '', '', 'Karthi', '9488666184', 'Tuuu', 1.2, 30, '9392', 2, '9.928478385548981', '78.11363232783923', ''),
(22, 'C00022', 22, '2020-10-04', '20:33:45', '9.92814020479204', '78.12460435123147', '9.929507018115997', '78.1147767374009', 'Kalpalam Rd, Sellur, near Muncipal Lorry Set, Simmakkal, Sellur, Madurai, Tamil Nadu 625001, India', '218a, Raja Mill Rd, Madurai Main, Poondhotam, Tamil Nadu 625001, India', 'Local', '', 'Food Products', '4c ABC street', 'Old police station', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 'cash', '', 10, 20, b'0000110000', 0, '9444555194', '5567', '', '', 'Karthi', '9488666184', 'Tuuhxdc', 1.09, 30, '7307', 1, '9.929507018115997', '78.1147767374009', ''),
(23, 'C00023', 23, '2020-10-04', '21:35:32', '9.926533838321328', '78.11732304760743', '9.9297888350403', '78.12483323284913', '54, Workshop Rd, near Soundaram Industry, Madurai Main, Madurai, Tamil Nadu 625001, India', '100, Sellur Rd, Sellur, Madurai, Tamil Nadu 625002, India', 'Local', '', 'Food Products', '4c ABC street', 'Old police station', 'user', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 'cash', '', 10, 20, b'0000110000', 0, '9444555194', '7003', '', '', 'Karthi', 'Guhhhhhhhh', 'J', 0.9, 30, '7728', 1, '9.9297888350403', '78.12483323284913', ''),
(24, 'C00024', 24, '2020-10-04', '21:48:44', '9.935072849893965', '78.1170512508911', '9.907806415289118', '78.12160027713479', '16, Kanthaiya St, Sellur, Madurai, Tamil Nadu 625002, India', 'kirdhumal nathi roadu 28,Ramasandhira puram kirdhumal nathi roadu 28,Ramasandhira puram, Keerathurai, Madurai, Tamil Nadu 625001, India', 'Local', '', 'Paper / Packaging / Printed Material', '4c ABC street', 'Old police station', 'user', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40, 'cash', '', 14, 26, b'0000110000', 0, '9444555194', '5298', '', '', 'Karthi', '9488666184', 'Pencil 300rs', 3.07, 40, '1017', 2, '9.907806415289118', '78.12160027713479', ''),
(25, 'C00025', 25, '2020-10-04', '21:52:25', '10.278512', '77.92444239999999', '10.3623794', '77.9694579', 'Chinnalapatti, Tamil Nadu 624302, India', 'Dindigul, Tamil Nadu 624001, India', 'Local', '', 'Food Products', '4c ABC street', 'Old police station', 'user', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 'cash', '', 26, 49, b'0000110000', 0, '9444555194', '5466', '', '', 'Shyam', '9894861366', 'Cake 100rs', 10.55, 75, '2316', 1, '10.3623794', '77.9694579', ''),
(26, 'C00026', 26, '2020-10-05', '12:55:01', '10.27559834841279', '77.9208804264282', '10.286651080141668', '77.91288386693043', 'State Bank St, Ambathurai, Chinnalapatti, Tamil Nadu 624301, India', 'Ramanathapuram Rd, Chinnalapatti, Tamil Nadu 624301, India', 'Local', '', 'Textile / Garments / Fashion Accessories  ', '12/4 Govindasamy street', 'Mettupatti', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 'cash', '', 2, 28, b'0000110000', 1, '9444555194', '3787', '', '', 'Kesav', '9488666184', 'Form', 1.51, 30, '1598', 1, '10.286651080141668', '77.91288386693043', ''),
(27, 'C00027', 27, '2020-10-05', '23:30:11', '10.278512', '77.92444239999999', '10.3623794', '77.9694579', 'Chinnalapatti, Tamil Nadu 624302, India', 'Dindigul, Tamil Nadu 624001, India', 'Local', '', 'Food Products', '12/4/26 ', 'Old police station', 'user', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 'cash', '', 2, 73, b'0000110000', 0, '9444555194', '4978', '', '', 'Guna', 'Ddhdhdbbbb', 'Hsb', 10.55, 75, '2246', 2, '10.3623794', '77.9694579', ''),
(28, 'C00028', 28, '2020-10-06', '10:39:05', '9.913809452971334', '78.09007180401612', '9.916472737307002', '78.12629235455323', '250, Erikarai St, Velmurugan Nagar, Namachivaya Nagar, Madurai, Tamil Nadu 625022, India', '7, 3rd St, Old Kuyavar Palayam Salai, Tamil Nadu 625001, India', 'Local', '', 'Textile / Garments / Fashion Accessories  ', 'hjjk', 'hffg', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40, 'cash', '', 1, 39, b'0000110000', 1, '8122995721', '9889', '', '', 'kritik', '8122995721', 'hello', 3.98, 40, '3568', 1, '9.916472737307002', '78.12629235455323', ''),
(29, 'C00029', 29, '2020-10-06', '10:46:10', '10.007576495039274', '77.47470864813232', '10.00445420319329', '77.4687316328491', 'Kochi - Madurai - Dhanushkodi Rd, RMTC Colony, Theni Allinagaram, Tamil Nadu 625531, India', 'R.M.T.C Shed, Kochi-Madurai-Tondi Point Rd, RMTC Colony, Theni Allinagaram, Tamil Nadu 625531, India', 'Local', '', 'Electrical / Electronics / Home Appliances  ', 'hjjk', 'uyguh', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 'cash', '', 1, 29, b'0000110000', 1, '8122995721', '8154', '', '', 'kritik', '8122995721', 'hahai', 0.74, 30, '3755', 1, '10.00445420319329', '77.4687316328491', ''),
(30, 'C00030', 30, '2020-10-06', '10:51:46', '10.279912514001062', '77.92375575408289', '10.286999440589963', '77.91291247762376', 'selvaganapathy house, Chinnalapatti, Tamil Nadu 624301, India', '12/8/4, Veeranan St, Mettupatti, Chinnalapatti, Tamil Nadu 624301, India', 'Local', '', 'Textile / Garments / Fashion Accessories  ', '12/4/26 Govindasamy street', 'Mettupatti', 'user', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 'cash', '', 1, 29, b'0000110000', 0, '9444555194', '9483', '', '', 'Kesav', '8883313104', 'Saree 500rs', 1.42, 30, '2702', 1, '10.286999440589963', '77.91291247762376', ''),
(31, 'C00031', 31, '2020-10-07', '13:12:20', '10.278512', '77.92444239999999', '10.281397474312964', '77.92039405241769', 'Chinnalapatti, Tamil Nadu 624302, India', 'Thiru.ve.ka nagar kasthuribai hospitL, Tamil Nadu 624301, India', 'Local', '', 'Textile / Garments / Fashion Accessories  ', '12 Janatha colony', 'Near SKS shop ', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 'online', '', 0, 10, b'0000110000', 0, '9444555194', '1528', 'pay_FlvwHkZ8szHTdp', '', 'Saravana kumar ', '9894861365', 'Saree - 500rs ', 0.55, 10, '2984', 1, '10.281397474312964', '77.92039405241769', ''),
(32, 'C00032', 32, '2020-10-07', '23:44:14', '10.278512', '77.92444239999999', '10.3623794', '77.9694579', 'Chinnalapatti, Tamil Nadu 624302, India', 'Dindigul, Tamil Nadu 624001, India', 'Local', '', 'Textile / Garments / Fashion Accessories  ', '28 anna street', 'Gandinagar', 'user', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 'cash', '', 0, 75, b'0000110000', 0, '9444555194', '3667', '', '', 'Deepan ', '9894861366', 'Saree - 500rs', 10.55, 75, '1777', 2, '10.3623794', '77.9694579', ''),
(33, 'C00033', 33, '2020-10-07', '00:59:15', '9.926336565554106', '78.11426175294262', '9.930070650915633', '78.12410367199708', 'Kalluppatti - Maravapatty Rd, Madurai Main, Poondhotam, Tamil Nadu 625001, India', '19/7, Mudaliar 2nd St, Sellur, Madurai, Tamil Nadu 625002, India', 'Local', '', 'Paper / Packaging / Printed Material', '98 ashok street', 'Kadaban nagar ', 'user', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 'cash', '', 0, 30, b'0000110000', 0, '9444555194', '8889', '', '', 'Inian', '9894861366', 'A4 - 600rs ', 1.16, 30, '2636', 1, '9.930070650915633', '78.12410367199708', ''),
(34, 'C00034', 34, '2020-10-07', '01:23:09', '9.921841515182644', '78.11835301586915', '9.92835156730214', '78.12471879236772', '26a, N Avani Moola St, near Central Market, Gnanaolivupuram, Madurai Main, Madurai, Tamil Nadu 625001, India', 'Sri Meenakshi Government Arts College for Women at Madurai, Kalpalam Rd, Sellur, Madurai, Tamil Nadu 625002, India', 'Local', '', 'Paper / Packaging / Printed Material', '89 anna salai', 'Gandhipuram', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 'online', '', 0, 10, b'0000110000', 0, '9444555194', '7713', 'pay_Fm8OkA59FWTAa8', '', 'Hareessh', '9894761366', 'Semiya - 500rs', 1.01, 10, '3227', 2, '9.92835156730214', '78.12471879236772', ''),
(35, 'C00035', 35, '2020-10-08', '08:13:30', '9.92836565861507', '78.11655057141114', '9.929690199329828', '78.1254769630127', '2-72-1, Madurai Main, Poondhotam, Tamil Nadu 625002, India', 'No.51/7, Aimsapuram 1st Street Extension ph-6381046781 Near Saraswathi Theatre, Sellur, Madurai, Tamil Nadu 625002, India', 'Local', '', 'Paper / Packaging / Printed Material', '56 nehru ', 'Carbon nagar ', 'user', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'online', '', 0, 1, b'0000110000', 0, '9444555194', '5106', 'pay_FmFMLtUWDg77nC', '', 'Gowtham', '9894861366', 'Color sketch - 200rs ', 0.99, 1, '4606', 1, '9.929690199329828', '78.1254769630127', ''),
(36, 'C00036', 36, '2020-10-08', '08:22:24', '10.278512', '77.92444239999999', '10.280369967337226', '77.92275439602338', 'Chinnalapatti, Tamil Nadu 624302, India', 'Mary Complex, 2-7/34, a.t.s.nagar,gandhigram post, Chinnalapatti, Tamil Nadu 624301, India', 'Local', '', 'Textile / Garments / Fashion Accessories  ', '567c Sri Ram nagar', 'Mettunerethan', 'admin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'online', '', 0, 1, b'0000110000', 0, '9444555194', '2783', 'pay_FmFUljI4UG9I5C', 'ND', 'Mary ', '9894861366', 'Shirt 500rs', 0.28, 1, '3926', 2, '10.280369967337226', '77.92275439602338', ''),
(37, 'C00037', 37, '2020-10-08', '08:49:42', '10.3623794', '77.9694579', '10.278512', '77.92444239999999', 'Dindigul, Tamil Nadu 624001, India', 'Chinnalapatti, Tamil Nadu 624302, India', 'Local', '', 'Food Products', '45c arumugam street', 'Mettupatti', 'admin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 'cash', '', 26, 102, b'0000110000', 0, '9444555194', '1454', '', 'NS', 'Deepan ', '9894861366', 'Books 500rs', 10.55, 128, '5613', 2, '10.278512', '77.92444239999999', ''),
(38, 'C00038', 38, '2020-10-08', '11:18:05', '10.280172092275489', '77.9337035320724', '10.285053641360662', '77.93060397041802', 'Unnamed Road, Tamil Nadu 624302, India', '1t street, 1st street, Dindigul, Tamil Nadu 624302, India', 'Local', '', 'Box', '1/2/3', 'Guna street', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 'cash', '', 8, 30, b'0000110000', 1, '9994860454', '3433', '', '', 'Guru', '6912485349', '100Rs', 0.64, 38, '7253', 1, '10.285053641360662', '77.93060397041802', ''),
(39, 'C00039', 39, '2020-10-08', '11:31:38', '10.359128798427598', '77.95662621207275', '10.369429290115452', '77.9816887731079', 'Unnamed Road, Muthalagupatty, Pallapatti, Tamil Nadu 624001, India', 'Kattaspatri Bus Stop, Chennai - Theni Hwy, Nehruji Nagar, Dindigul, Tamil Nadu 624001, India', 'Local', '', 'Machines / Equipments / Spare Parts / Metals ', 'hjjk', 'hffg', 'admin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48, 'cash', '', 10, 38, b'0000110000', 0, '8122995721', '8909', '', 'NS', 'kritik', '8122995721', 'hello', 2.97, 48, '3586', 1, '10.369429290115452', '77.9816887731079', ''),
(40, 'C00040', 40, '2020-10-08', '11:35:23', '9.923631087180416', '78.12180054895951', '9.929281564675984', '78.12457574143853', '5e, Old Chockanathar Koil St, Simmakkal, Madurai Main, Madurai, Tamil Nadu 625001, India', 'Sri Meenakshi Government Arts College for Women at Madurai, Kalpalam Rd, Sellur, Madurai, Tamil Nadu 625002, India', 'Local', '', 'Paper / Packaging / Printed Material', 'Ghsb', 'Gh', 'user', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 'cash', '', 8, 30, b'0000110000', 0, '9444555194', '9189', '', '', 'Hrg', 'Yhhzhsbvsg', 'Gzbsb', 0.7, 38, '5140', 2, '9.929281564675984', '78.12457574143853', ''),
(41, 'C00041', 41, '2020-10-08', '11:37:39', '9.927280658641465', '78.12467587702348', '9.93584783125753', '78.11872494907082', 'Kalpalam, Kochi - Madurai - Dhanushkodi Rd, Simmakkal, Madurai Main, Madurai, Tamil Nadu 625001, India', '49, Manavalan Nagar Main Road, Thiyagi Balu, Sellur, Madurai, Tamil Nadu 625014, India', 'Local', '', 'Paper / Packaging / Printed Material', 'Fuf', 'Fufj', 'user', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 'cash', '', 8, 30, b'0000110000', 0, '9444555194', '6447', '', '', 'Uf', 'Fujfjfjfjj', 'Fuuf', 1.15, 38, '5775', 1, '9.93584783125753', '78.11872494907082', ''),
(42, 'C00042', 42, '2020-10-08', '11:50:37', '9.917706371445297', '78.11738546986679', '9.919504934764415', '78.11946101179136', '156, Netaji Rd, Valaiyal Kadai, Madurai Main, Madurai, Tamil Nadu 625001, India', '21e, S Chitrai St, opposite Meenakshi Amman Temple, Valaiyal Kadai, Madurai Main, Madurai, Tamil Nadu 625001, India', 'Local', '', 'Textile / Garments / Fashion Accessories  ', 'Gah', 'Ha', 'admin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 'cash', '', 0, 2, b'0000110000', 0, '8122995721', '9702', '', 'NS', 'Krish', '8122995721', 'Hi', 0.3, 2, '3229', 1, '9.919504934764415', '78.11946101179136', ''),
(43, 'C00043', 43, '2020-10-08', '12:31:12', '9.91571180113355', '78.1049634284668', '9.918375070010757', '78.11238778302003', 'T-66, 70, Tamil Nadu Housing Board Colony, Ellis Nagar, Madurai, Tamil Nadu 625011, India', '2, Town Hall Rd, Madurai Main, Madurai, Tamil Nadu 625001, India', 'Local', '', 'Electrical / Electronics / Home Appliances  ', 'hjjk', 'hffg', 'admin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 'cash', '', 0, 2, b'0000110000', 0, '8122995721', '1835', '', 'NS', 'kritik', '8122995721', 'hi', 0.87, 2, '2613', 2, '9.918375070010757', '78.11238778302003', ''),
(44, 'C00044', 44, '2020-10-08', '12:39:41', '9.908959375056249', '78.11103399822376', '9.929358425431438', '78.12688926720374', 'Subramaniapuram, Madurai, Tamil Nadu 625011, India', '134, Palam Station Rd, Sellur, Goripalayam, Tamil Nadu 625002, India', 'Local', '', 'Paper / Packaging / Printed Material', 'Gah', 'Ha', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 'online', '', 0, 4, b'0000110000', 1, '8122995721', '4122', 'pay_FmJvTRew2z1Ahb', '', 'Krish', '8122995721', 'Hi', 2.86, 4, '7542', 2, '9.929358425431438', '78.12688926720374', ''),
(45, 'C00045', 45, '2020-10-08', '00:19:26', '9.929887469914744', '78.12353146762551', '9.930070650915633', '78.11542046756448', '19/7, Mudaliar 2nd St, Sellur, Madurai, Tamil Nadu 625002, India', '254, Madurai Main, Poondhotam, Tamil Nadu 625016, India', 'Local', '', 'Paper / Packaging / Printed Material', 'Hab', 'Hab', 'admin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 'cash', '', 10, 28, b'0000110000', 0, '9444555194', '2589', '', 'NS', 'Hab', 'Habhabhabh', 'Hab', 0.89, 38, '5456', 1, '9.930070650915633', '78.11542046756448', ''),
(46, 'C00046', 46, '2020-10-08', '00:23:54', '9.923786089308782', '78.11961186574852', '9.930084741751413', '78.1245328260943', '24, N Masi St, Madurai Main, Madurai, Tamil Nadu 625001, India', '27/17, Kumaran Salai, Sellur, Madurai, Tamil Nadu 625002, India', 'Local', '', 'Paper / Packaging / Printed Material', 'Ty', 'Ty', 'admin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 'cash', '', 10, 28, b'0000110000', 0, '9444555194', '4694', '', 'NS', 'Ty', 'Tytytytyty', 'Tyty', 0.88, 38, '4834', 1, '9.930084741751413', '78.1245328260943', ''),
(47, 'C00047', 47, '2020-10-08', '00:29:38', '9.92744974974949', '78.11653626651467', '9.929337928393217', '78.12556279370118', '10, 1st St, VP Square, Madurai Main, Madurai, Tamil Nadu 625001, India', 'No.51/7, Aimsapuram 1st Street Extension ph-6381046781 Near Saraswathi Theatre, Sellur, Madurai, Tamil Nadu 625002, India', 'Local', '', 'Textile / Garments / Fashion Accessories  ', 'Y2', 'Y2', 'user', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 'cash', '', 10, 28, b'0000110000', 0, '9444555194', '9316', '', '', 'Y2', 'Y2y2y2y2y2', 'Y2y2', 1.01, 38, '4126', 2, '9.929337928393217', '78.12556279370118', ''),
(48, 'C00048', 48, '2020-10-08', '00:40:51', '9.92770338689278', '78.12450421564652', '9.929647925963442', '78.11686528371727', 'Kalpalam, Kochi - Madurai - Dhanushkodi Rd, Simmakkal, Madurai Main, Madurai, Tamil Nadu 625001, India', '5-41, E Anna Rd, Madurai Main, Poondhotam, Tamil Nadu 625002, India', 'Local', '', 'Textile / Garments / Fashion Accessories  ', 'Y3', 'Y3', 'admin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 'cash', '', 10, 28, b'0000110000', 0, '9444555194', '7834', '', 'NS', 'Y3', 'Y3y3y3y3y3', 'Y3y3', 0.86, 38, '1391', 2, '9.929647925963442', '78.11686528371727', ''),
(49, 'C00049', 49, '2020-10-25', '12:42:13', '10.02063146444686', '77.4818677089018', '9.724510740500648', '77.27845328437714', 'VPSA Mill Rd, Kottai Kalam, Theni Allinagaram, Tamil Nadu 625531, India', 'Unnamed Road, Mani Nagaram, Cumbum, Tamil Nadu 625516, India', 'Local', '', 'Machines / Equipments / Spare Parts / Metals ', 'Gah', 'Gahs', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 304, 'cash', '', 91, 213, b'0000110000', 1, '', '6045', '', '', 'Krish', '8122995721', 'Hello', 39.76, 304, '8401', 1, '9.724510740500648', '77.27845328437714', ''),
(50, 'C00050', 50, '2020-10-25', '16:46:01', '9.922560163080602', '78.11406148144532', '9.911695719843763', '78.11474812695313', '17/10, Makkan Thoppu St, Kottur, Madurai Main, Madurai, Tamil Nadu 625001, India', '40, S Marret St, South Gate, Periyar, Madurai Main, Madurai, Tamil Nadu 625001, India', 'Local', '', 'Machines / Equipments / Spare Parts / Metals ', 'sf', 'sd', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 'cash', '', 11, 27, b'0000110000', 1, '9095204586', '6686', '', '', 'karthick', '8667052467', 'dg', 1.21, 38, '7336', 1, '9.911695719843763', '78.11474812695313', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_couriercompany`
--

CREATE TABLE `tbl_couriercompany` (
  `id` int(20) NOT NULL,
  `CourierName` varchar(200) NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_couriercompany`
--

INSERT INTO `tbl_couriercompany` (`id`, `CourierName`, `isActive`) VALUES
(1, 'ST courier', 1),
(2, 'Professional Courier', 1),
(3, 'franch express courier', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_courierconfig`
--

CREATE TABLE `tbl_courierconfig` (
  `id` int(10) NOT NULL,
  `studentMinRate` double NOT NULL,
  `studentAddlRate` double NOT NULL,
  `DMinRate` double NOT NULL,
  `DAddlRate` double NOT NULL,
  `LSminRate` double NOT NULL,
  `LSaddlRate` double NOT NULL,
  `LDminRate` double NOT NULL,
  `LDaddlRate` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_courierconfig`
--

INSERT INTO `tbl_courierconfig` (`id`, `studentMinRate`, `studentAddlRate`, `DMinRate`, `DAddlRate`, `LSminRate`, `LSaddlRate`, `LDminRate`, `LDaddlRate`) VALUES
(1, 11, 3, 3, 3, 20, 5, 18, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_courierlink`
--

CREATE TABLE `tbl_courierlink` (
  `id` int(10) NOT NULL,
  `CourierName` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Area` varchar(200) NOT NULL,
  `Latitude` varchar(50) NOT NULL,
  `Longitude` varchar(50) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `isActive` int(10) NOT NULL,
  `isBlock` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_courierlink`
--

INSERT INTO `tbl_courierlink` (`id`, `CourierName`, `State`, `City`, `Area`, `Latitude`, `Longitude`, `Description`, `isActive`, `isBlock`) VALUES
(2, 'STcourier', 'Tamilnadu(TN)', 'Madurai', 'Simmakkal', '9.923954', '78.117355', 'Naicker New St, Simmakkal, Madurai Main, Madurai, Tamil Nadu 625001', 1, 'false'),
(3, 'STcourier', 'Tamilnadu(TN)', 'Madurai', 'Perumal', '9.922863', '78.112179', '', 1, 'false'),
(4, 'STcourier', 'Tamilnadu(TN)', 'Madurai', 'KK Nagar', '9.925518', '78.140508', '', 1, 'false'),
(5, 'STcourier', 'Tamilnadu(TN)', 'Chennai', 'Guindy ', '13.069354', '80.267019', '', 1, 'false'),
(6, 'ST courier', 'Tamilnadu (TN)', 'Nagercoil ', 'Nagercoil ', '8.1800065', '77.4217795', '', 1, 'false'),
(7, 'Professional Courier', 'Tamilnadu (TN)', 'Theni', 'Theni', '10.015748', '77.479028', '', 1, 'false'),
(8, 'Professional Courier', 'Tamilnadu (TN)', 'Dindigul', 'Kodaikanal ', '10.259907', '77.500116', '', 1, 'false'),
(9, 'franch express courier', 'Tamilnadu (TN)', 'Theni', 'theni', '10.010105', '77.476440', '', 1, 'false'),
(10, 'ST courier', 'Tamilnadu (TN)', 'Dindigul', 'Chinnalapatti', '10.285055', '77.913093', 'Chinnalapati', 1, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_courierrate`
--

CREATE TABLE `tbl_courierrate` (
  `id` int(10) NOT NULL,
  `CourierName` varchar(200) NOT NULL,
  `CourierType` varchar(20) NOT NULL,
  `DocumentLength` int(10) NOT NULL,
  `DocumentBreadth` int(10) NOT NULL,
  `BoxWeight` float NOT NULL,
  `FromState` varchar(100) NOT NULL,
  `ToState` varchar(100) NOT NULL,
  `Area` varchar(100) NOT NULL,
  `CPrice` double NOT NULL,
  `DPrice` double NOT NULL,
  `OPrice` double NOT NULL,
  `Description` varchar(200) NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_courierrate`
--

INSERT INTO `tbl_courierrate` (`id`, `CourierName`, `CourierType`, `DocumentLength`, `DocumentBreadth`, `BoxWeight`, `FromState`, `ToState`, `Area`, `CPrice`, `DPrice`, `OPrice`, `Description`, `isActive`) VALUES
(1, 'ST courier', 'Document', 4, 9, 0, 'Tamilnadu (TN)', 'Tamilnadu (TN)', 'By City', 40, 60, 50, '', 1),
(2, 'ST courier', 'Document', 9, 18, 0, 'TamilNadu(TN)', 'Tamilnadu(TN)', 'By City', 45, 65, 45, '', 1),
(3, 'ST courier', 'Document', 4, 9, 0, 'TamilNadu(TN)', 'Karnataka (KA)', 'By State', 50, 70, 10, '', 1),
(4, 'ST courier', 'Document', 9, 18, 0, 'TamilNadu(TN)', 'Karnataka (KA)', 'By State', 55, 75, 75, '', 1),
(5, 'ST courier', 'Document', 4, 9, 0, 'TamilNadu(TN)', 'Kerala (KL)', 'By State', 50, 70, 10, '', 1),
(6, 'ST courier', 'Document', 9, 18, 0, 'TamilNadu(TN)', 'Kerala (KL)', 'By State', 55, 75, 10, '', 1),
(11, 'ST courier', 'Document', 4, 9, 0, 'TamilNadu(TN)', 'Tamilnadu(TN)', 'By City', 35, 55, 45, '', 1),
(12, 'ST courier', 'Document', 9, 18, 0, 'TamilNadu(TN)', 'Tamilnadu(TN)', 'By City', 40, 60, 45, '', 1),
(19, 'ST courier', 'Document', 4, 9, 0, 'TamilNadu(TN)', 'Kerala (KL)', 'By State', 40, 50, 45, '', 1),
(20, 'ST courier', 'Document', 9, 12, 0, 'TamilNadu(TN)', 'Kerala (KL)', 'By State', 45, 55, 50, '', 1),
(25, 'ST courier', 'Document', 4, 9, 0, 'TamilNadu(TN)', 'Tamilnadu(TN)', 'Local', 10, 34, 12, '', 1),
(26, 'Professional Courier', 'Document', 4, 9, 0, 'Tamilnadu (TN)', 'Tamilnadu (TN)', 'By City', 60, 70, 99, '', 1),
(27, 'ST courier', 'Box', 0, 0, 1, 'Tamilnadu (TN)', 'Tamilnadu (TN)', 'By City', 10, 20, 62, '', 1),
(28, 'ST courier', 'Box', 0, 0, 0.5, 'Tamilnadu (TN)', 'Tamilnadu (TN)', 'By City', 50, 70, 150, '', 1),
(29, 'ST courier', 'Box', 0, 0, 1, 'TamilNadu(TN)', 'Tamilnadu(TN)', 'By City', 55, 75, 20, '', 1),
(30, 'ST courier', 'Box', 0, 0, 2, 'Tamilnadu(TN)', 'Tamilnadu(TN)', 'By City', 95, 115, 105, '', 1),
(31, 'ST courier', 'Box', 0, 0, 3, 'Tamilnadu(TN)', 'Tamilnadu(TN)', 'By City', 135, 155, 145, '', 1),
(32, 'Professional Courier', 'Box', 0, 0, 0.5, 'Tamilnadu (TN)', 'Tamilnadu (TN)', 'By City', 35, 45, 40, '', 1),
(33, 'Professional Courier', 'Box', 0, 0, 1, 'Tamilnadu(TN)', 'Tamilnadu(TN)', 'By City', 40, 55, 50, '', 1),
(34, 'Professional Courier', 'Box', 0, 0, 1.5, 'Tamilnadu(TN)', 'Tamilnadu(TN)', 'By City', 50, 65, 60, '', 1),
(35, 'Professional Courier', 'Box', 0, 0, 2, 'Tamilnadu(TN)', 'Tamilnadu(TN)', 'By City', 65, 75, 70, '', 1),
(36, 'Professional Courier', 'Box', 0, 0, 2.5, 'Tamilnadu(TN)', 'Tamilnadu(TN)', 'By City', 80, 90, 85, '', 1),
(37, 'Professional Courier', 'Box', 0, 0, 3, 'Tamilnadu(TN)', 'Tamilnadu(TN)', 'By City', 90, 100, 95, '', 1),
(38, 'Professional Courier', 'Box', 0, 0, 2, 'Tamilnadu(TN)', 'Tamilnadu(TN)', 'By City', 65, 75, 70, '', 1),
(39, 'Professional Courier', 'Box', 0, 0, 0.5, 'Tamilnadu(TN)', 'Kerala(KL)', 'By State', 40, 50, 45, '', 1),
(40, 'Professional Courier', 'Box', 0, 0, 1, 'Tamilnadu(TN)', 'Kerala(KL)', 'By State', 45, 55, 50, '', 1),
(41, 'Professional Courier', 'Box', 0, 0, 3, 'Tamilnadu(TN)', 'Kerala(KL)', 'By State', 135, 145, 140, 'StCourier', 1),
(42, 'franch express courier', 'Box', 0, 0, 0.5, 'Tamilnadu (TN)', 'Kerala (KL)', 'By City', 30, 45, 35, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dailydiscount`
--

CREATE TABLE `tbl_dailydiscount` (
  `id` int(20) NOT NULL,
  `Day` varchar(200) NOT NULL,
  `ServiceArea` varchar(200) NOT NULL,
  `ServiceType` varchar(100) NOT NULL,
  `Discount` double NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_dailydiscount`
--

INSERT INTO `tbl_dailydiscount` (`id`, `Day`, `ServiceArea`, `ServiceType`, `Discount`, `isActive`) VALUES
(1, 'Monday', 'Chennai', 'Courier', 20, 1),
(2, 'Tuesday', 'Chennai', 'Courier', 30, 1),
(3, 'Wednesday', 'Chennai', 'Courier', 20, 1),
(4, 'Thursday', 'Chennai', 'Courier', 15, 1),
(5, 'Friday', 'Chennai', 'Courier', 25, 1),
(6, 'Saturday', 'Chennai', 'Courier', 20, 1),
(7, 'Sunday', 'Chennai', 'Courier', 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driverstatus`
--

CREATE TABLE `tbl_driverstatus` (
  `id` int(11) NOT NULL,
  `Driverid` varchar(11) NOT NULL,
  `Mobileno` varchar(20) NOT NULL,
  `isMadmoney` varchar(10) NOT NULL,
  `isShare` varchar(10) NOT NULL,
  `isHire` varchar(10) NOT NULL,
  `isRental` varchar(10) NOT NULL,
  `isActive` int(2) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_driverstatus`
--

INSERT INTO `tbl_driverstatus` (`id`, `Driverid`, `Mobileno`, `isMadmoney`, `isShare`, `isHire`, `isRental`, `isActive`, `latitude`, `longitude`) VALUES
(8, 'S10001', '9444555194', 'ON', 'Off', 'Off', 'Off', 1, '77.912835', '10.286256666666667'),
(9, 'S10019', '9790378394', 'REQ', 'Off', 'Off', 'Off', 1, '77.91282205', '10.28633614'),
(10, 'S10020', '9790378394', 'REQ', 'Off', 'Off', 'Off', 1, '77.91282205', '10.28633614'),
(11, 'S10021', '8667052467', 'OFF', 'Off', 'Off', 'Off', 1, '77.91282205', '10.28633614'),
(12, 'S10022', '8122995721', 'OFF', 'Off', 'Off', 'Off', 1, '77.4824470281601', '10.016913414001465'),
(13, 'S10023', '9976683704', 'REQ', 'Off', 'Off', 'Off', 1, '77.49402243', '10.00768347');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driverstatuslog`
--

CREATE TABLE `tbl_driverstatuslog` (
  `id` int(11) NOT NULL,
  `DriverId` varchar(20) NOT NULL,
  `Date` date NOT NULL,
  `Time` time(6) NOT NULL,
  `BookingType` varchar(10) NOT NULL,
  `SDate` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver_general_detail`
--

CREATE TABLE `tbl_driver_general_detail` (
  `id` int(11) NOT NULL,
  `driver_id` varchar(11) NOT NULL,
  `drivertype` varchar(20) NOT NULL,
  `driver_name` varchar(200) NOT NULL,
  `driver_email` varchar(200) NOT NULL,
  `driver_phone` varchar(50) NOT NULL,
  `driver_lan` varchar(50) NOT NULL,
  `driver_address` text NOT NULL,
  `year_experience` varchar(10) NOT NULL,
  `vehicle_width` varchar(10) NOT NULL,
  `vehicle_height` varchar(10) NOT NULL,
  `vehicle_depth` varchar(10) NOT NULL,
  `vehicle_model` varchar(50) NOT NULL,
  `vehicle_number` varchar(20) NOT NULL,
  `vehicle_type` varchar(20) NOT NULL,
  `driver_image` varchar(200) NOT NULL,
  `driver_full_image` varchar(200) NOT NULL,
  `driver_aadhar` varchar(200) NOT NULL,
  `driver_license` varchar(200) NOT NULL,
  `driver_voterId` varchar(200) NOT NULL,
  `driver_vehicleImage` varchar(200) NOT NULL,
  `driver_ration_gas_book` varchar(200) NOT NULL,
  `driver_owner_proof` varchar(200) NOT NULL,
  `driverstatus` varchar(20) NOT NULL,
  `isactive` int(11) NOT NULL,
  `Remarks` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_driver_general_detail`
--

INSERT INTO `tbl_driver_general_detail` (`id`, `driver_id`, `drivertype`, `driver_name`, `driver_email`, `driver_phone`, `driver_lan`, `driver_address`, `year_experience`, `vehicle_width`, `vehicle_height`, `vehicle_depth`, `vehicle_model`, `vehicle_number`, `vehicle_type`, `driver_image`, `driver_full_image`, `driver_aadhar`, `driver_license`, `driver_voterId`, `driver_vehicleImage`, `driver_ration_gas_book`, `driver_owner_proof`, `driverstatus`, `isactive`, `Remarks`) VALUES
(18, 'S10001', 'Mad Money', 'KESAV', 'donkeyCargo@gmail.com', '9444555194', '12/4 Govindasamy street', '12/4 Govindasamy street', '0', 'not', 'not', 'not', '', 'TN57BH2227', 'Own Vehicle', '', '', '', '', '', '', '', '', 'Approved', 1, ''),
(19, 'S10019', 'Mad Money', 'sanjay', 'donkeyCargo@gmail.com', '9790378394', '12/ 4/47govindasami street mettupatti chinnalapatt', '12/ 4/47govindasami street mettupatti chinnalapatti dindigul', '0', 'not', 'not', 'not', '', 'TN57BH3335', 'Own Vehicle', '', '', '', '', '', '', '', '', 'Pending', 1, ''),
(20, 'S10020', 'Mad Money', 'sanjay', 'donkeyCargo@gmail.com', '9790378394', '12/ 4/47govindasami street mettupatti chinnalapatt', '12/ 4/47govindasami street mettupatti chinnalapatti dindigul', '0', 'not', 'not', 'not', '', 'TN57BH3335', 'Own Vehicle', '', '', '', '', '', '', '', '', 'Pending', 1, ''),
(21, 'S10021', 'Mad Money', 'karthick', 'donkeyCargo@gmail.com', '8667052467', '12/ 4/47govindasami street mettupatti chinnalapatt', '12/ 4/47govindasami street mettupatti chinnalapatti dindigul', '0', 'not', 'not', 'not', '', 'TN57BH3335', 'Own Vehicle', '', '', '', '', '', '', '', '', 'Approved', 1, ''),
(22, 'S10022', 'Mad Money', 'hareessh', 'donkeyCargo@gmail.com', '8122995721', 'hai', 'hai', '0', 'not', 'not', 'not', '', 'hello', 'Own Vehicle', '', '', '', '', '', '', '', '', 'Approved', 1, ''),
(23, 'S10023', 'Mad Money', 'gnanam', 'donkeyCargo18@gmail.com', '9976683704', 'hahai', 'hahai', '0', 'not', 'not', 'not', '', 'hello', 'Own Vehicle', '', '', '', '', '', '', '', '', 'Approved', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver_login`
--

CREATE TABLE `tbl_driver_login` (
  `driver_name` varchar(200) NOT NULL,
  `driver_password` varchar(200) NOT NULL,
  `d_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_driver_login`
--

INSERT INTO `tbl_driver_login` (`driver_name`, `driver_password`, `d_ID`) VALUES
('tester', 'test123', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employees`
--

CREATE TABLE `tbl_employees` (
  `id` int(11) NOT NULL,
  `EmployeeName` varchar(50) NOT NULL,
  `Designation` varchar(50) NOT NULL,
  `MobileNo` varchar(10) NOT NULL,
  `EmailId` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `EmployeeType` varchar(10) NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_employees`
--

INSERT INTO `tbl_employees` (`id`, `EmployeeName`, `Designation`, `MobileNo`, `EmailId`, `Password`, `EmployeeType`, `isActive`) VALUES
(2, 'venki', 'emp', '1234', 'ds', '1234', 'User', 1),
(3, 'Kesavan', 'Manager', '9444555194', 'mdsf@gmial.com', '1234', 'Admin', 1),
(4, 'Hareessh', 'Manager ', '8122995721', 'J', '1234', 'Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faq`
--

CREATE TABLE `tbl_faq` (
  `id` int(20) NOT NULL,
  `QuestionBody` varchar(500) NOT NULL,
  `QuestionLink` varchar(500) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `isUser` varchar(10) NOT NULL,
  `isDriver` varchar(10) NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_faq`
--

INSERT INTO `tbl_faq` (`id`, `QuestionBody`, `QuestionLink`, `Description`, `isUser`, `isDriver`, `isActive`) VALUES
(1, 'What is DonkeyCargo?', 'donkeycargo.com', 'Online Shipping', 'true', 'false', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hiringrate`
--

CREATE TABLE `tbl_hiringrate` (
  `id` int(20) NOT NULL,
  `Category` varchar(200) NOT NULL,
  `ServiceCity` varchar(200) NOT NULL,
  `driverMinRate` double NOT NULL,
  `driverAddlRate` double NOT NULL,
  `DMinRate` double NOT NULL,
  `DAddlRate` float NOT NULL,
  `tMinRate` double NOT NULL,
  `tAddlRate` double NOT NULL,
  `isActive` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_messagetemplate`
--

CREATE TABLE `tbl_messagetemplate` (
  `id` int(20) NOT NULL,
  `MessageCode` varchar(100) NOT NULL,
  `MessageName` varchar(200) NOT NULL,
  `MessageTemplate` varchar(500) NOT NULL,
  `isActive` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_messagetemplate`
--

INSERT INTO `tbl_messagetemplate` (`id`, `MessageCode`, `MessageName`, `MessageTemplate`, `isActive`) VALUES
(11, 'parcel 11', 'service temporary disruption', 'We regret the inconvenience caused in $service area$ or $service city$ yesterday due to the temporary disruption of loading vehicle services. We are back in full swing to serve your transportation needs.', 1),
(17, 'parcel 17', 'sharing time allotment', '$driver name$ $mobile number$ is arriving at $time$ in a $vehicle number$-$vehicle name$. Your total fare is Rs.$12$ and cash to be paid is Rs.$12$. Share OTP - $1234$ only on shipping goods.', 1),
(18, 'CRBKOTP', 'Courier Booking OTP #1', 'Booking confirmation on Donkey Cargo! With booking I\'D - $bid$ and pickup OTP - $otp$.', 1),
(19, 'CRBKOTP1', 'Courier booking Receiver OTP #2', 'Booking confirmation on Donkey Cargo! Your pickup order is taken by driver successfully, booking I’D - $bid$ and drop OTP - $otp$.', 1),
(21, 'CRBKDR', 'Courier Booking Confirmation to Driver', 'DUTY ALERT from Donkey Cargo! Booking ID. $bid$ assigned for YOU, delivery address attached here for reference! \nFlat/House No.- $hno$\nLandmark/Area- $area$', 1),
(22, 'COMPLAINT', 'Complaint to Caller', 'We apologize for any inconvenience caused! Your complaint on Booking I’D $bid$ is successful registered, Reference No. - $cno$. ', 1),
(23, 'CRBKCAN', 'Cancel booking by driver', 'Your Booking I’D - $bid$ is Cancelled by the driver, we’ll  reschedule your booking shortly!', 1),
(24, 'CRBKCANTD', 'cancel booking from user', 'Booking I’D - $bid$ is cancelled by user, to get more duty turn on REQUEST mode in donkey driver app.', 1),
(25, 'LOGINOTP', 'Login OTP', '$loginotp$ is your One Time Password (OTP) for logging in at www.donkeycargo.com', 1),
(26, 'CRBKCANTU', 'User cancel booking info', 'Your booking with $bid$ has been cancelled successfully! If you have done online payment for Rs.$rs$, amount will be refunded within 5-7 business days. ', 1),
(27, 'DRLOGINOTP', 'Donkey Driver login OTP', '$otp$ is your One Time Password (OTP) for logging in at Donkey Driver.', 1),
(28, 'DRSNOTP', 'Driver signup otp', 'Welcome to Donkey Cargo family! $otp$ is your (OTP) to Register at Donkey Driver and you will receive a verification call within 24 hours..', 1),
(29, 'CRBKCANTUND', 'Admin -No driver message ', 'Due to high demand of Bookings, the pick-up time can take little longer than expected. We’re trying our best to process your request ASAP.', 1),
(30, 'CRBKCANTUNS', 'Admin - Service not available  ', 'Your booking with $bid$ has been cancelled! Our services are currently not available in this city, we will notify you as soon as we launch. If you have done online payment, amount will be refunded within 5-7 business days. \nFor Franchise contact - 8668 141 551', 1),
(31, 'duplicate', 'duplicate', 'Our service are currently not available in this city, we will notify you as soon as we launch.\nFor Franchise - 8668 141 551', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_otplist`
--

CREATE TABLE `tbl_otplist` (
  `id` int(200) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `otp` varchar(20) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `imeino` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_otplist`
--

INSERT INTO `tbl_otplist` (`id`, `mobile`, `otp`, `date`, `time`, `role`, `imeino`) VALUES
(1, '9444555194', '484788', '2020-10-12', '06:49:38', 'driver', '1234567890'),
(2, '9444555194', '484788', '2020-10-12', '06:49:38', 'driver', '1234567890'),
(3, '8122995721', '307710', '2020-09-30', '01:41:50', 'driver', '1234567890'),
(4, '8122995721', '648912', '2020-09-30', '01:42:02', 'driver', '1234567890'),
(5, '8122995721', '488118', '2020-09-30', '01:42:59', 'driver', '1234567890'),
(6, '8122995721', '716074', '2020-09-30', '01:43:05', 'driver', '1234567890'),
(7, '6374928118', '636588', '2020-09-30', '01:50:33', 'driver', '1234567890'),
(8, '8122995721', '217573', '2020-10-25', '09:23:36', 'user', ''),
(9, '7010289063', '227334', '2020-10-01', '04:06:47', 'user', ''),
(10, '9444555194', '484788', '2020-10-12', '06:49:38', 'driver', '1234567890'),
(11, '9790378394', '115018', '2020-10-01', '11:29:48', 'driver', '1234567890'),
(12, '9994860454', '741475', '2020-10-08', '12:38:02', 'user', ''),
(13, '9790378394', '115018', '2020-10-01', '11:29:48', 'driver', '1234567890'),
(14, '9790378394', '115018', '2020-10-01', '11:29:48', 'driver', '1234567890'),
(15, '9444555194', '161203', '2020-10-21', '08:11:40', 'user', ''),
(16, '8122995721', '520364', '2020-10-01', '11:45:55', 'driver', '1234567890'),
(17, '7299060419', '134641', '2020-10-02', '02:55:27', 'user', ''),
(18, '7299041906', '992303', '2020-10-02', '03:01:13', 'user', ''),
(19, '7708239491', '744072', '2020-10-03', '06:39:24', 'user', ''),
(20, '9095204586', '444083', '2020-10-25', '06:38:07', 'user', ''),
(21, '9488666184', '624513', '2020-10-04', '05:56:43', 'user', ''),
(22, '9976683704', '916789', '2020-10-06', '12:07:00', 'driver', '1234567890'),
(23, '9894861366', '524835', '2020-10-06', '06:29:49', 'user', ''),
(24, '9947324466', '390428', '2020-10-09', '01:46:15', 'user', ''),
(25, '9048118939', '593642', '2020-10-09', '01:51:08', 'user', ''),
(26, '9048481189', '633251', '2020-10-09', '01:48:55', 'user', ''),
(27, '7867032568', '483176', '2020-10-12', '02:11:39', 'user', ''),
(28, '9896818150', '902849', '2020-10-12', '05:32:37', 'user', ''),
(29, '9842408907', '836393', '2020-10-15', '02:10:42', 'user', ''),
(30, '9600896874', '364248', '2020-10-21', '07:56:13', 'user', ''),
(31, '9600896874', '364248', '2020-10-21', '07:56:13', 'user', ''),
(32, '8667052467', '700869', '2020-10-24', '10:58:39', 'user', ''),
(33, '8667052467', '797996', '2020-10-24', '10:58:40', 'user', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parcelbooking`
--

CREATE TABLE `tbl_parcelbooking` (
  `id` int(50) NOT NULL,
  `BookingId` varchar(20) NOT NULL,
  `BookingSerial` int(10) NOT NULL,
  `BookingDate` date NOT NULL,
  `BookingTime` time NOT NULL,
  `FromRange` varchar(50) NOT NULL,
  `ToRange` varchar(50) NOT NULL,
  `FromAddress` varchar(200) NOT NULL,
  `ToAddress` varchar(200) NOT NULL,
  `ParcelCategory` varchar(10) NOT NULL,
  `ParcelType` varchar(10) NOT NULL,
  `ParcelName` varchar(100) NOT NULL,
  `FromName` varchar(100) NOT NULL,
  `FromAddress1` varchar(200) NOT NULL,
  `FromLandmark` varchar(100) NOT NULL,
  `FromMobile` varchar(12) NOT NULL,
  `ToName` varchar(100) NOT NULL,
  `ToAddress1` varchar(200) NOT NULL,
  `ToLandmark` varchar(100) NOT NULL,
  `ToMobile` varchar(12) NOT NULL,
  `ProductType` varchar(100) NOT NULL,
  `small` int(10) NOT NULL,
  `medium` int(10) NOT NULL,
  `large` int(10) NOT NULL,
  `xl` int(10) NOT NULL,
  `LSAmt` float NOT NULL,
  `LMAmt` float NOT NULL,
  `LLAmt` float NOT NULL,
  `LXAmt` float NOT NULL,
  `DSAmt` float NOT NULL,
  `DMAmt` float NOT NULL,
  `DLAmt` float NOT NULL,
  `DXAmt` float NOT NULL,
  `HAmt` float NOT NULL,
  `Total` float NOT NULL,
  `LocalDistance` float NOT NULL,
  `PaymentMode` varchar(10) NOT NULL,
  `BankRefNo` varchar(20) NOT NULL,
  `CouponCode` varchar(20) NOT NULL,
  `CouponAmt` float NOT NULL,
  `NetTotal` float NOT NULL,
  `UserID` varchar(50) NOT NULL,
  `UserMobile` varchar(10) NOT NULL,
  `OTP` varchar(10) NOT NULL,
  `isCancel` bit(1) NOT NULL DEFAULT b'0',
  `isActive` int(10) NOT NULL,
  `FromLatitude` varchar(20) NOT NULL,
  `FromLongitude` varchar(20) NOT NULL,
  `ToLatitude` varchar(20) NOT NULL,
  `ToLongitude` varchar(20) NOT NULL,
  `RecOTP` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_parcelbooking`
--

INSERT INTO `tbl_parcelbooking` (`id`, `BookingId`, `BookingSerial`, `BookingDate`, `BookingTime`, `FromRange`, `ToRange`, `FromAddress`, `ToAddress`, `ParcelCategory`, `ParcelType`, `ParcelName`, `FromName`, `FromAddress1`, `FromLandmark`, `FromMobile`, `ToName`, `ToAddress1`, `ToLandmark`, `ToMobile`, `ProductType`, `small`, `medium`, `large`, `xl`, `LSAmt`, `LMAmt`, `LLAmt`, `LXAmt`, `DSAmt`, `DMAmt`, `DLAmt`, `DXAmt`, `HAmt`, `Total`, `LocalDistance`, `PaymentMode`, `BankRefNo`, `CouponCode`, `CouponAmt`, `NetTotal`, `UserID`, `UserMobile`, `OTP`, `isCancel`, `isActive`, `FromLatitude`, `FromLongitude`, `ToLatitude`, `ToLongitude`, `RecOTP`) VALUES
(76, 'P00001', 1, '2019-12-28', '01:17:08', '8.29', '2.345', 'mdu', 'mdu', 'share', 'local', '23', 'karhi', 'dd', '', '', '', '', '', '', '', 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 100, 10, '', '', '1', 0, 100, '', '9095204586', '5209', b'1', 1, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parcelcompany`
--

CREATE TABLE `tbl_parcelcompany` (
  `id` int(20) NOT NULL,
  `ParcelName` varchar(200) NOT NULL,
  `City` varchar(200) NOT NULL,
  `Latitude` varchar(200) NOT NULL,
  `Longitude` varchar(200) NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_parcelcompany`
--

INSERT INTO `tbl_parcelcompany` (`id`, `ParcelName`, `City`, `Latitude`, `Longitude`, `isActive`) VALUES
(1, 'SRM TRANSPORT', 'Madurai', '9.915072', '78.112165', 1),
(2, 'Parveen TRANSPORT', 'Chennai', '9.9570872', '71.112165', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parcelconfig`
--

CREATE TABLE `tbl_parcelconfig` (
  `id` int(20) NOT NULL,
  `driverMinRate` double NOT NULL,
  `driverAddlRate` double NOT NULL,
  `DMinRate` double NOT NULL,
  `DAddlRate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_parcelconfig`
--

INSERT INTO `tbl_parcelconfig` (`id`, `driverMinRate`, `driverAddlRate`, `DMinRate`, `DAddlRate`) VALUES
(1, 20, 34, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parcelrate`
--

CREATE TABLE `tbl_parcelrate` (
  `id` int(20) NOT NULL,
  `ParcelName` varchar(200) NOT NULL,
  `ParcelSize` varchar(200) NOT NULL,
  `FromCity` varchar(200) NOT NULL,
  `ToCity` varchar(200) NOT NULL,
  `parcelprice` double NOT NULL,
  `donkeyprice` double NOT NULL,
  `offerprice` double NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_parcelrate`
--

INSERT INTO `tbl_parcelrate` (`id`, `ParcelName`, `ParcelSize`, `FromCity`, `ToCity`, `parcelprice`, `donkeyprice`, `offerprice`, `isActive`) VALUES
(1, 'SRM TRANSPORT', 'S-Small', 'Madurai', 'Chennai', 200, 300, 250, 1),
(2, 'SRM TRANSPORT', 'M-Medium', 'Madurai', 'Chennai', 109, 345, 345, 1),
(3, 'SRM TRANSPORT', 'S-Small', 'Chennai', 'Madurai', 100, 110, 120, 1),
(4, 'SRM TRANSPORT', 'L-Large', 'Madurai', 'Chennai', 120, 150, 200, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_producttype`
--

CREATE TABLE `tbl_producttype` (
  `id` int(20) NOT NULL,
  `ProductType` varchar(200) NOT NULL,
  `isActive` int(10) NOT NULL,
  `isCourier` varchar(10) NOT NULL,
  `isParcel` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_producttype`
--

INSERT INTO `tbl_producttype` (`id`, `ProductType`, `isActive`, `isCourier`, `isParcel`) VALUES
(1, 'Electrical / Electronics / Home Appliances  ', 1, 'true', 'true'),
(2, 'Machines / Equipments / Spare Parts / Metals ', 1, 'true', 'false'),
(3, 'Textile / Garments / Fashion Accessories  ', 1, 'true', 'true'),
(4, 'Paper / Packaging / Printed Material', 1, 'true', 'true'),
(5, 'Plastic / Rubber ', 1, 'false', 'true'),
(6, 'Food Products', 1, 'true', 'true'),
(7, 'Books / Stationery / toys / Gifts', 1, 'true', 'true'),
(8, 'Houseware Supplies ', 1, 'false', 'true'),
(9, 'Paints', 1, 'false', 'true'),
(10, 'Document', 1, 'true', 'false'),
(11, 'Box', 1, 'true', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rating`
--

CREATE TABLE `tbl_rating` (
  `id` int(11) NOT NULL,
  `BookingID` varchar(20) NOT NULL,
  `UserMobile` varchar(10) NOT NULL,
  `DriverMobile` varchar(10) NOT NULL,
  `Rating` int(20) NOT NULL,
  `Remarks` varchar(200) NOT NULL,
  `isIgnore` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_rating`
--

INSERT INTO `tbl_rating` (`id`, `BookingID`, `UserMobile`, `DriverMobile`, `Rating`, `Remarks`, `isIgnore`) VALUES
(26, 'C00008', '9790378394', '9444555194', 4, '', 0),
(27, 'C00010', '8122995721', '8122995721', 0, '', 1),
(28, 'C00006', '8122995721', '8122995721', 0, '', 1),
(29, 'C00059', '9444555194', '9444555194', 4, 'Good ', 0),
(30, 'C00001', '9444555194', '9444555194', 5, '', 0),
(31, 'C00009', '9095204586', '8667052467', 0, '', 1),
(32, 'C00026', '9444555194', '9444555194', 5, 'Good service', 0),
(33, 'C00019', '8122995721', '8122995721', 4, '', 0),
(34, 'C00019', '8122995721', '8122995721', 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reason`
--

CREATE TABLE `tbl_reason` (
  `id` int(11) NOT NULL,
  `Reason` varchar(200) NOT NULL,
  `isUser` varchar(10) NOT NULL,
  `isDriver` varchar(10) NOT NULL,
  `isActive` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_reason`
--

INSERT INTO `tbl_reason` (`id`, `Reason`, `isUser`, `isDriver`, `isActive`) VALUES
(1, 'Hello', 'false', 'true', 1),
(2, 'hello hi', 'true', 'false', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rentalbooking`
--

CREATE TABLE `tbl_rentalbooking` (
  `id` int(50) NOT NULL,
  `BookingId` varchar(20) NOT NULL,
  `BookingSerial` int(10) NOT NULL,
  `BookingDate` date NOT NULL,
  `BookingTime` time NOT NULL,
  `FromRange` varchar(50) NOT NULL,
  `FromAddress` varchar(200) NOT NULL,
  `RentalPackage` varchar(50) NOT NULL,
  `ProductType` varchar(50) NOT NULL,
  `VehicleType` varchar(20) NOT NULL,
  `Amount` float NOT NULL,
  `PaymentMode` varchar(20) NOT NULL,
  `CouponCode` varchar(20) NOT NULL,
  `CouponAmt` float NOT NULL,
  `NetTotal` float NOT NULL,
  `isCancel` bit(1) NOT NULL DEFAULT b'0',
  `isActive` int(10) NOT NULL,
  `Mobileno` varchar(10) NOT NULL,
  `OTP` varchar(10) NOT NULL,
  `BankRefNo` varchar(20) NOT NULL,
  `UserID` varchar(10) NOT NULL,
  `FromLatitude` varchar(20) NOT NULL,
  `FromLongitude` varchar(20) NOT NULL,
  `RecOTP` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rentalrate`
--

CREATE TABLE `tbl_rentalrate` (
  `id` int(20) NOT NULL,
  `CategoryVehicle` varchar(200) NOT NULL,
  `Hours1` int(20) NOT NULL,
  `KMs1` int(20) NOT NULL,
  `donkeyprice` double NOT NULL,
  `offerprice` double NOT NULL,
  `Hours2` int(20) NOT NULL,
  `KMs2` int(20) NOT NULL,
  `price` double NOT NULL,
  `rentalprice` double NOT NULL,
  `isActive` int(20) NOT NULL,
  `ServiceCity` varchar(200) NOT NULL,
  `RentalPackages` varchar(47) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_rentalrate`
--

INSERT INTO `tbl_rentalrate` (`id`, `CategoryVehicle`, `Hours1`, `KMs1`, `donkeyprice`, `offerprice`, `Hours2`, `KMs2`, `price`, `rentalprice`, `isActive`, `ServiceCity`, `RentalPackages`) VALUES
(4, 'Mini', 1, 10, 400, 310, 15, 3, 50, 300, 1, 'Madurai', '1Hrs-10Kms'),
(5, 'Micro ', 1, 15, 150, 200, 10, 2, 10, 100, 1, 'Madurai', '1Hrs-15Kms'),
(6, 'Micro ', 1, 10, 150, 124, 10, 2, 20, 100, 1, 'Madurai', '1Hrs-10Kms');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_servicearea`
--

CREATE TABLE `tbl_servicearea` (
  `id` int(20) NOT NULL,
  `ServiceArea` varchar(200) NOT NULL,
  `Longitude` varchar(100) NOT NULL,
  `Latitude` varchar(100) NOT NULL,
  `isCourier` varchar(20) NOT NULL,
  `isParcel` varchar(20) NOT NULL,
  `isSharing` varchar(20) NOT NULL,
  `isRental` varchar(20) NOT NULL,
  `isActive` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_servicearea`
--

INSERT INTO `tbl_servicearea` (`id`, `ServiceArea`, `Longitude`, `Latitude`, `isCourier`, `isParcel`, `isSharing`, `isRental`, `isActive`) VALUES
(1, 'Chennai', '80.2707', '13.0827', 'true', 'true', 'true', 'false', 1),
(2, 'Madurai', '78.455', '7.8023', 'true', 'true', 'true', 'true', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_servicearea1`
--

CREATE TABLE `tbl_servicearea1` (
  `id` int(20) NOT NULL,
  `ServiceCity` varchar(200) NOT NULL,
  `ServiceArea` varchar(200) NOT NULL,
  `Latitude` varchar(200) NOT NULL,
  `Longitude` varchar(200) NOT NULL,
  `Radius` double NOT NULL,
  `Notes` varchar(500) NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_servicearea1`
--

INSERT INTO `tbl_servicearea1` (`id`, `ServiceCity`, `ServiceArea`, `Latitude`, `Longitude`, `Radius`, `Notes`, `isActive`) VALUES
(1, 'Chennai', 'Urapakkam', '12.8627', '80.0693', 5, 'Guduvanchery, Perumanttunallur, Thailavarm, Adhanur, Varadharajapuram, Vandalur, Nedunkundram, Kolapakkam, Arungal, Vanchuvancheri\n', 1),
(2, 'Chennai', 'Tambaram', '12.9229', '80.1275', 5, 'Selaiyur, Perungalathur, Chromepet, Chitlapakkam, Tiruneermalai, Irumbuliyur, Nedkundram Extension', 1),
(3, 'Chennai', 'Meenambakkam', '12.9870', '80.1715', 5, 'Pallavaram, Chrompet, Pammal, Gerugambakkam, Manapakkam, Maduvinkarai,Nangainallur, Madipakkam, Kovilambakkam, Nemilichery', 1),
(4, 'Chennai', 'Nungambakkam', '13.0595', '80.2425', 5, 'T Nagar, Saligramam, Chennai, Pattinapakkam, Mylapore, Choolai, Naddu Kuppam, Anna Nagar ', 1),
(5, 'Chennai', 'Velachery ', '12.9760', '80.2212', 5, 'Palavakkam, Thoraipakkam, Madipakkam, pallikaranai, Nangainallur, Maduvinkarai, Guindy, ', 1),
(6, 'Chennai', 'Sithalapakkam', '12.8821', '80.1923', 6, 'Karappakam, Panaiyur, Semmancheri, Sholinganallur, Mambakkam, Selaiyur', 1),
(7, 'Chennai', 'kolathur', '13.1204', '80.2143', 5, 'Madhavaram, Jamalia, Anna Nagar, Agaram, Lakshmipuram, Vallalar Nagar, Korattur, Elango Nagar, Padi ', 1),
(8, 'Madurai', 'Madurai', '9.916012', '78.124100', 5, 'd', 1),
(10, 'Madurai', 'vadipatti', '1', '1', 5, '3', 1),
(11, 'Madurai', 'Tiruparankundram', '1', '1', 5, 'm', 1),
(12, 'Chennai', 'Chennai', '1', '1', 5, 'd', 1),
(13, 'Madurai', 'Simmakkal', '9.9266953', '78.117076', 10, 'simmakkal to udhankudi', 1),
(14, 'uthankudi', 'madurai', '89.0000', '12.000', 3, '11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sharepass`
--

CREATE TABLE `tbl_sharepass` (
  `id` int(20) NOT NULL,
  `ServiceCityCode` int(10) NOT NULL,
  `KMs` varchar(50) NOT NULL,
  `Size` varchar(50) NOT NULL,
  `Rides` int(20) NOT NULL,
  `Days` int(20) NOT NULL,
  `MaxPrice` float NOT NULL,
  `DispPrice` float NOT NULL,
  `FlatPrice` float NOT NULL,
  `OfferP` float NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Picture` mediumtext NOT NULL,
  `isActive` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sharepass`
--

INSERT INTO `tbl_sharepass` (`id`, `ServiceCityCode`, `KMs`, `Size`, `Rides`, `Days`, `MaxPrice`, `DispPrice`, `FlatPrice`, `OfferP`, `Description`, `Picture`, `isActive`) VALUES
(1, 1, '6KM', 'M-Medium', 10, 28, 100, 200, 34, 20, 'ds', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/4Rt0RXhpZgAATU0AKgAAAAgABQEyAAIAAAAUAAAASgE7AAIAAAAHAAAAXkdGAAMAAAABAAQAAEdJAAMAAAABAD8AAIdpAAQAAAABAAAAZgAAAMYyMDA5OjAzOjEyIDEzOjQ4OjI4AENvcmJpcwAAAASQAwACAAAAFAAAAJyQBAACAAAAFAAAALCSkQACAAAAAzE3AACSkgACAAAAAzE3AAAAAAAAMjAwODowMjoxMSAxMTozMjo0MwAyMDA4OjAyOjExIDExOjMyOjQzAAAAAAYBAwADAAAAAQAGAAABGgAFAAAAAQAAARQBGwAFAAAAAQAAARwBKAADAAAAAQACAAACAQAEAAAAAQAAASQCAgAEAAAAAQAAGkgAAAAAAAAAYAAAAAEAAABgAAAAAf/Y/9sAQwAIBgYHBgUIBwcHCQkICgwUDQwLCwwZEhMPFB0aHx4dGhwcICQuJyAiLCMcHCg3KSwwMTQ0NB8nOT04MjwuMzQy/9sAQwEJCQkMCwwYDQ0YMiEcITIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIy/8AAEQgAeACgAwEhAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A5wJxTLgFYuCAa4TpW5TniKxoQw6ZJzSadGZL1cDdgcYq1sOR2dh4U1bUcGGzdVzjdJ8g56cnGfwrrYPBuhWcEcepXM0t1KMg2yFlXvyQCM9fTjp604QvqzJvoiIeF/C5ufIGtOuBuw6Dpz3/AA/Q1pXPgzRZY3+y3+MbfmAyAMDP16g+341fs0LmZxmr6JNpdyyFHMeMq5HBHT/IrOSEu4UDknFYNWZZ32g6IIbUSOOcelV9ault1MZJ2nriptdHQ9InLpbmUTxht2/mM+/pVK4DZRWHKjHIqE7s5nuQFKjZPatSSIrWlZI8Nq8wQHnrUz2sC3uV7meSc8sdo7ZqjJHVRioqwm7u4AVDc9VXHUd6RutxbHSLnWL2Oys4/MnkOF3KSo/LoK9K0DwjpnhPy7jVFS71Yj/Vxcxx7jwx3cZGMZ6c9OhreC6sib6E1/46somdkvG3LiMurDaenAwQGPXoOM9e1Y154ojum22/2hotmXEnIYc8ZIDDk88/jxmrJsZczwX20qskFxsIV2UFcZzwcYOPcHPrWbeXupWqWvlaklurSGHcWZUO4KAAeCcbc4zwAO4xQI9D07UrDWtN+x6xFJE7DfDJ0BHIyAffd1zww68VmxeHprLV1WT54icxyADDD/H2rKqupdNanZSSC3sto4AWvO9YuvtV0yjtWa2NpsgsrhYVaKQYVsEMOqmqtyP9IbPJJ6+tZpWkY21IiuOcVp6f4eudSJ2Iwwu48f1qteayEzST4f6gUJlEcTZ+RWkXLY61KfCl/Dam2We081jgxGcbge3Hqe31q/Yyb1IuYN/4f1GyWR5rfHl4LgMCVB74B6Z4z/jWNIvtTaa3HYhApjRNJJsUHPrjNQbR3PVPC0Vv4a0CS5kiIuZF5Zxtx7ZGTXmmvazfapf3BhjmePduZySqbcBSSO313YPTHauhbWItq2cbc6lcecTDu+UEM75cnJ6AE9Ooyevp0pdGvEF2vnnqduN2STxg4PGRj/GqJPS7eOye3R5Lt4943bJABE3+9jrnnoQPrWXLrcMOqpPNbWxjiPlQJAQU39pDnORgBufboerZKZmaVrk8mquizGSCeREhUDcVUHJI+U8ku2MdeuAAK9v0O6jsbKCOfzmeQfNGG3qG+XuehOR8o9zjvSe443aNCXVbGRAwtY5QcgsyjHA57f5wfSsa4Ph2VphNp9ssnzpmEhSVH8QA75xjj+mZdn0KSfcoxeFdIuozIl3eRqem5AxB9+BSv4C88h7TU4Z8KM70x+oJrP2V9huVnqVl8Itp7SXN7PbGOLLlVkySAMnH4c/SsWbxLe3VwLSyjEMVvOGkxkOVwPLUHb0JXv36kVVODi7slu5cGsQ2zw3OrXKxwYJtoWkZ5TnlSRgkYyQp447DAzU1HXNCMqhPOe42r5fkkDacZBwCWAJ28E4OOnU1rcmxq2GoQb0njCnzdwZVkHKjI6H+LKngY5546FmveGob2OObSYEMpDu7I+EkwecAnjGT3qZRuh9Tz5a3PD6xCfzZoBLt+6c/cPXj3/DjrXOtzaB2epOrWAM1m4GOPNQFePYn26fyri9Sga6hZdm2JTwkY2KD29/X3/nW6IkedazdQCf7NaYSIfecAkE9z7n61LpFjIJVuIMN684H41ZHQ6zW9Zgh0nE0UfmGM4UMABjuQVAbnvn39q4C/wBXli862dGxKVMCIcHGRkEDPVcZXp8q8cYqiDrvBuk3ctyt5cRxtM58y3DRBgCPbjpkcdTjtzXpKz3Akht2ihu1KlHkhwSpwQg6D+6CcAnOB2qJbmkNiK7imIlnhREkQZGVOETcWxweDjHTrjpzxnzRarZzxC8eAI7BnDb0ZxkAqp5cD5snpnODnAyrFXNGTULm1DSZlSSJ2XZvBfpkkdeAAuQ30/3rEfiporciEFpMsZSuSoTDEHnBHTOB1weF60AZWqeITc21yEuZJBbrjbICwHBwpXjuAcHpg9Sa870HUJ7rUppvtcuDIqM0LhS6bG4VjnHJJyRxjoM4qkRJ6ndLoFvcvOyzNIpba8jSsJQPmyGbOWPTqOw4rhvEcUcV6ZLS5nEi5RQs28/98nJPB7EDvRYEx9tqE0qW2XDyRF4SsaALkD5N390nIGRj7vWu78M6rcSWyW0NxG33WIcFgMr0XI6E5IGOfUA5ADOWU+lbGnXgtYwpJ8zqvOdv4fr+XFcvU2p7M05NWZYPJmMkz7AQpyT+JBwuR+Irn9WmuJbfEjJDbjplAoUdMY6n39a2iRI4R1L3R8suYs/fI2qP8+1dboq6XFBumhLSZypOWB/M4rRGb2Oa8XtM6SXJcASfKqA5O3r6ew/P8ofAOhSapqa6hOFeKNmALNjaQNxY+wGffJq1sQe7aX4ciitFEkct15rbm8uQ/KAMgZJwOWbkDnI6jpr31rF5drE5byeQQ5JAHG7uCwPHPQfLUGvkTwILq23so3O5JRdx5BzxuH95j8w6gDjoBQkjMyvPuh2ruG5jlBlQWIUDkZXvz1wcc0CRjXOlMqwCJ1JiPkmSaM9Cy9P7qnJ7ggrgHscPW7aKyKysJFby1YS+UjqoGWKljgg5AHbaDgDgtUlHnl9q9ybmS1EqRny1VVlQgn1Huc5688DtWNo9xd6Jfq1rOFdidkc67o2yOhUZyenXocfUaRM5PU6K98RNbaIqxp9oYMW2bmCgDOWVgehyDjHGemDzhyeJJruAxLbIgfj52zge3Sk0OOoujzJb3hmmMgKhmzHgYfHyk54xuxweMV6D4NuY5obq8tnk84xlVEaANwpCADP3VbBHuAM4OKSKkUA20bumOlP8/wAuHf8ANuHTb1P0rk6m1P4Tp9D0K/i01rwWzSGY5+Zuccdehz+XbpVHW7GGGOSWVHlmHCptOF/l/j+dbx2M5bnMR6XEbuKfVQOWHlQckk9un+f6ddNBH5IbCr8vCov9TWq2MWcN4oszfy+THG7j++OOa9L8DeFxp+jW2nGHbKVR55XBHBO4gDA5BwM54x9aL6DitTvbvUUUxBGwm3cAMAOM474wckfrj1rGhvpZtjFpWVWP75UAOCBwTxkjGOAcY5zjIRZYgurSGB05Xyl58sbiRwB69QADkfXrUJvkm3wJHDGVAXJCn526jnG7IZfTkHJPQAFWaKMss5mkWFE2lWJDMcdMbsZ+UHlcDBPOa5PXN15LN9ib0aSYRL5cQPGPvd0LE9evXoQgOG8SaRH9muPs4eR4V85WZto4A3YOMHO/rj+Hg468LF59xcoA568hcsC/0Hc44/CrjsRLc7zQ9Fl1O3EgiWaMneFK5/l/XnAHpUGr6Za28zMIJVuMfNySg/P/ADyKTCL1KtvZ210ixuTG+flZSSCMZ/kOvNdroll5FvbzwGM7GByrgNwDwc9Dn1GT+dKxTetinNq9lrO1bO2SIRMRIQO/pVSfXI9DuI7j7OJmT5Y0AyS56YrmSvKx0uyiddpt5r0tumot+7AAYwscM3+zg9zxWndRy6jpq300ciEY8yPGGPoCO1b6GGvU4q70+9N8kp+aSTOUI4jX0/Kthraf7LtCA4GMkdPpQpEuJT0/RLq71y288Hyo28xg3AIHP69K9LF/LBYTT2SLKW6IxXftHBYjJ7ceg9BQncdrGLI8mpRrMY/JlYguAwj2AjBGR95cD25Fa0+mI1gI02KrMDM5GcAY+g7HkdME5xwaQGNKkkDiOGZfmHlu4Oce/wBMv1x14prTJbtgoi+Y53krvBBOOG3A7c8DrwB3O2kHUW1v7XzI42kjTcrLKYwSUPUbW6Hj+HnjHUDjNkWWbUFKGOVowIo+T5ky45cgcEjrgHnOO+aAucb4kswHh+y3EpklyrxyLsMRwykA8gc5AA9MD1HC2mkTQ3odCrgudsZGARjkjPccH64q4vQzluepaS1xHHbkoyy7R+8BxuxjoR7Z4/T009feyuNJEspWVyPknj+VwQeRng/oR9MimScK1hK7x3Ai8yMcqVJRhj198kZz+BrsNBt1kn+1W8pMTAC6UrgMMD5sZOH4x1x19sqxVzm9CtnhsosqfM25c46msXxbdHSZNPuF/wCPlJfNVfcetcsNZnbUVosrReO9a1GWMy3ABDbmVe9e/wDgnVbbxDo5tr0EXUkYDkdCO341tJJHMpNialp39j3SrcRB0b5VuCOo/oawbu6Q3Sra5wDwSOprGTa0NYpS1OntbN208uGAuHXazH+7kFv6V5h4g1m9j+KH9l6fZIZEmhSCYqfkUBSX47dc+2fXnSnqkEtJWR6FNPb6LHJczOQqKXLA5JLMWAA75/p35A5y61/xZq07T2T2uk2oJIjdAzy9MbuOP59KtGUivpXiqW9kk0rWVhW9QEKd2FkABPTHAAJ5yD+tS6jflLc42eecfOV6HGPp6jOMnPtyxdDnoszSLcy3MEVo+ULSPgOTnGc9TjPbJret7mFGheK6jndUzvQ71YdOCBgehyM/jigRm38E13YGMyt5kF1IjKxz5mMNgjqwBDfeI6rkc4HMyzHT5VneEs4ySqjgLnkdiP4f85prQTOhsL4S28cwPyCQqYnXKlTgjjgZzxipPFIs7bTPLkjESSsSyq2V35OGAPoQ2e/GKu+hFtTG0O2kaa4spN5DZZQSQX9ec5JIXGe3JrvrJU0qHzUVfM8li/1AwP1OD9c96iUtLlxWpi6pDHp86hQoTHAryfxzcreamso+6AQBnpXLQ3TO/EWs0corFGDKcEHINev+CfF32KW3UhXVgAcdq6ai0OCL1PfbLXtO1Ww23XlYYDchORWVc+C4obv7XYvvi+95RPI+h7isprnXmbU3yS12ItSvzp+mqoAy0qrNlc7V54wRx2rhtT1+OHUGeGBWzN5YkB3beAe2egPb/wCsagtLCnL3m0aXiDUI1+yMcsUUuquMZ52qcY4OEB/GuZbxFIY8A4ycHb1rRIybMy9Rp5Yb8FkuYGDBhxx+HX/PrT4GW8uJBNIHAPzMo2jBI4/HH8ugpsSMbxPdX2l3cT6UFCoCoxGGK5z0BHHue+4dccb+i2l1JoENyVjgvi0kzKVPzA7ccAgDv69cYGSaSZbRvLue7juhxGwAIXHA2rnjv/CPovc81zuoWGZ2+8yEbQip0HXP8vTvSexJu6dpyT6UixsonQLlehHIYfyqfWbFtYtbeLY0o3bJHDcj1B9iD046d+lClbQOXqWNJsY9NlgXAcxs0anOGBIB78evU9z+NO7uSzvGSfLywAHU+mfxCmsZy0sbwic/4s1HE5ZW7YAJrzDVZfOkJYnnkZ70qS2Naz1ZFqGg3mnWNreSqDDcLuBH8Psa0PDCSxuZuiZ4Jro5lKNzkcXF2PQbPUrqNUEZ4HU7uteiaJ4ylfYnmFizbVXHH0rJ90XF30Zb8VSRahZSARndKU8wqMYHKsPryKwPA+l/2tqMpnjjS2j+bCgFUAJAVR6HGSevI7VcdSZaOx5x4+8YLJ4mvhp7f6OHEcZXj5FAUfoK5O31+QNl2OB1561otiGdHpusNq11BbKDhSCxGO3+f1q7rVtf2dxPIi/JNIHLnsPYfUnjPGDikxE2mzygxx3Drcx4JUqFDdRx83IHPPpXV2epF7cbP3KqAcOMZB/X2zx7ZpWKuFqsVvAI41YbMs3Tow6cepK+3FMdMXKtkqyoCxBwO/6GhiRneGvEUT6/e2b7gtxgRrkndhcgg9O3T2rpDMSkjKf3M48wMeoZcnp65GPxrOemprT1VijNdMz5DcADBHGSM8/qarM29yx6k5Nc7dzdI4PXLp7iaRj9B6VztraNqOqW1rg5kcD6DvWsNEE9T1S+02C+sPsbqNgGF46YrCt9MFrL9nmiUBPuqBwamEuhFVdTbtLD5l4AB4GO1dNa+H5Fh+0RNuVSDsXvVyZnBal8s1xa3MQjfanzfNz26VirPJaaPeLa3K2e6B41IzgM4I3E9AQSPX+dVTegVFqeH6rpEy+bdROZo1Pzseo9c1jhGwCO/QY61snoZtWZ3Pw80+W41V4pI2A2Bxu6HkDFeoatLpttbS2cgGGG05I+UnIznrj0+vOKLiaPOJLWOK9njkO+3ck73blewwp98DPfmustY4Y+cMwjgKEl+dx43Z78gd+ME1NwLdqwadiqnbtwFI6Lnj8O35dqoa3qiafo8+UyZEKRgE5yR1H060gOUsbiK2nt7qGQmWFsggb1Ug47noc5H4V3Wjan/atpJC6hLhQGVQOp4yOvXkcUpq6LpuzFZSGIIww6g0m2uQ6Tz+/YNAMYyam8F2Yn8RSzsMrBFkfVq0WzKn0PQNmTmq9/DG1t5kjBWU/KTUrciWxLYP8AMqqytjtXaaHfZKwnAGOg71UiIG62lxpGzxKApOSDznNcNr+jpaXE1s64guBmNjnoc/yopvWwVFpc5XxN4Str7QoL2xzbvLGBcRq3ysy8ZI7Hr9etefReGpreQhW+Zvl3Fc49xW97GaVzfSOXw7oc8ttclLtx/rWAJOB0A7DrT/DuoTz6f/puXuN2VlJBY+uRjk/jRfQloc04ledogoZR0YDrzz9AavWd4Z5BiNgxbEhVcqcjgfz59qBF77QTIyRAgE4IPUDOP8DXHavq8F/rSFCrwwqYUHABbByfz4H1prVgVUubiRTuXcFBJIGMgc55Gc+2ea1NHvWsvsrh1yrkiQEkfQ8ehb86b2BbneCcXcEdztVWcHeFOQGB5/PilVAetcklZnUnocp4asra5ummu4llWDaRG3Q+oI+ldXv0eWae502GOKQhY38sYVgM4P16VbWlw5tbCrIM49a4/wAZaszyLZ25JWP5nK+tKO4pEvhjxBFcxiJiqzpww7mu7s75onWUMOeOKckRF2O702+W4UIxzHGvJB7mpPEmn22o6csTNtkjH7twOR/9as46M0lqeU3v9oaLcSW1wgktn5IB4zz8w9Cc85rn768ht088xswA6ADNb3uYbHLzz3Wq3QMw2wKPliH9a0ftEcNvtgJ285II47CmxEMcTMshhcEZA3YHpWjFfRrY+ZKyxoMbiAME9MfXpTEzm7/xA93GYoC0UTEF8HJwOgJH4GqNu582NydzJkkBccAev4irSsSaluI8Hf8AeD4jIzgd8Yweeoz271MXSJ8xnbjDr5bH5iM8n2z+HPamB13ha6e4sbiNlxGjgoM5wehH6/jXQIO5rkqfEdMX7pwetaifDiHTbUDzC2bibH+sbPb2GMe/NaPhV5bu2lCQsXypGBzt28VpLSJMdZHQ3MJtLRn89PtB4SL1P1ripdOupFkJAcsSzGs723NYxbehysLT2Wtxm3VvMZ9pUd69I07VCWVWONvUMelay1SMXozudC1NjExLYVm69K624v4YrNrq4kC28SbmY1lbUu+h5d4i+IGkzSSCK0upVOQGEYwfpzXnusa/HIuILSVM/wDPQ7T+ma6Ekznd7nPvq8pDfK3PT5uKRNUn2FBCpY+p6VXIg5hy39/KVAJIVsBEXqT2pUFxeOVkkMm1c7SCR9QOPSnZIVyx9m8qJEUrtDEnJOF6deg9vripLWF5Sib8qVPliKPJyD0I59Dj9O+AB7IzEtGSApVSec8e56dAe3XpwcS7wU+eU7N3zNjJx6/THt/jQBv+GZzb3RDlgjRuI+Rg854xXawSB0VhwCK5qnxG8GdDr3wws/EFwZoEhWVTkFWworW0PwTPpOmPa74biPGFCHkY6DPWr1asF0pXPLvFtnrMWsJEuj3sUYbHmeWdp9846VW1OeW3sHCwSxuBvY7T+NZVFeyN6LtdmR4U0qa51qTUbuBlSHlCy8EmtjVdN+zXTXcCsUflgOxqutjKWupp6JesECk5z8uK0fFGs7bGO2lyE42nGVJ/p/8AWPpQ1clOyPL9ZSeaUPHuMJQFUK8SDqOe3b2rGjmimXzDA/lAqGdV2rHkcj88457V0xWhg9y09hGLnyCSsh+6DyVHqe3OfxpY9PESls5IUkDZkMO5yMf57Z4piGfZkgRfly4JcMCvA5x19cHoT+NTqkoIhbbG8agtHNEAH5HALZ/DPHBoAbNOYndGLOGBKrJgDr3wcZ64B9eOxqA9UBRtjsAPMA5zwfT6jrSAfvnHDgqiqFRSSN3JwO+emP8AIpN0kaCVHOSTgBs4OOAfb/GgZv8Ahs4utuFXcMuMcgkdf/1V3EThUUegrmqr3rm9M//Z/+wAEUR1Y2t5AAEABAAAAGQAAP/hC25odHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+DQo8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA0LjEtYzAzNiA0Ni4yNzY3MjAsIE1vbiBGZWIgMTkgMjAwNyAyMjo0MDowOCAgICAgICAgIj4NCgk8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPg0KCQk8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnhhcFJpZ2h0cz0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3JpZ2h0cy8iIHhhcFJpZ2h0czpNYXJrZWQ9IlRydWUiIHhhcFJpZ2h0czpXZWJTdGF0ZW1lbnQ9Imh0dHA6Ly9wcm8uY29yYmlzLmNvbS9zZWFyY2gvc2VhcmNocmVzdWx0cy5hc3A/dHh0PTQyLTE1NTY0OTc4JmFtcDtvcGVuSW1hZ2U9NDItMTU1NjQ5NzgiPg0KCQkJPGRjOnJpZ2h0cz4NCgkJCQk8cmRmOkFsdD4NCgkJCQkJPHJkZjpsaSB4bWw6bGFuZz0ieC1kZWZhdWx0Ij7CqSBDb3JiaXMuICBBbGwgUmlnaHRzIFJlc2VydmVkLjwvcmRmOmxpPg0KCQkJCTwvcmRmOkFsdD4NCgkJCTwvZGM6cmlnaHRzPg0KCQkJPGRjOmNyZWF0b3I+PHJkZjpTZXEgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj48cmRmOmxpPkNvcmJpczwvcmRmOmxpPjwvcmRmOlNlcT4NCgkJCTwvZGM6Y3JlYXRvcj48L3JkZjpEZXNjcmlwdGlvbj4NCgkJPHJkZjpEZXNjcmlwdGlvbiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iPjx4bXA6UmF0aW5nPjQ8L3htcDpSYXRpbmc+PHhtcDpDcmVhdGVEYXRlPjIwMDgtMDItMTFUMTk6MzI6NDMuMTczWjwveG1wOkNyZWF0ZURhdGU+PC9yZGY6RGVzY3JpcHRpb24+PHJkZjpEZXNjcmlwdGlvbiB4bWxuczpNaWNyb3NvZnRQaG90bz0iaHR0cDovL25zLm1pY3Jvc29mdC5jb20vcGhvdG8vMS4wLyI+PE1pY3Jvc29mdFBob3RvOlJhdGluZz42MzwvTWljcm9zb2Z0UGhvdG86UmF0aW5nPjwvcmRmOkRlc2NyaXB0aW9uPjwvcmRmOlJERj4NCjwveDp4bXBtZXRhPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg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', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sharepassdetails`
--

CREATE TABLE `tbl_sharepassdetails` (
  `id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `UserId` varchar(10) NOT NULL,
  `MobileNo` varchar(12) NOT NULL,
  `SharepassCode` int(10) NOT NULL,
  `Debit` float NOT NULL,
  `Credit` float NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sharepassdetails`
--

INSERT INTO `tbl_sharepassdetails` (`id`, `Date`, `Time`, `UserId`, `MobileNo`, `SharepassCode`, `Debit`, `Credit`, `isActive`) VALUES
(128, '2019-12-09', '06:43:40', '6', '', 6, 9, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sharepassmembers`
--

CREATE TABLE `tbl_sharepassmembers` (
  `id` int(10) NOT NULL,
  `UserId` varchar(20) NOT NULL,
  `Mobileno` varchar(20) NOT NULL,
  `PassCode` int(10) NOT NULL,
  `PassAmt` int(20) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `RefNo` varchar(50) NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sharepassmembers`
--

INSERT INTO `tbl_sharepassmembers` (`id`, `UserId`, `Mobileno`, `PassCode`, `PassAmt`, `Date`, `Time`, `RefNo`, `isActive`) VALUES
(130, '6', '', 6, 90, '2019-12-09', '06:43:40', '5', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sharepassnew`
--

CREATE TABLE `tbl_sharepassnew` (
  `id` int(20) NOT NULL,
  `ServiceCity` varchar(100) NOT NULL,
  `KMs` varchar(50) NOT NULL,
  `Size` varchar(50) NOT NULL,
  `Rides` int(20) NOT NULL,
  `Days` int(20) NOT NULL,
  `MaxPrice` float NOT NULL,
  `DispPrice` float NOT NULL,
  `FlatPrice` float NOT NULL,
  `OfferP` float NOT NULL,
  `Description` varchar(200) NOT NULL,
  `fileName` varchar(200) NOT NULL,
  `filePath` varchar(300) NOT NULL,
  `fileFormat` varchar(20) NOT NULL,
  `isActive` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sharepassnew`
--

INSERT INTO `tbl_sharepassnew` (`id`, `ServiceCity`, `KMs`, `Size`, `Rides`, `Days`, `MaxPrice`, `DispPrice`, `FlatPrice`, `OfferP`, `Description`, `fileName`, `filePath`, `fileFormat`, `isActive`) VALUES
(1, 'Chennai', '8KM', 'S-Small', 3, 3, 0, 100, 0, 0, 'dg', 'pass.png', '/upload/sharepass/pass.png-1551268928141.png', 'image/png', 1),
(2, 'Chennai', '12KM', 'S-Small', 3, 4, 0, 0, 0, 0, '', 'download.jpeg', '/upload/sharepass/download.jpeg-1548059746587.jpg', 'image/jpeg', 1),
(3, 'Madurai', '4KM', 'S-Small', 2, 5, 100, 124, 234, 10, 'DG', 'Vector Sketch\'-11.png-1548653481009.png', '/upload/sharepass/Vector Sketch\'-11.png-1548653481009.png-1551268398806.png', 'image/png', 1),
(4, 'Chennai', '8KM', 'M-Medium', 3, 5, 109, 34, 109, 23, 'd', 'Vector Sketch\'-11.png', '/upload/sharepass/Vector Sketch\'-11.png-1548654141999.png', 'image/png', 1),
(5, 'Madurai', '12KM', 'S-Small', 3, 30, 35, 30, 80, 10, 'dg', 'Vector Sketch\'-10.png', '/upload/sharepass/Vector Sketch\'-10.png-1548655120640.png', 'image/png', 1),
(6, 'Chennai', '4KM', 'S-Small', 9, 9, 9009, 90, 90, 0, 'i', '585e4bcdcb11b227491c3396 - Copy.png', '/upload/sharepass/585e4bcdcb11b227491c3396 - Copy.png-1549292951265.png', 'image/png', 1),
(7, 'Chennai', '8KM', 'S-Small', 3, 3, 23, 34, 324, 23, '23', 'Koala - Copy.jpg', '/upload/sharepass/Koala - Copy.jpg-1550294250935.jpg', 'image/jpeg', 1),
(8, 'Chennai', '8KM', 'S-Small', 9, 9, 787, 565, 343, 5, 'h', 'Koala - Copy.jpg', '/upload/sharepass/Koala - Copy.jpg-1550308808203.jpg', 'image/jpeg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sharingrate`
--

CREATE TABLE `tbl_sharingrate` (
  `id` int(20) NOT NULL,
  `ServiceArea` varchar(200) NOT NULL,
  `SharingSize` varchar(50) NOT NULL,
  `sharingprice` double NOT NULL,
  `donkeyprice` double NOT NULL,
  `offerprice` double NOT NULL,
  `SAddlRate` double NOT NULL,
  `SMaxRate` double NOT NULL,
  `SDispRate` double NOT NULL,
  `isActive` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sharingrate`
--

INSERT INTO `tbl_sharingrate` (`id`, `ServiceArea`, `SharingSize`, `sharingprice`, `donkeyprice`, `offerprice`, `SAddlRate`, `SMaxRate`, `SDispRate`, `isActive`) VALUES
(1, 'Chennai', 'S-Small', 45, 25, 34, 0, 0, 0, 1),
(2, 'Madurai', 'S-Small', 34, 34, 34, 0, 0, 0, 1),
(3, 'Madurai', 'M-Medium', 78, 100, 10, 0, 0, 0, 1),
(4, 'Chennai', 'M-Medium', 23, 23, 23, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_state`
--

CREATE TABLE `tbl_state` (
  `id` int(20) NOT NULL,
  `State` varchar(200) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_state`
--

INSERT INTO `tbl_state` (`id`, `State`, `Description`, `isActive`) VALUES
(1, 'Tamilnadu (TN)', 'Tamil', 1),
(2, 'Karnataka (KA)', 'kannada', 1),
(3, 'Kerala (KL)', 'Malayalam', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(10) NOT NULL,
  `UserName` varchar(200) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `UserType` varchar(100) NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `UserName`, `Password`, `UserType`, `isActive`) VALUES
(1, 'Karthick', '12345', 'User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_userdetails`
--

CREATE TABLE `tbl_userdetails` (
  `id` int(20) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Userid` varchar(30) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Mobile` varchar(30) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Aadhar` varchar(15) NOT NULL,
  `DocType` varchar(50) NOT NULL,
  `DocNo` varchar(100) NOT NULL,
  `DOB` varchar(50) NOT NULL,
  `ReferralCode` varchar(10) NOT NULL,
  `CusRefCode` varchar(10) NOT NULL,
  `isActive` int(10) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `OTP` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_userdetails`
--

INSERT INTO `tbl_userdetails` (`id`, `Date`, `Userid`, `Name`, `Gender`, `Mobile`, `Email`, `Aadhar`, `DocType`, `DocNo`, `DOB`, `ReferralCode`, `CusRefCode`, `isActive`, `Password`, `OTP`) VALUES
(1, '2020-09-30', '1', 'sd', 'Male', '9790378394', 'sd', '', '', '', '', '', '', 1, '1234', ''),
(2, '2020-09-30', '2', 'Hareessh', '', '8122995721', '', '', '', '', '', 'YKN21', '', 1, '', ''),
(3, '2020-10-01', '3', 'Gowtham', '', '7010289063', 'ggowtham.theni.gg@gmail.com', '', '', '', '', 'Q9TI1', '', 1, '', ''),
(4, '2020-10-01', '4', 'GUNA', '', '9994860454', '', '', '', '', '', '9Y7H7', '', 1, '', ''),
(5, '2020-10-01', '5', 'Kesav', '', '9444555194', '', '', '', '', '', 'GJF6Z', '', 1, '', ''),
(6, '2020-10-02', '6', 'Linga', '', '7299060419', '', '', '', '', '', 'S4X2H', '', 1, '', ''),
(7, '2020-10-02', '7', 'Linga', '', '7299041906', '', '', '', '', '', 'AX0Q3', '', 1, '', ''),
(8, '2020-10-03', '8', '??????? ', '', '7708239491', '', '', '', '', '', 'KA55T', '', 1, '', ''),
(9, '2020-10-03', '9', 'Karthick', '', '9095204586', 'sdg@gmail.com', '', '', '', '', '13IGY', '', 1, '', ''),
(10, '2020-10-04', '10', 'Bright ', '', '9488666184', '', '', '', '', '', 'SBRME', '', 1, '', ''),
(11, '2020-10-06', '11', 'Nirmala', '', '9894861366', '', '', '', '', '', '77PWO', '', 1, '', ''),
(12, '2020-10-09', '12', 'BRIAN JULIOUS ROY', '', '9947324466', 'brianjuliousroy@gmail.com', '', '', '', '', 'TGW8X', '', 1, '', ''),
(13, '2020-10-09', '13', 'BRIAN JULIOUS ROY', '', '9048118939', 'brianjuliousroy@gmail.com', '', '', '', '', 'FZBRK', '', 1, '', ''),
(14, '2020-10-09', '14', 'Brian', '', '9048481189', '', '', '', '', '', 'VH572', '', 1, '', ''),
(15, '2020-10-12', '15', 'Prakash', '', '7867032568', '', '', '', '', '', 'RQ4KZ', '', 1, '', ''),
(16, '2020-10-12', '16', 'jatinsahni26@gmail.com', '', '9896818150', 'jatinsahni26@gmail.com', '', '', '', '', 'MQR9I', '', 1, '', ''),
(17, '2020-10-15', '17', 'SUBRAMANIAN.M', '', '9842408907', 'mani21061980@gmail.com', '', '', '', '', '0BPOB', '', 1, '', ''),
(18, '2020-10-21', '18', 'Test', '', '9600896874', '', '', '', '', '', '1YPSI', '', 1, '', ''),
(19, '2020-10-21', '19', 'Test', '', '9600896874', '', '', '', '', '', 'JHZF3', '', 1, '', ''),
(20, '2020-10-24', '20', 'Karthi', '', '8667052467', 'Bd@jdj.co', '', '', '', '', '6EC79', '', 1, '', ''),
(21, '2020-10-24', '21', 'Karthi', '', '8667052467', 'Bd@jdj.co', '', '', '', '', 'MJ2Y3', '', 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vehicletype`
--

CREATE TABLE `tbl_vehicletype` (
  `id` int(20) NOT NULL,
  `Category` varchar(200) NOT NULL,
  `VehicleName` varchar(200) NOT NULL,
  `Length` double NOT NULL,
  `Breadth` double NOT NULL,
  `Height` double NOT NULL,
  `Description` varchar(200) NOT NULL,
  `isActive` int(20) NOT NULL,
  `isParcel` varchar(10) NOT NULL,
  `isSharing` varchar(10) NOT NULL,
  `isRental` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_vehicletype`
--

INSERT INTO `tbl_vehicletype` (`id`, `Category`, `VehicleName`, `Length`, `Breadth`, `Height`, `Description`, `isActive`, `isParcel`, `isSharing`, `isRental`) VALUES
(1, 'Micro ', 'Piaggio ape ', 4.1, 4.07, 0.11, 'xtra (560 Kg)', 1, 'false', 'true', 'false'),
(2, 'Micro ', 'Piaggio ape ', 5.05, 4.07, 0.11, 'xtra LD (537 Kg)', 1, 'false', 'true', 'false'),
(3, 'Mini', 'Piaggio Porter ', 7.01, 4.09, 1, 'Diesel (1 Ton)', 1, 'true', 'true', 'false'),
(4, 'Mini', 'Piaggio Porter ', 6.04, 4.07, 1, 'Diesel (700 kg)', 1, 'true', 'true', 'false'),
(5, 'Micro ', 'Piaggio City Xtra ', 4.03, 4.03, 0.06, 'Petrol (250 Kg)', 1, 'false', 'true', 'false'),
(6, 'Micro ', 'Piaggio City Xtra ', 4.03, 4.03, 0.6, 'CNG (348 Kg)', 1, 'false', 'true', 'false'),
(7, 'Micro ', 'Piaggio City Xtra ', 4.03, 4.03, 0.06, 'LPG (363 Kg)', 1, 'false', 'true', 'false'),
(8, 'Mini', 'Mahindra Imperio ', 8.05, 5.08, 2.08, 'SC (1.24 Ton)', 1, 'true', 'true', 'false'),
(9, 'Mini', 'Mahindra Imperio ', 8.05, 5.08, 2.08, 'SC VX (1.22 Ton)', 1, 'true', 'true', 'false'),
(10, 'Mini', 'Mahindra Imperio ', 5.04, 5.08, 2.08, 'DC (1.09 Ton)', 1, 'true', 'true', 'false'),
(11, 'Mini', 'Mahindra Imperio ', 5.04, 5.08, 2.08, 'DC VX (1.07 Ton)', 1, 'true', 'true', 'false'),
(12, 'Micro ', 'Mahindra Alfa ', 5.02, 4.09, 1, 'Alfa, CNG (525 Kg)', 1, 'false', 'true', 'false'),
(13, 'Micro ', 'Mahindra Alfa ', 5.08, 4.09, 1, 'PLUS (505 kg)', 1, 'false', 'true', 'false'),
(14, 'Mini', 'Bolero Pick - Up', 9, 5.06, 2.01, 'Big Bolero Flat Bed (1.5 Ton) / CBC (1.25 Ton)', 1, 'true', 'true', 'false'),
(15, 'Mini', 'Bolero Pick - Up', 7.05, 5, 2.05, '2WD (1.09 Ton) / 4WD (1.01 Ton)', 1, 'true', 'true', 'false'),
(16, 'Mini', 'Bolero Maxi ', 6.11, 4.09, 0.11, '(Maxi truck / CNG) 1 Ton', 1, 'true', 'true', 'false'),
(17, 'Micro ', 'Mahindra Jeeto', 5.04, 4.07, 0.11, 'S - series (S6-11 & S6-16) 600Kg ', 1, 'false', 'true', 'false'),
(18, 'Mini', 'Mahindra Jeeto', 5.1, 4.07, 0.11, 'L-series (L7-11 / L7-16) 700Kg', 1, 'true', 'true', 'false'),
(19, 'Micro ', 'Mahindra Jeeto', 5.1, 4.07, 0.11, 'L-series (L6-11 / L6-16) 600Kg', 1, 'false', 'true', 'false'),
(20, 'Mini', 'Mahindra Jeeto', 6.03, 4.07, 0.11, 'X-series (X7-11 / S7-16) 700Kg', 1, 'true', 'true', 'false'),
(21, 'Mini', 'Mahindra Supro Mini Truck', 7.05, 5, 1, 'Mini Truck (850 Kg) CNG (750 Kg)', 1, 'true', 'true', 'false'),
(22, 'Mini', 'Mahindra Supro Maxi Truck', 8.02, 5, 1, '(Maxi / Maxi CBC) 1 Ton', 1, 'true', 'true', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_voucher`
--

CREATE TABLE `tbl_voucher` (
  `id` int(11) NOT NULL,
  `VoucherNo` int(50) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `VoucherType` varchar(10) NOT NULL,
  `Userid` varchar(10) NOT NULL,
  `Mobileno` varchar(20) NOT NULL,
  `Debit` double NOT NULL,
  `Credit` double NOT NULL,
  `RefNo` varchar(50) NOT NULL,
  `isActive` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_voucher`
--

INSERT INTO `tbl_voucher` (`id`, `VoucherNo`, `Date`, `Time`, `VoucherType`, `Userid`, `Mobileno`, `Debit`, `Credit`, `RefNo`, `isActive`) VALUES
(1, 1, '2019-12-10', '09:36:20', 'wallet', '', '12345678', 299, 0, '', 1),
(2, 2, '2019-12-10', '09:36:24', 'wallet', '', '12345678', 299, 0, '', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_assignbooking`
-- (See below for the actual view)
--
CREATE TABLE `vw_assignbooking` (
`id` int(20)
,`bookingtype` varchar(10)
,`BookingId` varchar(20)
,`Userid` varchar(50)
,`UserMobileno` varchar(25)
,`DriverId` varchar(20)
,`FromLatitude` varchar(20)
,`FromLongitude` varchar(20)
,`Name` varchar(200)
,`FromAddress` varchar(200)
,`isAccept` bigint(20)
,`isReject` bigint(20)
,`noi` varchar(20)
,`toaddress` varchar(200)
,`tolatitude` varchar(20)
,`tolongitude` varchar(20)
,`otp` varchar(10)
,`recotp` varchar(10)
,`isPickup` bigint(20)
,`isDrop` bigint(20)
,`Drivermobile` varchar(12)
,`BookingDate` date
,`BookingTime` time
,`LocalDistance` varchar(12)
,`Total` double
,`NetTotal` double
,`BookDate` datetime
,`Type` varchar(10)
,`Refno` varchar(50)
,`PaymentMode` varchar(20)
,`driver_name` varchar(200)
,`vehicle_number` varchar(20)
,`BDate` varchar(10)
,`BTime` varchar(8)
,`RecName` varchar(200)
,`RecMobile` varchar(20)
,`dlatitude` varchar(20)
,`dlongitude` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_assignbookingcourier`
-- (See below for the actual view)
--
CREATE TABLE `vw_assignbookingcourier` (
`id` int(20)
,`bookingtype` varchar(10)
,`BookingId` varchar(20)
,`Userid` varchar(50)
,`UserMobileno` varchar(25)
,`DriverId` varchar(20)
,`FromLatitude` varchar(20)
,`FromLongitude` varchar(20)
,`Name` varchar(200)
,`FromAddress` varchar(200)
,`isAccept` bigint(11)
,`isReject` bigint(11)
,`noi` int(20)
,`toaddress` varchar(200)
,`tolatitude` varchar(20)
,`tolongitude` varchar(20)
,`otp` varchar(10)
,`recotp` varchar(10)
,`isPickup` bigint(11)
,`isDrop` bigint(11)
,`Drivermobile` varchar(12)
,`BookingDate` date
,`BookingTime` time
,`LocalDistance` float
,`Total` double
,`NetTotal` double
,`BookDate` datetime
,`CourierType` varchar(10)
,`Refno` varchar(50)
,`PaymentMode` varchar(20)
,`driver_name` varchar(200)
,`vehicle_number` varchar(20)
,`BDate` varchar(10)
,`BTime` varchar(8)
,`RecMobile` varchar(20)
,`RecName` varchar(200)
,`dlatitude` varchar(20)
,`dlongitude` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_assignbookingparcel`
-- (See below for the actual view)
--
CREATE TABLE `vw_assignbookingparcel` (
`id` int(20)
,`bookingtype` varchar(10)
,`BookingId` varchar(20)
,`Userid` varchar(20)
,`UserMobileno` varchar(12)
,`DriverId` varchar(20)
,`FromLatitude` varchar(20)
,`FromLongitude` varchar(20)
,`Name` varchar(200)
,`FromAddress` varchar(200)
,`isAccept` int(2)
,`isReject` int(2)
,`noi` varchar(1)
,`toaddress` varchar(200)
,`tolatitude` varchar(20)
,`tolongitude` varchar(20)
,`otp` varchar(10)
,`recotp` varchar(10)
,`isPickup` int(10)
,`isDrop` int(10)
,`Drivermobile` varchar(12)
,`BookingDate` date
,`BookingTime` time
,`LocalDistance` float
,`Total` float
,`NetTotal` float
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_assignbookingrental`
-- (See below for the actual view)
--
CREATE TABLE `vw_assignbookingrental` (
`id` int(20)
,`bookingtype` varchar(10)
,`BookingId` varchar(20)
,`Userid` varchar(20)
,`UserMobileno` varchar(12)
,`DriverId` varchar(20)
,`FromLatitude` varchar(20)
,`FromLongitude` varchar(20)
,`Name` varchar(200)
,`FromAddress` varchar(200)
,`isAccept` int(2)
,`isReject` int(2)
,`noi` varchar(1)
,`toaddress` char(0)
,`tolatitude` char(0)
,`tolongitude` char(0)
,`otp` varchar(10)
,`recotp` varchar(10)
,`isPickup` int(10)
,`isDrop` int(10)
,`Drivermobile` varchar(12)
,`BookingDate` date
,`BookingTime` time
,`LocalDistance` varchar(1)
,`Total` float
,`NetTotal` float
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_checkrating`
-- (See below for the actual view)
--
CREATE TABLE `vw_checkrating` (
`id` int(20)
,`BookingType` varchar(10)
,`BookingId` varchar(20)
,`Userid` varchar(20)
,`Mobileno` varchar(12)
,`DriverId` varchar(20)
,`Drivermobile` varchar(12)
,`isAccept` int(2)
,`isReject` int(2)
,`isPickup` int(10)
,`isDrop` int(10)
,`Remarks` varchar(100)
,`DriverName` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_couponbalance`
-- (See below for the actual view)
--
CREATE TABLE `vw_couponbalance` (
`userid` varchar(30)
,`Mobileno` varchar(12)
,`Couponid` int(10)
,`Debit` decimal(32,0)
,`Credit` decimal(32,0)
,`Balance` decimal(33,0)
,`CouponCode` varchar(10)
,`CouponAmt` float
,`Validity` int(10)
,`CouponType` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_coupondetails`
-- (See below for the actual view)
--
CREATE TABLE `vw_coupondetails` (
`id` int(20)
,`Date` date
,`UserId` varchar(30)
,`Mobileno` varchar(12)
,`Couponid` int(10)
,`Debit` int(10)
,`Credit` int(10)
,`isActive` int(10)
,`ServiceCity` varchar(30)
,`ServiceType` varchar(10)
,`CouponType` varchar(10)
,`CouponCode` varchar(10)
,`CouponAmt` float
,`Validity` int(10)
,`Description` varchar(200)
,`MonthlyLimit` double
,`FileName` varchar(100)
,`FilePath` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_courierbookingassign`
-- (See below for the actual view)
--
CREATE TABLE `vw_courierbookingassign` (
`id` int(50)
,`BookingId` varchar(20)
,`BookingSerial` int(10)
,`BookingDate` date
,`BookingTime` time
,`FromLatitude` varchar(20)
,`FromLongitude` varchar(20)
,`ToLatitude` varchar(20)
,`ToLongitude` varchar(20)
,`FromAddress` varchar(200)
,`ToAddress` varchar(200)
,`CourierType` varchar(10)
,`CourierName` varchar(50)
,`ProductType` varchar(50)
,`LocalAdd1` varchar(200)
,`LocalAdd2` varchar(200)
,`LocalAdd3` varchar(200)
,`DL1` float
,`DB1` float
,`DAmt1` float
,`DL2` float
,`DB2` float
,`DAmt2` float
,`BL1` float
,`BB1` float
,`BH1` float
,`BW1` float
,`BAmt1` float
,`BL2` float
,`BB2` float
,`BH2` float
,`BW2` float
,`BAmt2` float
,`Total` double
,`PaymentMode` varchar(20)
,`CouponCode` varchar(20)
,`CouponAmt` double
,`NetTotal` double
,`isCancel` bit(10)
,`isActive` int(10)
,`Mobileno` varchar(25)
,`OTP` varchar(10)
,`BankRefNo` varchar(50)
,`UserID` varchar(50)
,`RecName` varchar(200)
,`RecMobile` varchar(20)
,`Remarks` varchar(200)
,`LocalDistance` float
,`SAmt` float
,`RecOTP` varchar(10)
,`NOI` int(20)
,`clatitude` varchar(20)
,`clongitude` varchar(20)
,`PersonalMobno` varchar(15)
,`Username` varchar(200)
,`BDate` varchar(10)
,`BTime` varchar(8)
,`BookingType` varchar(10)
,`DriverId` varchar(20)
,`Drivermobile` varchar(12)
,`isPickup` int(10)
,`isDrop` int(10)
,`BRemarks` varchar(100)
,`driver_name` varchar(200)
,`isAccept` int(2)
,`isReject` int(2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_customerbalance`
-- (See below for the actual view)
--
CREATE TABLE `vw_customerbalance` (
`Userid` varchar(30)
,`Mobile` varchar(30)
,`Balance` double
,`moneyHeader` varchar(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_driver`
-- (See below for the actual view)
--
CREATE TABLE `vw_driver` (
`id` int(11)
,`driver_id` varchar(11)
,`drivertype` varchar(20)
,`driver_name` varchar(200)
,`driver_email` varchar(200)
,`driver_phone` varchar(50)
,`driver_lan` varchar(50)
,`driver_address` text
,`year_experience` varchar(10)
,`vehicle_width` varchar(10)
,`vehicle_height` varchar(10)
,`vehicle_depth` varchar(10)
,`vehicle_model` varchar(50)
,`vehicle_number` varchar(20)
,`vehicle_type` varchar(20)
,`driver_image` varchar(200)
,`driver_full_image` varchar(200)
,`driver_aadhar` varchar(200)
,`driver_license` varchar(200)
,`driver_voterId` varchar(200)
,`driver_vehicleImage` varchar(200)
,`driver_ration_gas_book` varchar(200)
,`driver_owner_proof` varchar(200)
,`driverstatus` varchar(20)
,`isactive` int(11)
,`Remarks` varchar(200)
,`driver` varchar(251)
,`status` varchar(10)
,`longitude` varchar(20)
,`latitude` varchar(20)
,`rating` decimal(44,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_hits`
-- (See below for the actual view)
--
CREATE TABLE `vw_hits` (
`RequesterName` varchar(100)
,`Title` varchar(100)
,`hits` bigint(21)
,`Reward` decimal(4,2)
,`created` varchar(26)
,`Description` varchar(200)
,`TimeAllotted` varchar(20)
,`expiredate` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_overallbookingstatus`
-- (See below for the actual view)
--
CREATE TABLE `vw_overallbookingstatus` (
`nbooking` bigint(21)
,`ncancelbooking` bigint(22)
,`ncompletebooking` bigint(21)
,`nincompletebooking` bigint(21)
,`nusers` bigint(21)
,`ndrivers` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_rentalrate`
-- (See below for the actual view)
--
CREATE TABLE `vw_rentalrate` (
`id` int(20)
,`CategoryVehicle` varchar(200)
,`Hours1` int(20)
,`KMs1` int(20)
,`donkeyprice` double
,`offerprice` double
,`Hours2` int(20)
,`KMs2` int(20)
,`price` double
,`rentalprice` double
,`isActive` int(20)
,`ServiceCity` varchar(200)
,`RentalPackages` varchar(47)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_servicearea`
-- (See below for the actual view)
--
CREATE TABLE `vw_servicearea` (
`ServiceCity` varchar(200)
,`ServiceArea` varchar(200)
,`Latitude` varchar(200)
,`Longitude` varchar(200)
,`Radius` double
,`isCourier` varchar(20)
,`isParcel` varchar(20)
,`isSharing` varchar(20)
,`isRental` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_sharepassbalance`
-- (See below for the actual view)
--
CREATE TABLE `vw_sharepassbalance` (
`userid` varchar(10)
,`MobileNo` varchar(12)
,`SharepassCode` int(10)
,`ServiceCity` varchar(100)
,`Size` varchar(50)
,`KMS` varchar(50)
,`Debit` double
,`Credit` double
,`Balance` double
,`Remaining` varchar(39)
,`KM` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_work`
-- (See below for the actual view)
--
CREATE TABLE `vw_work` (
`id` int(11)
,`requesterid` int(20)
,`startDate` datetime
,`expireDate` datetime
,`fileName` varchar(50)
,`filePath` varchar(200)
,`isActive` int(10)
,`isFinish` int(10)
,`isAccept` int(10)
,`RequesterName` varchar(100)
,`Title` varchar(100)
,`Description` varchar(200)
,`Reward` decimal(4,2)
,`TimeAllotted` varchar(20)
,`WorkerType` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_assignbooking`
--
DROP TABLE IF EXISTS `vw_assignbooking`;

CREATE ALGORITHM=UNDEFINED DEFINER=`donkey`@`%` SQL SECURITY DEFINER VIEW `vw_assignbooking`  AS  select `vw_assignbookingcourier`.`id` AS `id`,`vw_assignbookingcourier`.`bookingtype` AS `bookingtype`,`vw_assignbookingcourier`.`BookingId` AS `BookingId`,`vw_assignbookingcourier`.`Userid` AS `Userid`,`vw_assignbookingcourier`.`UserMobileno` AS `UserMobileno`,`vw_assignbookingcourier`.`DriverId` AS `DriverId`,`vw_assignbookingcourier`.`FromLatitude` AS `FromLatitude`,`vw_assignbookingcourier`.`FromLongitude` AS `FromLongitude`,`vw_assignbookingcourier`.`Name` AS `Name`,`vw_assignbookingcourier`.`FromAddress` AS `FromAddress`,`vw_assignbookingcourier`.`isAccept` AS `isAccept`,`vw_assignbookingcourier`.`isReject` AS `isReject`,`vw_assignbookingcourier`.`noi` AS `noi`,`vw_assignbookingcourier`.`toaddress` AS `toaddress`,`vw_assignbookingcourier`.`tolatitude` AS `tolatitude`,`vw_assignbookingcourier`.`tolongitude` AS `tolongitude`,`vw_assignbookingcourier`.`otp` AS `otp`,`vw_assignbookingcourier`.`recotp` AS `recotp`,`vw_assignbookingcourier`.`isPickup` AS `isPickup`,`vw_assignbookingcourier`.`isDrop` AS `isDrop`,`vw_assignbookingcourier`.`Drivermobile` AS `Drivermobile`,`vw_assignbookingcourier`.`BookingDate` AS `BookingDate`,`vw_assignbookingcourier`.`BookingTime` AS `BookingTime`,`vw_assignbookingcourier`.`LocalDistance` AS `LocalDistance`,`vw_assignbookingcourier`.`Total` AS `Total`,`vw_assignbookingcourier`.`NetTotal` AS `NetTotal`,`vw_assignbookingcourier`.`BookDate` AS `BookDate`,`vw_assignbookingcourier`.`CourierType` AS `Type`,`vw_assignbookingcourier`.`Refno` AS `Refno`,`vw_assignbookingcourier`.`PaymentMode` AS `PaymentMode`,`vw_assignbookingcourier`.`driver_name` AS `driver_name`,`vw_assignbookingcourier`.`vehicle_number` AS `vehicle_number`,`vw_assignbookingcourier`.`BDate` AS `BDate`,`vw_assignbookingcourier`.`BTime` AS `BTime`,`vw_assignbookingcourier`.`RecName` AS `RecName`,`vw_assignbookingcourier`.`RecMobile` AS `RecMobile`,`vw_assignbookingcourier`.`dlatitude` AS `dlatitude`,`vw_assignbookingcourier`.`dlongitude` AS `dlongitude` from `vw_assignbookingcourier` union all select `vw_assignbookingparcel`.`id` AS `id`,`vw_assignbookingparcel`.`bookingtype` AS `bookingtype`,`vw_assignbookingparcel`.`BookingId` AS `BookingId`,`vw_assignbookingparcel`.`Userid` AS `Userid`,`vw_assignbookingparcel`.`UserMobileno` AS `UserMobileno`,`vw_assignbookingparcel`.`DriverId` AS `DriverId`,`vw_assignbookingparcel`.`FromLatitude` AS `FromLatitude`,`vw_assignbookingparcel`.`FromLongitude` AS `FromLongitude`,`vw_assignbookingparcel`.`Name` AS `Name`,`vw_assignbookingparcel`.`FromAddress` AS `FromAddress`,`vw_assignbookingparcel`.`isAccept` AS `isAccept`,`vw_assignbookingparcel`.`isReject` AS `isReject`,`vw_assignbookingparcel`.`noi` AS `noi`,`vw_assignbookingparcel`.`toaddress` AS `toaddress`,`vw_assignbookingparcel`.`tolatitude` AS `tolatitude`,`vw_assignbookingparcel`.`tolongitude` AS `tolongitude`,`vw_assignbookingparcel`.`otp` AS `otp`,`vw_assignbookingparcel`.`recotp` AS `recotp`,`vw_assignbookingparcel`.`isPickup` AS `isPickup`,`vw_assignbookingparcel`.`isDrop` AS `isDrop`,`vw_assignbookingparcel`.`Drivermobile` AS `Drivermobile`,`vw_assignbookingparcel`.`BookingDate` AS `BookingDate`,`vw_assignbookingparcel`.`BookingTime` AS `BookingTime`,`vw_assignbookingparcel`.`LocalDistance` AS `LocalDistance`,`vw_assignbookingparcel`.`Total` AS `Total`,`vw_assignbookingparcel`.`NetTotal` AS `NetTotal`,`vw_assignbookingparcel`.`BookingDate` AS `BookDate`,'' AS `Type`,'' AS `Refno`,'' AS `PaymentMode`,'' AS `driver_name`,'' AS `vehicle_number`,'' AS `BDate`,'' AS `BTime`,'' AS `RecName`,'' AS `RecMobile`,'' AS `dlatitude`,'' AS `dlongitude` from `vw_assignbookingparcel` union all select `vw_assignbookingrental`.`id` AS `id`,`vw_assignbookingrental`.`bookingtype` AS `bookingtype`,`vw_assignbookingrental`.`BookingId` AS `BookingId`,`vw_assignbookingrental`.`Userid` AS `Userid`,`vw_assignbookingrental`.`UserMobileno` AS `UserMobileno`,`vw_assignbookingrental`.`DriverId` AS `DriverId`,`vw_assignbookingrental`.`FromLatitude` AS `FromLatitude`,`vw_assignbookingrental`.`FromLongitude` AS `FromLongitude`,`vw_assignbookingrental`.`Name` AS `Name`,`vw_assignbookingrental`.`FromAddress` AS `FromAddress`,`vw_assignbookingrental`.`isAccept` AS `isAccept`,`vw_assignbookingrental`.`isReject` AS `isReject`,`vw_assignbookingrental`.`noi` AS `noi`,`vw_assignbookingrental`.`toaddress` AS `toaddress`,`vw_assignbookingrental`.`tolatitude` AS `tolatitude`,`vw_assignbookingrental`.`tolongitude` AS `tolongitude`,`vw_assignbookingrental`.`otp` AS `otp`,`vw_assignbookingrental`.`recotp` AS `recotp`,`vw_assignbookingrental`.`isPickup` AS `isPickup`,`vw_assignbookingrental`.`isDrop` AS `isDrop`,`vw_assignbookingrental`.`Drivermobile` AS `Drivermobile`,`vw_assignbookingrental`.`BookingDate` AS `BookingDate`,`vw_assignbookingrental`.`BookingTime` AS `BookingTime`,`vw_assignbookingrental`.`LocalDistance` AS `LocalDistance`,`vw_assignbookingrental`.`Total` AS `Total`,`vw_assignbookingrental`.`NetTotal` AS `NetTotal`,`vw_assignbookingrental`.`BookingDate` AS `BookDate`,'' AS `Type`,'' AS `Refno`,'' AS `PaymentMode`,'' AS `driver_name`,'' AS `vehicle_number`,'' AS `BDate`,'' AS `BTime`,'' AS `RecName`,'' AS `RecMobile`,'' AS `dlatitude`,'' AS `dlongitude` from `vw_assignbookingrental` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_assignbookingcourier`
--
DROP TABLE IF EXISTS `vw_assignbookingcourier`;

CREATE ALGORITHM=UNDEFINED DEFINER=`donkey`@`%` SQL SECURITY DEFINER VIEW `vw_assignbookingcourier`  AS  select `tbl_assignbooking`.`id` AS `id`,ifnull(`tbl_assignbooking`.`BookingType`,'Courier') AS `bookingtype`,`tbl_courierbooking`.`BookingId` AS `BookingId`,`tbl_courierbooking`.`UserID` AS `Userid`,`tbl_courierbooking`.`Mobileno` AS `UserMobileno`,`tbl_assignbooking`.`DriverId` AS `DriverId`,`tbl_courierbooking`.`FromLatitude` AS `FromLatitude`,`tbl_courierbooking`.`FromLongitude` AS `FromLongitude`,`tbl_userdetails`.`Name` AS `Name`,`tbl_courierbooking`.`FromAddress` AS `FromAddress`,ifnull(`tbl_assignbooking`.`isAccept`,0) AS `isAccept`,ifnull(`tbl_assignbooking`.`isReject`,0) AS `isReject`,`tbl_courierbooking`.`NOI` AS `noi`,`tbl_courierbooking`.`ToAddress` AS `toaddress`,`tbl_courierbooking`.`ToLatitude` AS `tolatitude`,`tbl_courierbooking`.`ToLongitude` AS `tolongitude`,`tbl_courierbooking`.`OTP` AS `otp`,`tbl_courierbooking`.`RecOTP` AS `recotp`,ifnull(`tbl_assignbooking`.`isPickup`,0) AS `isPickup`,ifnull(`tbl_assignbooking`.`isDrop`,0) AS `isDrop`,`tbl_assignbooking`.`Drivermobile` AS `Drivermobile`,`tbl_courierbooking`.`BookingDate` AS `BookingDate`,`tbl_courierbooking`.`BookingTime` AS `BookingTime`,`tbl_courierbooking`.`LocalDistance` AS `LocalDistance`,`tbl_courierbooking`.`Total` AS `Total`,`tbl_courierbooking`.`NetTotal` AS `NetTotal`,cast(concat(`tbl_courierbooking`.`BookingDate`,' ',`tbl_courierbooking`.`BookingTime`) as datetime) AS `BookDate`,`tbl_courierbooking`.`CourierType` AS `CourierType`,`tbl_courierbooking`.`BankRefNo` AS `Refno`,`tbl_courierbooking`.`PaymentMode` AS `PaymentMode`,`tbl_driver_general_detail`.`driver_name` AS `driver_name`,`tbl_driver_general_detail`.`vehicle_number` AS `vehicle_number`,date_format(`tbl_courierbooking`.`BookingDate`,'%d/%m/%Y') AS `BDate`,date_format(`tbl_courierbooking`.`BookingTime`,'%h:%i %p') AS `BTime`,`tbl_courierbooking`.`RecMobile` AS `RecMobile`,`tbl_courierbooking`.`RecName` AS `RecName`,`tbl_driverstatus`.`latitude` AS `dlatitude`,`tbl_driverstatus`.`longitude` AS `dlongitude` from ((((`tbl_courierbooking` join `tbl_userdetails` on((`tbl_userdetails`.`Mobile` = `tbl_courierbooking`.`Mobileno`))) left join `tbl_assignbooking` on((`tbl_assignbooking`.`BookingId` = `tbl_courierbooking`.`BookingId`))) left join `tbl_driver_general_detail` on((`tbl_driver_general_detail`.`driver_phone` = `tbl_assignbooking`.`Drivermobile`))) left join `tbl_driverstatus` on((`tbl_driverstatus`.`Mobileno` = `tbl_assignbooking`.`Drivermobile`))) where (`tbl_courierbooking`.`isActive` <> '0') ;

-- --------------------------------------------------------

--
-- Structure for view `vw_assignbookingparcel`
--
DROP TABLE IF EXISTS `vw_assignbookingparcel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`donkey`@`%` SQL SECURITY DEFINER VIEW `vw_assignbookingparcel`  AS  select `tbl_assignbooking`.`id` AS `id`,`tbl_assignbooking`.`BookingType` AS `bookingtype`,`tbl_assignbooking`.`BookingId` AS `BookingId`,`tbl_assignbooking`.`Userid` AS `Userid`,`tbl_assignbooking`.`Mobileno` AS `UserMobileno`,`tbl_assignbooking`.`DriverId` AS `DriverId`,`tbl_parcelbooking`.`FromLatitude` AS `FromLatitude`,`tbl_parcelbooking`.`FromLongitude` AS `FromLongitude`,`tbl_userdetails`.`Name` AS `Name`,`tbl_parcelbooking`.`FromAddress` AS `FromAddress`,`tbl_assignbooking`.`isAccept` AS `isAccept`,`tbl_assignbooking`.`isReject` AS `isReject`,'1' AS `noi`,`tbl_parcelbooking`.`ToAddress` AS `toaddress`,`tbl_parcelbooking`.`ToLatitude` AS `tolatitude`,`tbl_parcelbooking`.`ToLongitude` AS `tolongitude`,`tbl_parcelbooking`.`OTP` AS `otp`,`tbl_parcelbooking`.`RecOTP` AS `recotp`,`tbl_assignbooking`.`isPickup` AS `isPickup`,`tbl_assignbooking`.`isDrop` AS `isDrop`,`tbl_assignbooking`.`Drivermobile` AS `Drivermobile`,`tbl_parcelbooking`.`BookingDate` AS `BookingDate`,`tbl_parcelbooking`.`BookingTime` AS `BookingTime`,`tbl_parcelbooking`.`LocalDistance` AS `LocalDistance`,`tbl_parcelbooking`.`Total` AS `Total`,`tbl_parcelbooking`.`NetTotal` AS `NetTotal` from ((`tbl_assignbooking` join `tbl_parcelbooking` on((`tbl_assignbooking`.`BookingId` = `tbl_parcelbooking`.`BookingId`))) join `tbl_userdetails` on((`tbl_assignbooking`.`Userid` = `tbl_userdetails`.`Userid`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_assignbookingrental`
--
DROP TABLE IF EXISTS `vw_assignbookingrental`;

CREATE ALGORITHM=UNDEFINED DEFINER=`donkey`@`%` SQL SECURITY DEFINER VIEW `vw_assignbookingrental`  AS  select `tbl_assignbooking`.`id` AS `id`,`tbl_assignbooking`.`BookingType` AS `bookingtype`,`tbl_assignbooking`.`BookingId` AS `BookingId`,`tbl_assignbooking`.`Userid` AS `Userid`,`tbl_assignbooking`.`Mobileno` AS `UserMobileno`,`tbl_assignbooking`.`DriverId` AS `DriverId`,`tbl_rentalbooking`.`FromLatitude` AS `FromLatitude`,`tbl_rentalbooking`.`FromLongitude` AS `FromLongitude`,`tbl_userdetails`.`Name` AS `Name`,`tbl_rentalbooking`.`FromAddress` AS `FromAddress`,`tbl_assignbooking`.`isAccept` AS `isAccept`,`tbl_assignbooking`.`isReject` AS `isReject`,'1' AS `noi`,'' AS `toaddress`,'' AS `tolatitude`,'' AS `tolongitude`,`tbl_rentalbooking`.`OTP` AS `otp`,`tbl_rentalbooking`.`RecOTP` AS `recotp`,`tbl_assignbooking`.`isPickup` AS `isPickup`,`tbl_assignbooking`.`isDrop` AS `isDrop`,`tbl_assignbooking`.`Drivermobile` AS `Drivermobile`,`tbl_rentalbooking`.`BookingDate` AS `BookingDate`,`tbl_rentalbooking`.`BookingTime` AS `BookingTime`,'0' AS `LocalDistance`,`tbl_rentalbooking`.`NetTotal` AS `Total`,`tbl_rentalbooking`.`NetTotal` AS `NetTotal` from ((`tbl_assignbooking` join `tbl_rentalbooking` on((`tbl_assignbooking`.`BookingId` = `tbl_rentalbooking`.`BookingId`))) join `tbl_userdetails` on((`tbl_assignbooking`.`Userid` = `tbl_userdetails`.`Userid`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_checkrating`
--
DROP TABLE IF EXISTS `vw_checkrating`;

CREATE ALGORITHM=UNDEFINED DEFINER=`donkey`@`%` SQL SECURITY DEFINER VIEW `vw_checkrating`  AS  select `tbl_assignbooking`.`id` AS `id`,`tbl_assignbooking`.`BookingType` AS `BookingType`,`tbl_assignbooking`.`BookingId` AS `BookingId`,`tbl_assignbooking`.`Userid` AS `Userid`,`tbl_assignbooking`.`Mobileno` AS `Mobileno`,`tbl_assignbooking`.`DriverId` AS `DriverId`,`tbl_assignbooking`.`Drivermobile` AS `Drivermobile`,`tbl_assignbooking`.`isAccept` AS `isAccept`,`tbl_assignbooking`.`isReject` AS `isReject`,`tbl_assignbooking`.`isPickup` AS `isPickup`,`tbl_assignbooking`.`isDrop` AS `isDrop`,`tbl_assignbooking`.`Remarks` AS `Remarks`,ifnull((select `tbl_driver_general_detail`.`driver_name` from `tbl_driver_general_detail` where (`tbl_driver_general_detail`.`driver_phone` = `tbl_assignbooking`.`Drivermobile`)),'') AS `DriverName` from `tbl_assignbooking` where ((`tbl_assignbooking`.`isDrop` = '1') and (not(`tbl_assignbooking`.`BookingId` in (select `tbl_rating`.`BookingID` from `tbl_rating`)))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_couponbalance`
--
DROP TABLE IF EXISTS `vw_couponbalance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`donkey`@`%` SQL SECURITY DEFINER VIEW `vw_couponbalance`  AS  select `vw_coupondetails`.`UserId` AS `userid`,`vw_coupondetails`.`Mobileno` AS `Mobileno`,`vw_coupondetails`.`Couponid` AS `Couponid`,sum(`vw_coupondetails`.`Debit`) AS `Debit`,sum(`vw_coupondetails`.`Credit`) AS `Credit`,(sum(`vw_coupondetails`.`Debit`) - sum(`vw_coupondetails`.`Credit`)) AS `Balance`,`vw_coupondetails`.`CouponCode` AS `CouponCode`,`vw_coupondetails`.`CouponAmt` AS `CouponAmt`,`vw_coupondetails`.`Validity` AS `Validity`,`vw_coupondetails`.`CouponType` AS `CouponType` from `vw_coupondetails` where 1 group by `vw_coupondetails`.`UserId`,`vw_coupondetails`.`Mobileno`,`vw_coupondetails`.`Couponid` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_coupondetails`
--
DROP TABLE IF EXISTS `vw_coupondetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`donkey`@`%` SQL SECURITY DEFINER VIEW `vw_coupondetails`  AS  select `tbl_coupondetails`.`id` AS `id`,`tbl_coupondetails`.`Date` AS `Date`,`tbl_coupondetails`.`UserId` AS `UserId`,`tbl_coupondetails`.`Mobileno` AS `Mobileno`,`tbl_coupondetails`.`Couponid` AS `Couponid`,`tbl_coupondetails`.`Debit` AS `Debit`,`tbl_coupondetails`.`Credit` AS `Credit`,`tbl_coupondetails`.`isActive` AS `isActive`,`tbl_couponmaster`.`ServiceCity` AS `ServiceCity`,`tbl_couponmaster`.`ServiceType` AS `ServiceType`,`tbl_couponmaster`.`CouponType` AS `CouponType`,`tbl_couponmaster`.`CouponCode` AS `CouponCode`,`tbl_couponmaster`.`CouponAmt` AS `CouponAmt`,`tbl_couponmaster`.`Validity` AS `Validity`,`tbl_couponmaster`.`Description` AS `Description`,`tbl_couponmaster`.`MonthlyLimit` AS `MonthlyLimit`,`tbl_couponmaster`.`fileName` AS `FileName`,`tbl_couponmaster`.`filePath` AS `FilePath` from (`tbl_coupondetails` join `tbl_couponmaster` on((`tbl_coupondetails`.`Couponid` = `tbl_couponmaster`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_courierbookingassign`
--
DROP TABLE IF EXISTS `vw_courierbookingassign`;

CREATE ALGORITHM=UNDEFINED DEFINER=`donkey`@`%` SQL SECURITY DEFINER VIEW `vw_courierbookingassign`  AS  select `tbl_courierbooking`.`id` AS `id`,`tbl_courierbooking`.`BookingId` AS `BookingId`,`tbl_courierbooking`.`BookingSerial` AS `BookingSerial`,`tbl_courierbooking`.`BookingDate` AS `BookingDate`,`tbl_courierbooking`.`BookingTime` AS `BookingTime`,`tbl_courierbooking`.`FromLatitude` AS `FromLatitude`,`tbl_courierbooking`.`FromLongitude` AS `FromLongitude`,`tbl_courierbooking`.`ToLatitude` AS `ToLatitude`,`tbl_courierbooking`.`ToLongitude` AS `ToLongitude`,`tbl_courierbooking`.`FromAddress` AS `FromAddress`,`tbl_courierbooking`.`ToAddress` AS `ToAddress`,`tbl_courierbooking`.`CourierType` AS `CourierType`,`tbl_courierbooking`.`CourierName` AS `CourierName`,`tbl_courierbooking`.`ProductType` AS `ProductType`,`tbl_courierbooking`.`LocalAdd1` AS `LocalAdd1`,`tbl_courierbooking`.`LocalAdd2` AS `LocalAdd2`,`tbl_courierbooking`.`LocalAdd3` AS `LocalAdd3`,`tbl_courierbooking`.`DL1` AS `DL1`,`tbl_courierbooking`.`DB1` AS `DB1`,`tbl_courierbooking`.`DAmt1` AS `DAmt1`,`tbl_courierbooking`.`DL2` AS `DL2`,`tbl_courierbooking`.`DB2` AS `DB2`,`tbl_courierbooking`.`DAmt2` AS `DAmt2`,`tbl_courierbooking`.`BL1` AS `BL1`,`tbl_courierbooking`.`BB1` AS `BB1`,`tbl_courierbooking`.`BH1` AS `BH1`,`tbl_courierbooking`.`BW1` AS `BW1`,`tbl_courierbooking`.`BAmt1` AS `BAmt1`,`tbl_courierbooking`.`BL2` AS `BL2`,`tbl_courierbooking`.`BB2` AS `BB2`,`tbl_courierbooking`.`BH2` AS `BH2`,`tbl_courierbooking`.`BW2` AS `BW2`,`tbl_courierbooking`.`BAmt2` AS `BAmt2`,`tbl_courierbooking`.`Total` AS `Total`,`tbl_courierbooking`.`PaymentMode` AS `PaymentMode`,`tbl_courierbooking`.`CouponCode` AS `CouponCode`,`tbl_courierbooking`.`CouponAmt` AS `CouponAmt`,`tbl_courierbooking`.`NetTotal` AS `NetTotal`,`tbl_courierbooking`.`isCancel` AS `isCancel`,`tbl_courierbooking`.`isActive` AS `isActive`,`tbl_courierbooking`.`Mobileno` AS `Mobileno`,`tbl_courierbooking`.`OTP` AS `OTP`,`tbl_courierbooking`.`BankRefNo` AS `BankRefNo`,`tbl_courierbooking`.`UserID` AS `UserID`,`tbl_courierbooking`.`RecName` AS `RecName`,`tbl_courierbooking`.`RecMobile` AS `RecMobile`,`tbl_courierbooking`.`Remarks` AS `Remarks`,`tbl_courierbooking`.`LocalDistance` AS `LocalDistance`,`tbl_courierbooking`.`SAmt` AS `SAmt`,`tbl_courierbooking`.`RecOTP` AS `RecOTP`,`tbl_courierbooking`.`NOI` AS `NOI`,`tbl_courierbooking`.`clatitude` AS `clatitude`,`tbl_courierbooking`.`clongitude` AS `clongitude`,`tbl_courierbooking`.`PersonalMobno` AS `PersonalMobno`,`tbl_userdetails`.`Name` AS `Username`,date_format(`tbl_courierbooking`.`BookingDate`,'%d/%m/%Y') AS `BDate`,date_format(`tbl_courierbooking`.`BookingTime`,'%h:%i %p') AS `BTime`,`tbl_assignbooking`.`BookingType` AS `BookingType`,`tbl_assignbooking`.`DriverId` AS `DriverId`,ifnull(`tbl_assignbooking`.`Drivermobile`,'') AS `Drivermobile`,`tbl_assignbooking`.`isPickup` AS `isPickup`,`tbl_assignbooking`.`isDrop` AS `isDrop`,`tbl_assignbooking`.`Remarks` AS `BRemarks`,ifnull((select `tbl_driver_general_detail`.`driver_name` from `tbl_driver_general_detail` where (`tbl_driver_general_detail`.`driver_phone` = `tbl_assignbooking`.`Drivermobile`)),'') AS `driver_name`,`tbl_assignbooking`.`isAccept` AS `isAccept`,`tbl_assignbooking`.`isReject` AS `isReject` from ((`tbl_courierbooking` join `tbl_userdetails` on((`tbl_userdetails`.`Mobile` = `tbl_courierbooking`.`Mobileno`))) left join `tbl_assignbooking` on((`tbl_assignbooking`.`BookingId` = `tbl_courierbooking`.`BookingId`))) order by `tbl_courierbooking`.`BookingDate`,`tbl_courierbooking`.`BookingTime` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_customerbalance`
--
DROP TABLE IF EXISTS `vw_customerbalance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`donkey`@`%` SQL SECURITY DEFINER VIEW `vw_customerbalance`  AS  select `tbl_userdetails`.`Userid` AS `Userid`,`tbl_userdetails`.`Mobile` AS `Mobile`,ifnull((sum(`tbl_voucher`.`Debit`) - sum(`tbl_voucher`.`Credit`)),0) AS `Balance`,(case when (ifnull((sum(`tbl_voucher`.`Debit`) - sum(`tbl_voucher`.`Credit`)),0) <= 0) then 'Low Balance' else '' end) AS `moneyHeader` from (`tbl_userdetails` left join `tbl_voucher` on((`tbl_userdetails`.`Mobile` = `tbl_voucher`.`Mobileno`))) group by `tbl_userdetails`.`Userid`,`tbl_userdetails`.`Mobile` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_driver`
--
DROP TABLE IF EXISTS `vw_driver`;

CREATE ALGORITHM=UNDEFINED DEFINER=`donkey`@`%` SQL SECURITY DEFINER VIEW `vw_driver`  AS  select `tbl_driver_general_detail`.`id` AS `id`,`tbl_driver_general_detail`.`driver_id` AS `driver_id`,`tbl_driver_general_detail`.`drivertype` AS `drivertype`,`tbl_driver_general_detail`.`driver_name` AS `driver_name`,`tbl_driver_general_detail`.`driver_email` AS `driver_email`,`tbl_driver_general_detail`.`driver_phone` AS `driver_phone`,`tbl_driver_general_detail`.`driver_lan` AS `driver_lan`,`tbl_driver_general_detail`.`driver_address` AS `driver_address`,`tbl_driver_general_detail`.`year_experience` AS `year_experience`,`tbl_driver_general_detail`.`vehicle_width` AS `vehicle_width`,`tbl_driver_general_detail`.`vehicle_height` AS `vehicle_height`,`tbl_driver_general_detail`.`vehicle_depth` AS `vehicle_depth`,`tbl_driver_general_detail`.`vehicle_model` AS `vehicle_model`,`tbl_driver_general_detail`.`vehicle_number` AS `vehicle_number`,`tbl_driver_general_detail`.`vehicle_type` AS `vehicle_type`,`tbl_driver_general_detail`.`driver_image` AS `driver_image`,`tbl_driver_general_detail`.`driver_full_image` AS `driver_full_image`,`tbl_driver_general_detail`.`driver_aadhar` AS `driver_aadhar`,`tbl_driver_general_detail`.`driver_license` AS `driver_license`,`tbl_driver_general_detail`.`driver_voterId` AS `driver_voterId`,`tbl_driver_general_detail`.`driver_vehicleImage` AS `driver_vehicleImage`,`tbl_driver_general_detail`.`driver_ration_gas_book` AS `driver_ration_gas_book`,`tbl_driver_general_detail`.`driver_owner_proof` AS `driver_owner_proof`,`tbl_driver_general_detail`.`driverstatus` AS `driverstatus`,`tbl_driver_general_detail`.`isactive` AS `isactive`,`tbl_driver_general_detail`.`Remarks` AS `Remarks`,concat(`tbl_driver_general_detail`.`driver_name`,'-',`tbl_driver_general_detail`.`driver_phone`) AS `driver`,`tbl_driverstatus`.`isMadmoney` AS `status`,`tbl_driverstatus`.`latitude` AS `longitude`,`tbl_driverstatus`.`longitude` AS `latitude`,round(ifnull((select (sum(`tbl_rating`.`Rating`) / count(`tbl_rating`.`DriverMobile`)) from `tbl_rating` where (`tbl_rating`.`DriverMobile` = `tbl_driver_general_detail`.`driver_phone`)),0),2) AS `rating` from (`tbl_driver_general_detail` join `tbl_driverstatus` on((`tbl_driverstatus`.`Driverid` = `tbl_driver_general_detail`.`driver_id`))) where (`tbl_driver_general_detail`.`isactive` <> 0) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_hits`
--
DROP TABLE IF EXISTS `vw_hits`;

CREATE ALGORITHM=UNDEFINED DEFINER=`donkey`@`%` SQL SECURITY DEFINER VIEW `vw_hits`  AS  select distinct `vw_work`.`RequesterName` AS `RequesterName`,`vw_work`.`Title` AS `Title`,ifnull((select count(0) from `tblwork` where ((`tblwork`.`requesterid` = `vw_work`.`requesterid`) and (cast(`tblwork`.`expireDate` as date) = cast(`vw_work`.`expireDate` as date)) and (`tblwork`.`isActive` <> '0'))),0) AS `hits`,`vw_work`.`Reward` AS `Reward`,concat(cast(timestampdiff(HOUR,`vw_work`.`startDate`,curtime()) as char charset utf8mb4),'h ago') AS `created`,`vw_work`.`Description` AS `Description`,`vw_work`.`TimeAllotted` AS `TimeAllotted`,cast(`vw_work`.`expireDate` as date) AS `expiredate` from `vw_work` where (`vw_work`.`isActive` <> '0') ;

-- --------------------------------------------------------

--
-- Structure for view `vw_overallbookingstatus`
--
DROP TABLE IF EXISTS `vw_overallbookingstatus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`donkey`@`%` SQL SECURITY DEFINER VIEW `vw_overallbookingstatus`  AS  select ifnull((select count(0) from `vw_courierbookingassign`),0) AS `nbooking`,(ifnull((select count(0) from `vw_courierbookingassign` where (`vw_courierbookingassign`.`isReject` = '1')),0) + ifnull((select count(0) from `tbl_courierbooking` where (`tbl_courierbooking`.`isActive` = '0')),0)) AS `ncancelbooking`,ifnull((select count(0) from `tbl_assignbooking` where (`tbl_assignbooking`.`isDrop` = 1)),0) AS `ncompletebooking`,ifnull((select count(0) from `vw_courierbookingassign` where (((`vw_courierbookingassign`.`isPickup` = 0) or (`vw_courierbookingassign`.`isDrop` = 0)) and (`vw_courierbookingassign`.`BookingType` is not null) and (`vw_courierbookingassign`.`isReject` = 0) and (`vw_courierbookingassign`.`isActive` <> 0))),0) AS `nincompletebooking`,ifnull((select count(0) from `tbl_userdetails` where (`tbl_userdetails`.`isActive` <> 0)),0) AS `nusers`,ifnull((select count(0) from `tbl_driver_general_detail`),0) AS `ndrivers` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_rentalrate`
--
DROP TABLE IF EXISTS `vw_rentalrate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`donkey`@`%` SQL SECURITY DEFINER VIEW `vw_rentalrate`  AS  (select `tbl_rentalrate`.`id` AS `id`,`tbl_rentalrate`.`CategoryVehicle` AS `CategoryVehicle`,`tbl_rentalrate`.`Hours1` AS `Hours1`,`tbl_rentalrate`.`KMs1` AS `KMs1`,`tbl_rentalrate`.`donkeyprice` AS `donkeyprice`,`tbl_rentalrate`.`offerprice` AS `offerprice`,`tbl_rentalrate`.`Hours2` AS `Hours2`,`tbl_rentalrate`.`KMs2` AS `KMs2`,`tbl_rentalrate`.`price` AS `price`,`tbl_rentalrate`.`rentalprice` AS `rentalprice`,`tbl_rentalrate`.`isActive` AS `isActive`,`tbl_rentalrate`.`ServiceCity` AS `ServiceCity`,concat(`tbl_rentalrate`.`Hours1`,'Hrs-',`tbl_rentalrate`.`KMs1`,'Kms') AS `RentalPackages` from `tbl_rentalrate`) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_servicearea`
--
DROP TABLE IF EXISTS `vw_servicearea`;

CREATE ALGORITHM=UNDEFINED DEFINER=`donkey`@`%` SQL SECURITY DEFINER VIEW `vw_servicearea`  AS  select `tbl_servicearea1`.`ServiceCity` AS `ServiceCity`,`tbl_servicearea1`.`ServiceArea` AS `ServiceArea`,`tbl_servicearea1`.`Latitude` AS `Latitude`,`tbl_servicearea1`.`Longitude` AS `Longitude`,`tbl_servicearea1`.`Radius` AS `Radius`,`tbl_servicearea`.`isCourier` AS `isCourier`,`tbl_servicearea`.`isParcel` AS `isParcel`,`tbl_servicearea`.`isSharing` AS `isSharing`,`tbl_servicearea`.`isRental` AS `isRental` from (`tbl_servicearea1` join `tbl_servicearea` on((`tbl_servicearea1`.`ServiceCity` = `tbl_servicearea`.`ServiceArea`))) where 1 ;

-- --------------------------------------------------------

--
-- Structure for view `vw_sharepassbalance`
--
DROP TABLE IF EXISTS `vw_sharepassbalance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`donkey`@`%` SQL SECURITY DEFINER VIEW `vw_sharepassbalance`  AS  select `d`.`userid` AS `userid`,`d`.`MobileNo` AS `MobileNo`,`d`.`SharepassCode` AS `SharepassCode`,`d`.`ServiceCity` AS `ServiceCity`,`d`.`Size` AS `Size`,`d`.`KMS` AS `KMS`,`d`.`Debit` AS `Debit`,`d`.`Credit` AS `Credit`,`d`.`Balance` AS `Balance`,`d`.`Remaining` AS `Remaining`,cast(replace(`d`.`KMS`,'KM','') as signed) AS `KM` from (select `tbl_sharepassdetails`.`UserId` AS `userid`,`tbl_sharepassdetails`.`MobileNo` AS `MobileNo`,`tbl_sharepassdetails`.`SharepassCode` AS `SharepassCode`,(select `tbl_sharepassnew`.`ServiceCity` from `tbl_sharepassnew` where (`tbl_sharepassnew`.`id` = `tbl_sharepassdetails`.`SharepassCode`)) AS `ServiceCity`,(select `tbl_sharepassnew`.`Size` from `tbl_sharepassnew` where (`tbl_sharepassnew`.`id` = `tbl_sharepassdetails`.`SharepassCode`)) AS `Size`,(select `tbl_sharepassnew`.`KMs` from `tbl_sharepassnew` where (`tbl_sharepassnew`.`id` = `tbl_sharepassdetails`.`SharepassCode`)) AS `KMS`,sum(`tbl_sharepassdetails`.`Debit`) AS `Debit`,sum(`tbl_sharepassdetails`.`Credit`) AS `Credit`,(sum(`tbl_sharepassdetails`.`Debit`) - sum(`tbl_sharepassdetails`.`Credit`)) AS `Balance`,concat('Remaining Items:',(sum(`tbl_sharepassdetails`.`Debit`) - sum(`tbl_sharepassdetails`.`Credit`))) AS `Remaining` from `tbl_sharepassdetails` group by `tbl_sharepassdetails`.`UserId`,`tbl_sharepassdetails`.`MobileNo`,`tbl_sharepassdetails`.`SharepassCode`) `d` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_work`
--
DROP TABLE IF EXISTS `vw_work`;

CREATE ALGORITHM=UNDEFINED DEFINER=`donkey`@`%` SQL SECURITY DEFINER VIEW `vw_work`  AS  select `tblwork`.`id` AS `id`,`tblwork`.`requesterid` AS `requesterid`,`tblwork`.`startDate` AS `startDate`,`tblwork`.`expireDate` AS `expireDate`,`tblwork`.`fileName` AS `fileName`,`tblwork`.`filePath` AS `filePath`,`tblwork`.`isActive` AS `isActive`,`tblwork`.`isFinish` AS `isFinish`,`tblwork`.`isAccept` AS `isAccept`,`tblrequester`.`RequesterName` AS `RequesterName`,`tblrequester`.`Title` AS `Title`,`tblrequester`.`Description` AS `Description`,`tblrequester`.`Reward` AS `Reward`,`tblrequester`.`TimeAllotted` AS `TimeAllotted`,`tblrequester`.`WorkerType` AS `WorkerType` from (`tblwork` join `tblrequester` on((`tblrequester`.`ID` = `tblwork`.`requesterid`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbllogs`
--
ALTER TABLE `tbllogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblrequester`
--
ALTER TABLE `tblrequester`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblwork`
--
ALTER TABLE `tblwork`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_assignbooking`
--
ALTER TABLE `tbl_assignbooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_complaints`
--
ALTER TABLE `tbl_complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_coupondetails`
--
ALTER TABLE `tbl_coupondetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_courierbooking`
--
ALTER TABLE `tbl_courierbooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_driverstatus`
--
ALTER TABLE `tbl_driverstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_driverstatuslog`
--
ALTER TABLE `tbl_driverstatuslog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_driver_general_detail`
--
ALTER TABLE `tbl_driver_general_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_employees`
--
ALTER TABLE `tbl_employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_otplist`
--
ALTER TABLE `tbl_otplist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_reason`
--
ALTER TABLE `tbl_reason`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbllogs`
--
ALTER TABLE `tbllogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tblwork`
--
ALTER TABLE `tblwork`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_assignbooking`
--
ALTER TABLE `tbl_assignbooking`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_coupondetails`
--
ALTER TABLE `tbl_coupondetails`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `tbl_courierbooking`
--
ALTER TABLE `tbl_courierbooking`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tbl_driverstatus`
--
ALTER TABLE `tbl_driverstatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_driverstatuslog`
--
ALTER TABLE `tbl_driverstatuslog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_driver_general_detail`
--
ALTER TABLE `tbl_driver_general_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_otplist`
--
ALTER TABLE `tbl_otplist`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_basic
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    01-04-2023 11:20:33
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_basic'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_basic" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_basic";


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(10) unsigned NOT NULL,
  "admin_name" varchar(50) NOT NULL,
  "admin_email" varchar(50) NOT NULL,
  "admin_password" varchar(50) NOT NULL,
  PRIMARY KEY  ("admin_id")
);



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_name", "admin_email", "admin_password") VALUES
	('1','admin','admin@gmail.com','admin123');
/*!40000 ALTER TABLE "tbl_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_assign'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_assign" (
  "assign_id" int(10) unsigned NOT NULL auto_increment,
  "request_id" int(10) unsigned NOT NULL,
  "driver_id" int(10) unsigned NOT NULL,
  "vechile_id" varchar(50) NOT NULL,
  "assigned_status" varchar(50) NOT NULL,
  "company_id" int(11) default '0',
  "panchayath_id" int(11) default '0',
  PRIMARY KEY  ("assign_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_assign'
#

LOCK TABLES "tbl_assign" WRITE;
/*!40000 ALTER TABLE "tbl_assign" DISABLE KEYS;*/
REPLACE INTO "tbl_assign" ("assign_id", "request_id", "driver_id", "vechile_id", "assigned_status", "company_id", "panchayath_id") VALUES
	('1','2','9','3','0',4,0);
REPLACE INTO "tbl_assign" ("assign_id", "request_id", "driver_id", "vechile_id", "assigned_status", "company_id", "panchayath_id") VALUES
	('3','4','11','3','0',4,0);
REPLACE INTO "tbl_assign" ("assign_id", "request_id", "driver_id", "vechile_id", "assigned_status", "company_id", "panchayath_id") VALUES
	('4','6','7','1','0',1,0);
REPLACE INTO "tbl_assign" ("assign_id", "request_id", "driver_id", "vechile_id", "assigned_status", "company_id", "panchayath_id") VALUES
	('5','1','7','12','0',1,0);
/*!40000 ALTER TABLE "tbl_assign" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_category'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_category" (
  "category_id" int(10) unsigned NOT NULL auto_increment,
  "category_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("category_id")
) AUTO_INCREMENT=10;



#
# Dumping data for table 'tbl_category'
#

LOCK TABLES "tbl_category" WRITE;
/*!40000 ALTER TABLE "tbl_category" DISABLE KEYS;*/
REPLACE INTO "tbl_category" ("category_id", "category_name") VALUES
	('7','Biodegradeable');
REPLACE INTO "tbl_category" ("category_id", "category_name") VALUES
	('9','Non Biodegradeable');
/*!40000 ALTER TABLE "tbl_category" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_company'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_company" (
  "company_id" int(10) unsigned NOT NULL auto_increment,
  "company_name" varchar(50) NOT NULL,
  "company_address" varchar(50) NOT NULL,
  "company_contact" varchar(50) NOT NULL,
  "company_email" varchar(50) NOT NULL,
  "company_logo" varchar(50) NOT NULL,
  "company_proof" varchar(50) NOT NULL,
  "place_id" int(10) NOT NULL,
  "company_password" varchar(50) NOT NULL,
  "company_doj" varchar(50) NOT NULL,
  "company_vstatus" varchar(50) NOT NULL default '0',
  PRIMARY KEY  ("company_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_company'
#

LOCK TABLES "tbl_company" WRITE;
/*!40000 ALTER TABLE "tbl_company" DISABLE KEYS;*/
REPLACE INTO "tbl_company" ("company_id", "company_name", "company_address", "company_contact", "company_email", "company_logo", "company_proof", "place_id", "company_password", "company_doj", "company_vstatus") VALUES
	('1','Go clean','kkkk','9876543212','goclean@gmail.com','Company1867.png','CProof1866.png',3,'goclean1234','2023-01-26','1');
REPLACE INTO "tbl_company" ("company_id", "company_name", "company_address", "company_contact", "company_email", "company_logo", "company_proof", "place_id", "company_password", "company_doj", "company_vstatus") VALUES
	('2','cleanindia','yfhkfhk','7878905432','cleanindia@gmail.com','Company1407.png','CProof1307.png',4,'cleanindia123','2023-02-04','2');
REPLACE INTO "tbl_company" ("company_id", "company_name", "company_address", "company_contact", "company_email", "company_logo", "company_proof", "place_id", "company_password", "company_doj", "company_vstatus") VALUES
	('3','cleaneco','gkhgjjnmgg','8787654435','cleaneco@gmail.com','Company2039.png','CProof1796.png',4,'cleaneco123','2023-02-09','1');
REPLACE INTO "tbl_company" ("company_id", "company_name", "company_address", "company_contact", "company_email", "company_logo", "company_proof", "place_id", "company_password", "company_doj", "company_vstatus") VALUES
	('4','cleanv','qqqqqqqqqqqqqqq','8787654435','cleanv@gmail.com','Company1630.png','CProof1068.png',1,'cleanv123','2023-02-25','1');
REPLACE INTO "tbl_company" ("company_id", "company_name", "company_address", "company_contact", "company_email", "company_logo", "company_proof", "place_id", "company_password", "company_doj", "company_vstatus") VALUES
	('5','Ecoclean','ytruytiy','9894564321','ecoclean@gmail.com','Company1406.png','CProof1051.png',5,'ecoclean123','2023-02-27','0');
/*!40000 ALTER TABLE "tbl_company" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_complaint'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaint" (
  "complaint_id" int(10) unsigned NOT NULL auto_increment,
  "complainttype_id" int(10) unsigned NOT NULL,
  "complaint_description" varchar(50) NOT NULL,
  "complaint_date" varchar(50) NOT NULL,
  "complaint_status" varchar(50) NOT NULL default '0',
  "user_id" int(10) unsigned NOT NULL,
  "complaint_reply" varchar(50) NOT NULL default 'not replyed',
  PRIMARY KEY  ("complaint_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_complaint'
#

LOCK TABLES "tbl_complaint" WRITE;
/*!40000 ALTER TABLE "tbl_complaint" DISABLE KEYS;*/
REPLACE INTO "tbl_complaint" ("complaint_id", "complainttype_id", "complaint_description", "complaint_date", "complaint_status", "user_id", "complaint_reply") VALUES
	('2','6','fdfgjgfjghfkgh','2023-02-26','1','1','tt');
REPLACE INTO "tbl_complaint" ("complaint_id", "complainttype_id", "complaint_description", "complaint_date", "complaint_status", "user_id", "complaint_reply") VALUES
	('3','6','gfggvgv','2023-03-13','0','1','not replyed');
REPLACE INTO "tbl_complaint" ("complaint_id", "complainttype_id", "complaint_description", "complaint_date", "complaint_status", "user_id", "complaint_reply") VALUES
	('4','6','trut','2023-03-15','0','1','not replyed');
/*!40000 ALTER TABLE "tbl_complaint" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_complainttype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complainttype" (
  "complainttype_id" int(10) unsigned NOT NULL auto_increment,
  "complainttype_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("complainttype_id")
) AUTO_INCREMENT=8;



#
# Dumping data for table 'tbl_complainttype'
#

LOCK TABLES "tbl_complainttype" WRITE;
/*!40000 ALTER TABLE "tbl_complainttype" DISABLE KEYS;*/
REPLACE INTO "tbl_complainttype" ("complainttype_id", "complainttype_name") VALUES
	('6','Transport');
REPLACE INTO "tbl_complainttype" ("complainttype_id", "complainttype_name") VALUES
	('7','Arrival');
/*!40000 ALTER TABLE "tbl_complainttype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(10) unsigned NOT NULL auto_increment,
  "district_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("district_id")
) AUTO_INCREMENT=12;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('7','Trissur');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('8','Kollam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('9','Kottayam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('10','Ernakulam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('11','Trivandrum');
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_driver'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_driver" (
  "driver_id" int(10) unsigned NOT NULL auto_increment,
  "driver_name" varchar(50) NOT NULL,
  "driver_address" varchar(50) NOT NULL,
  "driver_contact" varchar(50) NOT NULL,
  "driver_email" varchar(50) NOT NULL,
  "driver_gender" varchar(50) NOT NULL,
  "driver_dob" varchar(50) NOT NULL,
  "location_id" int(10) unsigned NOT NULL,
  "driver_photo" varchar(50) NOT NULL,
  "driver_proof" varchar(50) NOT NULL,
  "driver_password" varchar(50) NOT NULL,
  "panchayath_id" int(50) NOT NULL default '0',
  "driver_doj" varchar(50) NOT NULL,
  "company_id" int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ("driver_id")
) AUTO_INCREMENT=13;



#
# Dumping data for table 'tbl_driver'
#

LOCK TABLES "tbl_driver" WRITE;
/*!40000 ALTER TABLE "tbl_driver" DISABLE KEYS;*/
REPLACE INTO "tbl_driver" ("driver_id", "driver_name", "driver_address", "driver_contact", "driver_email", "driver_gender", "driver_dob", "location_id", "driver_photo", "driver_proof", "driver_password", "panchayath_id", "driver_doj", "company_id") VALUES
	('7','Ram','rdhfjfjf','9876543456','ram@gmail.com','Male','2023-02-22','6','Driver1028.png','DProof1632.png','ram123',0,'2023-02-26','1');
REPLACE INTO "tbl_driver" ("driver_id", "driver_name", "driver_address", "driver_contact", "driver_email", "driver_gender", "driver_dob", "location_id", "driver_photo", "driver_proof", "driver_password", "panchayath_id", "driver_doj", "company_id") VALUES
	('8','Smith','jgvjhl','7676898965','smith@gmail.com','Male','2023-02-03','9','Driver1749.png','DProof1041.png','smith123',1,'2023-02-26','0');
REPLACE INTO "tbl_driver" ("driver_id", "driver_name", "driver_address", "driver_contact", "driver_email", "driver_gender", "driver_dob", "location_id", "driver_photo", "driver_proof", "driver_password", "panchayath_id", "driver_doj", "company_id") VALUES
	('9','alex','gfjgh','9999888876','alex@gmail.com','Male','2023-02-27','7','Driver1121.jpg','DProof1904.jpg','alex123',0,'2023-03-13','4');
REPLACE INTO "tbl_driver" ("driver_id", "driver_name", "driver_address", "driver_contact", "driver_email", "driver_gender", "driver_dob", "location_id", "driver_photo", "driver_proof", "driver_password", "panchayath_id", "driver_doj", "company_id") VALUES
	('10','manu','hgfjgvj','5566553456','manu@gmail.com','Male','2023-03-01','8','Driver1051.jpg','DProof1471.jpg','manu123',1,'2023-03-13','0');
REPLACE INTO "tbl_driver" ("driver_id", "driver_name", "driver_address", "driver_contact", "driver_email", "driver_gender", "driver_dob", "location_id", "driver_photo", "driver_proof", "driver_password", "panchayath_id", "driver_doj", "company_id") VALUES
	('11','anu','ytfugj','9999888877','anu@gmail.com','Female','2023-03-16','6','Driver1733.jpg','DProof1256.jpg','anu123',0,'2023-03-15','4');
REPLACE INTO "tbl_driver" ("driver_id", "driver_name", "driver_address", "driver_contact", "driver_email", "driver_gender", "driver_dob", "location_id", "driver_photo", "driver_proof", "driver_password", "panchayath_id", "driver_doj", "company_id") VALUES
	('12','john','jihgutgfy','9887654323','john@gmail.com','Male','2023-03-01','7','Driver1530.jpg','DProof1746.jpg','john123',1,'2023-03-15','0');
/*!40000 ALTER TABLE "tbl_driver" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_ewasterate'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_ewasterate" (
  "ewasterate_id" int(10) unsigned NOT NULL auto_increment,
  "ewaste_name" varchar(50) NOT NULL,
  "ewaste_rate" varchar(50) NOT NULL,
  "ewaste_mode" varchar(50) NOT NULL,
  "subcategory_id" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("ewasterate_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_ewasterate'
#

LOCK TABLES "tbl_ewasterate" WRITE;
/*!40000 ALTER TABLE "tbl_ewasterate" DISABLE KEYS;*/
REPLACE INTO "tbl_ewasterate" ("ewasterate_id", "ewaste_name", "ewaste_rate", "ewaste_mode", "subcategory_id") VALUES
	('1','Newspaper','100','pay','1');
REPLACE INTO "tbl_ewasterate" ("ewasterate_id", "ewaste_name", "ewaste_rate", "ewaste_mode", "subcategory_id") VALUES
	('2','Spoiled food','350','pay','2');
REPLACE INTO "tbl_ewasterate" ("ewasterate_id", "ewaste_name", "ewaste_rate", "ewaste_mode", "subcategory_id") VALUES
	('3','Hard paper','50','pay','1');
/*!40000 ALTER TABLE "tbl_ewasterate" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_feedback'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_feedback" (
  "feedback_id" int(10) unsigned NOT NULL auto_increment,
  "feedback_description" varchar(50) NOT NULL,
  "feedback_date" varchar(50) NOT NULL,
  "user_id" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("feedback_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_feedback'
#

LOCK TABLES "tbl_feedback" WRITE;
/*!40000 ALTER TABLE "tbl_feedback" DISABLE KEYS;*/
REPLACE INTO "tbl_feedback" ("feedback_id", "feedback_description", "feedback_date", "user_id") VALUES
	('1','excellent service','2023-02-26','1');
REPLACE INTO "tbl_feedback" ("feedback_id", "feedback_description", "feedback_date", "user_id") VALUES
	('4','hiiiiii','2023-03-13','1');
REPLACE INTO "tbl_feedback" ("feedback_id", "feedback_description", "feedback_date", "user_id") VALUES
	('5','good','2023-03-15','1');
/*!40000 ALTER TABLE "tbl_feedback" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_location'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_location" (
  "location_id" int(10) unsigned NOT NULL auto_increment,
  "location_name" varchar(50) NOT NULL,
  "place_id" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("location_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_location'
#

LOCK TABLES "tbl_location" WRITE;
/*!40000 ALTER TABLE "tbl_location" DISABLE KEYS;*/
REPLACE INTO "tbl_location" ("location_id", "location_name", "place_id") VALUES
	('1','Kadathy','1');
REPLACE INTO "tbl_location" ("location_id", "location_name", "place_id") VALUES
	('2','Athirapilly','3');
REPLACE INTO "tbl_location" ("location_id", "location_name", "place_id") VALUES
	('3','Beach road','6');
REPLACE INTO "tbl_location" ("location_id", "location_name", "place_id") VALUES
	('4','Vaikyam temple road','5');
REPLACE INTO "tbl_location" ("location_id", "location_name", "place_id") VALUES
	('5','NH bypass','2');
REPLACE INTO "tbl_location" ("location_id", "location_name", "place_id") VALUES
	('6','Beach','3');
/*!40000 ALTER TABLE "tbl_location" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_panchayath'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_panchayath" (
  "panchayath_id" int(10) unsigned NOT NULL auto_increment,
  "panchayath_name" varchar(50) NOT NULL,
  "panchayath_address" varchar(50) NOT NULL,
  "panchayath_contact" varchar(10) NOT NULL,
  "panchayath_email" varchar(50) NOT NULL,
  "panchayath_photo" varchar(50) NOT NULL,
  "place_id" int(10) unsigned NOT NULL,
  "panchyath_password" varchar(50) NOT NULL,
  PRIMARY KEY  ("panchayath_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_panchayath'
#

LOCK TABLES "tbl_panchayath" WRITE;
/*!40000 ALTER TABLE "tbl_panchayath" DISABLE KEYS;*/
REPLACE INTO "tbl_panchayath" ("panchayath_id", "panchayath_name", "panchayath_address", "panchayath_contact", "panchayath_email", "panchayath_photo", "place_id", "panchyath_password") VALUES
	('1','Mekkadambbu','hgjvvbj','9898767654','Mekkadambbu@gmail.com','Panchayath 1358.png','1','mekkadambbu123');
REPLACE INTO "tbl_panchayath" ("panchayath_id", "panchayath_name", "panchayath_address", "panchayath_contact", "panchayath_email", "panchayath_photo", "place_id", "panchyath_password") VALUES
	('2','Kottiyam','ghcjgvbhk','9898987676','kottiyam@gmail.com','Panchayath 2045.png','4','kottiyam123');
REPLACE INTO "tbl_panchayath" ("panchayath_id", "panchayath_name", "panchayath_address", "panchayath_contact", "panchayath_email", "panchayath_photo", "place_id", "panchyath_password") VALUES
	('3','vaikyam','gfjhgjkhkgbhb','7654323456','vaikyam@gmail.com','Panchayath 1535.png','5','vaikyam123');
REPLACE INTO "tbl_panchayath" ("panchayath_id", "panchayath_name", "panchayath_address", "panchayath_contact", "panchayath_email", "panchayath_photo", "place_id", "panchyath_password") VALUES
	('4','Chalakudy','gfkghvbkjh','7809834215','chalakudy@gmail.com','Panchayath 1004.png','3','chalakudy123');
REPLACE INTO "tbl_panchayath" ("panchayath_id", "panchayath_name", "panchayath_address", "panchayath_contact", "panchayath_email", "panchayath_photo", "place_id", "panchyath_password") VALUES
	('5','Mayyanad','cjgvjkbljblj','6767543267','mayyanad@gmail.com','Panchayath 1347.png','6','mayyanad123');
/*!40000 ALTER TABLE "tbl_panchayath" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" int(10) unsigned NOT NULL auto_increment,
  "place_name" varchar(50) NOT NULL,
  "district_id" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("place_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_place'
#

LOCK TABLES "tbl_place" WRITE;
/*!40000 ALTER TABLE "tbl_place" DISABLE KEYS;*/
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('1','Muvattupuzha','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('2','Kakkanad','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('3','Chalakudy','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('4','Kottiyam','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('5','Vaikyam','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('6','Mayyanad','8');
/*!40000 ALTER TABLE "tbl_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_request'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_request" (
  "request_id" int(10) unsigned NOT NULL auto_increment,
  "request_details" varchar(50) NOT NULL,
  "request_date" varchar(50) NOT NULL,
  "panchayath_id" int(10) unsigned NOT NULL default '0',
  "company_id" int(10) unsigned NOT NULL default '0',
  "user_id" int(10) unsigned NOT NULL,
  "request_status" varchar(50) NOT NULL default '0',
  "payment_status" varchar(50) NOT NULL default '0',
  "ewasterate_id" int(10) unsigned NOT NULL,
  "request_fordate" varchar(50) NOT NULL,
  "request_fortime" varchar(50) NOT NULL,
  PRIMARY KEY  ("request_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_request'
#

LOCK TABLES "tbl_request" WRITE;
/*!40000 ALTER TABLE "tbl_request" DISABLE KEYS;*/
REPLACE INTO "tbl_request" ("request_id", "request_details", "request_date", "panchayath_id", "company_id", "user_id", "request_status", "payment_status", "ewasterate_id", "request_fordate", "request_fortime") VALUES
	('1','Available at this time','2023-03-31','0','1','1','3','1','2','2023-04-02','10 Am-5 Pm');
/*!40000 ALTER TABLE "tbl_request" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_subcategory'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_subcategory" (
  "subcategory_id" int(10) unsigned NOT NULL auto_increment,
  "subcat_name" varchar(50) NOT NULL,
  "category_id" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("subcategory_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_subcategory'
#

LOCK TABLES "tbl_subcategory" WRITE;
/*!40000 ALTER TABLE "tbl_subcategory" DISABLE KEYS;*/
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcat_name", "category_id") VALUES
	('1','Papper','7');
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcat_name", "category_id") VALUES
	('2','Food wastes','7');
/*!40000 ALTER TABLE "tbl_subcategory" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_user" (
  "user_id" int(10) unsigned NOT NULL auto_increment,
  "user_name" varchar(50) NOT NULL,
  "user_address" varchar(50) NOT NULL,
  "user_contact" varchar(50) NOT NULL,
  "user_email" varchar(50) NOT NULL,
  "user_photo" varchar(50) NOT NULL,
  "place_id" int(10) unsigned NOT NULL,
  "user_password" varchar(50) NOT NULL,
  PRIMARY KEY  ("user_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_user'
#

LOCK TABLES "tbl_user" WRITE;
/*!40000 ALTER TABLE "tbl_user" DISABLE KEYS;*/
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_address", "user_contact", "user_email", "user_photo", "place_id", "user_password") VALUES
	('1','Rose','fgjvbvj','8787656523','rose@gmail.com','User 1403.png','3','rose1234');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_address", "user_contact", "user_email", "user_photo", "place_id", "user_password") VALUES
	('2','Jinta','hffdgfgf','9999888876','jinta@GMAIL.COM','User 1119.png','4','JINTA123');
/*!40000 ALTER TABLE "tbl_user" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_vechile'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_vechile" (
  "vechile_id" int(10) unsigned NOT NULL auto_increment,
  "vechile_name" varchar(50) NOT NULL,
  "vechile_number" varchar(50) NOT NULL,
  "panchayath_id" int(10) unsigned NOT NULL default '0',
  "company_id" int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ("vechile_id")
) AUTO_INCREMENT=13;



#
# Dumping data for table 'tbl_vechile'
#

LOCK TABLES "tbl_vechile" WRITE;
/*!40000 ALTER TABLE "tbl_vechile" DISABLE KEYS;*/
REPLACE INTO "tbl_vechile" ("vechile_id", "vechile_name", "vechile_number", "panchayath_id", "company_id") VALUES
	('1','Duster','kl7 123','0','1');
REPLACE INTO "tbl_vechile" ("vechile_id", "vechile_name", "vechile_number", "panchayath_id", "company_id") VALUES
	('2','Alto','kl2 565','1','0');
REPLACE INTO "tbl_vechile" ("vechile_id", "vechile_name", "vechile_number", "panchayath_id", "company_id") VALUES
	('3','pickup','kl12 4545','0','4');
REPLACE INTO "tbl_vechile" ("vechile_id", "vechile_name", "vechile_number", "panchayath_id", "company_id") VALUES
	('4','bulk pickup','kl3 565','1','0');
REPLACE INTO "tbl_vechile" ("vechile_id", "vechile_name", "vechile_number", "panchayath_id", "company_id") VALUES
	('5','pickupp','kl5 4545','0','4');
REPLACE INTO "tbl_vechile" ("vechile_id", "vechile_name", "vechile_number", "panchayath_id", "company_id") VALUES
	('6','lorryy','kl4 5656','1','0');
REPLACE INTO "tbl_vechile" ("vechile_id", "vechile_name", "vechile_number", "panchayath_id", "company_id") VALUES
	('12','Rjjhh','Rk23','0','1');
/*!40000 ALTER TABLE "tbl_vechile" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_wastetype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_wastetype" (
  "wastetype_id" int(10) unsigned NOT NULL auto_increment,
  "wastetype_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("wastetype_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_wastetype'
#

LOCK TABLES "tbl_wastetype" WRITE;
/*!40000 ALTER TABLE "tbl_wastetype" DISABLE KEYS;*/
REPLACE INTO "tbl_wastetype" ("wastetype_id", "wastetype_name") VALUES
	('1','Plastic');
/*!40000 ALTER TABLE "tbl_wastetype" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/

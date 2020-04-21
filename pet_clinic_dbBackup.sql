-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: pet_clinic
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_date` date DEFAULT NULL,
  `app_time` time DEFAULT NULL,
  `owner_id` varchar(7) NOT NULL,
  PRIMARY KEY (`app_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'2019-12-25','04:00:00','oid0001'),(3,'2019-12-25','06:00:00','oid0002'),(4,'2019-12-26','06:00:00','oid0002'),(5,'2019-12-26','04:00:00','oid0001'),(6,'2019-12-26','06:00:00','oid0003'),(7,'2019-12-26','04:00:00','oid0004'),(8,'2020-01-11','06:00:00','oid0009'),(9,'2020-01-13','06:00:00','oid0002');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `card_number` varchar(16) DEFAULT NULL,
  `voucher_no` varchar(11) NOT NULL,
  PRIMARY KEY (`card_id`),
  KEY `voucher_no` (`voucher_no`),
  CONSTRAINT `card_ibfk_1` FOREIGN KEY (`voucher_no`) REFERENCES `payment` (`voucher_no`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,'cno_0000001','vno_0000002'),(2,'cno_0000002','vno_0000002'),(3,'cno_0000003','vno_0000002'),(4,'cno_0000004','vno_0000004'),(5,'cno_0000005','vno_0000004'),(6,'cno_0000005','vno_0000005');
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctor_id` varchar(7) NOT NULL,
  `doctor_name` varchar(25) DEFAULT NULL,
  `doctor_rank` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('did01','Daw Hla','Skin Specialist'),('did02','U Toe','General Specialist');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_schedule`
--

DROP TABLE IF EXISTS `doctor_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `day_name` enum('MON','TUE','WED','THU','FRI','SAT','SUN') DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `doctor_id` varchar(7) NOT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `doctor_schedule_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_schedule`
--

LOCK TABLES `doctor_schedule` WRITE;
/*!40000 ALTER TABLE `doctor_schedule` DISABLE KEYS */;
INSERT INTO `doctor_schedule` VALUES (12,'MON','04:00:00','06:00:00','did01'),(13,'MON','06:00:00','08:00:00','did02'),(14,'TUE','04:00:00','06:00:00','did01'),(15,'TUE','06:00:00','08:00:00','did02'),(16,'WED','04:00:00','06:00:00','did01'),(17,'WED','06:00:00','08:00:00','did02'),(18,'THU','04:00:00','06:00:00','did01'),(19,'THU','06:00:00','08:00:00','did02'),(20,'FRI','04:00:00','06:00:00','did01'),(21,'FRI','06:00:00','08:00:00','did02'),(22,'SAT','04:00:00','06:00:00','did01'),(23,'SAT','06:00:00','08:00:00','did02'),(24,'SUN','04:00:00','06:00:00','did01'),(25,'SUN','06:00:00','08:00:00','did02');
/*!40000 ALTER TABLE `doctor_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_type`
--

DROP TABLE IF EXISTS `drug_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drug_type` (
  `drug_id` int(11) NOT NULL AUTO_INCREMENT,
  `drug_name` varchar(50) DEFAULT NULL,
  `drug_duration` int(11) DEFAULT NULL,
  `drug_duration_type` enum('year','month','day') DEFAULT NULL,
  PRIMARY KEY (`drug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_type`
--

LOCK TABLES `drug_type` WRITE;
/*!40000 ALTER TABLE `drug_type` DISABLE KEYS */;
INSERT INTO `drug_type` VALUES (34,'simple',0,'day'),(35,'Steriods',1,'month'),(36,'Antibiotics',1,'year'),(37,'Penicillin',7,'day'),(38,'Neuron',6,'month'),(39,'Glucose',6,'month');
/*!40000 ALTER TABLE `drug_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `owner_id` varchar(7) NOT NULL,
  `owner_name` varchar(20) DEFAULT NULL,
  `owner_ph` varchar(20) DEFAULT NULL,
  `owner_email` varchar(50) DEFAULT NULL,
  `owner_add` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES ('oid0001','Mya Mya','09783925501','myamya@gmail.com','North Dagon'),('oid0002','Kyaw Kyaw','0989775646','kyawkyaw@gmail.com','Bahan'),('oid0003','Khin Khin','0675757585','khinkhin@gmail.com','Sule'),('oid0004','Nu Nu','0745475758','nunu@gmail.com','Thuwana'),('oid0005','Toe Toe','09443124335','toetoe@gmail.com','Tharketa'),('oid0006','Moe Moe','057586886','moemoe@gmail.com','South Okkalapa'),('oid0007','Shwe Shwe ','0897756575','shweshwe@gmail.com','North Dagon'),('oid0008','Mr.Smith','0924243536','smith@gmai.com','London'),('oid0009','Suzie','0897756575','suzie@gmail.com','New York'),('oid0010','Mark Prin','09783925501','markprin@gmail.com','Thailand'),('oid0011','Thandar','0924243536','thandar@gmail.com','Tarmwe');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `voucher_no` varchar(11) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amt` int(11) DEFAULT NULL,
  `payment_status` enum('cash','card') DEFAULT NULL,
  PRIMARY KEY (`voucher_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('vno_0000001','2019-12-23',15000,'cash'),('vno_0000002','2019-12-23',10000,'card'),('vno_0000003','2019-12-24',5000,'cash'),('vno_0000004','2019-12-24',30000,'card'),('vno_0000005','2020-01-08',5000,'card');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet` (
  `pet_id` varchar(9) NOT NULL,
  `pet_name` varchar(30) DEFAULT NULL,
  `pet_sex` enum('F','M') DEFAULT NULL,
  `pet_birth` date DEFAULT NULL,
  `pet_death` date DEFAULT NULL,
  `species_id` int(11) NOT NULL,
  `owner_id` varchar(7) NOT NULL,
  PRIMARY KEY (`pet_id`),
  KEY `owner_id` (`owner_id`),
  KEY `species_id` (`species_id`),
  CONSTRAINT `pet_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pet_ibfk_2` FOREIGN KEY (`species_id`) REFERENCES `species` (`species_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet`
--

LOCK TABLES `pet` WRITE;
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
INSERT INTO `pet` VALUES ('pid_00001','Jackie','M','2019-09-25',NULL,1,'oid0001'),('pid_00002','Blacky','M','2019-03-22',NULL,2,'oid0001'),('pid_00003','Sweetie','F','2019-03-22',NULL,6,'oid0002'),('pid_00004','Bunny','M','2018-09-22',NULL,5,'oid0002'),('pid_00005','Kitty','F','2019-08-05',NULL,2,'oid0003'),('pid_00006','Pooh','M','2019-11-11',NULL,7,'oid0003'),('pid_00007','Winnie','F','2018-09-22',NULL,1,'oid0004'),('pid_00008','Snowy','F','2019-07-19',NULL,1,'oid0004'),('pid_00009','Gar Gar','M','2019-03-22',NULL,2,'oid0005'),('pid_00010','Rosy','F','2018-09-22',NULL,2,'oid0005'),('pid_00011','Kiddy','F','2018-11-12',NULL,1,'oid0006'),('pid_00012','Bravy','F','2019-03-22',NULL,1,'oid0006'),('pid_00013','Sunny','F','2018-12-30',NULL,1,'oid0007'),('pid_00014','Scoobie Doo','M','2020-01-01',NULL,1,'oid0008'),('pid_00015','Garfie','F','2019-12-30',NULL,2,'oid0008'),('pid_00016','Brownie','M','2019-03-22',NULL,5,'oid0009'),('pid_00017','Asela','F','2020-01-01',NULL,6,'oid0009'),('pid_00018','Twinkle','F','2018-09-22',NULL,1,'oid0010'),('pid_00019','Fatty','M','2018-12-30',NULL,7,'oid0011');
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_drug`
--

DROP TABLE IF EXISTS `pet_drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_drug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drug_date` date DEFAULT NULL,
  `drug_next_date` date DEFAULT NULL,
  `drug_desc` varchar(50) DEFAULT NULL,
  `pet_id` varchar(9) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `doctor_id` varchar(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `drug_id` (`drug_id`),
  KEY `pet_id` (`pet_id`),
  CONSTRAINT `pet_drug_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pet_drug_ibfk_2` FOREIGN KEY (`drug_id`) REFERENCES `drug_type` (`drug_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pet_drug_ibfk_3` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_drug`
--

LOCK TABLES `pet_drug` WRITE;
/*!40000 ALTER TABLE `pet_drug` DISABLE KEYS */;
INSERT INTO `pet_drug` VALUES (8,'2020-01-06','2020-01-13','ill','pid_00004',37,'did01'),(9,'2020-01-06','2020-02-11','ache','pid_00001',34,'did01'),(10,'2020-01-06','2020-02-06','vaccination','pid_00002',35,'did01'),(11,'2020-01-06','2021-01-06','pain reliever','pid_00002',36,'did01'),(12,'2020-01-06','2020-01-09','sneezy','pid_00001',34,'did01'),(13,'2020-01-06','2020-07-06','vitamins for nerve','pid_00003',38,'did01'),(16,'2020-01-10','2020-07-10','vaccination','pid_00005',39,'did01'),(17,'2020-01-10','2020-01-28','pain reliever','pid_00004',34,'did02'),(18,'2020-01-10','2021-01-10','vitamins for nerve','pid_00004',36,'did02'),(19,'2020-01-10','2021-01-10','vitamins for nerve','pid_00004',36,'did02');
/*!40000 ALTER TABLE `pet_drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_login`
--

DROP TABLE IF EXISTS `pet_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_login` (
  `login_id` varchar(20) NOT NULL,
  `login_password` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_login`
--

LOCK TABLES `pet_login` WRITE;
/*!40000 ALTER TABLE `pet_login` DISABLE KEYS */;
INSERT INTO `pet_login` VALUES ('did01','2f55c3c0d10571b03cb3deb89f338a65'),('did02','769d677ea65bb0ad1d1bdb03343a2ca4'),('id01','57ee1345597f3bb1d50054c299cca0f7'),('id02','769d677ea65bb0ad1d1bdb03343a2ca4'),('oid0001','28b122a8af969944048b845409352810'),('oid0002','29a2d203b618f62045f50834648d836f'),('oid0003','5386ae6f89318915bc15bf09be93a984'),('oid0004','2f8c3ab806a42e79c774cb09b41a53c8'),('oid0005','769d677ea65bb0ad1d1bdb03343a2ca4'),('oid0006','97485d10a8b381d8477aa1496240ab0a'),('oid0007','ad236f1428a3a303d74bffedbc9982ba'),('oid0008','a66e44736e753d4533746ced572ca821'),('oid0009','d87b5213dd646b37200f2a90acee340f'),('oid0010','c0c40b80d8ac220f55d024da697fd04e'),('oid0011','fcddcc55ae43d6e25f490f63b3d466db');
/*!40000 ALTER TABLE `pet_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `species` (
  `species_id` int(11) NOT NULL AUTO_INCREMENT,
  `species_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`species_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species`
--

LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;
INSERT INTO `species` VALUES (1,'dog'),(2,'cat'),(4,'snake'),(5,'rabbit'),(6,'hamster'),(7,'panda');
/*!40000 ALTER TABLE `species` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-10 14:32:45

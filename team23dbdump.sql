-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mobilityserviceproviderdb
-- ------------------------------------------------------
-- Server version	8.0.34

DROP SCHEMA IF EXISTS `mobilityserviceproviderdb`;
CREATE SCHEMA `mobilityserviceproviderdb`;
USE `mobilityserviceproviderdb`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assistant`
--

DROP TABLE IF EXISTS `assistant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assistant` (
  `Assistant_code` int unsigned NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `Street` varchar(35) NOT NULL,
  `Zip` char(5) NOT NULL,
  `City` varchar(35) NOT NULL,
  `Position` varchar(20) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Phone_number` char(10) NOT NULL,
  PRIMARY KEY (`Assistant_code`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `Phone_number_UNIQUE` (`Phone_number`),
  UNIQUE KEY `Assistant_code_UNIQUE` (`Assistant_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assistant`
--

LOCK TABLES `assistant` WRITE;
/*!40000 ALTER TABLE `assistant` DISABLE KEYS */;
INSERT INTO `assistant` VALUES (101,'Evgenia','Doumou','Kapetan Manoli 103','71307','Heraklion','Customer Service','evge@gmail.com','6982285582'),(234,'Eleftherios','Kalaitzidis','Tsimiski 52','54623','Thessaloniki','Programmer','Lef_oui@yahoo.com','6944562183'),(508,'Dimitra','Kyrou','Alsous 7','54636','Thessaloniki','Company Director','dimitraKyr1965@gmail.com','6954483217'),(1022,'Nikolaos','Papagiannis','Panormou 22','11523','Athens','Vehicle Manager','nikTheGreek@yahoo.com','6972200232'),(1213,'Michail','Papoulias','Pavlou Mela 25','45444','Ioannina','Customer Service','mpapoulias8@gmail.com','6949823576'),(4097,'Iasonas','Antonopoulos','Iliou 5','26333','Patra','Customer Service','jason8332@hotmail.com','6946123084');
/*!40000 ALTER TABLE `assistant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bicycle`
--

DROP TABLE IF EXISTS `bicycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bicycle` (
  `Bicycle_number` int NOT NULL,
  `Range` decimal(10,0) NOT NULL,
  `Vehicle_Serial_number` varchar(20) NOT NULL,
  PRIMARY KEY (`Vehicle_Serial_number`),
  UNIQUE KEY `Bicycle_number_UNIQUE` (`Bicycle_number`),
  CONSTRAINT `fk_Bicycle_Vehicle1` FOREIGN KEY (`Vehicle_Serial_number`) REFERENCES `vehicle` (`Serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bicycle`
--

LOCK TABLES `bicycle` WRITE;
/*!40000 ALTER TABLE `bicycle` DISABLE KEYS */;
INSERT INTO `bicycle` VALUES (3,35,'BCR123XYZ'),(1,30,'BIK456XY'),(2,40,'BWE789ABC');
/*!40000 ALTER TABLE `bicycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `Booking_code` int unsigned NOT NULL,
  `Card_number` char(16) DEFAULT NULL,
  `Payment_amount` decimal(10,0) NOT NULL,
  `Payment_method` enum('Cash','Card') NOT NULL,
  `Comments` varchar(100) DEFAULT NULL,
  `Rate` enum('Very Bad','Poor','Fair','Good','Very Good','Excellent') DEFAULT NULL,
  `Start_point` point NOT NULL,
  `End_point` point NOT NULL,
  `Distance` decimal(10,0) NOT NULL,
  `Start_time` datetime NOT NULL,
  `End_time` datetime NOT NULL,
  `Duration` time GENERATED ALWAYS AS ((`End_time` - `Start_time`)) VIRTUAL,
  `Vehicle_Serial_number` varchar(20) NOT NULL,
  `Customer_Number_of_id_card` char(8) NOT NULL,
  PRIMARY KEY (`Booking_code`),
  UNIQUE KEY `Booking_code_UNIQUE` (`Booking_code`),
  KEY `fk_Booking_Vehicle1_idx` (`Vehicle_Serial_number`),
  KEY `fk_Booking_Customer1_idx` (`Customer_Number_of_id_card`),
  CONSTRAINT `fk_Booking_Customer1` FOREIGN KEY (`Customer_Number_of_id_card`) REFERENCES `customer` (`Number_of_id_card`),
  CONSTRAINT `fk_Booking_Vehicle1` FOREIGN KEY (`Vehicle_Serial_number`) REFERENCES `vehicle` (`Serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` (`Booking_code`, `Card_number`, `Payment_amount`, `Payment_method`, `Comments`, `Rate`, `Start_point`, `End_point`, `Distance`, `Start_time`, `End_time`, `Vehicle_Serial_number`, `Customer_Number_of_id_card`) VALUES (1,'5684856191388040',11,'Card',NULL,'Fair',POINT(21.4166, 37.6376),POINT(21.3908, 37.6321),8,'2021-11-20 11:11:00','2021-11-20 11:30:00','JH4KA8262MC012345','AM392068'),(2,NULL,7,'Cash','Very rude driver!#@%&','Very Bad',POINT(22.941, 40.6401),POINT(22.94, 40.5923),4,'2021-12-12 12:00:00','2021-12-12 12:10:00','DJSO493KS23242400','AM281149'),(3,'4329984944612516',3,'Card',NULL,NULL,POINT(22.941, 40.6401),POINT(22.9521, 40.63),3,'2022-07-30 23:14:00','2022-07-30 23:25:00','PTN123AB','AM381002'),(4,'5639169151114369',3,'Card','Very expensive','Poor',POINT(23.7293, 38.0049),POINT(23.7013, 38.05), 3,'2023-02-15 08:10:00','2023-02-15 08:15:30','BIK456XY','AM391951');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `booking_BEFORE_INSERT` BEFORE INSERT ON `booking` FOR EACH ROW BEGIN
	IF(NEW.Payment_amount <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data, Payment_amount must be positive';
	END IF;
    IF(NEW.Distance <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data, Distance must be positive';
	END IF;
    IF(NEW.End_time <= NEW.Start_time) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data, End_time must be greater than Start_time';
	END IF;
	IF(NEW.Payment_method = 'Card' && NEW.Card_Number IS NULL) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'missing data, there is no Card_number';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `booking_BEFORE_UPDATE` BEFORE UPDATE ON `booking` FOR EACH ROW BEGIN
	IF(NEW.Payment_amount <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data, Payment_amount must be positive';
	END IF;
    IF(NEW.Distance <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data, Distance must be positive';
	END IF;
    IF(NEW.End_time <= NEW.Start_time) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid data, End_time must be greater than Start_time';
	END IF;
    IF(NEW.Payment_method = 'Card' && NEW.Card_Number IS NULL) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'missing data, there is no Card_number';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Number_of_id_card` char(8) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `Street` varchar(35) NOT NULL,
  `Zip` char(5) NOT NULL,
  `City` varchar(35) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Phone_number` char(10) NOT NULL,
  PRIMARY KEY (`Number_of_id_card`),
  UNIQUE KEY `Number_of_id_card_UNIQUE` (`Number_of_id_card`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `Phone_number_UNIQUE` (`Phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('AM281149','Giannis','Papadopoulos','Olympou 118','54631','Thessaloniki','giannis_pap2001@gmail.com','6950028021'),('AM381002','Dimitrios','Fousekis','Tritonos 12','41335','Larisa','real_fousekis@yahoo.com','6912460232'),('AM391951','Grigoris','Arnaoutoglou','Chelidonous 20','14564','Athens','grgarnaout@gmail.com','6954234170'),('AM392068','Maria','Doumou','Trapezoudos 4','59200','Naousa','Maria9@gmail.com','6970302521'),('AM803248','Thanos','Giannoglou','Xalkis 6','54640','Thessaloniki','Thanos510gmail.com','6972343474');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_support`
--

DROP TABLE IF EXISTS `customer_support`;
/*!50001 DROP VIEW IF EXISTS `customer_support`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_support` AS SELECT 
 1 AS `Assistant_name`,
 1 AS `Assistant_surname`,
 1 AS `Assistant_code`,
 1 AS `Service_date`,
 1 AS `Number_of_id_card`,
 1 AS `Customer_name`,
 1 AS `Customer_surname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `Name` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `Number_of_id_card` char(8) NOT NULL,
  `Street` varchar(35) NOT NULL,
  `Zip` char(5) NOT NULL,
  `City` varchar(35) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Phone_number` char(10) NOT NULL,
  `Number_of_driver_licence` char(9) NOT NULL,
  `Taxi_Vehicle_Serial_number` varchar(20) NOT NULL,
  PRIMARY KEY (`Number_of_id_card`),
  UNIQUE KEY `Number_of_id_card_UNIQUE` (`Number_of_id_card`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `Phone_number_UNIQUE` (`Phone_number`),
  UNIQUE KEY `Number_of_driver_licence_UNIQUE` (`Number_of_driver_licence`),
  KEY `fk_Driver_Taxi1_idx` (`Taxi_Vehicle_Serial_number`),
  CONSTRAINT `fk_Driver_Taxi1` FOREIGN KEY (`Taxi_Vehicle_Serial_number`) REFERENCES `taxi` (`Vehicle_Serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES ('Theodoros','Chatzis','EA042087','Agisilaou 5','71307','Heraklion','Teo_Liapis@gmail.com','6932105640','50245801','XYZ987654OP432100'),('Giorgos','Papapetrou','KM971977','Anthias 3','26333','Patra','giorgaras13@gmail.com','6938329391','371609318','JH4KA8262MC012345'),('Marios','Ioannidis','OE286946','Plateia Parkou 1','35100','Lamia','SuperMarioBros03@gmail.com','6969603019','48027775','MBRT5309FKSK03459'),('Sotirios','Georgiou','PA853628','Athanasiou Diakou 2','52100','Kastoria','OtoRechagel@yahoo.com','6941568730','636464287','DMEV3D430DMS40200'),('Emanouil','Pappas','PI349516','Aristotelous 2','54623','Thessaloniki','Manoz3321@yahoo.com','6922457712','914459604','DJSO493KS23242400'),('Evaggelos','Stergiou','TP965352','Evans 93','71201','Heraklion','Spanovaggelopoulos@hotmail.com','6930456912','732074086','XYZ987654OP432100'),('Anastasia','Nikolaidou','YA632560','Agias Sofias 63','54633','Thessaloniki','Tasoula1995@gmail.com','6978023457','790223359','DJSO493KS23242400');
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance` (
  `Num_of_maintenance` int NOT NULL,
  `Date_of_entry` datetime NOT NULL,
  `Date_of_export` datetime DEFAULT NULL,
  `Cost` decimal(10,0) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Location` point NOT NULL,
  `Vehicle_Serial_number` varchar(20) NOT NULL,
  PRIMARY KEY (`Num_of_maintenance`,`Vehicle_Serial_number`),
  KEY `fk_Maintenance_Vehicle1_idx` (`Vehicle_Serial_number`),
  CONSTRAINT `fk_Maintenance_Vehicle1` FOREIGN KEY (`Vehicle_Serial_number`) REFERENCES `vehicle` (`Serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
INSERT INTO `maintenance` VALUES (1,'2023-01-01 08:10:00','2023-01-03 09:11:00',31,'Change tyres',POINT(23.7345, 37.9532),'BIK456XY'),(1,'2021-11-20 11:11:00','2021-11-25 12:00:00',250,'Change Oils, Change Brakes, Change light bulb',POINT(22.9209, 40.6543),'DJSO493KS23242400'),(2,'2021-11-20 11:11:00','2021-11-25 12:00:00',0,'KTEO',POINT(22.9111, 40.6),'DJSO493KS23242400'),(3,'2022-07-18 06:45:00','2022-07-18 21:45:00',0,'Charging',POINT(22.9111, 40.6),'PTN123AB');
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office`
--

DROP TABLE IF EXISTS `office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office` (
  `Office_code` int unsigned NOT NULL,
  `Sreet` varchar(35) NOT NULL,
  `Zip` char(5) NOT NULL,
  `City` varchar(35) NOT NULL,
  PRIMARY KEY (`Office_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office`
--

LOCK TABLES `office` WRITE;
/*!40000 ALTER TABLE `office` DISABLE KEYS */;
INSERT INTO `office` VALUES (1,'Kassandrou 118','54634','Thessaloniki'),(2,'Melenikou 10','54248','Thessaloniki'),(3,'Nikopoleos 5','11253','Athens'),(4,'Averof 2','45221','Ioannina'),(5,'Leoforos Kyfisias 115','11524','Athens'),(6,'Kouma 6','41222','Larisa'),(7,'Epimenidou 15','71202','Heraklion'),(8,'Arakynthou 3','26226','Patra');
/*!40000 ALTER TABLE `office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!50001 DROP VIEW IF EXISTS `payment`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `payment` AS SELECT 
 1 AS `Booking_code`,
 1 AS `Payment_amount`,
 1 AS `Payment_method`,
 1 AS `Card_number`,
 1 AS `Date`,
 1 AS `Number_of_id_card`,
 1 AS `Name`,
 1 AS `Surname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!50001 DROP VIEW IF EXISTS `rating`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rating` AS SELECT 
 1 AS `Booking_code`,
 1 AS `Rate`,
 1 AS `Comments`,
 1 AS `Vehicle_Serial_number`,
 1 AS `Date`,
 1 AS `Number_of_id_card`,
 1 AS `Name`,
 1 AS `surname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `scooter`
--

DROP TABLE IF EXISTS `scooter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scooter` (
  `Scooter_number` int NOT NULL,
  `Range` decimal(10,0) NOT NULL,
  `Vehicle_Serial_number` varchar(20) NOT NULL,
  PRIMARY KEY (`Vehicle_Serial_number`),
  UNIQUE KEY `Scooter_number_UNIQUE` (`Scooter_number`),
  CONSTRAINT `fk_Scooter_Vehicle1` FOREIGN KEY (`Vehicle_Serial_number`) REFERENCES `vehicle` (`Serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scooter`
--

LOCK TABLES `scooter` WRITE;
/*!40000 ALTER TABLE `scooter` DISABLE KEYS */;
INSERT INTO `scooter` VALUES (1,25,'PTN123AB'),(3,20,'SKT789PDQ'),(2,30,'SLN456XYZ');
/*!40000 ALTER TABLE `scooter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serve`
--

DROP TABLE IF EXISTS `serve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serve` (
  `Assistant_Assistant_code` int unsigned NOT NULL,
  `Customer_Number_of_id_card` char(8) NOT NULL,
  `Serve_id` int unsigned NOT NULL,
  `Service_date` datetime NOT NULL,
  PRIMARY KEY (`Serve_id`),
  KEY `fk_Assistant_has_Customer_Customer1_idx` (`Customer_Number_of_id_card`),
  KEY `fk_Assistant_has_Customer_Assistant1_idx` (`Assistant_Assistant_code`),
  CONSTRAINT `fk_Assistant_has_Customer_Assistant1` FOREIGN KEY (`Assistant_Assistant_code`) REFERENCES `assistant` (`Assistant_code`),
  CONSTRAINT `fk_Assistant_has_Customer_Customer1` FOREIGN KEY (`Customer_Number_of_id_card`) REFERENCES `customer` (`Number_of_id_card`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serve`
--

LOCK TABLES `serve` WRITE;
/*!40000 ALTER TABLE `serve` DISABLE KEYS */;
INSERT INTO `serve` VALUES (4097,'AM381002',24,'2018-01-27 13:15:00'),(1213,'AM803248',98,'2021-04-05 10:00:00'),(508,'AM281149',112,'2022-10-08 16:30:00'),(101,'AM392068',214,'2004-03-03 15:15:15'),(101,'AM803248',345,'2010-10-20 10:20:11'),(1213,'AM391951',917,'2023-03-07 18:45:00');
/*!40000 ALTER TABLE `serve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxi`
--

DROP TABLE IF EXISTS `taxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxi` (
  `Plate_number` char(7) NOT NULL,
  `Vehicle_Serial_number` varchar(20) NOT NULL,
  PRIMARY KEY (`Vehicle_Serial_number`),
  UNIQUE KEY `Plate_number_UNIQUE` (`Plate_number`),
  CONSTRAINT `fk_Taxi_Vehicle1` FOREIGN KEY (`Vehicle_Serial_number`) REFERENCES `vehicle` (`Serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxi`
--

LOCK TABLES `taxi` WRITE;
/*!40000 ALTER TABLE `taxi` DISABLE KEYS */;
INSERT INTO `taxi` VALUES ('TAZ2652','AB3CD5678EF901234'),('TAZ3855','DJSO493KS23242400'),('TAZ4202','XYZ987654OP432100'),('TAZ4802','JH4KA8262MC012345'),('TAZ4912','DMEV3D430DMS40200'),('TAZ5922','MBRT5309FKSK03459');
/*!40000 ALTER TABLE `taxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `Serial_number` varchar(20) NOT NULL,
  `Model` varchar(20) NOT NULL,
  `City` varchar(35) NOT NULL,
  PRIMARY KEY (`Serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES ('AB3CD5678EF901234','Chenrolet Malibu','Athens'),('BCR123XYZ','Cannondale Synapse','Thessaloniki'),('BIK456XY','Trek FX 2','Athens'),('BWE789ABC','Specialized Sirrus','Ioannina'),('DJSO493KS23242400','Mercedes S Class','Thessaloniki'),('DMEV3D430DMS40200','Mercedes E Class','Thessaloniki'),('JH4KA8262MC012345','Toyota Prius','Patra'),('MBRT5309FKSK03459','Toyota Prius','Athens'),('PTN123AB','Razor A5 Lux','Thessaloniki'),('SKT789PDQ','Xiaomi Mi Scooter','Athens'),('SLN456XYZ','Micro Sprite Scoot ','Larisa'),('XYZ987654OP432100','Volkswagen Golf','Heraklion');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work` (
  `Assistant_Assistant_code` int unsigned NOT NULL,
  `Office_Office_code` int unsigned NOT NULL,
  `Work_id` int unsigned NOT NULL,
  `From` datetime NOT NULL,
  `To` datetime DEFAULT NULL,
  PRIMARY KEY (`Work_id`),
  KEY `fk_Assistant_has_Office_Office1_idx` (`Office_Office_code`),
  KEY `fk_Assistant_has_Office_Assistant1_idx` (`Assistant_Assistant_code`),
  CONSTRAINT `fk_Assistant_has_Office_Assistant1` FOREIGN KEY (`Assistant_Assistant_code`) REFERENCES `assistant` (`Assistant_code`),
  CONSTRAINT `fk_Assistant_has_Office_Office1` FOREIGN KEY (`Office_Office_code`) REFERENCES `office` (`Office_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work`
--

LOCK TABLES `work` WRITE;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` VALUES (234,2,1,'2003-02-27 08:45:00','2007-02-27 08:46:00'),(101,7,14,'2003-04-13 12:00:00',NULL),(234,7,20,'2007-02-27 12:00:00','2008-01-15 12:45:00'),(234,2,41,'2008-01-20 12:00:00',NULL),(1022,3,54,'2012-11-08 12:00:00','2018-03-28 12:00:00'),(4097,8,451,'2016-01-30 12:00:00','2022-04-02 18:00:00'),(508,1,712,'2021-10-04 09:00:00',NULL);
/*!40000 ALTER TABLE `work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `customer_support`
--

/*!50001 DROP VIEW IF EXISTS `customer_support`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_support` AS select `assistant`.`Name` AS `Assistant_name`,`assistant`.`Surname` AS `Assistant_surname`,`assistant`.`Assistant_code` AS `Assistant_code`,`serve`.`Service_date` AS `Service_date`,`customer`.`Number_of_id_card` AS `Number_of_id_card`,`customer`.`Name` AS `Customer_name`,`customer`.`Surname` AS `Customer_surname` from ((`assistant` join `serve` on((`assistant`.`Assistant_code` = `serve`.`Assistant_Assistant_code`))) join `customer` on((`serve`.`Customer_Number_of_id_card` = `customer`.`Number_of_id_card`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `payment`
--

/*!50001 DROP VIEW IF EXISTS `payment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `payment` AS select `booking`.`Booking_code` AS `Booking_code`,`booking`.`Payment_amount` AS `Payment_amount`,`booking`.`Payment_method` AS `Payment_method`,`booking`.`Card_number` AS `Card_number`,`booking`.`End_time` AS `Date`,`booking`.`Customer_Number_of_id_card` AS `Number_of_id_card`,`customer`.`Name` AS `Name`,`customer`.`Surname` AS `Surname` from (`booking` join `customer` on((`booking`.`Customer_Number_of_id_card` = `customer`.`Number_of_id_card`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rating`
--

/*!50001 DROP VIEW IF EXISTS `rating`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rating` AS select `booking`.`Booking_code` AS `Booking_code`,`booking`.`Rate` AS `Rate`,`booking`.`Comments` AS `Comments`,`booking`.`Vehicle_Serial_number` AS `Vehicle_Serial_number`,`booking`.`End_time` AS `Date`,`booking`.`Customer_Number_of_id_card` AS `Number_of_id_card`,`customer`.`Name` AS `Name`,`customer`.`Surname` AS `surname` from (`booking` join `customer` on((`booking`.`Customer_Number_of_id_card` = `customer`.`Number_of_id_card`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-21 11:51:55

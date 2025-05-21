CREATE DATABASE  IF NOT EXISTS `renthive8` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `renthive8`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: renthive8
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `agreement`
--

DROP TABLE IF EXISTS `agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agreement` (
  `agreement_id` int NOT NULL AUTO_INCREMENT,
  `property_id` int NOT NULL,
  `pdf_link` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`agreement_id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `agreement_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agreement`
--

LOCK TABLES `agreement` WRITE;
/*!40000 ALTER TABLE `agreement` DISABLE KEYS */;
INSERT INTO `agreement` VALUES (1,7,'/uploads/agreements/hwk10venkataramansundarams.pdf','2024-12-12','2024-12-12');
/*!40000 ALTER TABLE `agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agreementtenant`
--

DROP TABLE IF EXISTS `agreementtenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agreementtenant` (
  `agreement_id` int NOT NULL,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`agreement_id`,`tenant_id`),
  KEY `tenant_id` (`tenant_id`),
  CONSTRAINT `agreementtenant_ibfk_1` FOREIGN KEY (`agreement_id`) REFERENCES `agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `agreementtenant_ibfk_2` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agreementtenant`
--

LOCK TABLES `agreementtenant` WRITE;
/*!40000 ALTER TABLE `agreementtenant` DISABLE KEYS */;
INSERT INTO `agreementtenant` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `agreementtenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenancerequest`
--

DROP TABLE IF EXISTS `maintenancerequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenancerequest` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int NOT NULL,
  `property_id` int NOT NULL,
  `request_date` date NOT NULL,
  `status` enum('Open','In Progress','Completed') NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`request_id`),
  KEY `tenant_id` (`tenant_id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `maintenancerequest_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `maintenancerequest_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenancerequest`
--

LOCK TABLES `maintenancerequest` WRITE;
/*!40000 ALTER TABLE `maintenancerequest` DISABLE KEYS */;
INSERT INTO `maintenancerequest` VALUES (1,1,7,'2024-12-05','Completed','Leaky Faucet in the Kitchen');
/*!40000 ALTER TABLE `maintenancerequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `property_id` int NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,7,'House inspection on 11th January','2024-12-05 23:14:58');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `owner_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`owner_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,'johndoe','John','Doe','johndoe@gmail.com','123','78899202','2024-12-05 22:41:02'),(2,'Adam','Adam','Joe','adam@gmail.com','123','988927637','2024-12-05 22:42:09'),(3,'sai','Sai','Rashwant','sairashwant.vs2002@gmail.com','123','06369438149','2024-12-05 22:45:37');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `agreement_id` int NOT NULL,
  `tenant_id` int NOT NULL,
  `payment_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_type` enum('Deposit','Rent') NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `agreement_id` (`agreement_id`),
  KEY `tenant_id` (`tenant_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`agreement_id`) REFERENCES `agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,1,'2024-12-05',4000.00,'Deposit');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `property_id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `description` text,
  `statuss` enum('Available','Rented') NOT NULL,
  `rent_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`property_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `property_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (1,1,'24 Saint Alphonsus Street','Boston','Massachusetts','02120','3BHK - 1000 sq.ft','Available',3000.00,'2024-12-05 22:42:50'),(2,1,'17 Bush Street','Boston','Massachusetts','02120','2BHK - 800 sq.ft','Available',2500.00,'2024-12-05 22:43:14'),(3,1,'12 Horadan Way','Boston','Massachusetts','02120','3BHK - 1000 sq.ft','Available',4000.00,'2024-12-05 22:43:38'),(5,2,'16 Boylston Street','Boston','Massachusetts','02120','2BHK - 600 sq.ft','Available',1800.00,'2024-12-05 22:44:37'),(6,2,'20 Horadan Way','Boston','Massachusetts','02120','3BHK - 1500 sq.ft','Available',6499.99,'2024-12-05 22:45:11'),(7,3,'30 Preising Street','Boston','Massachusetts','02120','3BHK','Available',4000.00,'2024-12-05 22:47:28'),(8,3,'28 Saint Alphonsus Street','Boton','Massachusetts','02120','2BHK','Available',2500.00,'2024-12-05 22:47:57');
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertyimage`
--

DROP TABLE IF EXISTS `propertyimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyimage` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `property_id` int NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `uploaded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `propertyimage_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertyimage`
--

LOCK TABLES `propertyimage` WRITE;
/*!40000 ALTER TABLE `propertyimage` DISABLE KEYS */;
INSERT INTO `propertyimage` VALUES (1,1,'/static/uploads/download_1.jpg','2024-12-05 22:42:50'),(2,2,'/static/uploads/download_2.jpg','2024-12-05 22:43:14'),(3,3,'/static/uploads/download.jpg','2024-12-05 22:43:38'),(5,5,'/static/uploads/images_2.jpg','2024-12-05 22:44:37'),(6,6,'/static/uploads/images.jpg','2024-12-05 22:45:11'),(7,7,'/static/uploads/residential-house-for-sale-in-USA-blog.jpg','2024-12-05 22:47:28'),(8,8,'/static/uploads/images_2.jpg','2024-12-05 22:47:57');
/*!40000 ALTER TABLE `propertyimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant`
--

DROP TABLE IF EXISTS `tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant` (
  `tenant_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `property_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tenant_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `tenant_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant`
--

LOCK TABLES `tenant` WRITE;
/*!40000 ALTER TABLE `tenant` DISABLE KEYS */;
INSERT INTO `tenant` VALUES (1,'swetha','Swetha','S','swetha@gmail.com','123','56780290',7,'2024-12-05 22:46:02'),(2,'ela','Ela','M','ela@gmail.com','123','7892000027',7,'2024-12-05 22:46:22'),(3,'Sandy','Sandy','V','sandy@gmail.com','123','279809876',NULL,'2024-12-05 22:46:44');
/*!40000 ALTER TABLE `tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'renthive8'
--

--
-- Dumping routines for database 'renthive8'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddProperty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddProperty`(
    IN owner_id INT,
    IN address VARCHAR(255),
    IN city VARCHAR(100),
    IN state VARCHAR(100),
    IN zip_code VARCHAR(20),
    IN description TEXT,
    IN rent_amount DECIMAL(10, 2),
    IN status VARCHAR(50),
    IN images JSON
)
BEGIN
    DECLARE property_id INT;
    DECLARE image_path VARCHAR(255);
    DECLARE image_count INT DEFAULT 0;

    -- Start a transaction
    START TRANSACTION;

    -- Insert the property into the Property table
    INSERT INTO Property (owner_id, address, city, state, zip_code, description, rent_amount, statuss)
    VALUES (owner_id, address, city, state, zip_code, description, rent_amount, status);
    SET property_id = LAST_INSERT_ID();

    -- Iterate through image paths and insert into PropertyImage
    WHILE image_count < JSON_LENGTH(images) DO
        SET image_path = JSON_UNQUOTE(JSON_EXTRACT(images, CONCAT('$[', image_count, ']')));

        INSERT INTO PropertyImage (property_id, image_path)
        VALUES (property_id, image_path);

        SET image_count = image_count + 1;
    END WHILE;

    -- Commit the transaction
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AssignPropertyToTenant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AssignPropertyToTenant`(
    IN p_tenant_id INT,
    IN p_property_id INT
)
BEGIN
    UPDATE Tenant
    SET property_id = p_property_id
    WHERE tenant_id = p_tenant_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateAgreement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateAgreement`(
    IN property_id INT,
    IN tenant_usernames JSON,
    IN pdf_link_path VARCHAR(255),
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    DECLARE agreement_id INT;
    DECLARE tenant_id INT;
    DECLARE tenant_count INT DEFAULT 0;

    -- Start a transaction
    START TRANSACTION;

    -- Insert into Agreement
    INSERT INTO Agreement (property_id, pdf_link, start_date, end_date)
    VALUES (property_id, pdf_link_path, start_date, end_date);
    SET agreement_id = LAST_INSERT_ID();

    -- Update property status to "Rented"
    UPDATE Property
    SET statuss = 'Rented'
    WHERE property_id = property_id;

    -- Iterate through tenant usernames and link tenants to agreement
    WHILE tenant_count < JSON_LENGTH(tenant_usernames) DO
        SET tenant_id = JSON_UNQUOTE(JSON_EXTRACT(tenant_usernames, CONCAT('$[', tenant_count, ']')));

        -- Link tenant to agreement
        INSERT INTO AgreementTenant (agreement_id, tenant_id)
        VALUES (agreement_id, tenant_id);

        -- Update tenant's property_id
        UPDATE Tenant
        SET property_id = property_id
        WHERE tenant_id = tenant_id;

        SET tenant_count = tenant_count + 1;
    END WHILE;

    -- Commit transaction
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateLeaseAgreement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateLeaseAgreement`(
    IN p_property_id INT,
    IN p_tenant_emails TEXT, -- A comma-separated list of tenant emails
    IN p_start_date DATE,
    IN p_end_date DATE,
    IN p_pdf_link VARCHAR(255)
)
BEGIN
    DECLARE v_agreement_id INT;
    DECLARE v_owner_id INT;
    DECLARE v_email VARCHAR(100);
    DECLARE v_tenant_id INT;

    -- Declare handlers for error management
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- Validate property availability
    SELECT owner_id INTO v_owner_id
    FROM Property
    WHERE property_id = p_property_id AND statuss = 'Available'
    LIMIT 1;

    IF v_owner_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Property is not available for lease';
    END IF;

    -- Insert Agreement
    INSERT INTO Agreement (
        property_id,
        start_date,
        end_date,
        pdf_link
    ) VALUES (
        p_property_id,
        p_start_date,
        p_end_date,
        p_pdf_link
    );

    -- Get the last inserted agreement ID
    SET v_agreement_id = LAST_INSERT_ID();

    -- Split and process tenant emails
    WHILE LOCATE(',', p_tenant_emails) > 0 DO
        SET v_email = TRIM(SUBSTRING_INDEX(p_tenant_emails, ',', 1));
        SET p_tenant_emails = TRIM(SUBSTRING(p_tenant_emails FROM LOCATE(',', p_tenant_emails) + 1));

        -- Validate tenant existence or allow existing tenant for the same property
        SELECT tenant_id INTO v_tenant_id
        FROM Tenant
        WHERE email = v_email AND (property_id IS NULL OR property_id = p_property_id)
        LIMIT 1;

        IF v_tenant_id IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tenant with that email not found or already assigned to a different property';
        END IF;

        -- Link tenant to agreement
        INSERT INTO AgreementTenant (
            agreement_id,
            tenant_id
        ) VALUES (
            v_agreement_id,
            v_tenant_id
        );

        -- Update tenant's property if they are not already linked to it
        IF (SELECT property_id FROM Tenant WHERE tenant_id = v_tenant_id) IS NULL THEN
            UPDATE Tenant
            SET property_id = p_property_id
            WHERE tenant_id = v_tenant_id;
        END IF;
    END WHILE;

    -- Handle the last email (if any)
    IF p_tenant_emails != '' THEN
        SET v_email = TRIM(p_tenant_emails);

        SELECT tenant_id INTO v_tenant_id
        FROM Tenant
        WHERE email = v_email AND (property_id IS NULL OR property_id = p_property_id)
        LIMIT 1;

        IF v_tenant_id IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tenant with that email not found or already assigned to a different property';
        END IF;

        INSERT INTO AgreementTenant (
            agreement_id,
            tenant_id
        ) VALUES (
            v_agreement_id,
            v_tenant_id
        );

        -- Update tenant's property if they are not already linked to it
        IF (SELECT property_id FROM Tenant WHERE tenant_id = v_tenant_id) IS NULL THEN
            UPDATE Tenant
            SET property_id = p_property_id
            WHERE tenant_id = v_tenant_id;
        END IF;
    END IF;

    COMMIT;

    -- Return the created agreement ID
    SELECT v_agreement_id AS agreement_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateNotification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateNotification`(
    IN p_owner_id INT,
    IN p_property_id INT,
    IN p_message TEXT
)
BEGIN
    -- Verify owner owns the property
    IF EXISTS (SELECT 1 FROM Property WHERE property_id = p_property_id AND owner_id = p_owner_id) THEN
        INSERT INTO Notifications (property_id, message, created_at)
        VALUES (p_property_id, p_message, CURRENT_TIMESTAMP);
        SELECT LAST_INSERT_ID() as notification_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Unauthorized: Property does not belong to this owner';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteLeaseAgreement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteLeaseAgreement`(
    IN p_agreement_id INT,
    IN p_user_id INT -- Assuming this is the owner ID for authorization
)
BEGIN
    DECLARE v_tenant_id INT;
    DECLARE v_property_id INT;

    -- Declare handlers for error management
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- Get the tenant ID associated with the agreement
    SELECT tenant_id INTO v_tenant_id
    FROM AgreementTenant
    WHERE agreement_id = p_agreement_id
    LIMIT 1;

    IF v_tenant_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lease agreement not found or already deleted';
    END IF;

    -- Delete the lease agreement
    DELETE FROM Agreement
    WHERE agreement_id = p_agreement_id;

    -- Check if the tenant has any remaining lease agreements
    IF (SELECT COUNT(*) FROM AgreementTenant WHERE tenant_id = v_tenant_id) = 0 THEN
        -- If no remaining agreements, set the property_id in the Tenant table to NULL
        UPDATE Tenant
        SET property_id = NULL
        WHERE tenant_id = v_tenant_id;
    END IF;

    COMMIT;

    -- Optionally, return a success message or the deleted agreement ID
    SELECT p_agreement_id AS deleted_agreement_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteProperty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteProperty`(
    IN p_property_id INT, 
    IN p_owner_id INT
)
BEGIN
    DECLARE property_count INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- Start transaction
    START TRANSACTION;

    -- Check if the property belongs to the owner
    SELECT COUNT(*) INTO property_count
    FROM Property
    WHERE property_id = p_property_id AND owner_id = p_owner_id;

    -- If property doesn't belong to the owner, raise an error
    IF property_count = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Property not found or you are not authorized to delete it';
    END IF;

    -- Delete associated images first
    DELETE FROM PropertyImage 
    WHERE property_id = p_property_id;

    -- Delete associated agreement tenants
    DELETE FROM AgreementTenant 
    WHERE agreement_id IN (
        SELECT agreement_id 
        FROM Agreement 
        WHERE property_id = p_property_id
    );

    -- Delete associated agreements
    DELETE FROM Agreement 
    WHERE property_id = p_property_id;

    -- Delete associated maintenance requests
    DELETE FROM MaintenanceRequest 
    WHERE property_id = p_property_id;

    -- Update tenants who were associated with this property
    UPDATE Tenant 
    SET property_id = NULL 
    WHERE property_id = p_property_id;

    -- Delete the property
    DELETE FROM Property 
    WHERE property_id = p_property_id AND owner_id = p_owner_id;

    -- Commit the transaction
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAgreementIdByTenantId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAgreementIdByTenantId`(
    IN tenant_id INT
)
BEGIN
    -- Get the agreement_id for the provided tenant_id
    SELECT agreement_id
    FROM agreementtenant
    WHERE tenant_id = tenant_id
    LIMIT 1; -- Limit to one result, assuming the tenant has only one active agreement
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllAvailableProperties` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllAvailableProperties`()
BEGIN
    SELECT 
        p.property_id,
        p.address,
        p.city,
        p.state,
        p.zip_code,
        p.description,
        p.rent_amount,
        GROUP_CONCAT(DISTINCT pi.image_path) AS property_images,
        p.created_at AS property_created_at,
        (
            SELECT COUNT(a.agreement_id) 
            FROM Agreement a 
            WHERE a.property_id = p.property_id
        ) AS active_agreements
    FROM 
        Property p
    LEFT JOIN 
        PropertyImage pi ON p.property_id = pi.property_id
    WHERE 
        p.statuss = "Available"
    GROUP BY 
        p.property_id,
        p.address,
        p.city,
        p.state,
        p.zip_code,
        p.description,
        p.rent_amount,
        p.created_at,
        p.statuss
    ORDER BY 
        p.created_at DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllAvailablePropertiesHome` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllAvailablePropertiesHome`()
BEGIN
    SELECT 
        p.property_id,
        p.address,
        p.city,
        p.state,
        p.zip_code,
        p.description,
        p.rent_amount,
        p.statuss,
        o.email AS owner_email,
        GROUP_CONCAT(pi.image_path) AS property_images
    FROM 
        Property p
    JOIN 
        owner o ON p.owner_id = o.owner_id
    LEFT JOIN 
        PropertyImage pi ON p.property_id = pi.property_id
    WHERE 
        p.statuss = 'Available'
    GROUP BY 
        p.property_id, 
        p.address, 
        p.city, 
        p.state, 
        p.zip_code, 
        p.description, 
        p.rent_amount, 
        p.statuss,
        o.email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAvailablePropertiesofOwner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAvailablePropertiesofOwner`(
    IN owner_idno INT
)
BEGIN
    SELECT property_id, CONCAT(address, ', ', city) AS name
    FROM Property
    WHERE owner_id = owner_idno AND statuss = 'Available';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAvailableTenants` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAvailableTenants`()
BEGIN
    SELECT tenant_id, CONCAT(first_name, ' ', last_name) AS name
    FROM Tenant
    WHERE property_id IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetLeaseAgreementDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetLeaseAgreementDetails`(IN agreement_id INT, IN owner_id INT)
BEGIN
    SELECT * FROM lease_agreements WHERE agreement_id = agreement_id AND owner_id = owner_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOwnerLeaseAgreements` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOwnerLeaseAgreements`(IN owner_id INT)
BEGIN
    SELECT 
        a.agreement_id, 
        p.address AS property_name, 
        GROUP_CONCAT(CONCAT(t.first_name, ' ', t.last_name) ORDER BY t.first_name) AS tenant_names,
        a.start_date,
        a.end_date
    FROM Agreement a
    JOIN Property p ON a.property_id = p.property_id
    JOIN AgreementTenant at ON a.agreement_id = at.agreement_id
    JOIN Tenant t ON at.tenant_id = t.tenant_id
    WHERE p.owner_id = owner_id
    GROUP BY a.agreement_id, p.address, a.start_date, a.end_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOwnerNotifications` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOwnerNotifications`(IN owner_id INT)
BEGIN
    SELECT 
        p.property_id,
        n.message,
        n.created_at AS sent_at
    FROM Notifications n
    JOIN Property p ON n.property_id = p.property_id
    WHERE p.owner_id = owner_id
    ORDER BY n.created_at DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOwnerProperties` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOwnerProperties`(IN ownerId INT)
BEGIN
    SELECT property_id, address FROM Property WHERE owner_id = ownerId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPropertyById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPropertyById`(
    IN p_property_id INT,
    IN p_owner_id INT
)
BEGIN
    SELECT 
        p.property_id,
        p.address,
        p.city,
        p.state,
        p.zip_code,
        p.description,
        p.rent_amount,
        p.statuss,
        GROUP_CONCAT(DISTINCT pi.image_path) AS property_images
    FROM 
        Property p
    LEFT JOIN 
        PropertyImage pi ON p.property_id = pi.property_id
    WHERE 
        p.property_id = p_property_id AND p.owner_id = p_owner_id
    GROUP BY 
        p.property_id,
        p.address,
        p.city,
        p.state,
        p.zip_code,
        p.description,
        p.rent_amount,
        p.statuss;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTenantAgreement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTenantAgreement`(
    IN agreement_id INT,
    IN tenant_id INT
)
BEGIN
    SELECT a.agreement_id, p.address, a.pdf_link, a.start_date, a.end_date
    FROM Agreement a
    JOIN Property p ON a.property_id = p.property_id
    JOIN AgreementTenant at ON a.agreement_id = at.agreement_id
    WHERE a.agreement_id = agreement_id AND at.tenant_id = tenant_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTenantLeaseAgreements` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTenantLeaseAgreements`(
    IN tenant_id INT
)
BEGIN
    SELECT a.agreement_id, p.address, a.start_date, a.end_date
    FROM Agreement a
    JOIN Property p ON a.property_id = p.property_id
    JOIN AgreementTenant at ON a.agreement_id = at.agreement_id
    WHERE at.tenant_id = tenant_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTenantNotifications` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTenantNotifications`(
    IN p_tenant_id INT
)
BEGIN
    SELECT 
        n.notification_id,
        n.message,
        n.created_at AS sent_at,
        p.address as property_address
    FROM Notifications n
    JOIN Property p ON n.property_id = p.property_id
    JOIN Tenant t ON t.property_id = p.property_id
    WHERE t.tenant_id = p_tenant_id
    ORDER BY n.created_at DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoginUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LoginUser`(
    IN p_username VARCHAR(100),
    IN p_password VARCHAR(100)
)
BEGIN
    DECLARE user_type VARCHAR(10);
    
    SELECT 'owner' INTO user_type
    FROM owner
    WHERE username = p_username AND password = p_password
    LIMIT 1;
    
    IF user_type IS NULL THEN
        SELECT 'tenant' INTO user_type
        FROM tenant
        WHERE username = p_username AND password = p_password
        LIMIT 1;
    END IF;
    
    IF user_type IS NULL THEN
        SET user_type = NULL;
    END IF;

    SELECT user_type;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MakePayment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MakePayment`(
    IN p_tenant_id INT,
    IN p_agreement_id INT,
    IN p_amount DECIMAL(10, 2),
    IN p_payment_type ENUM('Deposit', 'Rent')
)
BEGIN
    -- Insert payment record
    INSERT INTO Payment (agreement_id, tenant_id, payment_date, amount, payment_type)
    VALUES (p_agreement_id, p_tenant_id, CURRENT_DATE, p_amount, p_payment_type);
    
    -- Return the payment ID
    SELECT LAST_INSERT_ID() AS payment_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OwnerDashboard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `OwnerDashboard`(
    IN p_owner_id INT
)
BEGIN
    SELECT 
        p.property_id,
        p.address,
        p.city,
        p.state,
        p.zip_code,
        p.description,
        p.rent_amount,
        p.statuss, 
        GROUP_CONCAT(DISTINCT pi.image_path) AS property_images,
        p.created_at AS property_created_at,
        (
            SELECT COUNT(a.agreement_id) 
            FROM Agreement a 
            WHERE a.property_id = p.property_id
        ) AS active_agreements
    FROM 
        Property p
    LEFT JOIN 
        PropertyImage pi ON p.property_id = pi.property_id
    WHERE 
        p.owner_id = p_owner_id
    GROUP BY 
        p.property_id,
        p.address,
        p.city,
        p.state,
        p.zip_code,
        p.description,
        p.rent_amount,
        p.statuss, 
        p.created_at
    ORDER BY 
        p.created_at DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `owner_update_maintenance_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `owner_update_maintenance_status`(
    IN owner_id INT,
    IN request_id_input INT,
    IN new_status ENUM('Open', 'In Progress', 'Completed')
)
BEGIN
    -- Check if the owner is authorized to update the maintenance request
    IF EXISTS (SELECT 1 
               FROM MaintenanceRequest mr
               JOIN Property p ON mr.property_id = p.property_id
               WHERE p.owner_id = owner_id AND mr.request_id = request_id) THEN
               
        -- Update the status of the maintenance request
        UPDATE MaintenanceRequest
        SET status = new_status
        WHERE request_id = request_id_input;

    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Owner is not authorized to update this maintenance request';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `owner_view_maintenance_requests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `owner_view_maintenance_requests`(
    IN owner_id INT
)
BEGIN
    SELECT mr.request_id, mr.tenant_id, mr.property_id, mr.request_date, mr.status, mr.description
    FROM MaintenanceRequest mr
    JOIN Property p ON mr.property_id = p.property_id
    WHERE p.owner_id = owner_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterUser`(
    IN p_username VARCHAR(255),
    IN p_password VARCHAR(255),
    IN p_first_name VARCHAR(255),
    IN p_last_name VARCHAR(255),
    IN p_email_id VARCHAR(255),
    IN p_phone_no VARCHAR(20),
    IN p_user_type VARCHAR(50)
)
BEGIN
    IF p_user_type = 'owner' THEN
        INSERT INTO owner (username, password, first_name, last_name, email, phone)
        VALUES (p_username, p_password, p_first_name, p_last_name, p_email_id, p_phone_no);
    ELSEIF p_user_type = 'tenant' THEN
        INSERT INTO tenant (username, password, first_name, last_name, email, phone)
        VALUES (p_username, p_password, p_first_name, p_last_name, p_email_id, p_phone_no);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid user type. Must be either owner or tenant.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SubmitMaintenanceRequestForm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SubmitMaintenanceRequestForm`(
    IN in_tenant_id INT,
    IN description TEXT
)
BEGIN
    DECLARE property_ids INT;
    -- Fetch the property_id for the tenant
    SELECT property_id INTO property_ids
    FROM Tenant
    WHERE tenant_id = in_tenant_id
    LIMIT 1;

    IF property_ids IS NULL THEN
        -- If no property found, raise an error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No property found for the tenant';
    ELSE
        -- Proceed with inserting the maintenance request if property_id is valid
        INSERT INTO MaintenanceRequest (tenant_id, property_id, request_date, status, description)
        VALUES (in_tenant_id, property_ids, CURDATE(), 'Open', description);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdatePropertyDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePropertyDetails`(
    IN p_property_id INT,
    IN p_owner_id INT,
    IN p_address VARCHAR(255),
    IN p_city VARCHAR(100),
    IN p_state VARCHAR(100),
    IN p_zip_code VARCHAR(20),
    IN p_description TEXT,
    IN p_rent_amount DECIMAL(10, 2),
    IN p_status VARCHAR(50)
)
BEGIN
    UPDATE Property 
    SET 
        address = p_address, 
        city = p_city, 
        state = p_state, 
        zip_code = p_zip_code, 
        description = p_description, 
        rent_amount = p_rent_amount, 
        statuss = p_status
    WHERE 
        property_id = p_property_id AND owner_id = p_owner_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_lease_agreement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_lease_agreement`(
    IN agreement_id INT,
    IN start_date DATE,
    IN end_date DATE,
    IN pdf_link VARCHAR(255)
)
BEGIN
    -- Update lease agreement with or without the PDF link
    IF pdf_link IS NOT NULL AND pdf_link != '' THEN
        UPDATE Agreement
        SET start_date = start_date, 
            end_date = end_date,
            pdf_link = pdf_link
        WHERE agreement_id = agreement_id;
    ELSE
        UPDATE Agreement
        SET start_date = start_date, 
            end_date = end_date
        WHERE agreement_id = agreement_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ViewOwnerPaymentHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewOwnerPaymentHistory`(
    IN p_owner_id INT
)
BEGIN
    SELECT 
        t.first_name AS tenant_first_name,
        t.last_name AS tenant_last_name,
        p.address AS property_address,
        pay.payment_date,
        pay.amount,
        pay.payment_type
    FROM 
        Payment pay
    JOIN 
        Agreement ag ON ag.agreement_id = pay.agreement_id
    JOIN 
        Property p ON p.property_id = ag.property_id
    JOIN 
        Tenant t ON t.tenant_id = pay.tenant_id
    WHERE 
        p.owner_id = p_owner_id
    ORDER BY 
        pay.payment_date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_maintenance_request_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_maintenance_request_status`(
    IN tenant_id INT
)
BEGIN
    SELECT request_id, property_id, status, request_date, description
    FROM MaintenanceRequest
    WHERE tenant_id = tenant_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-05 18:21:19

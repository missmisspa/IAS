-- MySQL dump 10.13  Distrib 9.2.0, for Win64 (x86_64)
--
-- Host: localhost    Database: floweryflowers
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customersID` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`customersID`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Mingyu','Kim','kimmingyu@gmail.com','1234567890','Florence Italy'),(2,'Seokmin','Lee','leeseokmin@gmail.com','9876543210','Edinburgh Scotland'),(3,'Hansol','Choi','choihansol@gmail.com','5555555555','Tokyo Japan'),(4,'Wonwoo','Jeon','jeonwonwoo@gmail.com','1112223333','Athens Greece'),(5,'Joshua','Hong','hongjoshua@gmail.com','4446668888','Los Angeles USA'),(6,'Seungcheol','Choi','choiseungcheol@gmail.com','7779990000','Seoul South Korea'),(7,'Minghao','Xu','xuminghao@gmail.com','3331117777','Beijing China'),(8,'Jeonghan','Yoon','yoonjeonghan@gmail.com','8882224444','London UK'),(9,'Junhui','Wen','wenjunhui@gmail.com','6660003333','Brasilia Brazil'),(10,'Soonyoung','Kwon','horanghae@gmail.com','9998887777','Bangkok Thailand');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventoryID` int NOT NULL AUTO_INCREMENT,
  `productID` int NOT NULL,
  `quantity` int NOT NULL,
  `lastUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`inventoryID`),
  KEY `productID` (`productID`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,100,'2025-02-01 02:42:56'),(2,2,80,'2025-02-01 02:42:56'),(3,3,50,'2025-02-01 02:42:56'),(4,4,40,'2025-02-01 02:42:56'),(5,5,60,'2025-02-01 02:42:56'),(6,6,70,'2025-02-01 02:42:56'),(7,7,30,'2025-02-01 02:42:56'),(8,8,25,'2025-02-01 02:42:56'),(9,9,90,'2025-02-01 02:42:56'),(10,10,85,'2025-02-01 02:42:56');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `orderItemID` int NOT NULL AUTO_INCREMENT,
  `orderID` int NOT NULL,
  `productID` int NOT NULL,
  `quantity` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`orderItemID`),
  KEY `orderID_idx` (`orderID`),
  KEY `productID_idx` (`productID`),
  CONSTRAINT `orderID` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `productID` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,2,1000.00),(2,2,3,1,700.00),(3,3,5,4,3400.00),(4,4,2,2,1300.00),(5,5,6,3,1200.00),(6,6,4,1,450.00),(7,7,8,2,1100.00),(8,8,7,3,3000.00),(9,9,10,5,3000.00),(10,10,9,6,4500.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderID` int NOT NULL AUTO_INCREMENT,
  `customerID` int NOT NULL,
  `orderDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `totalAmount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `customerID_idx` (`customerID`),
  CONSTRAINT `customerID` FOREIGN KEY (`customerID`) REFERENCES `customers` (`customersID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2025-02-01 11:22:39',1000.00),(2,2,'2025-02-01 11:22:39',1300.00),(3,3,'2025-02-01 11:22:39',700.00),(4,4,'2025-02-01 11:22:39',900.00),(5,5,'2025-02-01 11:22:39',1500.00),(6,6,'2025-02-01 11:22:39',400.00),(7,7,'2025-02-01 11:22:39',2000.00),(8,8,'2025-02-01 11:22:39',550.00),(9,9,'2025-02-01 11:22:39',750.00),(10,10,'2025-02-01 11:22:39',600.00);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `paymentID` int NOT NULL AUTO_INCREMENT,
  `orderID` int NOT NULL,
  `paymentDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `amountPaid` decimal(10,2) NOT NULL,
  `paymentMethod` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`paymentID`),
  KEY `orderID` (`orderID`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'2025-02-01 11:14:30',1000.00,'Credit Card'),(2,2,'2025-02-01 11:14:30',1300.00,'PayPal'),(3,3,'2025-02-01 11:14:30',700.00,'Debit Card'),(4,4,'2025-02-01 11:14:30',900.00,'Cash'),(5,5,'2025-02-01 11:14:30',1500.00,'Credit Card'),(6,6,'2025-02-01 11:14:30',400.00,'PayPal'),(7,7,'2025-02-01 11:14:30',2000.00,'Debit Card'),(8,8,'2025-02-01 11:14:30',550.00,'Cash'),(9,9,'2025-02-01 11:14:30',750.00,'Credit Card'),(10,10,'2025-02-01 11:14:30',600.00,'PayPal');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `supplierID` int DEFAULT NULL,
  PRIMARY KEY (`productID`),
  KEY `supplierID_idx` (`supplierID`),
  CONSTRAINT `supplierID` FOREIGN KEY (`supplierID`) REFERENCES `supplier` (`supplierID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Roses',500.00,100,1),(2,'Tulips',650.00,80,2),(3,'Sunflowers',700.00,50,3),(4,'Orchids',450.00,40,4),(5,'Lilies',850.00,60,5),(6,'Daisies',400.00,70,6),(7,'Peonies',1000.00,30,7),(8,'Hydrangeas',550.00,25,8),(9,'Carnations',750.00,90,9),(10,'Chrysanthemums',600.00,85,10);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplierID` int NOT NULL AUTO_INCREMENT,
  `supplierName` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`supplierID`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Flora Supplies','flora@example.com','1234567890'),(2,'Bloom Distributors','bloom@example.com','9876543210'),(3,'Greenhouse Ltd','greenhouse@example.com','5555555555'),(4,'Petal Partners','petal@example.com','1112223333'),(5,'Nature’s Best','naturesbest@example.com','4446668888'),(6,'Orchid Experts','orchid@example.com','7779990000'),(7,'Rose Garden Co','rosegarden@example.com','3331117777'),(8,'Sunflower Traders','sunflower@example.com','8882224444'),(9,'Lily Valley','lilyvalley@example.com','6660003333'),(10,'Tulip Trends','tuliptrends@example.com','9998887777');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-01 11:42:04

-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: criptomoedas_bi
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `cotacoes_atuais`
--

DROP TABLE IF EXISTS `cotacoes_atuais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotacoes_atuais` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_ativo` varchar(50) DEFAULT NULL,
  `preco_usd` decimal(20,8) DEFAULT NULL,
  `market_cap_usd` decimal(30,8) DEFAULT NULL,
  `volume_24h_usd` decimal(30,8) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_ativo` (`nome_ativo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotacoes_atuais`
--

LOCK TABLES `cotacoes_atuais` WRITE;
/*!40000 ALTER TABLE `cotacoes_atuais` DISABLE KEYS */;
INSERT INTO `cotacoes_atuais` VALUES (1,'binancecoin',981.70000000,136573474220.40929000,2235695436.86743500,'2025-09-19 18:27:19'),(2,'bitcoin',115455.00000000,2300054691997.82500000,35993847020.07095000,'2025-09-19 18:27:19'),(3,'ethereum',4462.79000000,538629739087.82150000,28647374072.95870600,'2025-09-19 18:27:19'),(4,'solana',237.56000000,128920605232.82217000,7815356911.67183900,'2025-09-19 18:27:19'),(5,'tether',1.00000000,171515018962.59586000,81724472503.67303000,'2025-09-19 18:27:19');
/*!40000 ALTER TABLE `cotacoes_atuais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotacoes_historico`
--

DROP TABLE IF EXISTS `cotacoes_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotacoes_historico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_ativo` varchar(50) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `preco_usd` decimal(20,8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_ativo` (`nome_ativo`,`data`)
) ENGINE=InnoDB AUTO_INCREMENT=2878 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotacoes_historico`
--

LOCK TABLES `cotacoes_historico` WRITE;
/*!40000 ALTER TABLE `cotacoes_historico` DISABLE KEYS */;
INSERT INTO `cotacoes_historico` VALUES (1,'bitcoin','2025-08-20',114723.40721359),(2,'bitcoin','2025-08-21',112817.82613496),(3,'bitcoin','2025-08-22',116431.22818367),(4,'bitcoin','2025-08-23',115431.18058443),(5,'bitcoin','2025-08-24',113023.46267055),(6,'bitcoin','2025-08-25',109728.82804914),(7,'bitcoin','2025-08-26',111263.82257989),(8,'bitcoin','2025-08-27',111659.07422306),(9,'bitcoin','2025-08-28',111479.67155872),(10,'bitcoin','2025-08-29',107689.75218526),(11,'bitcoin','2025-08-30',109453.20512621),(12,'bitcoin','2025-08-31',108163.58489380),(13,'bitcoin','2025-09-01',109347.43818283),(14,'bitcoin','2025-09-02',111258.43974877),(15,'bitcoin','2025-09-03',111853.88232509),(16,'bitcoin','2025-09-04',111123.18893240),(17,'bitcoin','2025-09-05',110873.87504986),(18,'bitcoin','2025-09-06',110581.74308347),(19,'bitcoin','2025-09-07',110858.36729080),(20,'bitcoin','2025-09-08',111407.09074160),(21,'bitcoin','2025-09-09',111023.09957074),(22,'bitcoin','2025-09-10',113925.24673335),(23,'bitcoin','2025-09-11',115541.43745372),(24,'bitcoin','2025-09-12',115817.78761225),(25,'bitcoin','2025-09-13',116020.94225644),(26,'bitcoin','2025-09-14',115221.82820885),(27,'bitcoin','2025-09-15',115069.45354548),(28,'bitcoin','2025-09-16',116688.52098719),(29,'bitcoin','2025-09-17',116761.69147902),(30,'bitcoin','2025-09-18',117246.22326322),(31,'bitcoin','2025-09-19',115454.83032071),(720,'ethereum','2025-08-20',4333.96172675),(721,'ethereum','2025-08-21',4257.14534476),(722,'ethereum','2025-08-22',4780.95845026),(723,'ethereum','2025-08-23',4774.38470622),(724,'ethereum','2025-08-24',4729.82966902),(725,'ethereum','2025-08-25',4419.08228204),(726,'ethereum','2025-08-26',4560.20267191),(727,'ethereum','2025-08-27',4518.26654963),(728,'ethereum','2025-08-28',4454.50503340),(729,'ethereum','2025-08-29',4280.51089222),(730,'ethereum','2025-08-30',4457.53485221),(731,'ethereum','2025-08-31',4417.59813507),(732,'ethereum','2025-09-01',4323.07712679),(733,'ethereum','2025-09-02',4329.07747539),(734,'ethereum','2025-09-03',4465.64844052),(735,'ethereum','2025-09-04',4326.66957220),(736,'ethereum','2025-09-05',4318.74046698),(737,'ethereum','2025-09-06',4297.97418970),(738,'ethereum','2025-09-07',4289.62041014),(739,'ethereum','2025-09-08',4286.84740505),(740,'ethereum','2025-09-09',4303.48050101),(741,'ethereum','2025-09-10',4366.91750736),(742,'ethereum','2025-09-11',4501.37666301),(743,'ethereum','2025-09-12',4706.60638943),(744,'ethereum','2025-09-13',4675.22928020),(745,'ethereum','2025-09-14',4623.83737503),(746,'ethereum','2025-09-15',4519.69692105),(747,'ethereum','2025-09-16',4514.52156235),(748,'ethereum','2025-09-17',4621.52041028),(749,'ethereum','2025-09-18',4607.38741209),(750,'ethereum','2025-09-19',4463.56340891),(1439,'tether','2025-08-20',1.00004872),(1440,'tether','2025-08-21',0.99975556),(1441,'tether','2025-08-22',0.99957817),(1442,'tether','2025-08-23',0.99968423),(1443,'tether','2025-08-24',0.99990117),(1444,'tether','2025-08-25',1.00018501),(1445,'tether','2025-08-26',1.00014061),(1446,'tether','2025-08-27',1.00008025),(1447,'tether','2025-08-28',1.00020899),(1448,'tether','2025-08-29',1.00024551),(1449,'tether','2025-08-30',1.00020571),(1450,'tether','2025-08-31',1.00015435),(1451,'tether','2025-09-01',1.00006920),(1452,'tether','2025-09-02',1.00004329),(1453,'tether','2025-09-03',1.00041519),(1454,'tether','2025-09-04',1.00016109),(1455,'tether','2025-09-05',1.00017380),(1456,'tether','2025-09-06',1.00031229),(1457,'tether','2025-09-07',0.99999695),(1458,'tether','2025-09-08',1.00010348),(1459,'tether','2025-09-09',1.00009645),(1460,'tether','2025-09-10',1.00027591),(1461,'tether','2025-09-11',1.00040516),(1462,'tether','2025-09-12',1.00061472),(1463,'tether','2025-09-13',1.00060072),(1464,'tether','2025-09-14',1.00062715),(1465,'tether','2025-09-15',1.00034877),(1466,'tether','2025-09-16',1.00037429),(1467,'tether','2025-09-17',1.00037157),(1468,'tether','2025-09-18',1.00033986),(1469,'tether','2025-09-19',1.00037589),(2158,'binancecoin','2025-08-20',878.74520278),(2159,'binancecoin','2025-08-21',845.98421007),(2160,'binancecoin','2025-08-22',884.91463612),(2161,'binancecoin','2025-08-23',882.48783497),(2162,'binancecoin','2025-08-24',874.95220185),(2163,'binancecoin','2025-08-25',844.32965154),(2164,'binancecoin','2025-08-26',858.86688460),(2165,'binancecoin','2025-08-27',856.25775652),(2166,'binancecoin','2025-08-28',873.72298745),(2167,'binancecoin','2025-08-29',855.97005404),(2168,'binancecoin','2025-08-30',863.16342229),(2169,'binancecoin','2025-08-31',862.32210763),(2170,'binancecoin','2025-09-01',849.28316611),(2171,'binancecoin','2025-09-02',851.77592801),(2172,'binancecoin','2025-09-03',854.78051395),(2173,'binancecoin','2025-09-04',846.42764468),(2174,'binancecoin','2025-09-05',854.98380191),(2175,'binancecoin','2025-09-06',862.93586508),(2176,'binancecoin','2025-09-07',878.37086526),(2177,'binancecoin','2025-09-08',873.19943345),(2178,'binancecoin','2025-09-09',878.76545466),(2179,'binancecoin','2025-09-10',891.53819037),(2180,'binancecoin','2025-09-11',905.07324939),(2181,'binancecoin','2025-09-12',927.89717187),(2182,'binancecoin','2025-09-13',935.32525332),(2183,'binancecoin','2025-09-14',928.35198750),(2184,'binancecoin','2025-09-15',920.97858752),(2185,'binancecoin','2025-09-16',956.82048080),(2186,'binancecoin','2025-09-17',991.35288638),(2187,'binancecoin','2025-09-18',985.51044605),(2188,'binancecoin','2025-09-19',981.74248643);
/*!40000 ALTER TABLE `cotacoes_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'criptomoedas_bi'
--

--
-- Dumping routines for database 'criptomoedas_bi'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-19 18:51:38

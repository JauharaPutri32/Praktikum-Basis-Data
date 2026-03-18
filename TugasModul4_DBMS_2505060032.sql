-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mahasiswa
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data` (
  `NPM` int(3) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Jurusan` varchar(20) NOT NULL,
  `Matkul` varchar(20) NOT NULL,
  `Nilai_Matkul` int(3) NOT NULL,
  PRIMARY KEY (`NPM`,`Matkul`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES (101,'Na Jaemin','Farmasi','Bahasa Indonesia',86),(101,'Na Jaemin','Farmasi','Bahasa Inggris',80),(101,'Na Jaemin','Farmasi','Pendidikan Pancasila',88),(102,'Carmenita','Farmasi','Bahasa Indonesia',91),(102,'Carmenita','Farmasi','Bahasa Inggris',90),(201,'Lee Jeno','Pendidikan Matematik','Pendidikan Pancasila',86),(202,'Hwang In Youp','Pendidikan Matematik','Bahasa Inggris',90),(202,'Hwang In Youp','Pendidikan Matematik','Geometri',92),(203,'Kim Jisoo','Pendidikan Matematik','Bahasa Indonesia',80),(203,'Kim Jisoo','Pendidikan Matematik','Geometri',89),(301,'Im Yoon Ah','Teknologi Informasi','Bahasa Indonesia',95),(301,'Im Yoon Ah','Teknologi Informasi','Bahasa Inggris',100),(301,'Im Yoon Ah','Teknologi Informasi','Kalkulus Dasar',93),(301,'Im Yoon Ah','Teknologi Informasi','Kalkulus Lanjut',100),(302,'Seo Kangjoon','Teknologi Informasi','Kalkulus Dasar',81),(302,'Seo Kangjoon','Teknologi Informasi','Kalkulus Lanjut',90);
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-18  7:25:37

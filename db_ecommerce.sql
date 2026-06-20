-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_ecommerce
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
-- Temporary table structure for view `data_pelanggan_pribadi`
--

DROP TABLE IF EXISTS `data_pelanggan_pribadi`;
/*!50001 DROP VIEW IF EXISTS `data_pelanggan_pribadi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `data_pelanggan_pribadi` AS SELECT
 1 AS `id_pelanggan`,
  1 AS `Nama`,
  1 AS `Alamat` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `data_toko_pribadi`
--

DROP TABLE IF EXISTS `data_toko_pribadi`;
/*!50001 DROP VIEW IF EXISTS `data_toko_pribadi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `data_toko_pribadi` AS SELECT
 1 AS `id_toko`,
  1 AS `Nama_Toko`,
  1 AS `id_produk`,
  1 AS `Nama_Produk`,
  1 AS `Harga` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `detail_pesanan`
--

DROP TABLE IF EXISTS `detail_pesanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_pesanan` (
  `id_pesanan` varchar(5) NOT NULL,
  `id_produk` varchar(5) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pesanan`,`id_produk`),
  KEY `id_produk` (`id_produk`),
  CONSTRAINT `detail_pesanan_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_pesanan_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_pesanan`
--

LOCK TABLES `detail_pesanan` WRITE;
/*!40000 ALTER TABLE `detail_pesanan` DISABLE KEYS */;
INSERT INTO `detail_pesanan` VALUES ('P-001','PR-01',2),('P-001','PR-02',3),('P-001','PR-03',1),('P-002','PR-04',1),('P-002','PR-05',1),('P-003','PR-06',5),('P-004','PR-07',3);
/*!40000 ALTER TABLE `detail_pesanan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validasiQTY` BEFORE INSERT ON `detail_pesanan` FOR EACH ROW IF NEW.qty <= 0 THEN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Pemesanan GAGAL : QTY yang dipesan minimal harus 1 pcs.';
END IF */;;
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `logPesanan` AFTER UPDATE ON `detail_pesanan` FOR EACH ROW IF (OLD.id_produk <> NEW.id_produk) OR (OLD.qty <> NEW.qty) THEN
	INSERT INTO perubahan_pesanan (id_pesanan, Log_perubahan, Pengubah)
    VALUES (OLD.id_pesanan, CONCAT('Perubahan pesanan, ', 'Produk lama: [', OLD.id_produk,'] -> Produk baru: [', NEW.id_produk, '], ', 'QTY lama: (', OLD.qty, ') -> QTY baru: (', NEW.qty, ').'), CURRENT_USER());
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pelanggan`
--

DROP TABLE IF EXISTS `pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(100) DEFAULT NULL,
  `Alamat` text DEFAULT NULL,
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=6667 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan`
--

LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
INSERT INTO `pelanggan` VALUES (1111,'Rina','Jl. Tentara Pelajar No.1'),(2222,'Budi','Jl. Beringin VI No.2'),(3333,'Andi','Jl. Cawang No.3'),(4444,'Tono','Jl. Merdeka No.4'),(5555,'Sinta','Jl. Pemuda No.5'),(6666,'Pelanggan','Jl. Nuklir No.23');
/*!40000 ALTER TABLE `pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perubahan_pesanan`
--

DROP TABLE IF EXISTS `perubahan_pesanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perubahan_pesanan` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `id_pesanan` varchar(5) NOT NULL,
  `Log_perubahan` text NOT NULL,
  `Waktu_perubahan` timestamp NOT NULL DEFAULT current_timestamp(),
  `Pengubah` varchar(30) NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perubahan_pesanan`
--

LOCK TABLES `perubahan_pesanan` WRITE;
/*!40000 ALTER TABLE `perubahan_pesanan` DISABLE KEYS */;
INSERT INTO `perubahan_pesanan` VALUES (1,'P-003','Perubahan pesanan, Produk lama: [PR-06] -> Produk baru: [PR-06], QTY lama: (1) -> QTY baru: (5).','2026-06-18 13:33:53','root@localhost');
/*!40000 ALTER TABLE `perubahan_pesanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanan`
--

DROP TABLE IF EXISTS `pesanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesanan` (
  `id_pesanan` varchar(5) NOT NULL,
  `Tanggal` date DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pesanan`),
  KEY `id_pelanggan` (`id_pelanggan`),
  CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanan`
--

LOCK TABLES `pesanan` WRITE;
/*!40000 ALTER TABLE `pesanan` DISABLE KEYS */;
INSERT INTO `pesanan` VALUES ('P-001','2026-01-13',1111),('P-002','2026-02-14',2222),('P-003','2026-03-15',3333),('P-004','2026-04-16',6666);
/*!40000 ALTER TABLE `pesanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `pesanan_pelanggan`
--

DROP TABLE IF EXISTS `pesanan_pelanggan`;
/*!50001 DROP VIEW IF EXISTS `pesanan_pelanggan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `pesanan_pelanggan` AS SELECT
 1 AS `id_pesanan`,
  1 AS `Tanggal`,
  1 AS `Nama_Toko`,
  1 AS `Nama_Produk`,
  1 AS `qty`,
  1 AS `Harga`,
  1 AS `Total_Harga` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `produk`
--

DROP TABLE IF EXISTS `produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produk` (
  `id_produk` varchar(5) NOT NULL,
  `Nama_Produk` varchar(100) DEFAULT NULL,
  `Harga` decimal(10,2) DEFAULT NULL,
  `id_toko` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_produk`),
  KEY `id_toko` (`id_toko`),
  KEY `idx_harga` (`Harga`),
  CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id_toko`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produk`
--

LOCK TABLES `produk` WRITE;
/*!40000 ALTER TABLE `produk` DISABLE KEYS */;
INSERT INTO `produk` VALUES ('PR-01','Tas',99000.00,'T-001'),('PR-02','Sunscreen',67000.00,'T-001'),('PR-03','Set cat akrilik',182000.00,'T-001'),('PR-04','Hoodie',499000.00,'T-002'),('PR-05','Topi',149000.00,'T-002'),('PR-06','Sweater',300000.00,'T-003'),('PR-07','Gaun',599000.00,'T-004');
/*!40000 ALTER TABLE `produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `tampil_semua`
--

DROP TABLE IF EXISTS `tampil_semua`;
/*!50001 DROP VIEW IF EXISTS `tampil_semua`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `tampil_semua` AS SELECT
 1 AS `id_pesanan`,
  1 AS `Tanggal`,
  1 AS `id_pelanggan`,
  1 AS `Nama`,
  1 AS `Alamat`,
  1 AS `id_toko`,
  1 AS `Nama_Toko`,
  1 AS `id_produk`,
  1 AS `Nama_Produk`,
  1 AS `Harga`,
  1 AS `qty` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `temp_tabel`
--

DROP TABLE IF EXISTS `temp_tabel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_tabel` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_tabel`
--

LOCK TABLES `temp_tabel` WRITE;
/*!40000 ALTER TABLE `temp_tabel` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_tabel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toko`
--

DROP TABLE IF EXISTS `toko`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `toko` (
  `id_toko` varchar(5) NOT NULL,
  `Nama_Toko` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_toko`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toko`
--

LOCK TABLES `toko` WRITE;
/*!40000 ALTER TABLE `toko` DISABLE KEYS */;
INSERT INTO `toko` VALUES ('T-001','Jimshoney_official'),('T-002','Eiger_adventure'),('T-003','Hexity st'),('T-004','Pemilik_Toko');
/*!40000 ALTER TABLE `toko` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `transaksi_toko_pribadi`
--

DROP TABLE IF EXISTS `transaksi_toko_pribadi`;
/*!50001 DROP VIEW IF EXISTS `transaksi_toko_pribadi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `transaksi_toko_pribadi` AS SELECT
 1 AS `id_pesanan`,
  1 AS `Tanggal`,
  1 AS `Nama_Pelanggan`,
  1 AS `Alamat`,
  1 AS `id_produk`,
  1 AS `Nama_Produk`,
  1 AS `qty`,
  1 AS `Harga`,
  1 AS `Total_Harga` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_detail_pesanan`
--

DROP TABLE IF EXISTS `view_detail_pesanan`;
/*!50001 DROP VIEW IF EXISTS `view_detail_pesanan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_detail_pesanan` AS SELECT
 1 AS `id_pesanan`,
  1 AS `id_produk`,
  1 AS `qty` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `data_pelanggan_pribadi`
--

/*!50001 DROP VIEW IF EXISTS `data_pelanggan_pribadi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `data_pelanggan_pribadi` AS select `pelanggan`.`id_pelanggan` AS `id_pelanggan`,`pelanggan`.`Nama` AS `Nama`,`pelanggan`.`Alamat` AS `Alamat` from `pelanggan` where `pelanggan`.`Nama` = substring_index(user(),'@',1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `data_toko_pribadi`
--

/*!50001 DROP VIEW IF EXISTS `data_toko_pribadi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `data_toko_pribadi` AS select `t`.`id_toko` AS `id_toko`,`t`.`Nama_Toko` AS `Nama_Toko`,`p`.`id_produk` AS `id_produk`,`p`.`Nama_Produk` AS `Nama_Produk`,`p`.`Harga` AS `Harga` from (`toko` `t` left join `produk` `p` on(`t`.`id_toko` = `p`.`id_toko`)) where `t`.`Nama_Toko` = substring_index(user(),'@',1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pesanan_pelanggan`
--

/*!50001 DROP VIEW IF EXISTS `pesanan_pelanggan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pesanan_pelanggan` AS select `p`.`id_pesanan` AS `id_pesanan`,`p`.`Tanggal` AS `Tanggal`,`t`.`Nama_Toko` AS `Nama_Toko`,`r`.`Nama_Produk` AS `Nama_Produk`,`d`.`qty` AS `qty`,`r`.`Harga` AS `Harga`,`d`.`qty` * `r`.`Harga` AS `Total_Harga` from ((((`pesanan` `p` join `detail_pesanan` `d` on(`p`.`id_pesanan` = `d`.`id_pesanan`)) join `produk` `r` on(`d`.`id_produk` = `r`.`id_produk`)) join `toko` `t` on(`r`.`id_toko` = `t`.`id_toko`)) join `pelanggan` `e` on(`p`.`id_pelanggan` = `e`.`id_pelanggan`)) where `e`.`Nama` = substring_index(user(),'@',1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tampil_semua`
--

/*!50001 DROP VIEW IF EXISTS `tampil_semua`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tampil_semua` AS select `d`.`id_pesanan` AS `id_pesanan`,`p`.`Tanggal` AS `Tanggal`,`p`.`id_pelanggan` AS `id_pelanggan`,`e`.`Nama` AS `Nama`,`e`.`Alamat` AS `Alamat`,`r`.`id_toko` AS `id_toko`,`t`.`Nama_Toko` AS `Nama_Toko`,`d`.`id_produk` AS `id_produk`,`r`.`Nama_Produk` AS `Nama_Produk`,`r`.`Harga` AS `Harga`,`d`.`qty` AS `qty` from ((((`detail_pesanan` `d` join `pesanan` `p` on(`d`.`id_pesanan` = `p`.`id_pesanan`)) join `pelanggan` `e` on(`p`.`id_pelanggan` = `e`.`id_pelanggan`)) join `produk` `r` on(`d`.`id_produk` = `r`.`id_produk`)) join `toko` `t` on(`r`.`id_toko` = `t`.`id_toko`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `transaksi_toko_pribadi`
--

/*!50001 DROP VIEW IF EXISTS `transaksi_toko_pribadi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `transaksi_toko_pribadi` AS select `p`.`id_pesanan` AS `id_pesanan`,`p`.`Tanggal` AS `Tanggal`,`e`.`Nama` AS `Nama_Pelanggan`,`e`.`Alamat` AS `Alamat`,`d`.`id_produk` AS `id_produk`,`r`.`Nama_Produk` AS `Nama_Produk`,`d`.`qty` AS `qty`,`r`.`Harga` AS `Harga`,`d`.`qty` * `r`.`Harga` AS `Total_Harga` from ((((`pesanan` `p` join `detail_pesanan` `d` on(`p`.`id_pesanan` = `d`.`id_pesanan`)) join `produk` `r` on(`d`.`id_produk` = `r`.`id_produk`)) join `toko` `t` on(`r`.`id_toko` = `t`.`id_toko`)) join `pelanggan` `e` on(`p`.`id_pelanggan` = `e`.`id_pelanggan`)) where `t`.`Nama_Toko` = substring_index(user(),'@',1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_detail_pesanan`
--

/*!50001 DROP VIEW IF EXISTS `view_detail_pesanan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_detail_pesanan` AS select `detail_pesanan`.`id_pesanan` AS `id_pesanan`,`detail_pesanan`.`id_produk` AS `id_produk`,`detail_pesanan`.`qty` AS `qty` from `detail_pesanan` where `detail_pesanan`.`qty` >= 2 */;
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

-- Dump completed on 2026-06-20  9:47:10

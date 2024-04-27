-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 27, 2024 at 12:49 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_wisata_pulau_derawan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID_ADMIN` int NOT NULL,
  `ID_Pemandu_Wisata` int DEFAULT NULL,
  `NAMA_ADMIN` varchar(100) DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `ID_HOTEL` int NOT NULL,
  `NAMA_HOTEL` varchar(100) DEFAULT NULL,
  `LOKASI` varchar(100) DEFAULT NULL,
  `FASILITAS` text,
  `HARGA_MALAM` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `ID_KAMAR` int NOT NULL,
  `ID_HOTEL` int DEFAULT NULL,
  `JENIS_KAMAR` varchar(50) DEFAULT NULL,
  `HARGA` decimal(10,2) DEFAULT NULL,
  `KAPASITAS` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `objek_atraksi`
--

CREATE TABLE `objek_atraksi` (
  `ID_OBJEK_ATRAKSI` int NOT NULL,
  `ID_TEMPAT_WISATA` int DEFAULT NULL,
  `NAMA_OBJEK_ATRAKSI` varchar(100) DEFAULT NULL,
  `DESKRIPSI` text,
  `FASILITAS` text,
  `HARGA` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemandu_wisata`
--

CREATE TABLE `pemandu_wisata` (
  `ID_PEMANDU_WISATA` int NOT NULL,
  `ID_TEMPAT_WISATA` int DEFAULT NULL,
  `NAMA_PEMANDU_WISATA` varchar(100) DEFAULT NULL,
  `JENIS_KELAMIN` varchar(20) DEFAULT NULL,
  `NO_HP` varchar(20) DEFAULT NULL,
  `BAHASA` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `ID_PEMESANAN` int NOT NULL,
  `ID_TEMPAT_WISATA` int DEFAULT NULL,
  `ID_HOTEL` int DEFAULT NULL,
  `ID_KAMAR` int DEFAULT NULL,
  `TANGGAL_MASUK` date DEFAULT NULL,
  `TANGGAL_KELUAR` date DEFAULT NULL,
  `STATUS_PEMBAYARAN` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengunjung`
--

CREATE TABLE `pengunjung` (
  `ID_PENGUNJUNG` int NOT NULL,
  `ID_PEMESANAN` int DEFAULT NULL,
  `ID_PEMANDU_WISATA` int DEFAULT NULL,
  `ID_RECEPCIONIST` int DEFAULT NULL,
  `ID_HOTEL` int DEFAULT NULL,
  `ID_TEMPAT_WISATA` int DEFAULT NULL,
  `ID_ULASAN` int DEFAULT NULL,
  `NAMA_PENGUNJUNG` varchar(100) DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `NO_HP` varchar(20) DEFAULT NULL,
  `ALAMAT` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recepcionist_hotel`
--

CREATE TABLE `recepcionist_hotel` (
  `ID_RECEPCIONIST` int NOT NULL,
  `ID_HOTEL` int DEFAULT NULL,
  `NAMA_RECEPCIONIST` varchar(100) DEFAULT NULL,
  `JENIS_KELAMIN` varchar(20) DEFAULT NULL,
  `NO_HP` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tempat_wisata`
--

CREATE TABLE `tempat_wisata` (
  `ID_TEMPAT_WISATA` int NOT NULL,
  `NAMA_TEMPAT` varchar(100) DEFAULT NULL,
  `LOKASI` varchar(100) DEFAULT NULL,
  `DESKRIPSI` text,
  `FASILITAS` text,
  `JAM_BUKA` time DEFAULT NULL,
  `JAM_TUTUP` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ulasan`
--

CREATE TABLE `ulasan` (
  `ID_ULASAN` int NOT NULL,
  `ID_TEMPAT_WISATA` int DEFAULT NULL,
  `ID_HOTEL` int DEFAULT NULL,
  `KOMENTAR` text,
  `BINTANG_ULASAN` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_ADMIN`),
  ADD KEY `ID_Pemandu_Wisata` (`ID_Pemandu_Wisata`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`ID_HOTEL`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`ID_KAMAR`),
  ADD KEY `ID_HOTEL` (`ID_HOTEL`);

--
-- Indexes for table `objek_atraksi`
--
ALTER TABLE `objek_atraksi`
  ADD PRIMARY KEY (`ID_OBJEK_ATRAKSI`),
  ADD KEY `ID_TEMPAT_WISATA` (`ID_TEMPAT_WISATA`);

--
-- Indexes for table `pemandu_wisata`
--
ALTER TABLE `pemandu_wisata`
  ADD PRIMARY KEY (`ID_PEMANDU_WISATA`),
  ADD KEY `ID_TEMPAT_WISATA` (`ID_TEMPAT_WISATA`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`ID_PEMESANAN`),
  ADD KEY `ID_TEMPAT_WISATA` (`ID_TEMPAT_WISATA`),
  ADD KEY `ID_HOTEL` (`ID_HOTEL`),
  ADD KEY `ID_KAMAR` (`ID_KAMAR`);

--
-- Indexes for table `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD PRIMARY KEY (`ID_PENGUNJUNG`),
  ADD KEY `ID_PEMESANAN` (`ID_PEMESANAN`),
  ADD KEY `ID_PEMANDU_WISATA` (`ID_PEMANDU_WISATA`),
  ADD KEY `ID_RECEPCIONIST` (`ID_RECEPCIONIST`),
  ADD KEY `ID_HOTEL` (`ID_HOTEL`),
  ADD KEY `ID_TEMPAT_WISATA` (`ID_TEMPAT_WISATA`),
  ADD KEY `ID_ULASAN` (`ID_ULASAN`);

--
-- Indexes for table `recepcionist_hotel`
--
ALTER TABLE `recepcionist_hotel`
  ADD PRIMARY KEY (`ID_RECEPCIONIST`),
  ADD KEY `ID_HOTEL` (`ID_HOTEL`);

--
-- Indexes for table `tempat_wisata`
--
ALTER TABLE `tempat_wisata`
  ADD PRIMARY KEY (`ID_TEMPAT_WISATA`);

--
-- Indexes for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD PRIMARY KEY (`ID_ULASAN`),
  ADD KEY `ID_TEMPAT_WISATA` (`ID_TEMPAT_WISATA`),
  ADD KEY `ID_HOTEL` (`ID_HOTEL`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`ID_Pemandu_Wisata`) REFERENCES `pemandu_wisata` (`ID_PEMANDU_WISATA`);

--
-- Constraints for table `kamar`
--
ALTER TABLE `kamar`
  ADD CONSTRAINT `kamar_ibfk_1` FOREIGN KEY (`ID_HOTEL`) REFERENCES `hotel` (`ID_HOTEL`);

--
-- Constraints for table `objek_atraksi`
--
ALTER TABLE `objek_atraksi`
  ADD CONSTRAINT `objek_atraksi_ibfk_1` FOREIGN KEY (`ID_TEMPAT_WISATA`) REFERENCES `tempat_wisata` (`ID_TEMPAT_WISATA`);

--
-- Constraints for table `pemandu_wisata`
--
ALTER TABLE `pemandu_wisata`
  ADD CONSTRAINT `pemandu_wisata_ibfk_1` FOREIGN KEY (`ID_TEMPAT_WISATA`) REFERENCES `tempat_wisata` (`ID_TEMPAT_WISATA`);

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`ID_TEMPAT_WISATA`) REFERENCES `tempat_wisata` (`ID_TEMPAT_WISATA`),
  ADD CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`ID_HOTEL`) REFERENCES `hotel` (`ID_HOTEL`),
  ADD CONSTRAINT `pemesanan_ibfk_3` FOREIGN KEY (`ID_KAMAR`) REFERENCES `kamar` (`ID_KAMAR`);

--
-- Constraints for table `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD CONSTRAINT `pengunjung_ibfk_1` FOREIGN KEY (`ID_PEMESANAN`) REFERENCES `pemesanan` (`ID_PEMESANAN`),
  ADD CONSTRAINT `pengunjung_ibfk_2` FOREIGN KEY (`ID_PEMANDU_WISATA`) REFERENCES `pemandu_wisata` (`ID_PEMANDU_WISATA`),
  ADD CONSTRAINT `pengunjung_ibfk_3` FOREIGN KEY (`ID_RECEPCIONIST`) REFERENCES `recepcionist_hotel` (`ID_RECEPCIONIST`),
  ADD CONSTRAINT `pengunjung_ibfk_4` FOREIGN KEY (`ID_HOTEL`) REFERENCES `hotel` (`ID_HOTEL`),
  ADD CONSTRAINT `pengunjung_ibfk_5` FOREIGN KEY (`ID_TEMPAT_WISATA`) REFERENCES `tempat_wisata` (`ID_TEMPAT_WISATA`),
  ADD CONSTRAINT `pengunjung_ibfk_6` FOREIGN KEY (`ID_ULASAN`) REFERENCES `ulasan` (`ID_ULASAN`);

--
-- Constraints for table `recepcionist_hotel`
--
ALTER TABLE `recepcionist_hotel`
  ADD CONSTRAINT `recepcionist_hotel_ibfk_1` FOREIGN KEY (`ID_HOTEL`) REFERENCES `hotel` (`ID_HOTEL`);

--
-- Constraints for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD CONSTRAINT `ulasan_ibfk_1` FOREIGN KEY (`ID_TEMPAT_WISATA`) REFERENCES `tempat_wisata` (`ID_TEMPAT_WISATA`),
  ADD CONSTRAINT `ulasan_ibfk_2` FOREIGN KEY (`ID_HOTEL`) REFERENCES `hotel` (`ID_HOTEL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2024 at 05:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `databaseaol`
--

-- --------------------------------------------------------

--
-- Table structure for table `msbarang`
--

CREATE TABLE `msbarang` (
  `Nama_Barang` varchar(50) NOT NULL,
  `Satuan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `msbarang`
--

INSERT INTO `msbarang` (`Nama_Barang`, `Satuan`) VALUES
('Helm Keselamatan', 'Unit'),
('Masker N95', 'Box'),
('Rompi Reflective', 'Buah'),
('Sarung Tangan Karet', 'Pasang'),
('Sepatu Boot', 'Pasang'),
('Seragam Safety', 'Set');

-- --------------------------------------------------------

--
-- Table structure for table `msdetailpeminjaman`
--

CREATE TABLE `msdetailpeminjaman` (
  `No_Peminjaman` varchar(10) NOT NULL,
  `Nama_Barang` varchar(50) NOT NULL,
  `Jumlah_Angka` int(11) DEFAULT NULL,
  `Keterangan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `msdetailpeminjaman`
--

INSERT INTO `msdetailpeminjaman` (`No_Peminjaman`, `Nama_Barang`, `Jumlah_Angka`, `Keterangan`) VALUES
('P001', 'Helm Keselamatan', 10, 'Baik'),
('P001', 'Rompi Reflective', 5, 'Baik'),
('P002', 'Sarung Tangan Karet', 8, 'Baru'),
('P002', 'Sepatu Boot', 8, 'Sedikit Kotor'),
('P003', 'Masker N95', 50, 'Baik'),
('P004', 'Helm Keselamatan', 12, 'Baik'),
('P005', 'Rompi Reflective', 7, 'Baik'),
('P005', 'Seragam Safety', 10, 'Baik'),
('P006', 'Masker N95', 30, 'Baik'),
('P007', 'Helm Keselamatan', 8, 'Baik'),
('P008', 'Sarung Tangan Karet', 18, 'Baru'),
('P008', 'Sepatu Boot', 5, 'Sedikit Kotor');

-- --------------------------------------------------------

--
-- Table structure for table `mskaryawan`
--

CREATE TABLE `mskaryawan` (
  `Nama_Karyawan` varchar(50) NOT NULL,
  `Jabatan` varchar(50) DEFAULT NULL,
  `Departemen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mskaryawan`
--

INSERT INTO `mskaryawan` (`Nama_Karyawan`, `Jabatan`, `Departemen`) VALUES
('Andi Prasetyo', 'Supervisor', 'Logistik'),
('Arief Setiawan', 'Manajer', 'Pemasaran'),
('Budi Santosa', 'Supervisor', 'Pemasaran'),
('Budi Santoso', 'Operator', 'Produksi'),
('Dina Marlina', 'Asisten', 'Gudang'),
('Fajar Nurhadi', 'Supervisor', 'Produksi'),
('Rina Pratiwi', 'Operator', 'Logistik'),
('Siti Rohmah', 'Staff Gudang', 'Gudang');

-- --------------------------------------------------------

--
-- Table structure for table `mspeminjaman`
--

CREATE TABLE `mspeminjaman` (
  `No_Peminjaman` varchar(10) NOT NULL,
  `Nama_Karyawan` varchar(50) DEFAULT NULL,
  `Tanggal_Peminjaman` date NOT NULL,
  `Tanggal_Pengembalian` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mspeminjaman`
--

INSERT INTO `mspeminjaman` (`No_Peminjaman`, `Nama_Karyawan`, `Tanggal_Peminjaman`, `Tanggal_Pengembalian`) VALUES
('P001', 'Andi Prasetyo', '2024-12-01', '2024-12-10'),
('P002', 'Budi Santoso', '2024-12-03', '2024-12-15'),
('P003', 'Siti Rohmah', '2024-12-05', '2024-12-12'),
('P004', 'Arief Setiawan', '2024-12-06', '2024-12-13'),
('P005', 'Dina Marlina', '2024-12-07', '2024-12-14'),
('P006', 'Fajar Nurhadi', '2024-12-08', '2024-12-16'),
('P007', 'Rina Pratiwi', '2024-12-09', '2024-12-17'),
('P008', 'Budi Santosa', '2024-12-10', '2024-12-17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `msbarang`
--
ALTER TABLE `msbarang`
  ADD PRIMARY KEY (`Nama_Barang`);

--
-- Indexes for table `msdetailpeminjaman`
--
ALTER TABLE `msdetailpeminjaman`
  ADD PRIMARY KEY (`No_Peminjaman`,`Nama_Barang`),
  ADD KEY `Nama_Barang` (`Nama_Barang`);

--
-- Indexes for table `mskaryawan`
--
ALTER TABLE `mskaryawan`
  ADD PRIMARY KEY (`Nama_Karyawan`);

--
-- Indexes for table `mspeminjaman`
--
ALTER TABLE `mspeminjaman`
  ADD PRIMARY KEY (`No_Peminjaman`),
  ADD KEY `Nama_Karyawan` (`Nama_Karyawan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `msdetailpeminjaman`
--
ALTER TABLE `msdetailpeminjaman`
  ADD CONSTRAINT `msdetailpeminjaman_ibfk_1` FOREIGN KEY (`No_Peminjaman`) REFERENCES `mspeminjaman` (`No_Peminjaman`),
  ADD CONSTRAINT `msdetailpeminjaman_ibfk_2` FOREIGN KEY (`Nama_Barang`) REFERENCES `msbarang` (`Nama_Barang`);

--
-- Constraints for table `mspeminjaman`
--
ALTER TABLE `mspeminjaman`
  ADD CONSTRAINT `mspeminjaman_ibfk_1` FOREIGN KEY (`Nama_Karyawan`) REFERENCES `mskaryawan` (`Nama_Karyawan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

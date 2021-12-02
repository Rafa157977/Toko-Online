-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2021 at 12:56 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembelian_senjata`
--

CREATE TABLE `detail_pembelian_senjata` (
  `id_detail_pembelian_senjata` int(20) NOT NULL,
  `id_pembelian_senjata` int(20) NOT NULL,
  `id_senjata` int(20) NOT NULL,
  `qty` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_senjata`
--

CREATE TABLE `pembelian_senjata` (
  `id_pembelian_senjata` int(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  `tanggal_beli` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `senjata`
--

CREATE TABLE `senjata` (
  `id_senjata` int(20) NOT NULL,
  `nama_senjata` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `senjata`
--

INSERT INTO `senjata` (`id_senjata`, `nama_senjata`, `deskripsi`, `harga`) VALUES
(1, 'Excalibur', 'Pedang suci terkuat dan paling agung yang melambangkan Raja Arthur.', 1000000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(20) NOT NULL,
  `nama_user` text NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `username` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `tanggal_lahir`, `alamat`, `gender`, `username`, `password`) VALUES
(1, 'Rafa', '2005-11-15', 'Malang', 'L', 'rafa', '123456789');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_pembelian_senjata`
--
ALTER TABLE `detail_pembelian_senjata`
  ADD PRIMARY KEY (`id_detail_pembelian_senjata`),
  ADD KEY `id_pembelian_senjata` (`id_pembelian_senjata`,`id_senjata`),
  ADD KEY `id_senjata` (`id_senjata`);

--
-- Indexes for table `pembelian_senjata`
--
ALTER TABLE `pembelian_senjata`
  ADD PRIMARY KEY (`id_pembelian_senjata`),
  ADD KEY `id` (`id_user`);

--
-- Indexes for table `senjata`
--
ALTER TABLE `senjata`
  ADD PRIMARY KEY (`id_senjata`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_pembelian_senjata`
--
ALTER TABLE `detail_pembelian_senjata`
  MODIFY `id_detail_pembelian_senjata` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pembelian_senjata`
--
ALTER TABLE `pembelian_senjata`
  MODIFY `id_pembelian_senjata` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `senjata`
--
ALTER TABLE `senjata`
  MODIFY `id_senjata` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_pembelian_senjata`
--
ALTER TABLE `detail_pembelian_senjata`
  ADD CONSTRAINT `detail_pembelian_senjata_ibfk_1` FOREIGN KEY (`id_pembelian_senjata`) REFERENCES `pembelian_senjata` (`id_pembelian_senjata`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_pembelian_senjata_ibfk_2` FOREIGN KEY (`id_senjata`) REFERENCES `senjata` (`id_senjata`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembelian_senjata`
--
ALTER TABLE `pembelian_senjata`
  ADD CONSTRAINT `pembelian_senjata_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

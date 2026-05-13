-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Bulan Mei 2026 pada 02.15
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sub_query`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ambil_mk`
--

CREATE TABLE `ambil_mk` (
  `NIM` char(3) NOT NULL,
  `KD_MK` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ambil_mk`
--

INSERT INTO `ambil_mk` (`NIM`, `KD_MK`) VALUES
('101', 'PTI447'),
('103', 'TIK333'),
('104', 'PTI333'),
('104', 'PTI777'),
('105', 'PTI123'),
('107', 'PTI777');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `KODE_DOS` char(2) NOT NULL,
  `NAMA_DOS` varchar(30) NOT NULL,
  `ALAMAT_DOS` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`KODE_DOS`, `NAMA_DOS`, `ALAMAT_DOS`) VALUES
('10', 'Suharto', 'Jl. Jombang'),
('11', 'Martono', 'Jl. Kalpataru'),
('12', 'Rahmawati', 'Jl. Jakarta'),
('13', 'Bambang', 'Jl. Bandung'),
('14', 'Nurul', 'Jl. Raya Tidar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `KODE_JUR` char(2) NOT NULL,
  `NAMA_JUR` varchar(30) NOT NULL,
  `KD_DOS_J` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`KODE_JUR`, `NAMA_JUR`, `KD_DOS_J`) VALUES
('TE', 'Teknik Elektro', '10'),
('TM', 'Teknik Mesin', '13'),
('TS', 'Teknik Sipil', '23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM_M` char(3) NOT NULL,
  `NAMA` varchar(30) NOT NULL,
  `JK` char(1) NOT NULL,
  `ALAMAT` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM_M`, `NAMA`, `JK`, `ALAMAT`) VALUES
('101', 'Arif', 'L', 'Jl. Kenangan'),
('102', 'Budi', 'L', 'Jl. Jombang'),
('103', 'Wati', 'P', 'Jl. Surabaya'),
('104', 'Ika', 'P', 'Jl. Jombang'),
('105', 'Tono', 'L', 'Jl. Jakarta'),
('106', 'Iwan', 'L', 'Jl. Bandung'),
('107', 'Sari', 'P', 'Jl. Malang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `KODE_MK` char(6) NOT NULL,
  `NAMA_MK` varchar(30) NOT NULL,
  `SKS` int(1) NOT NULL,
  `SEMESTER` int(1) NOT NULL,
  `KD_DOS` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`KODE_MK`, `NAMA_MK`, `SKS`, `SEMESTER`, `KD_DOS`) VALUES
('PTI123', 'Grafika Multimedia', 3, 5, '12'),
('PTI333', 'Basis Data Terdistribusi', 3, 5, '10'),
('PTI447', 'Praktikum Basis Data', 1, 3, '11'),
('PTI777', 'Sistem Informasi', 2, 3, '99'),
('TIK123', 'Jaringan Komputer', 2, 5, '33'),
('TIK333', 'Sistem Operasi', 3, 5, '10'),
('TIK342', 'Praktikum Basis Data', 1, 3, '11');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`KODE_DOS`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`KODE_JUR`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM_M`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`KODE_MK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

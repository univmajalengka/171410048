-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Bulan Mei 2019 pada 14.43
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpusuput`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `setup`
--

CREATE TABLE `setup` (
  `app_title` text NOT NULL,
  `app_version` text NOT NULL,
  `app_description` text NOT NULL,
  `app_footer` text NOT NULL,
  `app_theme` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `setup`
--

INSERT INTO `setup` (`app_title`, `app_version`, `app_description`, `app_footer`, `app_theme`) VALUES
('PERPUSTAKAAN', '1.0.0', 'Sistem Informasi Perpustakaan', 'Copyright Â© 2019  Puput Putriani', 'skin-blue');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_anggota`
--

CREATE TABLE `tb_anggota` (
  `id_anggota` varchar(4) NOT NULL,
  `nm_anggota` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(12) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_anggota`
--

INSERT INTO `tb_anggota` (`id_anggota`, `nm_anggota`, `jenis_kelamin`, `alamat`) VALUES
('A001', 'PUPUT PUTRIANI', 'Perempuan', 'Lemahsugih');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_buku`
--

CREATE TABLE `tb_buku` (
  `kd_buku` varchar(6) NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `id_pengarang` int(11) NOT NULL,
  `id_penerbit` int(11) NOT NULL,
  `jml_buku` int(11) NOT NULL,
  `tahun_terbit` int(11) NOT NULL,
  `no_rak` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_buku`
--

INSERT INTO `tb_buku` (`kd_buku`, `judul_buku`, `id_pengarang`, `id_penerbit`, `jml_buku`, `tahun_terbit`, `no_rak`) VALUES
('B001', 'PHOTOSHOP', 1, 1, 10, 2018, '10'),
('B002', 'SISTEM BASIS DATA 1', 1, 1, 10, 2018, '5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_peminjaman`
--

CREATE TABLE `tb_peminjaman` (
  `kd_pinjam` varchar(10) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `lama_pinjam` int(11) NOT NULL,
  `denda` int(11) NOT NULL,
  `kd_buku` varchar(6) NOT NULL,
  `id_anggota` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_peminjaman`
--

INSERT INTO `tb_peminjaman` (`kd_pinjam`, `tgl_pinjam`, `tgl_kembali`, `lama_pinjam`, `denda`, `kd_buku`, `id_anggota`) VALUES
('P00002', '2019-05-09', '2019-05-16', 0, 0, 'B002', 'A001'),
('P00003', '2019-05-09', '2019-05-09', 0, 0, 'B002', 'A001'),
('P00004', '2019-05-11', '2019-05-11', 0, 0, 'B002', 'A001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penerbit`
--

CREATE TABLE `tb_penerbit` (
  `id_penerbit` int(11) NOT NULL,
  `nama_penerbit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_penerbit`
--

INSERT INTO `tb_penerbit` (`id_penerbit`, `nama_penerbit`) VALUES
(1, 'ERLANGGA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengarang`
--

CREATE TABLE `tb_pengarang` (
  `id_pengarang` int(11) NOT NULL,
  `nama_pengarang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pengarang`
--

INSERT INTO `tb_pengarang` (`id_pengarang`, `nama_pengarang`) VALUES
(1, 'SURYA HERIYANA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengembalian`
--

CREATE TABLE `tb_pengembalian` (
  `kd_pinjam` varchar(10) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `lama_pinjam` int(11) NOT NULL,
  `denda` int(11) NOT NULL,
  `kd_buku` varchar(6) NOT NULL,
  `id_anggota` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pengembalian`
--

INSERT INTO `tb_pengembalian` (`kd_pinjam`, `tgl_pinjam`, `tgl_kembali`, `lama_pinjam`, `denda`, `kd_buku`, `id_anggota`) VALUES
('P00001', '2019-05-05', '2019-05-09', 4, 0, 'B001', 'A001'),
('P00003', '2019-05-09', '2019-05-09', 0, 0, 'B002', 'A001'),
('P00004', '2019-05-11', '2019-05-11', 0, 0, 'B002', 'A001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `id` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_petugas`
--

INSERT INTO `tb_petugas` (`id`, `fullname`, `nickname`, `username`, `password`, `level`) VALUES
(1, 'Administrator', 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(2, 'Operator', 'Operator', 'operator', '4b583376b2767b923c3e1da60d10de59', 'operator');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_anggota`
--
ALTER TABLE `tb_anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`kd_buku`);

--
-- Indeks untuk tabel `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  ADD PRIMARY KEY (`kd_pinjam`);

--
-- Indeks untuk tabel `tb_penerbit`
--
ALTER TABLE `tb_penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indeks untuk tabel `tb_pengarang`
--
ALTER TABLE `tb_pengarang`
  ADD PRIMARY KEY (`id_pengarang`);

--
-- Indeks untuk tabel `tb_pengembalian`
--
ALTER TABLE `tb_pengembalian`
  ADD PRIMARY KEY (`kd_pinjam`);

--
-- Indeks untuk tabel `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_penerbit`
--
ALTER TABLE `tb_penerbit`
  MODIFY `id_penerbit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_pengarang`
--
ALTER TABLE `tb_pengarang`
  MODIFY `id_pengarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_petugas`
--
ALTER TABLE `tb_petugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

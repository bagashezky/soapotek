-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Bulan Mei 2023 pada 09.41
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci-apotek`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_obat`
--

CREATE TABLE `jenis_obat` (
  `id_unit` int(2) NOT NULL,
  `unit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `jenis_obat`
--

INSERT INTO `jenis_obat` (`id_unit`, `unit`) VALUES
(1, 'Kapsul'),
(2, 'Semprot'),
(3, 'Sirup'),
(4, 'Tablet');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_obat`
--

CREATE TABLE `kategori_obat` (
  `id_kategori_obat` int(7) NOT NULL,
  `nama_kategori` varchar(30) NOT NULL,
  `des_kat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kategori_obat`
--

INSERT INTO `kategori_obat` (`id_kategori_obat`, `nama_kategori`, `des_kat`) VALUES
(223, 'Obat Bebas', 'Obat yang dapat dijual bebas kepada umum tanpa resep dokter'),
(224, 'Obat Keras', 'Obat yang hanya boleh diserahkan dengan resep dokter'),
(225, 'Obat Herbal', 'Obat yang diramu dari tanaman-tanaman tradisonal berkhasiat yang digunakan untuk pengobatan penyakit-penyakit tertentu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `month`
--

CREATE TABLE `month` (
  `month_num` int(2) NOT NULL,
  `month_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `month`
--

INSERT INTO `month` (`month_num`, `month_name`) VALUES
(1, 'Januari'),
(2, 'Februari'),
(3, 'Maret'),
(4, 'April'),
(5, 'Mei'),
(6, 'Juni'),
(7, 'Juli'),
(8, 'Agustus'),
(9, 'September'),
(10, 'Oktober'),
(11, 'November'),
(12, 'Desember');

-- --------------------------------------------------------

--
-- Struktur dari tabel `obats`
--

CREATE TABLE `obats` (
  `id_obat` int(4) NOT NULL,
  `nama_obat` varchar(30) NOT NULL,
  `penyimpanan` varchar(30) NOT NULL,
  `jmlh_stok` int(11) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `nama_kategori` varchar(30) NOT NULL,
  `tgl_beli` date DEFAULT NULL,
  `tgl_kadaluarsa` date NOT NULL,
  `des_obat` text NOT NULL,
  `harga_obat` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `nama_supplier` varchar(30) NOT NULL,
  `gambar` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `obats`
--

INSERT INTO `obats` (`id_obat`, `nama_obat`, `penyimpanan`, `jmlh_stok`, `unit`, `nama_kategori`, `tgl_beli`, `tgl_kadaluarsa`, `des_obat`, `harga_obat`, `harga_jual`, `nama_supplier`, `gambar`) VALUES
(1046, 'Oskadon', 'Rak', 100, 'Kapsul', 'Obat Keras', '2023-05-18', '2023-07-08', '', 100, 1000, 'Kimia Farma', ''),
(1047, 'Mixagrip', 'Gudang', 100, 'Tablet', 'Obat Bebas', '2023-05-18', '2023-07-21', '', 100, 1000, 'Kimia Farma', ''),
(1048, 'OBH', 'Gudang', 10, 'Sirup', 'Obat Bebas', '2023-05-18', '2023-06-10', '', 100, 1000, 'Kimia Farma', ''),
(1049, 'Gooday', 'Rak', 10, 'Kapsul', 'Obat Bebas', '2023-05-18', '2023-06-02', '', 12, 12, 'Surya Farmasi', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(5) NOT NULL,
  `ref` varchar(10) NOT NULL,
  `nama_obat` varchar(30) NOT NULL,
  `harga_obat` int(11) NOT NULL,
  `banyak` int(3) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `nama_supplier` varchar(40) NOT NULL,
  `tgl_beli` date NOT NULL,
  `grandtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `ref`, `nama_obat`, `harga_obat`, `banyak`, `subtotal`, `nama_supplier`, `tgl_beli`, `grandtotal`) VALUES
(3, 'L8BvtCyFDZ', 'Salbutamol', 6000, 3, 18000, 'Bina Jaya Apotek', '2018-08-11', 24000),
(4, 'L8BvtCyFDZ', 'Stimuno', 6000, 1, 6000, 'Bina Jaya Apotek', '2018-08-11', 24000),
(8, 'pwoaFcmGVs', 'Asam Mefenamat', 4000, 12, 48000, 'Bina Jaya Apotek', '2018-02-22', 48000),
(9, '96kHYMepS9', 'Salbutamol', 6000, 7, 42000, 'Bina Jaya Apotek', '2018-03-21', 42000),
(10, 'Tbb6pLVCJr', 'Ambroxol', 20000, 4, 80000, 'Bina Jaya Apotek', '2018-01-24', 80000),
(11, 'fdMGrBa4nS', 'Stimuno', 6000, 16, 96000, 'Bina Jaya Apotek', '2018-04-18', 96000),
(12, 'aDxtUA0rsc', 'Adrome', 12000, 6, 72000, 'Bina Jaya Apotek', '2018-05-09', 72000),
(14, 'KCZxZ1MqID', 'Ambroxol', 20000, 2, 40000, 'Bina Jaya Apotek', '2018-07-18', 40000),
(15, 'Ar9235n1ny', 'Adrome', 12000, 3, 36000, 'Kenanga Apotek', '2018-06-06', 56000),
(16, 'Ar9235n1ny', 'Ambroxol', 20000, 1, 20000, 'Kenanga Apotek', '2018-06-06', 56000),
(25, 'q8ke6ToBMo', 'Cetirizen', 2000, 3, 6000, 'Kenanga Apotek', '2018-09-24', 6000),
(26, 'bVTTm3p8jq', 'Corovit', 2000, 2, 24000, 'Kimia Farma', '2023-05-25', 24000),
(27, 'UO9JOlBwSw', 'hasuem', 1000, 10, 10000, 'bagas', '2023-05-18', 10000),
(28, 'Oaa6zbHI0g', 'Salbutamol', 6000, 6, 36000, 'Bina Jaya Apotek', '2023-06-03', 36000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rak_penyimpanan`
--

CREATE TABLE `rak_penyimpanan` (
  `kode_rak` int(5) NOT NULL,
  `nama_rak_penyimpanan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rak_penyimpanan`
--

INSERT INTO `rak_penyimpanan` (`kode_rak`, `nama_rak_penyimpanan`) VALUES
(3, 'RAK001'),
(4, 'RAK002');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(7) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telp` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat`, `no_telp`) VALUES
(101, 'Bina Jaya Apotek', 'Jalan Kaliurang KM 7', '089693330253'),
(103, 'Kimia Farma', 'Jalan Kaliurang', '02574555'),
(104, 'Tina Farma', 'Jalan Kaliurang', '08775544'),
(105, 'Kenanga Apotek', 'Jalan Magelang', '08965555'),
(108, 'Surya Farmasi', 'Jalan Magelang KM 9', '08546677790'),
(109, 'Dexametason', 'Bandung', '0831312'),
(110, 'bagas', 'bandung', '2144124');

-- --------------------------------------------------------

--
-- Struktur dari tabel `table_invoice`
--

CREATE TABLE `table_invoice` (
  `id_tagihan` int(5) NOT NULL,
  `ref` varchar(10) NOT NULL,
  `nama_obat` varchar(30) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `banyak` int(3) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `nama_pembeli` varchar(40) NOT NULL,
  `tgl_beli` date NOT NULL,
  `grandtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `table_invoice`
--

INSERT INTO `table_invoice` (`id_tagihan`, `ref`, `nama_obat`, `harga_jual`, `banyak`, `subtotal`, `nama_pembeli`, `tgl_beli`, `grandtotal`) VALUES
(80, 'JMBSErmmo0', 'Adona', 15000, 1, 15000, 'Melinda', '2018-08-09', 29000),
(81, 'JMBSErmmo0', 'Asam Mefenamat', 4000, 1, 4000, 'Melinda', '2018-08-09', 29000),
(82, 'JMBSErmmo0', 'Salbutamol', 10000, 1, 10000, 'Melinda', '2018-08-09', 29000),
(87, 'xl23Q6whsP', 'Salbutamol', 10000, 3, 30000, 'Melinda', '2018-01-10', 30000),
(90, '9ab7RcZHma', 'Adrome', 15000, 6, 90000, 'Doni', '2018-02-14', 90000),
(91, 'fAMEjr9rA0', 'Ambroxol', 22000, 5, 110000, 'Amirullah', '2018-03-14', 110000),
(92, 'so5518T1vI', 'Salbutamol', 10000, 6, 60000, 'Doni', '2018-04-18', 60000),
(97, 'VS27jjD5Ze', 'Ambroxol', 22000, 1, 22000, 'Pitaloka', '2018-07-18', 32000),
(98, 'VS27jjD5Ze', 'Stimuno', 10000, 1, 10000, 'Pitaloka', '2018-07-18', 32000),
(99, 'nyptFm9i43', 'Stimuno', 10000, 3, 30000, 'Andi', '2018-06-13', 30000),
(101, 'e7QgBweE8X', 'Adrome', 15000, 1, 15000, 'Andi', '2018-09-15', 15000),
(105, 'zPpAfLsmd7', 'Adrome', 15000, 1, 15000, 'Amila', '2018-05-16', 25000),
(106, 'zPpAfLsmd7', 'Amoxilin', 10000, 1, 10000, 'Amila', '2018-05-16', 25000),
(119, 'FfndSkUmh6', 'Asam Mefenamat', 4000, 2, 8000, 'Alina', '2018-09-24', 12000),
(120, 'FfndSkUmh6', 'Vitamin E', 4000, 1, 4000, 'Alina', '2018-09-24', 12000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jenis_obat`
--
ALTER TABLE `jenis_obat`
  ADD PRIMARY KEY (`id_unit`),
  ADD UNIQUE KEY `unit` (`unit`);

--
-- Indeks untuk tabel `kategori_obat`
--
ALTER TABLE `kategori_obat`
  ADD PRIMARY KEY (`id_kategori_obat`),
  ADD UNIQUE KEY `kategori` (`nama_kategori`);

--
-- Indeks untuk tabel `month`
--
ALTER TABLE `month`
  ADD PRIMARY KEY (`month_num`);

--
-- Indeks untuk tabel `obats`
--
ALTER TABLE `obats`
  ADD PRIMARY KEY (`id_obat`),
  ADD UNIQUE KEY `nama_obat` (`nama_obat`),
  ADD KEY `med_unit` (`unit`),
  ADD KEY `med_cat` (`nama_kategori`),
  ADD KEY `med_sup` (`nama_supplier`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `rak_penyimpanan`
--
ALTER TABLE `rak_penyimpanan`
  ADD PRIMARY KEY (`kode_rak`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`),
  ADD UNIQUE KEY `nama_supplier` (`nama_supplier`);

--
-- Indeks untuk tabel `table_invoice`
--
ALTER TABLE `table_invoice`
  ADD PRIMARY KEY (`id_tagihan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jenis_obat`
--
ALTER TABLE `jenis_obat`
  MODIFY `id_unit` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kategori_obat`
--
ALTER TABLE `kategori_obat`
  MODIFY `id_kategori_obat` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT untuk tabel `obats`
--
ALTER TABLE `obats`
  MODIFY `id_obat` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1050;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `rak_penyimpanan`
--
ALTER TABLE `rak_penyimpanan`
  MODIFY `kode_rak` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT untuk tabel `table_invoice`
--
ALTER TABLE `table_invoice`
  MODIFY `id_tagihan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `obats`
--
ALTER TABLE `obats`
  ADD CONSTRAINT `med_cat` FOREIGN KEY (`nama_kategori`) REFERENCES `kategori_obat` (`nama_kategori`) ON UPDATE CASCADE,
  ADD CONSTRAINT `med_sup` FOREIGN KEY (`nama_supplier`) REFERENCES `supplier` (`nama_supplier`) ON UPDATE CASCADE,
  ADD CONSTRAINT `med_unit` FOREIGN KEY (`unit`) REFERENCES `jenis_obat` (`unit`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

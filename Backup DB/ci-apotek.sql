-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Jul 2023 pada 00.27
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
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `no_reff` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `nama_reff` varchar(40) NOT NULL,
  `keterangan` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`no_reff`, `id_user`, `nama_reff`, `keterangan`) VALUES
(111, 1, 'Kas', 'Kas Peruangan'),
(112, 1, 'Persediaan Barang', 'Persediaan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `coa`
--

CREATE TABLE `coa` (
  `kode_coa` int(11) NOT NULL,
  `nama_coa` varchar(50) NOT NULL,
  `header_akun` varchar(7) NOT NULL,
  `posisi_db_cr` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `coa`
--

INSERT INTO `coa` (`kode_coa`, `nama_coa`, `header_akun`, `posisi_db_cr`) VALUES
(111, 'Kas', '1', 'Debitt'),
(114, 'Persediaan', '2', 'Debit');

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
(5, 'Asap'),
(6, 'Cair'),
(1, 'Kapsul'),
(3, 'Sirup'),
(4, 'Tablet'),
(2, 'Uap');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_obat`
--

CREATE TABLE `kategori_obat` (
  `id_kategori_obat` int(7) NOT NULL,
  `nama_kategori` varchar(30) NOT NULL,
  `nama_rak_penyimpanan` varchar(15) NOT NULL,
  `des_kat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kategori_obat`
--

INSERT INTO `kategori_obat` (`id_kategori_obat`, `nama_kategori`, `nama_rak_penyimpanan`, `des_kat`) VALUES
(228, 'Obat Bebas', 'RAK002', 'HANYA OBAT BEBAS'),
(230, 'Obat Keras', 'RAK001', 'Obat yang hanya boleh diserahkan dengan resep dokter');

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
  `kode_obat` varchar(7) NOT NULL,
  `nama_obat` varchar(30) NOT NULL,
  `jmlh_stok` int(11) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `nama_kategori` varchar(30) NOT NULL,
  `tgl_beli` date DEFAULT NULL,
  `tgl_kadaluarsa` date NOT NULL,
  `des_obat` text NOT NULL,
  `harga_obat` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `nama_supplier` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `obats`
--

INSERT INTO `obats` (`id_obat`, `kode_obat`, `nama_obat`, `jmlh_stok`, `unit`, `nama_kategori`, `tgl_beli`, `tgl_kadaluarsa`, `des_obat`, `harga_obat`, `harga_jual`, `nama_supplier`) VALUES
(1052, '', 'OSKADON', 143, 'Kapsul', 'Obat Bebas', '2023-05-21', '2023-09-29', '', 1000, 2000, 'bagas'),
(1053, '', 'Mixagrip', 19, 'Uap', 'Obat Keras', '2023-05-21', '2023-05-31', '', 12222, 122222, 'bagas'),
(1059, 'BL72593', 'Bodrexin', 122, 'Tablet', 'Obat Bebas', '2023-06-12', '2023-07-08', '', 1000, 2000, 'bagas'),
(1061, 'BL79729', 'Mixagripss', 53, 'Sirup', 'Obat Keras', '2023-07-18', '2023-07-26', '', 122, 12121, 'bagas'),
(1063, 'BL52265', 'Mixagripss', 162, 'Cair', 'Obat Bebas', '2023-07-11', '2023-07-19', '', 1313, 11414, 'Komia Farmu'),
(1064, 'BL93566', 'OSKADON', 122, 'Kapsul', 'Obat Keras', '2023-07-05', '2023-07-20', '', 12122, 1212, 'Komia Farmu'),
(1065, 'BL43842', 'paramex', 561, 'Cair', 'Obat Keras', '2023-07-04', '2023-08-05', '', 2000, 5000, 'Komia Farmu');

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
(10, 'BL41967386', 'Mixagripss', 1313, 1, 1313, 'Komia Farmu', '2023-07-06', 1313),
(11, 'BL92593576', 'paramex', 2000, 1, 2000, 'Komia Farmu', '2023-07-06', 2000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rak_penyimpanan`
--

CREATE TABLE `rak_penyimpanan` (
  `kode_rak` int(5) NOT NULL,
  `nama_rak_penyimpanan` varchar(15) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rak_penyimpanan`
--

INSERT INTO `rak_penyimpanan` (`kode_rak`, `nama_rak_penyimpanan`) VALUES
(6, 'RAK001'),
(2, 'RAK002'),
(8, 'RAK003');

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
(110, 'bagas', 'bandung', '081296283121'),
(111, 'Komia Farmu', 'Bandung', '088888');

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

-- --------------------------------------------------------

--
-- Struktur dari tabel `table_user`
--

CREATE TABLE `table_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_akses` int(11) NOT NULL,
  `user_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `table_user`
--

INSERT INTO `table_user` (`user_id`, `user_name`, `user_email`, `user_password`, `user_akses`, `user_status`) VALUES
(1, 'Tuanku Imam Bonjol', 'admin@gmail.com', 'admin123', 1, 1),
(2, 'Muhammad Hatta', 'apoteker@gmail.com', 'apoteker', 2, 1),
(3, 'Bagindo Aziz Chan', 'pegawai@gmail.com', 'pegawai', 3, 1),
(4, 'pemilik', 'pemilik@gmail.com', 'pemilik', 4, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jurnal_umum`
--

CREATE TABLE `tbl_jurnal_umum` (
  `no` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nama_perkiraan` varchar(45) NOT NULL,
  `debet` int(11) NOT NULL,
  `kredit` int(11) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_jurnal_umum`
--

INSERT INTO `tbl_jurnal_umum` (`no`, `tanggal`, `nama_perkiraan`, `debet`, `kredit`, `keterangan`) VALUES
(1, '2023-07-06', 'Pembelian', 1313, 0, 'Tunai'),
(2, '2023-07-06', 'Kas', 0, 1313, 'Pembelian');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `no_reff` int(11) NOT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `jenis_saldo` enum('debit','kredit','','') NOT NULL,
  `saldo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`no_reff`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `coa`
--
ALTER TABLE `coa`
  ADD PRIMARY KEY (`kode_coa`);

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
  ADD UNIQUE KEY `kategori` (`nama_kategori`),
  ADD KEY `nama_rak_penyimpanan` (`nama_rak_penyimpanan`);

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
  ADD PRIMARY KEY (`kode_rak`),
  ADD UNIQUE KEY `nama_rak_penyimpanan` (`nama_rak_penyimpanan`) USING BTREE;

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
-- Indeks untuk tabel `table_user`
--
ALTER TABLE `table_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeks untuk tabel `tbl_jurnal_umum`
--
ALTER TABLE `tbl_jurnal_umum`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `no_reff` (`no_reff`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `coa`
--
ALTER TABLE `coa`
  MODIFY `kode_coa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT untuk tabel `jenis_obat`
--
ALTER TABLE `jenis_obat`
  MODIFY `id_unit` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `kategori_obat`
--
ALTER TABLE `kategori_obat`
  MODIFY `id_kategori_obat` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT untuk tabel `obats`
--
ALTER TABLE `obats`
  MODIFY `id_obat` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1066;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `rak_penyimpanan`
--
ALTER TABLE `rak_penyimpanan`
  MODIFY `kode_rak` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT untuk tabel `table_invoice`
--
ALTER TABLE `table_invoice`
  MODIFY `id_tagihan` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `table_user`
--
ALTER TABLE `table_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_jurnal_umum`
--
ALTER TABLE `tbl_jurnal_umum`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kategori_obat`
--
ALTER TABLE `kategori_obat`
  ADD CONSTRAINT `nama_rakk` FOREIGN KEY (`nama_rak_penyimpanan`) REFERENCES `rak_penyimpanan` (`nama_rak_penyimpanan`) ON DELETE CASCADE ON UPDATE CASCADE;

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

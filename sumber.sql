-- Membuat Database
CREATE DATABASE toko_elektronik;

-- CREATE
-- Membuat Tabel 1NF
CREATE TABLE IF NOT EXISTS utama (
    id_transaksi SERIAL,
    id_pelanggan INTEGER,
    nama_pelanggan TEXT,
    alamat_pelanggan TEXT,
    email_pelanggan TEXT,
    telepon_pelanggan TEXT,
    id_produk INTEGER,
    nama_produk TEXT,
    kategori TEXT,
    harga REAL,
    id_persediaan INTEGER,
    jumlah_persediaan INTEGER,
    lokasi_persediaan TEXT,
    id_supplier INTEGER,
    nama_supplier TEXT,
    kontak_supplier TEXT,
    id_pengadaan INTEGER,
    tanggal_pengadaan DATE,
    jumlah_pengadaan INTEGER,
    harga_satuan_pengadaan REAL,
    jumlah INTEGER,
    tanggal_transaksi DATE
);

-- Menyisipkan Data
INSERT INTO 
    utama(id_pelanggan, nama_pelanggan, alamat_pelanggan, email_pelanggan, telepon_pelanggan, id_produk, nama_produk, kategori, harga, id_persediaan, jumlah_persediaan, lokasi_persediaan, id_supplier, nama_supplier, kontak_supplier, id_pengadaan, 
          tanggal_pengadaan, jumlah_pengadaan, harga_satuan_pengadaan, jumlah, tanggal_transaksi) 
VALUES
    (1, 'John Doe', 'Jl. Raya No. 123', 'john.doe@example.com', '0812345678', 1, 'Laptop ASUS', 'Laptop', 1200.00, 101, 15, 'Gudang A', 201, 'PT. Tekno', '08123456789', 301, '2024-05-01', 5, 1100.00, 2, '2024-05-10'),
    (2, 'Jane Smith', 'Jl. Maju Mundur No. 456', 'jane.smith@example.com', '0823456789', 2, 'Mouse Wireless', 'Elektronik', 120.00, 102, 30, 'Gudang A', 201, 'PT. Tekno', '08123456789', 302, '2024-05-01', 5, 100.00, 3, '2024-05-11'),
    (3, 'Alice Johnson', 'Jl. Indah No. 789', 'alice.johnson@example.com', '0834567890', 3, 'Keyboard Gaming', 'Elektronik', 100.00, 103, 20, 'Gudang B', 202, 'CV. Inovasi', '08234567890', 303, '2024-05-02', 10, 90.00,  1, '2024-05-12'),
    (4, 'Bob Brown', 'Jl. Bahagia No. 101112', 'bob.brown@example.com', '0845678901', 4, 'Smartphone Samsung', 'Smartphone', 800.00, 104, 25, 'Gudang C', 203, 'PT. Pintar', '08345678901', 304, '2024-05-03', 15, 750.00, 5, '2024-05-13'),
    (5, 'Emily Davis', 'Jl. Ceria No. 131415', 'emily.davis@example.com', '0856789012', 5, 'Speaker Bluetooth', 'Elektronik', 50.00, 105, 30, 'Gudang D', 204, 'UD. Suara Jaya', '08456789012', 305, '2024-05-04', 20, 40.00, 4, '2024-05-14'),
    (1, 'John Doe', 'Jl. Raya No. 123', 'john.doe@example.com', '0812345678', 2, 'Mouse Wireless', 'Elektronik', 120.00, 102, 30, 'Gudang A', 201, 'PT. Tekno', '08123456789', 302, '2024-05-01', 5, 100.00, 5, '2024-05-15'),
    (2, 'Jane Smith', 'Jl. Maju Mundur No. 456', 'jane.smith@example.com', '0823456789', 3, 'Keyboard Gaming', 'Elektronik', 100.00, 103, 20, 'Gudang B', 202, 'CV. Inovasi', '08234567890', 303, '2024-05-02', 10, 90.00, 2, '2024-05-16'),
    (3, 'Alice Johnson', 'Jl. Indah No. 789', 'alice.johnson@example.com', '0834567890', 4, 'Smartphone Samsung', 'Smartphone', 800.00, 104, 25, 'Gudang C', 203, 'PT. Pintar', '08345678901', 304, '2024-05-03', 15, 750.00, 3, '2024-05-17'),
    (4, 'Bob Brown', 'Jl. Bahagia No. 101112', 'bob.brown@example.com', '0845678901', 5, 'Speaker Bluetooth', 'Elektronik', 50.00, 105, 30, 'Gudang D', 204, 'UD. Suara Jaya', '08456789012', 305, '2024-05-04', 20, 40.00, 1, '2024-05-18'),
    (5, 'Emily Davis', 'Jl. Ceria No. 131415', 'emily.davis@example.com', '0856789012', 6, 'Powerbank', 'Elektronik', 30.00, 106, 35, 'Gudang E', 205, 'PT. Energi Teknologi', '08567890123', 306, '2024-05-05', 25, 25.00, 4, '2024-05-19');
    
SELECT * FROM utama;

-- Membuat Tabel 2NF
-- Tabel Pelanggan
CREATE TABLE IF NOT EXISTS pelanggan (
    id_pelanggan INTEGER PRIMARY KEY,
    nama_pelanggan TEXT,
    alamat_pelanggan TEXT,
    email_pelanggan TEXT,
    telepon_pelanggan TEXT
);

INSERT INTO 
	pelanggan 
SELECT DISTINCT
    id_pelanggan,
    nama_pelanggan,
    alamat_pelanggan,
    email_pelanggan,
    telepon_pelanggan
FROM
    utama;

SELECT * FROM pelanggan;

-- Tabel Produk
CREATE TABLE IF NOT EXISTS produk (
    id_produk INTEGER PRIMARY KEY,
    nama_produk TEXT,
    kategori TEXT,
    harga REAL,
    id_persediaan INTEGER,
    jumlah_persediaan INTEGER,
    lokasi_persediaan TEXT,
    id_supplier INTEGER,
    nama_supplier TEXT,
    kontak_supplier TEXT,
    id_pengadaan INTEGER,
    tanggal_pengadaan DATE,
    jumlah_pengadaan INTEGER,
    harga_satuan_pengadaan REAL
);

INSERT INTO 
	produk
SELECT DISTINCT
    id_produk,
    nama_produk,
    kategori,
    harga,
    id_persediaan, 
    jumlah_persediaan, 
    lokasi_persediaan, 
    id_supplier,
    nama_supplier,
    kontak_supplier,
    id_pengadaan, 
    tanggal_pengadaan, 
    jumlah_pengadaan, 
    harga_satuan_pengadaan
FROM 
    utama;
  
SELECT * FROM produk;

-- Tabel Transaksi
CREATE TABLE IF NOT EXISTS transaksi (
    id_transaksi INTEGER PRIMARY KEY,
    id_pelanggan INTEGER REFERENCES pelanggan(id_pelanggan),
    id_produk INTEGER REFERENCES produk(id_produk),
    jumlah INTEGER,
    tanggal_transaksi DATE
);

INSERT INTO
	transaksi
SELECT DISTINCT
    id_transaksi,
    id_pelanggan,
    id_produk,
    jumlah,
    tanggal_transaksi
FROM 
    utama;
   
SELECT * FROM transaksi;

-- Membuat Tabel 3NF
-- Tabel Persediaan
CREATE TABLE IF NOT EXISTS persediaan (
    id_persediaan INTEGER PRIMARY KEY,
    jumlah_persediaan INTEGER,
    lokasi_persediaan TEXT
);

INSERT INTO
	persediaan
SELECT DISTINCT
    id_persediaan, 
    jumlah_persediaan, 
    lokasi_persediaan
FROM 
    utama;
   
SELECT * FROM persediaan;

-- Tabel Supplier
CREATE TABLE IF NOT EXISTS supplier (
    id_supplier INTEGER PRIMARY KEY,
    nama_supplier TEXT,
    kontak_supplier TEXT
);

INSERT INTO
	supplier 
SELECT DISTINCT
    id_supplier,
    nama_supplier,
    kontak_supplier
FROM 
    utama;
   
SELECT * FROM supplier;

-- Tabel Pengadaan
CREATE TABLE IF NOT EXISTS pengadaan (
    id_pengadaan INTEGER PRIMARY KEY,
    tanggal_pengadaan DATE,
    jumlah_pengadaan INTEGER,
    harga_satuan_pengadaan REAL
);

INSERT INTO
	pengadaan 
SELECT DISTINCT
    id_pengadaan,
    tanggal_pengadaan,
    jumlah_pengadaan,
    harga_satuan_pengadaan
FROM 
    utama;
   
SELECT * FROM pengadaan;

-- Tabel Produk
DROP TABLE transaksi;
DROP TABLE produk;

CREATE TABLE IF NOT EXISTS produk (
    id_produk INTEGER PRIMARY KEY,
    nama_produk TEXT,
    kategori TEXT,
    harga REAL,
    id_persediaan INTEGER REFERENCES persediaan(id_persediaan),
    id_supplier INTEGER REFERENCES supplier(id_supplier),
    id_pengadaan INTEGER REFERENCES pengadaan(id_pengadaan)
);

INSERT INTO
	produk
SELECT DISTINCT
    id_produk,
    nama_produk,
    kategori,
    harga,
    id_persediaan,  
    id_supplier,
    id_pengadaan
FROM 
    utama;
   
SELECT * FROM produk;

-- Tabel Transaksi
CREATE TABLE IF NOT EXISTS transaksi (
    id_transaksi INTEGER PRIMARY KEY,
    id_pelanggan INTEGER REFERENCES pelanggan(id_pelanggan),
    id_produk INTEGER REFERENCES produk(id_produk),
    jumlah INTEGER,
    tanggal_transaksi DATE
);

INSERT INTO
	transaksi
SELECT DISTINCT
    id_transaksi,
    id_pelanggan,
    id_produk,
    jumlah,
    tanggal_transaksi
FROM 
    utama;

-- READ
SELECT * FROM pelanggan WHERE id_pelanggan = 1;

SELECT
    p.nama_pelanggan,
    p2.nama_produk,
    t.jumlah,
    p2.harga,
    SUM(p2.harga * t.jumlah) AS total_harga,
    t.tanggal_transaksi
FROM
    transaksi t
JOIN
    pelanggan p ON p.id_pelanggan = t.id_pelanggan
JOIN
    produk p2 ON p2.id_produk = t.id_produk
GROUP BY
    t.id_transaksi, p.id_pelanggan, p2.id_produk;

-- UPDATE
UPDATE
    pelanggan
SET
    telepon_pelanggan = '0818283848'
WHERE
    id_pelanggan = 4;
   
SELECT * FROM pelanggan WHERE id_pelanggan = 4;

-- DELETE
DROP TABLE utama;

DELETE FROM
    transaksi
WHERE
    id_transaksi = 10;
    
SELECT * FROM transaksi;

-- Membuat Tabel Junction untuk Many-to-Many Relasi antara Produk dan Supplier
CREATE TABLE IF NOT EXISTS produk_supplier (
    id_produk INTEGER REFERENCES produk(id_produk),
    id_supplier INTEGER REFERENCES supplier(id_supplier),
    PRIMARY KEY (id_produk, id_supplier)
);

-- Memasukkan Data ke dalam Tabel Junction
INSERT INTO produk_supplier (id_produk, id_supplier)
SELECT DISTINCT id_produk, id_supplier
FROM utama;

-- Menghapus Data Relasi Supplier dari Tabel Produk (Karena Sudah di-relasikan Lewat Tabel Junction)
ALTER TABLE produk
DROP COLUMN id_supplier;

-- Menghapus Tabel 'utama' Jika Tidak Diperlukan Lagi
DROP TABLE utama;

-- Mengecek Data dalam Tabel produk_supplier
SELECT * FROM produk_supplier;

-- Mendapatkan Produk yang Disuplai oleh Supplier Tertentu
SELECT s.nama_supplier, p.nama_produk, p.kategori, p.harga
FROM supplier s
JOIN produk_supplier ps ON s.id_supplier = ps.id_supplier
JOIN produk p ON ps.id_produk = p.id_produk
WHERE s.id_supplier = 201;

CREATE TABLE kategori (
  id SERIAL PRIMARY KEY,
  kategori VARCHAR(64) NOT NULL,
  deskripsi VARCHAR(64)
);

CREATE TABLE rak_buku (
  id SERIAL PRIMARY KEY,
  lokasi VARCHAR(64),
  kode_rak VARCHAR(64)
);

CREATE TABLE peminjam (
  id SERIAL PRIMARY KEY,
  nama VARCHAR(64),
  alamat VARCHAR(64),
  tanggal_daftar TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE petugas (
  id SERIAL PRIMARY KEY,
  nama VARCHAR(64),
  posisi VARCHAR(64)
);

CREATE TABLE buku (
  id SERIAL PRIMARY KEY,
  ISBN INT UNIQUE NOT NULL,
  judul VARCHAR(64),
  penulis_id INT REFERENCES penulis(id),
  penerbit_id INT REFERENCES penerbit(id),
  tahun_terbit INT,
  jumlah_stok INT,
  kategori_id INT REFERENCES kategori(id),
  peminjam_id INT REFERENCES peminjam(id),
  petugas_id INT REFERENCES petugas(id),
  rak_buku_id INT REFERENCES rak_buku(id)
);

CREATE TABLE penulis (
  id SERIAL PRIMARY KEY,
  nama VARCHAR(64),
  biografi_singkat TEXT,
  negara_asal VARCHAR(64)
)

CREATE TABLE penerbit (
  id SERIAL PRIMARY KEY,
  nama VARCHAR(64),
  alamat VARCHAR(64),
  email VARCHAR(64)
)

CREATE TABLE peminjaman (
 id SERIAL PRIMARY KEY,
 buku_id IN REFERENCES buku(id),
 peminjam_id REFERENCES peminjam (id),
 petugas_id REFERENCES petugas(id),
 tanggal_pinjam Datetime,
 tanggal_kembali_rencana Date,
 tanggal_kembali_aktial Date,
 denda INT
)


ALTER TABLE buku
ALTER COLUMN ISBN TYPE VARCHAR(64);

-----
--- insert query

INSERT INTO kategori (kategori, deskripsi) VALUES
('Fiksi', 'Novel dan cerita fiksi'),
('Sastra Klasik', 'Buku sastra klasik'),
('Biografi', 'Buku biografi berbagai tokoh dunia');
('Fiksi Lokal', 'Novel dan cerita fiksi karya penulis Indonesia'),
('Non-Fiksi', 'Buku pengetahuan, referensi, dan pengembangan diri'),
('Anak-Anak', 'Buku cerita dan edukasi untuk anak-anak'),
('Komik', 'Buku komik dan manga dari berbagai negara'),
('Sejarah', 'Buku tentang sejarah Indonesia dan dunia');
('Pelajaran Umum', 'Buku modul SD/SMP/SMA');
('Art', 'Buku seni');



INSERT INTO rak_buku (lokasi, genre) VALUES
('Rak A1', 'Fiksi Lokal'),
('Rak A2', 'Fiksi Lokal'),
('Rak B1', 'Non-Fiksi'),
('Rak B2', 'Non-Fiksi'),
('Rak C1', 'Anak-Anak'),
('Rak C2', 'Agama Islam'),
('Rak D1', 'Komik'),
('Rak D2', 'Majalah'),
('Rak E1', 'Sejarah'),
('Rak E2', 'Biografi');


INSERT INTO peminjam (nama, alamat) VALUES
('Anton Sanjoyo', 'Jl. Merdeka No. 10, Jakarta'),
('Justinus Lhaksana', 'Jl. Aceh No, 12, Bandung'),
('Ahmad Syafiq', 'Jl. Nusa Indah No. 20, Denpasar');
('Budi Santoso', 'Jl. Merdeka No. 10, Jakarta Pusat'),
('Siti Nurhaliza', 'Jl. Ahmad Yani No. 5, Bandung'),
('Ahmad Wijaya', 'Jl. Sudirman No. 20, Surabaya'),
('Eka Putri', 'Jl. Diponegoro No. 15, Yogyakarta'),
('Roni Hermanto', 'Jl. Gatot Subroto No. 8, Medan'),
('Dewi Lestari', 'Jl. Imam Bonjol No. 12, Semarang'),
('Fajar Nugraha', 'Jl. Hayam Wuruk No. 7, Makassar'),
('Lina Wijayanti', 'Jl. Pemuda No. 25, Palembang'),
('Toni Setiawan', 'Jl. Sultan Agung No. 18, Bekasi'),
('Maya Kusuma', 'Jl. Cendana No. 30, Tangerang');

INSERT INTO petugas (nama, posisi, nomor_hp, email) VALUES
('Ayyas Aulia', 'Librarian', '081234567890', 'Ayyas@uilibrary.ac.id'),
('Tasrif Muhammad', 'Admin', '082345678901', 'hendra@uilibrary.ac.id');
('Aditya Bastyas', 'Kepala Librarian', '081234567890', 'aditya@uilibrary.ac.id'),
('Aska Diliyan', 'Admin Sistem', '082345678901', 'diliyan@uilibrary.ac.id'),
('Annisa Mardhiyah', 'Librarian', '083456789012', 'annisai@uilibrary.ac.id'),
('Bambang Irawan', 'Petugas Peminjaman', '084567890123', 'bambang@uilibrary.ac.id'),
('Nur Azizah', 'Petugas Pengembalian', '085678901234', 'nur@uilibrary.ac.id'),
('Teguh Prasetyo', 'Petugas Katalog', '086789012345', 'teguh@uilibrary.ac.id'),
('Azizah Nurrohmah', 'Petugas Referensi', '087890123456', 'azizah@uilibrary.ac.id'),
('Doni Hermawan', 'Admin Database', '088901234567', 'doni@uilibrary.ac.id'),
('Lisa Handayani', 'Petugas Arsip', '089012345678', 'lisa@uilibrary.ac.id'),
('Rudi Habibie', 'Security', '080123456789', 'rudihabibie@uilibrary.ac.id');

INSERT INTO buku (ISBN, judul, penulis, penerbit, tahun, sedang_dipinjam, kategori_id, peminjam_id, petugas_id, rak_buku_id) VALUES
('978-6023-2345-1', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', 2005, FALSE, 1, NULL, 1, 1),
('978-6023-2346-8', 'Pulang', 'Perawan Kurnia', 'Gramedia Pustaka Utama', 2012, TRUE, 1, 1, 1, 1),
('978-6023-2347-5', 'Saman', 'Ayu Utami', 'Gramedia Pustaka Utama', 1998, FALSE, 1, NULL, 1, 1),
('978-6023-2348-2', 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', 2006, TRUE, 1, 2, 1, 1),
('978-6023-2349-9', 'Eksklusif', 'Okky Madasari', 'Gramedia Pustaka Utama', 2010, FALSE, 1, NULL, 1, 1),
('978-6023-2350-5', 'Tenggelamnya Kapal Van Der Wijck', 'Hamka', 'Balai Pustaka', 1938, FALSE, 1, NULL, 2, 1),
('978-6023-2351-2', 'Filosofi Teras', 'Henry Manampiring', 'Baca', 2018, TRUE, 2, 3, 2, 2),
('978-6023-2352-9', 'Catatan Juang', 'Pramoedya Ananta Toer', 'Lentera Dipantara', 2000, FALSE, 2, NULL, 2, 2),
('978-6023-2353-6', 'Semua Ikan di Langit', 'ziggy zezsyazeoviennazabrizkie', 'Gramedia', 2005, FALSE, 1, NULL, 1, 1),
('978-6023-2354-3', 'Anak Semua Bangsa', 'Pramoedya Ananta Toer', 'Lentera Dipantara', 1980, FALSE, 1, NULL, 2, 1);

INSERT INTO PENERBIT (id, nama_penerbit, alamat, email_kontak) VALUES
(1, 'Gramedia Pustaka Utama', 'Jl. Palmerah Barat 29-37, Jakarta', 'redaksi@gramedia.com'),
(2, 'Mizan Pustaka', 'Jl. Cinambo No. 135, Bandung', 'public@mizan.com'),
(3, 'Elex Media Komputindo', 'Jl. Palmerah Selatan 22, Jakarta', 'elex.media@gramedia.com'),
(4, 'Penerbit Andi', 'Jl. Beo 38-40, Yogyakarta', 'pemasaran@andipublisher.com'),
(5, 'Bentang Pustaka', 'Jl. Plemburan No. 1, Yogyakarta', 'bentang.pustaka@gmail.com'),
(6, 'Republika Penerbit', 'Jl. Pejaten Raya No. 15, Jakarta', 'buku@republika.co.id'),
(7, 'GagasMedia', 'Jl. Haji Montong No. 57, Jakarta', 'redaksi@gagasmedia.net'),
(8, 'Penerbit Erlangga', 'Jl. H. Baping Raya No. 100, Jakarta', 'cs@erlangga.co.id'),
(9, 'Informatika Bandung', 'Jl. Buah Batu No. 121, Bandung', 'info@informatika.co.id'),
(10, 'Deepublish', 'Jl. Rajawali, Sleman, Yogyakarta', 'cs@deepublish.co.id');

INSERT INTO PENULIS (id, nama_penulis, biografi_singkat, negara_asal) VALUES
(1, 'Andrea Hirata', 'Penulis novel Laskar Pelangi.', 'Indonesia'),
(2, 'Tere Liye', 'Penulis prolifik dengan berbagai genre.', 'Indonesia'),
(3, 'Pramoedya Ananta Toer', 'Sastrawan besar sejarah Indonesia.', 'Indonesia'),
(4, 'Dee Lestari', 'Penulis seri Supernova dan penyanyi.', 'Indonesia'),
(5, 'J.K. Rowling', 'Penulis seri Harry Potter.', 'Inggris'),
(6, 'Raditya Dika', 'Penulis komedi dan sutradara.', 'Indonesia'),
(7, 'Leila S. Chudori', 'Wartawan dan penulis Laut Bercerita.', 'Indonesia'),
(8, 'Rhenald Kasali', 'Akademisi dan praktisi bisnis.', 'Indonesia'),
(9, 'Eka Kurniawan', 'Penulis Cantik Itu Luka.', 'Indonesia'),
(10, 'Agatha Christie', 'Penulis novel kriminal/detektif.', 'Inggris');


INSERT INTO PEMINJAMAN (id, buku_id, peminjam_id, petugas_id, tgl_pinjam, tgl_kembali_rencana, tgl_kembali_aktual, denda) VALUES
(1, 101, 1, 1, '2024-01-01', '2024-01-08', '2024-01-07', 0),
(2, 105, 2, 1, '2024-01-02', '2024-01-09', '2024-01-12', 6000),
(3, 102, 3, 2, '2024-01-05', '2024-01-12', '2024-01-12', 0),
(4, 101, 4, 2, '2024-01-10', '2024-01-17', '2024-01-15', 0),
(5, 110, 5, 1, '2024-02-01', '2024-02-08', NULL, 0),
(6, 103, 1, 2, '2024-02-02', '2024-02-09', '2024-02-15', 12000),
(7, 108, 6, 1, '2024-02-05', '2024-02-12', '2024-02-11', 0),
(8, 104, 2, 1, '2024-02-10', '2024-02-17', NULL, 0),
(9, 109, 7, 2, '2024-02-12', '2024-02-19', '2024-02-25', 12000),
(10, 107, 8, 1, '2024-02-20', '2024-02-27', '2024-02-26', 0);

select * from buku;

select * from kategori;

select * from petugas where nama = "Ayyas Aulia";
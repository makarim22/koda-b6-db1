CREATE TABLE kategori (
  id SERIAL PRIMARY KEY,
  kategori VARCHAR(64) NOT NULL,
  deskripsi VARCHAR(64)
);

CREATE TABLE rak_buku (
  id SERIAL PRIMARY KEY,
  lokasi VARCHAR(64),
  genre VARCHAR(64)
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
  posisi VARCHAR(64),
  nomor_hp VARCHAR(64),
  email VARCHAR(64) UNIQUE
);

CREATE TABLE buku (
  id SERIAL PRIMARY KEY,
  ISBN INT UNIQUE NOT NULL,
  judul VARCHAR(64),
  penulis VARCHAR(64),
  penerbit VARCHAR(64),
  tahun INT,
  sedang_dipinjam BOOLEAN,
  kategori_id INT REFERENCES kategori(id),
  peminjam_id INT REFERENCES peminjam(id),
  petugas_id INT REFERENCES petugas(id),
  rak_buku_id INT REFERENCES rak_buku(id)
);

ALTER TABLE buku
ALTER COLUMN ISBN TYPE VARCHAR(64);

-----
--- insert query

INSERT INTO kategori (kategori, deskripsi) VALUES
('Fiksi', 'Novel dan cerita fiksi'),
('Non-Fiksi', 'Buku pengetahuan dan referensi'),
('Anak-Anak', 'Buku untuk anak-anak');


INSERT INTO rak_buku (lokasi, genre) VALUES
('Rak A1', 'Fiksi Indonesia'),
('Rak A2', 'Non-Fiksi');

INSERT INTO peminjam (nama, alamat) VALUES
('Anton Sanjoyo', 'Jl. Merdeka No. 10, Jakarta'),
('Justinus Lhaksana', 'Jl. Aceh No, 12, Bandung'),
('Ahmad Syafiq', 'Jl. Nusa Indah No. 20, Denpasar');

INSERT INTO petugas (nama, posisi, nomor_hp, email) VALUES
('Ayyas Aulia', 'Librarian', '081234567890', 'Ayyas@uilibrary.ac.id'),
('Tasrif Muhammad', 'Admin', '082345678901', 'hendra@uilibrary.ac.id');

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


select * from buku;

select * from kategori;

select * from petugas where nama = "Ayyas Aulia";
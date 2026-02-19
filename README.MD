``` mermaid
erDiagram
     KATEGORI ||--o{ BUKU : memiliki
    RAK_BUKU ||--o{ BUKU : menyimpan
    PEMINJAM ||--o{ BUKU : meminjam
    PETUGAS ||--o{ BUKU : mengelola

BUKU {
    int id PK
    int ISBN UK
    string judul
    string penulis
    int tahun_terbit
    int kategori_id FK
    int rak_buku_id FK
    int peminjam_id FK
    int petugas_id FK
}

KATEGORI {
    int id PK
    string nama_kategori
    string deskripsi
}

RAK_BUKU {
    int id PK
    string lokasi
}

PEMINJAM {
 int id PK
 string nama
 string address
 date tanggal_daftar

}

PETUGAS {
 int id PK
 string nama
 string posisi
 string nomor_telepon
 string email
}
```
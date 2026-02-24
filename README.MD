``` mermaid
erDiagram
    KATEGORI ||--o{ BUKU : mengkategorikan
    RAK_BUKU ||--o{ BUKU : menyimpan
    PEMINJAM ||--o{ PEMINJAMAN : melakukan
    BUKU ||--o{ PEMINJAMAN : dicatat_dalam
    PETUGAS ||--o{ PEMINJAMAN : memproses
    PENULIS ||--o{ BUKU : menulis
    PENERBIT ||--o{ BUKU : menerbitkan

    BUKU {
        int id PK
        int penulis_id FK  
        int penerbit_id FK
        string ISBN
        string judul
        int tahun_terbit
        int kategori_id FK
        int rak_buku_id FK
        int jumlah_stok 
    }

    PENULIS {
        int id PK
        string nama_penulis
        string biografi_singkat
        string negara_asal
    }

    PENERBIT {
        int id PK
        string nama_penerbit
        string alamat
        string email_kontak
    }

    KATEGORI {
        int id PK
        string nama_kategori
        string deskripsi
    }

    RAK_BUKU {
        int id PK
        string lokasi 
        string kode_rak
    }

    PEMINJAM {
        int id PK
        string nama
        string alamat
        date tanggal_daftar
    }

    PETUGAS {
        int id PK
        string nama
        string posisi
    }

    PEMINJAMAN {
        int id PK
        int buku_id FK
        int peminjam_id FK
        int petugas_id FK
        date tanggal_pinjam
        date tanggal_kembali_rencana
        date tanggal_kembali_aktual
        int denda
    }
```
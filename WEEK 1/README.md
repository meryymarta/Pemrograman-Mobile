Laporan Praktikum Minggu 1: Instalasi dan Pengenalan Dart

Nama: Meriam Oktavia
NIM: 244107060018
Kelas: SIB 2G

1.Pendahuluan
Pada praktikum minggu pertama, saya melakukan proses instalasi software yang dibutuhkan untuk pengembangan aplikasi mobile, yaitu Flutter dan Android Studio. Selain itu, saya juga mencoba menjalankan program sederhana menggunakan bahasa Dart untuk memahami dasar-dasarnya

2.Proses Instalasi dan Konfigurasi
A. Instalasi Android studio
Langkah langkah yang dilakukan
- Mengunduh file installer Android Studio dari website resminya
- Menjalankan Installer
- Memilih tipe instalasi
- Menentukan lokasi penyimpanan.
- Menyetujui lisensi yang diminta.

A. Instalasi Flutter SDK
Langkah-langkah yang dilakukan:
-Mengunduh Flutter SDK versi stabil (flutter_windows_3.38.9-stable.zip).
-Mengekstrak file ZIP ke folder C:\src\flutter supaya lebih mudah diakses dan menghindari masalah permission.
-Menambahkan path C:\src\flutter\bin ke Environment Variables (User Variables) agar perintah flutter bisa dijalankan dari terminal mana saja.

A. Struktur Kode
Program yang dibuat dibagi menjadi dua file dalam folder proyek dart_basic1:
> lib/dart_basic1.dart
  Berisi fungsi-fungsi utama, yaitu:
 - calculate() untuk melakukan operasi perkalian.
 - segitiga() untuk menghitung luas segitiga dengan rumus (alas × tinggi) / 2.

> bin/dart_basic1.dart
Berisi fungsi main() sebagai entry point yang memanggil fungsi dari folder lib. Pada bagian ini, fungsi segitiga(10, 5) dipanggil untuk menghitung luas segitiga dengan alas 10 dan tinggi 5, sehingga menghasilkan nilai 25.0.

B. Hasil Output
Program berhasil dijalankan dan menghasilkan output:
Hello world: 42!
Luas segitiga: 25.0

Screenshot hasil output sudah disimpan di folder docs/.

4.Kendala
- Masalah "Lokasi" (Path & Folder)
  saya sempat bingung untuk mengekstrak Flutter dimana (di Downloads atau Program Files), lalu memindahkannya ke C:\src.


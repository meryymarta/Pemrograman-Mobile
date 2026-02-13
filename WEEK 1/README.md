Laporan Praktikum Minggu 1
Instalasi dan Pengenalan Dart

# Nama: Meriam Oktavia
# NIM: 244107060018
# Kelas: SIB 2G

1. Pendahuluan

Pada praktikum minggu pertama, saya melakukan proses instalasi software yang dibutuhkan untuk pengembangan aplikasi mobile, yaitu Flutter dan Android Studio. Selain itu, saya juga mencoba menjalankan program sederhana menggunakan bahasa Dart untuk memahami dasar-dasarnya.

2. Proses Instalasi dan Konfigurasi
A. Instalasi Android Studio

Langkah-langkah yang dilakukan:

Mengunduh file installer Android Studio dari website resminya.

Menjalankan installer.

Memilih tipe instalasi.

Menentukan lokasi penyimpanan.

Menyetujui lisensi yang diminta.

B. Instalasi Flutter SDK

Langkah-langkah yang dilakukan:

Mengunduh Flutter SDK versi stabil (flutter_windows_3.38.9-stable.zip).

Mengekstrak file ZIP ke folder C:\src\flutter agar mudah diakses dan menghindari masalah permission.

Menambahkan path C:\src\flutter\bin ke Environment Variables (User Variables) agar perintah flutter dapat dijalankan dari terminal mana saja.

3. Pembuatan dan Uji Coba Program Dart
A. Struktur Kode

Program yang dibuat dibagi menjadi dua file dalam folder proyek dart_basic1:

1. lib/dart_basic1.dart
Berisi fungsi-fungsi utama, yaitu:

calculate() untuk melakukan operasi perkalian.

segitiga() untuk menghitung luas segitiga dengan rumus (alas × tinggi) / 2.

2. bin/dart_basic1.dart
Berisi fungsi main() sebagai entry point yang memanggil fungsi dari folder lib. Pada bagian ini, fungsi segitiga(10, 5) dipanggil untuk menghitung luas segitiga dengan alas 10 dan tinggi 5, sehingga menghasilkan nilai 25.0.

B. Hasil Output

Program berhasil dijalankan dan menghasilkan output:

Hello world: 42!
Luas segitiga: 25.0

Screenshot hasil output sudah disimpan di folder docs/.

4. Kendala
Masalah Lokasi (Path & Folder)

Saya sempat mengalami kebingungan dalam menentukan lokasi ekstraksi Flutter, apakah di folder Downloads atau Program Files. Awalnya file berada di Downloads, kemudian saya memindahkannya ke C:\src agar lebih mudah dikonfigurasi dan menghindari masalah permission. Setelah dipindahkan dan path ditambahkan ke Environment Variables, Flutter dapat berjalan dengan baik.
# Laporan Pembelajaran: Dasar Pemrograman Dart

**Identitas Mahasiswa:**
* **Nama:** Meriam Oktavia
* **NIM:** 244107060018
* **Kelas:** SIB 2G
* **Prodi:** D4 Sistem Informasi Bisnis

---

## Pendahuluan
Laporan praktikum kali ini merangkum materi dan hal baru yang telah dipelajari selama mengerjakan tugas-tugas awal mata kuliah Pemrograman Mobile. Fokus utamanya adalah memahami fundamental bahasa pemrograman Dart, mulai dari logika dasar hingga penulisan kode yang rapi sesuai *best practices*.

## Materi yang Telah Dipelajari
Selama mengerjakan tugas (seperti Kalkulator BMI, Kasir Skincare, dan Konversi Unit), terdapat beberapa konsep baru yang langsung dipraktikkan:

* **Tipe Data & Variabel**: Pemahaman tentang kapan harus menggunakan `int` (angka bulat), `double` (angka desimal/pecahan), `String` (teks), dan `bool` (true/false). Selain itu, terdapat juga penggunaan `Map` untuk menyimpan data berpasangan, contohnya seperti menyimpan daftar nilai mahasiswa atau nilai kurs mata uang.
* **Bermain dengan Operator**: Eksplorasi berbagai jenis operator. Mulai dari perhitungan dasar (aritmatika), logika gabungan (`&&`, `||`, `!`), sampai operator *ternary* (`? :`) yang terbukti membuat kode bersyarat menjadi jauh lebih ringkas.
* **Control Flow (Alur Program)**: Mempelajari cara membuat alur logika dan pengambilan keputusan menggunakan `if-else`. Selanjutnya, dipelajari juga cara mengulang proses (looping) di dalam koleksi data menggunakan `.forEach()`.

## Penerapan Standar Kode (Best Practices)
Kode tidak hanya sekadar bisa berjalan, tetapi juga harus rapi dan profesional. Beberapa standar yang diterapkan di semua tugas meliputi:

| Praktik Terbaik | Penjelasan & Penerapannya |
* **Keamanan Variabel** Membiasakan penggunaan `final` atau `const` untuk data yang sudah pasti, agar nilainya aman dan performa aplikasi lebih optimal. 
* **Penamaan (CamelCase)** Selalu menggunakan huruf kecil di awal dan huruf besar di awal kata berikutnya (contoh: `hargaAkhir`, `totalBelanja`). 
* **Formatting Output** Menggunakan *String Interpolation* (`$`) agar lebih mudah memanggil variabel ke dalam teks, serta `.toStringAsFixed()` agar angka desimal di terminal terlihat rapi. 

## Struktur Pengerjaan Tugas
Agar susunan file tetap rapi, hasil pekerjaan dibagi ke dalam dua *folder* utama:
* 📂 **`src`**: Tempat menyimpan semua file kode program (`.dart`) yang sudah berjalan dengan baik dan bebas *error*.
* 📂 **`docs`**: Tempat menyimpan catatan, laporan, atau *screenshot* hasil eksekusi dari program yang telah dibuat.

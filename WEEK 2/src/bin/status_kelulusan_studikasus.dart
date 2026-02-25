void main() {
  // Map untuk menyimpan pasangan data (Mata Kuliah : Nilai)
  Map nilaiMahasiswa = {
    'Matematika': 85, 
    'Fisika': 78, 
    'Pemrograman': 90, 
    'Bahasa Inggris': 80
  };

  // Wadah untuk menyimpan hasil penjumlahan semua nilai
  double total = 0;

  // Perulangan untuk mengecek tiap isi Map dan menjumlahkan nilainya
  nilaiMahasiswa.forEach((mataKuliah, nilai) {
    total += nilai;
  });

  // Menghitung rata-rata (Total nilai dibagi jumlah mata kuliah)
  double rataRata = total / nilaiMahasiswa.length;

  // Menentukan status kelulusan (Lulus jika rata-rata >= 60)
  String status = rataRata >= 60 ? 'LULUS' : 'TIDAK LULUS';

  // Menentukan predikat berdasarkan angka rata-rata
  String predikat;
  if (rataRata >= 90) {
    predikat = 'A';
  } else if (rataRata >= 80) {
    predikat = 'B';
  } else if (rataRata >= 70) {
    predikat = 'C';
  } else {
    predikat = 'D/E';
  }

  // Menampilkan hasil akhir ke layar
  print('Nilai Mahasiswa: $nilaiMahasiswa');
  print('Rata-rata: $rataRata');
  print('Status: $status');
  print('Predikat: $predikat');
}
void main(){
  print('=== Kalkulator BMI Sederhana ===');

  // Mendeklarasikan variabel untuk berat dan tinggi badan
  final double beratKg = 50.0;   // kg
  final double tinggiCm = 160.0; // cm

  // Menampilkan data input ke layar biar kelihatan di terminal
  print('Berat badan  : $beratKg kg');
  print('Tinggi badan : $tinggiCm cm');

  // menghitung tinggi dalam meter (karena rumus BMI pakai meter)
  final double tinggiM = tinggiCm / 100;

  // Menghitung BMI sesuai rumus
  final double bmi = beratKg / (tinggiM * tinggiM);

  // Menentukan Kategori BMI menggunakan if-else
  final String kategori;
  
  if (bmi < 18.5) {
    kategori = 'Kekurangan berat badan';
  } else if (bmi >= 18.5 && bmi < 24.9) {
    kategori = 'Normal (Ideal)';
  } else if (bmi >= 25 && bmi < 29.9) {
    kategori = 'Kelebihan berat badan';
  } else {
    kategori = 'Obesitas';
  }

  // Menampilkan hasil akhir
  print('\n--- Hasil Analisis ---');
  // toStringAsFixed(1) digunakan agar angka di belakang koma dibatasi 1 digit saja
  print('Nilai BMI Anda : ${bmi.toStringAsFixed(1)}');
  print('Kategori       : $kategori');
}
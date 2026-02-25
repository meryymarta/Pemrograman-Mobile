void main() {
  print('--- Program Konversi Mata Uang ---');
  //input jumlah uang dalam Rupiah
  final double rupiah = 150000.0; 

  // membuang .0 saat dicetak ke layar, tanpa mengubah tipe data asli variabel rupiah-nya.
  print('Uang dalam Rupiah: Rp ${rupiah.toInt()}');

  // Mendeklarasi kurs mata uang untuk menjadi nilai tukar
  const double kursUsd = 15000; //Dolar AS
  const double kursJpy = 105; //Yen Jepang
  const double kursMyr = 3500; //Ringgit Malaysia
  const double kursSar = 4000; //Riyal Arab Saudi
  const double kursPhp = 280; //Peso Filipina

  // Proses konversi mata uang (Rupiah dibagi nilai kurs)
  final double hasilUsd = rupiah / kursUsd;
  final double hasilJpy = rupiah / kursJpy;
  final double hasilMyr = rupiah / kursMyr;
  final double hasilSar = rupiah / kursSar;
  final double hasilPhp = rupiah / kursPhp;

  // Menampilkan hasil akhir
  print('\n--- Hasil Konversi ---');

  // Menggunakan toStringAsFixed(2) agar angka komanya rapi
  print('Ke Dolar AS    : \$${hasilUsd.toStringAsFixed(2)}');
  print('Ke Yen Jepang  : ¥${hasilJpy.toStringAsFixed(2)}');
  print('Ke Ringgit MY  : RM ${hasilMyr.toStringAsFixed(2)}');
  print('Ke Riyal Arab  : SAR ${hasilSar.toStringAsFixed(2)}');
  print('Ke Peso PH     : ₱${hasilPhp.toStringAsFixed(2)}');
}
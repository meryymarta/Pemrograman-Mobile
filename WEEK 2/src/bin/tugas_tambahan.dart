import 'dart:io';

void main() {

  // Implementasi Map untuk menyimpan faktor konversi (Nilai dasar = 1.0)
  const Map<String, double> faktorPanjang = {
    'Meter (Base)' : 1.0,
    'Kilometer'    : 0.001,
    'Centimeter'   : 100.0,
    'Milimeter'    : 1000.0,
    'Mikrometer'   : 1000000.0,
    'Inci (Inch)'  : 39.3701
  };

  const Map<String, double> faktorMassa = {
    'Kilogram (Base)' : 1.0,
    'Gram'            : 1000.0,
    'Miligram'        : 1000000.0,
    'Ton'             : 0.001,
    'Kuintal'         : 0.01,
    'Pon (Pound)'     : 2.20462
  };

  const Map<String, double> faktorVolume = {
    'Liter (Base)'     : 1.0,
    'Mililiter (mL)'   : 1000.0,
    'Meter Kubik (m3)' : 0.001,
    'Sentimeter Kubik' : 1000.0,
    'Galon (US)'       : 0.264172,
    'Barel'            : 0.00628981
  };

  bool isRunning = true;

  // Looping Menu Utama
  while (isRunning) {
    print('\n==================================');
    print('    APLIKASI KONVERSI UNIT');
    print('==================================');
    print('1. Panjang (Base: Meter)');
    print('2. Massa   (Base: Kilogram)');
    print('3. Volume  (Base: Liter)');
    print('4. Suhu    (Base: Celcius)');
    print('0. Keluar');
    print('----------------------------------');
    stdout.write('Pilih menu (0-4): ');

    // Null Safety dengan ?? (Default ke string kosong jika null)
    final String pilihan = stdin.readLineSync() ?? '';

    if (pilihan == '0') {
      print('Terima kasih telah menggunakan aplikasi ini!');
      isRunning = false;
      continue; 
    }

    // Pengecekan kategori 1, 2, dan 3 (Kategori yang tidak boleh negatif)
    if (pilihan == '1' || pilihan == '2' || pilihan == '3') {
      stdout.write('Masukkan nilai untuk dikonversi: ');
      
      // Menggunakan 'final' untuk variabel yang nilainya tidak diubah lagi
      final String inputNilai = stdin.readLineSync() ?? '';
      
      // tryParse: Mengubah string ke double. Jika user memasukkan huruf, jadikan -1.0
      final double nilai = double.tryParse(inputNilai) ?? -1.0;

      // VALIDASI INPUT: Hindari nilai negatif
      if (nilai < 0) {
        print('-> ERROR: Input tidak valid! Nilai tidak boleh negatif atau berupa huruf.');
        continue; 
      }

      print('\n--- Hasil Konversi ---');
      if (pilihan == '1') {
        // Looping isi Map Panjang
        faktorPanjang.forEach((namaUnit, faktor) {
          double hasil = nilai * faktor;
          print('- $namaUnit : ${hasil.toStringAsFixed(3)}');
        });
      } else if (pilihan == '2') {
        // Looping isi Map Massa
        faktorMassa.forEach((namaUnit, faktor) {
          double hasil = nilai * faktor;
          print('- $namaUnit : ${hasil.toStringAsFixed(3)}');
        });
      } else if (pilihan == '3') {
        // Looping isi Map Volume
        faktorVolume.forEach((namaUnit, faktor) {
          double hasil = nilai * faktor;
          print('- $namaUnit : ${hasil.toStringAsFixed(3)}');
        });
      }

    } 
    // Pengecekan kategori 4 (Suhu) -> Suhu boleh bernilai negatif
    else if (pilihan == '4') {
      stdout.write('Masukkan suhu dalam Celcius: ');
      final String inputSuhu = stdin.readLineSync() ?? '';
      final double? suhuC = double.tryParse(inputSuhu);

      // VALIDASI INPUT: Memastikan input bukan huruf/kosong (suhuC null)
      if (suhuC == null) {
        print('-> ERROR: Masukkan format angka yang benar!');
        continue;
      }

      print('\n--- Hasil Konversi Suhu ---');
      // Suhu dihitung dengan rumus manual karena tidak memakai faktor perkalian murni
      print('- Celcius (Base) : ${suhuC.toStringAsFixed(2)} °C');
      print('- Fahrenheit     : ${((suhuC * 9 / 5) + 32).toStringAsFixed(2)} °F');
      print('- Kelvin         : ${(suhuC + 273.15).toStringAsFixed(2)} K');
      print('- Reamur         : ${(suhuC * 4 / 5).toStringAsFixed(2)} °Ré');
      print('- Rankine        : ${((suhuC + 273.15) * 9 / 5).toStringAsFixed(2)} °R');
    } 
    // Jika user salah ketik menu
    else {
      print('-> ERROR: Pilihan tidak tersedia. Silakan ketik angka 0 - 4.');
    }
  }
}
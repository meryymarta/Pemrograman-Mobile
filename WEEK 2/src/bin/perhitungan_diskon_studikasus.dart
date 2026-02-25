void main() {
  
  //Deklarasi variabel
  double hargaBarang = 120000; 
  int jumlahBeli = 3; 
  String kodeMember = 'GOLD';

  //Proses Perhitungan
  double total = hargaBarang * jumlahBeli; // Menghitung total harga sebelum dipotong diskon
  double diskonPersen = 0;
  
  // Pengecekan status member untuk menentukan diskon
  if (kodeMember == 'GOLD') { 
    diskonPersen = 0.1;
  } else if (kodeMember == 'SILVER') { 
    diskonPersen = 0.05;
  }
  
  // Ternary operator (? :) : Jika belanja > 300rb, dapat tambahan diskon 5% (0.05), jika tidak dapat 0
  double diskonTambahan = total > 300000 ? 0.05 : 0; 
  //menghitung total diskon 
  double totalDiskon = total * (diskonPersen + diskonTambahan); 
  // Menghitung harga yang harus dibayar
  double hargaAkhir = total - totalDiskon; 
  
  //Menampilkan hasil
  print('Total: Rp$total'); 
  print('Diskon: Rp$totalDiskon');
  print('Akhir: Rp$hargaAkhir');

} 
void main() {
  print('=== Kasir KKV Beauty & Skincare ===');

  // 1. operator penugasan dasar (=)
  const double hargaSerum = 125000.0;
  const double hargaSunscreen = 85000.0;

  // Menentukan data pembeli
  final int beliSerum = 3;        
  final int beliSunscreen = 1;    
  final String inputMember = 'y';

  // Menampilkan data input ke layar
  print('Beli Serum (pcs)     : $beliSerum');
  print('Beli Sunscreen (pcs) : $beliSunscreen');
  print('Apakah anda VIP?     : $inputMember\n');

  // 2. operator aritmatika (+,*)
  final int totalItem = beliSerum + beliSunscreen;
  double totalBelanja = (beliSerum * hargaSerum) + (beliSunscreen * hargaSunscreen);

  // 3. operator penugasan gabungan(+=)
  // Tambah biaya paperbag & packaging Rp 2000
  totalBelanja += 2000;

  // 4. operator perbandingan (>, ==) & Logika (&&, ||)
  // Cek apakah dia VIP (huruf kecil 'y' ATAU huruf besar 'Y')
  final bool isVIP = (inputMember == 'y' || inputMember == 'Y');

  // syarat dapat diskon: Belanja diatas 300rb dan member VIP
  final bool dapatDiskon = totalBelanja > 300000 && isVIP;

  // 5. operator ternary(? :)
  // Jika dapat diskon, potong 15%
  final double potongan = dapatDiskon ? totalBelanja * 0.15 : 0.0;

  // Opeator aritmatika pengurangan (-) untuk total akhir
  final double totalBayar = totalBelanja - potongan;

  // 6. operator aritmatika modulo (%)
  final int sisaItem = totalItem % 3; // Mengecek sisa item menuju bonus berikutnya
  final int freeSheetMask = totalItem ~/ 3; // Promo setiap pembelian 3 item, dapat 1 free sheetmask

  // 7. operator logika NOT (!)
  // jika bukan VIP, maka menawarkan daftar member
  final String pesan = !isVIP ? 'Yuk daftar VIP biar bisa dapat diskon 15%!' : 'Terima kasih^^';

  // Menampilkan struk belanja
  print('=== Struk Belanja Skincare ===');
  print('Total Item           : $totalItem pcs');
  print('Total Harga (+Pack)  : Rp ${totalBelanja.toInt()}');
  print('Potongan Diskon      : Rp ${potongan.toInt()}');
  print('Total Bayar          : Rp ${totalBayar.toInt()}');

  // Pengecekan sederhana untuk bonus sheet mask
  if (freeSheetMask > 0) {
    print('Bonus Belanja        : $freeSheetMask Free Sheet Mask');
    print('Beli ${3 - sisaItem} produk lagi untuk nambah bonus sheetmask!');
  }
  
  print('Pesan                : $pesan');
}
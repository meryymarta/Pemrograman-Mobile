//KUIS PRAKTIK: Sistem Pengolah Diskon Toko Terpersonalisasi

void main() {
  //Deklarasi nama dan nim pribadi
  String nama = "Meriam Oktavia Martadinata";
  String nim = "244107060018";

  //mengambil 3 digit terkahir nim (018)
  double nilaiUnikNIM = double.parse(nim.substring(nim.length - 3));

  //list harga barang
  List<double> hargaBarang = [50000.0, 45000.0, 30000.0, 60000.0, 25000.0];

  //menambahkan nilai unik nim sbg elemen ke-6 dalam list 
  hargaBarang.add(nilaiUnikNIM);

  //menghitung total awal awal dengan functions
  double totalAwal = hitungTotal(hargaBarang);

  //null safety 
  String? pesanDiskon;
  double besarDiskon = 0.0;

  //percabangan if-sles
  if (totalAwal > 200000) {
    besarDiskon = totalAwal * 0.1; //diskon 10%
    pesanDiskon = "Anda mendapatkan diskon 10%!";
  } else if (totalAwal >=100000 && totalAwal <=200000){
    besarDiskon = totalAwal * 0.05; //diskon 5%
    pesanDiskon = "Anda mendapatkan diskon 5%";
  } else {
    besarDiskon = 0.0; //tidak ada diskon
    pesanDiskon = "Maaf, Anda tidak mendapatkan diskon.";
  }

  double totalAkhir = totalAwal - besarDiskon;

  //output
  print("Nama         : $nama");
  print("NIM          : $nim");
  print("Total Awal   : Rp ${totalAwal.toStringAsFixed(0)}");
  print("Besar Diskon : Rp ${besarDiskon.toStringAsFixed(0)} (${pesanDiskon!})");
  print("Total Akhir  : Rp ${totalAkhir.toStringAsFixed(0)}");
}

  //functions dan looping dg for in
  double hitungTotal(List<double>daftarHarga){
    double total = 0.0;

    for (double harga in daftarHarga){
      total += harga;
    }
    return total;
  }
  



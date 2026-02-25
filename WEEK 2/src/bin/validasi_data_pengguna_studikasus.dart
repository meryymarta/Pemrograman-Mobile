void main(){
  //Deklarasi variabel
  String username = 'budi123';
  String password = 'pass123';
  int umur = 17;

  //Proses validasi
  //.length digunakan untuk menghitung jumlah huruf/karakter
  bool isUsernameValid = username.length >= 6;
  bool ispasswordValid = password.length >= 6;
  bool isAdult = umur >= 18;

  //proses validasi dan terdapat operator AND
  //kedua syarat harus bernilai 'true' agar hasilnya 'true'
  bool canRegister = isUsernameValid && ispasswordValid;
  bool canAccessAdultContent = canRegister && isAdult;

  //Menampilkan hasil validasi
  //tanda '$' untuk memanggil nilai dr variabel
  print('Dapat mendaftar: $canRegister');
  print('Dapat mengakses konten: $canAccessAdultContent');

}
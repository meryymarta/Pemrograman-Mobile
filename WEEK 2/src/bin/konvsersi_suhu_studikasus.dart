void main() {
  //Menentukan suhu awal
  double celcius = 30;
  double farenheit, kelvin;

  //Memasukkan rumus matematika konversi suhu
  farenheit = (celcius * 9/5) + 32;
  kelvin = celcius + 273.15;

  //Menampilkan hasil ke layar
  print('$celcius°C = $farenheit°F');
  print('$celcius°C = $kelvin K');
}
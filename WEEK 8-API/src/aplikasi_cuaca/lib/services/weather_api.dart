import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherApiClient {
 Future<WeatherModel> fetchWeather(double lat, double lon) async {
  final String url = 
    "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=relative_humidity_2m&current_weather=true&daily=temperature_2m_max&past_days=1";

  try {
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw Exception("Gagal memuat data dari server");
    }
  } catch (e) {
    throw Exception("Masalah Koneksi: $e");
  }
}
  Future<Map<String, dynamic>> getCoordinates(String cityName) async {
    final String url = "https://geocoding-api.open-meteo.com/v1/search?name=$cityName&count=1&language=en&format=json";
    try {
      Response response = await Dio().get(url);
      if (response.data['results'] != null) {
        final res = response.data['results'][0];
        return {"lat": res['latitude'], "lon": res['longitude'], "name": res['name']};
      }
      throw Exception("Kota tidak ditemukan");
    } catch (e) {
      throw Exception("Gagal mencari lokasi");
    }
  }
}
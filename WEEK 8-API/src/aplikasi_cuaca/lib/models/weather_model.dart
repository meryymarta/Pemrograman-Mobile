class WeatherModel {
  final double temperature;
  final double windSpeed;
  final int weatherCode;
  final int humidity;
  final List<double> maxTemp;

  WeatherModel({
    required this.temperature,
    required this.windSpeed,
    required this.weatherCode,
    required this.humidity,
    required this.maxTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    // Ambil data 'current' (untuk kelembapan)
    final current = json['current'];
    // Ambil data 'current_weather' (untuk suhu & angin)
    final currentWeather = json['current_weather'];
    // Ambil data 'daily' (untuk suhu harian)
    final daily = json['daily'];

    // Pengaman List Suhu Harian
    List<double> temps = [0.0, 0.0, 0.0];
    if (daily != null && daily['temperature_2m_max'] != null) {
      temps = List<double>.from(daily['temperature_2m_max'].map((x) => x.toDouble()));
    }

    return WeatherModel(
      temperature: (currentWeather?['temperature'] ?? 0.0).toDouble(),
      windSpeed: (currentWeather?['windspeed'] ?? 0.0).toDouble(),
      weatherCode: (currentWeather?['weathercode'] ?? 0).toInt(),
      humidity: (current?['relative_humidity_2m'] ?? 0).toInt(),
      maxTemp: temps,
    );
  }
}
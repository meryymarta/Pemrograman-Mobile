import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/weather_api.dart';
import '../models/weather_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherApiClient _weatherService = WeatherApiClient();
  final TextEditingController _searchController = TextEditingController();

  String _currentCity = "Malang";
  double _lat = -7.98;
  double _lon = 112.63;
  int _selectedTab = 1; 

  late Future<WeatherModel> _weatherFuture;

  @override
  void initState() {
    super.initState();
    _weatherFuture = _weatherService.fetchWeather(_lat, _lon);
  }

  void _searchCity() async {
    if (_searchController.text.isEmpty) return;
    try {
      final coords = await _weatherService.getCoordinates(_searchController.text);
      setState(() {
        _lat = coords['lat'];
        _lon = coords['lon'];
        _currentCity = coords['name'];
        _selectedTab = 1;
        _weatherFuture = _weatherService.fetchWeather(_lat, _lon);
      });
      _searchController.clear();
      FocusScope.of(context).unfocus();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Kota tidak ditemukan")),
      );
    }
  }

  String _getWeatherStatus(int code) {
    if (code == 0) return "Clear Sky";
    if (code >= 1 && code <= 3) return "Partly Cloudy";
    if (code >= 45 && code <= 48) return "Foggy";
    if (code >= 51 && code <= 65) return "Rainy";
    return "Cloudy";
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, d MMMM yyyy').format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xFFF3F7FF),
      body: FutureBuilder<WeatherModel>(
        future: _weatherFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFF5A9CFF)));
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final weather = snapshot.data!;
          double displayTemp = _selectedTab == 1
              ? weather.temperature
              : _selectedTab == 0
                  ? weather.maxTemp[0]
                  : weather.maxTemp[2];

          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 330,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF5A9CFF), Color(0xFF86B9FF)],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            child: Container(
                              height: 42,
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextField(
                                controller: _searchController,
                                style: const TextStyle(color: Colors.white, fontSize: 14),
                                decoration: InputDecoration(
                                  hintText: "Search city...",
                                  hintStyle: const TextStyle(color: Colors.white70, fontSize: 13),
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.search, color: Colors.white, size: 18),
                                    onPressed: _searchCity,
                                  ),
                                ),
                                onSubmitted: (_) => _searchCity(),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.location_on, color: Colors.white, size: 14),
                              const SizedBox(width: 4),
                              Text(_currentCity, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const Icon(Icons.cloud, size: 60, color: Colors.white),
                          Text(_getWeatherStatus(weather.weatherCode), style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          Text(formattedDate, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                          Text("${displayTemp.toStringAsFixed(1)}°", style: const TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold)),
                          
                          const SizedBox(height: 10),

                          // --- Forecast Card ---
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 5))],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    _buildTabButton("Yesterday", 0),
                                    _buildTabButton("Today", 1),
                                    _buildTabButton("Tomorrow", 2),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    _hourlyWeather("Now", Icons.wb_sunny, "${weather.temperature}°"),
                                    _hourlyWeather("3 PM", Icons.wb_cloudy, "27°"),
                                    _hourlyWeather("4 PM", Icons.cloud, "26°"),
                                    _hourlyWeather("5 PM", Icons.grain, "23°"),
                                    _hourlyWeather("6 PM", Icons.water_drop, "20°"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // --- DETAILS & TIPS ---
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2C3E50))),
                      
                      GridView.count(
                        padding: EdgeInsets.zero, 
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2.3, 
                        children: [
                          _detailBox(Icons.thermostat, "${displayTemp.toStringAsFixed(1)}°C", "Celsius"),
                          _detailBox(Icons.air, "${weather.windSpeed} km/h", "Wind Speed"),
                          _detailBox(Icons.light_mode, "Low", "UV Index"),
                          _detailBox(Icons.water_drop_outlined, "${weather.humidity}%", "Humidity"),
                        ],
                      ),
                      
                      const SizedBox(height: 10), 
                      
                      const Text("Tips", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2C3E50))),
                      const SizedBox(height: 4), 
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F1FF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.lightbulb_outline, color: Colors.amber, size: 22),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "It's a great weather for studying and coding!",
                                style: TextStyle(color: Color(0xFF2C3E50), fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    bool isActive = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF5A9CFF) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(label, style: TextStyle(color: isActive ? Colors.white : Colors.grey, fontSize: 11, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
      ),
    );
  }

  Widget _hourlyWeather(String time, IconData icon, String temp) {
    return Column(
      children: [
        Text(time, style: const TextStyle(color: Colors.grey, fontSize: 10)),
        const SizedBox(height: 4),
        Icon(icon, color: const Color(0xFFF1C40F), size: 18),
        const SizedBox(height: 4),
        Text(temp, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
      ],
    );
  }

  Widget _detailBox(IconData icon, String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)],
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF5A9CFF), size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13), overflow: TextOverflow.ellipsis),
                Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
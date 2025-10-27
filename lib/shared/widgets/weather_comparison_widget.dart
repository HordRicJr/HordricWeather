import 'package:flutter/material.dart';
import 'package:hordric_weather/shared/models/city.dart';

class WeatherComparisonWidget extends StatelessWidget {
  final List<City> cities;
  final Map<String, dynamic> weatherData;
  final Function(City) onCityTap;

  const WeatherComparisonWidget({
    Key? key,
    required this.cities,
    required this.weatherData,
    required this.onCityTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cities.isEmpty) {
      return _buildEmptyState();
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade400,
            Colors.cyan.shade300,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 12),
          _buildCityComparison(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(
            Icons.compare_arrows,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 8),
          Text(
            'Compare Cities',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            '${cities.length} cities',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCityComparison() {
    return Container(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: cities.length,
        itemBuilder: (context, index) {
          final city = cities[index];
          final weather = weatherData[city.name];
          
          return _buildCityCard(city, weather);
        },
      ),
    );
  }

  Widget _buildCityCard(City city, dynamic weather) {
    final temp = weather?['main']?['temp']?.toString() ?? '--';
    final feelsLike = weather?['main']?['feels_like']?.toString() ?? '--';
    final humidity = weather?['main']?['humidity']?.toString() ?? '--';
    final windSpeed = weather?['wind']?['speed']?.toString() ?? '--';
    final description = weather?['weather']?[0]?['description'] ?? 'No data';
    final icon = weather?['weather']?[0]?['icon'] ?? '01d';

    return GestureDetector(
      onTap: () => onCityTap(city),
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12, bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // City name
              Text(
                city.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                city.country,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 8),
              
              // Temperature
              Row(
                children: [
                  Image.asset(
                    'assets/${_getWeatherIcon(icon)}.png',
                    width: 32,
                    height: 32,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '$temp°C',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 4),
              
              // Description
              Text(
                description,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade700,
                  fontStyle: FontStyle.italic,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              
              const Spacer(),
              
              // Weather details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDetailItem(Icons.water_drop, '$humidity%'),
                  _buildDetailItem(Icons.air, '$windSpeed m/s'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String value) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: Colors.grey.shade600,
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade400,
            Colors.cyan.shade300,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(
            Icons.add_location_alt,
            size: 48,
            color: Colors.white,
          ),
          const SizedBox(height: 12),
          Text(
            'No cities to compare',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Add favorite cities to compare weather',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  String _getWeatherIcon(String icon) {
    if (icon.contains('01')) return 'clear';
    if (icon.contains('02')) return 'clouds';
    if (icon.contains('03') || icon.contains('04')) return 'clouds';
    if (icon.contains('09') || icon.contains('10')) return 'rain';
    if (icon.contains('11')) return 'thunderstorm';
    if (icon.contains('13')) return 'snow';
    if (icon.contains('50')) return 'mist';
    return 'clear';
  }
}

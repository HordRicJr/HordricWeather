# Weather Comparison Widget

A Flutter widget for HordricWeather that enables users to compare weather conditions across multiple favorite cities in a beautiful, scrollable card interface.

## 📋 Description

The `WeatherComparisonWidget` displays a horizontal scrollable list of city weather cards, allowing users to quickly compare temperature, humidity, wind speed, and weather conditions across their favorite locations.

## ✨ Features

- 🏙️ **Multi-City Comparison**: View multiple cities side-by-side
- 📊 **Key Metrics Display**: Temperature, feels-like, humidity, wind speed
- 🎨 **Beautiful Gradient UI**: Blue/cyan gradients matching HordricWeather theme
- 📱 **Horizontal Scroll**: Smooth card-based scrolling
- 🖼️ **Weather Icons**: Animated weather condition icons
- 👆 **Tap Navigation**: Tap any city card to view details
- 🌈 **Empty State**: Friendly message when no cities added
- 🎯 **Responsive Design**: Adapts to different screen sizes

## 🚀 Usage

### Basic Implementation

```dart
import 'package:hordric_weather/shared/widgets/weather_comparison_widget.dart';
import 'package:hordric_weather/shared/models/city.dart';

class HomePage extends StatelessWidget {
  final List<City> favoriteCities = [
    City(name: 'Paris', country: 'FR'),
    City(name: 'London', country: 'GB'),
    City(name: 'New York', country: 'US'),
  ];

  final Map<String, dynamic> weatherData = {
    'Paris': {
      'main': {'temp': 18, 'feels_like': 16, 'humidity': 65},
      'wind': {'speed': 3.5},
      'weather': [{'description': 'Partly cloudy', 'icon': '02d'}]
    },
    // ... more cities
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WeatherComparisonWidget(
        cities: favoriteCities,
        weatherData: weatherData,
        onCityTap: (city) {
          // Navigate to city details
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CityDetailPage(city: city),
            ),
          );
        },
      ),
    );
  }
}
```

### Integration in Home Page

```dart
// In features/home/pages/home_page.dart
Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        // Current weather
        CurrentWeatherCard(),
        
        const SizedBox(height: 20),
        
        // City comparison widget
        WeatherComparisonWidget(
          cities: favoriteCities,
          weatherData: weatherDataMap,
          onCityTap: navigateToCityDetails,
        ),
        
        const SizedBox(height: 20),
        
        // Other widgets...
      ],
    ),
  );
}
```

## 📦 Props

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `cities` | `List<City>` | Yes | List of favorite cities to compare |
| `weatherData` | `Map<String, dynamic>` | Yes | Weather data keyed by city name |
| `onCityTap` | `Function(City)` | Yes | Callback when user taps a city card |

## 🎨 UI Components

### Header Section
- Compare icon
- "Compare Cities" title
- City count badge

### City Cards (Horizontal Scroll)
Each card displays:
- 🏙️ City name and country
- 🌡️ Current temperature
- 🎨 Weather icon
- ☁️ Weather description
- 💧 Humidity percentage
- 💨 Wind speed

### Empty State
- Add location icon
- "No cities to compare" message
- Encouragement to add favorites

## 📸 Visual Layout

```
┌────────────────────────────────────────────┐
│ 🔄 Compare Cities            3 cities      │
├────────────────────────────────────────────┤
│                                            │
│  ┌──────┐  ┌──────┐  ┌──────┐             │
│  │Paris │  │London│  │Tokyo │  ───►       │
│  │FR    │  │GB    │  │JP    │             │
│  │☀️ 18°│  │☁️ 15°│  │🌧️ 12°│             │
│  │Sunny │  │Cloudy│  │Rainy │             │
│  │💧65% │  │💧72% │  │💧88% │             │
│  │💨3 m/s│ │💨5 m/s│ │💨2 m/s│            │
│  └──────┘  └──────┘  └──────┘             │
│                                            │
└────────────────────────────────────────────┘
```

## 🎨 Styling

### Gradient Container
```dart
LinearGradient(
  colors: [
    Colors.blue.shade400,
    Colors.cyan.shade300,
  ],
)
```

### City Cards
- White background
- Rounded corners (16px radius)
- Subtle shadow
- 160px fixed width
- Responsive height

### Typography
- City name: Bold, 16px, blue
- Temperature: Bold, 24px, blue
- Description: Italic, 11px, gray
- Details: Regular, 11px, gray

## 🔧 Technical Details

### Dependencies
- Flutter SDK
- `shared/models/city.dart` (existing City model)
- Weather icons from `assets/` directory

### Weather Data Structure

```dart
Map<String, dynamic> weatherData = {
  'CityName': {
    'main': {
      'temp': 18.5,
      'feels_like': 16.2,
      'humidity': 65
    },
    'wind': {
      'speed': 3.5
    },
    'weather': [
      {
        'description': 'Partly cloudy',
        'icon': '02d'
      }
    ]
  }
};
```

### Icon Mapping
The widget automatically maps OpenWeather icon codes to local assets:
- `01d/01n` → `clear.png`
- `02d/02n` → `clouds.png`
- `09d/09n, 10d/10n` → `rain.png`
- `11d/11n` → `thunderstorm.png`
- `13d/13n` → `snow.png`
- `50d/50n` → `mist.png`

## 📱 Integration Points

### Where to Use
1. **Home Page**: Main weather comparison section
2. **Favorites Page**: Compare all saved cities
3. **Dashboard Widget**: Quick city overview
4. **City Selection**: Help choose which city to view

### Data Flow
```
UserService → Get Favorite Cities
     ↓
WeatherService → Fetch Weather for Each City
     ↓
WeatherComparisonWidget → Display Comparison
     ↓
onCityTap → Navigate to City Details
```

## 🎯 Use Cases

- 📍 **Multi-Location Users**: People with homes in multiple cities
- ✈️ **Travelers**: Compare weather at destination
- 👨‍👩‍👧‍👦 **Family**: Check weather where relatives live
- 🏢 **Business**: Monitor weather at office locations
- 🌍 **Weather Enthusiasts**: Compare global conditions

## 💡 Future Enhancements

Potential additions:
- Temperature trend indicators (↑↓)
- Best/worst weather highlighting
- Filter by specific metrics
- Sort by temperature/humidity
- Day/night comparison
- Weather alerts badge
- Refresh button
- Add city quick action

## 🧪 Testing

```dart
// Example widget test
testWidgets('WeatherComparisonWidget displays cities', (tester) async {
  final cities = [City(name: 'Paris', country: 'FR')];
  final weatherData = {'Paris': mockWeatherData};
  
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: WeatherComparisonWidget(
          cities: cities,
          weatherData: weatherData,
          onCityTap: (city) {},
        ),
      ),
    ),
  );
  
  expect(find.text('Paris'), findsOneWidget);
  expect(find.text('Compare Cities'), findsOneWidget);
});
```

## 👨‍💻 Author

**Ashvin**
- GitHub: [@ashvin2005](https://github.com/ashvin2005)
- LinkedIn: [ashvin-tiwari](https://linkedin.com/in/ashvin-tiwari)

## 🎃 Hacktoberfest 2025

Created as part of Hacktoberfest 2025 contributions to HordricWeather.

## 📄 License

MIT License - Same as HordricWeather project

---

Made with ❤️ for the HordricWeather community
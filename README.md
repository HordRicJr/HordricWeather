# HordricWeather 

![Hacktoberfest 2025](https://img.shields.io/badge/Hacktoberfest-2025-orange?style=for-the-badge&logo=digitalocean)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-3-orange.svg?style=for-the-badge)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

![Version](https://img.shields.io/badge/version-1.0.1-blue.svg)
![Flutter](https://img.shields.io/badge/Flutter-3.32.8-02569B?logo=flutter)
![Platform](https://img.shields.io/badge/platform-Android-brightgreen.svg)

[![Flutter Analyze](https://github.com/HordRicJr/HordricWeather/actions/workflows/flutter_analyze.yml/badge.svg)](https://github.com/HordRicJr/HordricWeather/actions/workflows/flutter_analyze.yml)
[![Flutter Test](https://github.com/HordRicJr/HordricWeather/actions/workflows/flutter_test.yml/badge.svg)](https://github.com/HordRicJr/HordricWeather/actions/workflows/flutter_test.yml)
[![Build APK](https://github.com/HordRicJr/HordricWeather/actions/workflows/build_apk.yml/badge.svg)](https://github.com/HordRicJr/HordricWeather/actions/workflows/build_apk.yml)
[![Code Quality](https://github.com/HordRicJr/HordricWeather/actions/workflows/code_quality.yml/badge.svg)](https://github.com/HordRicJr/HordricWeather/actions/workflows/code_quality.yml)
[![Dependabot](https://img.shields.io/badge/Dependabot-enabled-blue?logo=dependabot)](https://github.com/HordRicJr/HordricWeather/network/updates)

**Your smart, free, and ad-free weather companion!**

HordricWeather is a modern and elegant weather app built with Flutter, providing accurate forecasts, intelligent alerts, air quality monitoring, and a customizable widget. Completely free, ad-free, and respectful of your privacy.


---

## 📱 Download

[![Get it on Google Play](https://img.shields.io/badge/Google%20Play-Coming%20Soon-brightgreen?logo=google-play)](https://play.google.com/store/apps)

---

## ✨ Preview

*(Screenshots coming soon)*

---

## 🚀 Features

### 🌡️ Complete and Accurate Weather
- Real-time GPS-based forecasts
- Current and feels-like temperature
- Humidity, atmospheric pressure
- Wind speed and direction
- Detailed hourly forecasts
- 5-day forecasts
- Automatic updates every 30 minutes

### 🔔 Smart and Customizable Alerts
- Extreme weather notifications (heatwave, cold, storms, high winds)
- Sudden temperature change alerts (>5°C)
- Hourly forecasts for imminent rain/snow/storms
- Daily weather at 8:00 AM
- Anti-spam system with cooldowns (2h for changes, 6h for alerts)

### 🌍 Real-Time Air Quality
- Real-time AQI index (scale 1-5)
- Pollutant details (PM2.5, PM10, NO2, O3, SO2, CO)
- Personalized health advice based on quality
- Automatic updates

### 💡 Daily Personalized Advice
- Clothing recommendations based on weather
- Adapted activity suggestions
- Health advice based on air quality

### 📱 Elegant Android Widget
- Weather widget on home screen
- Modern and clean design
- Automatic updates every 30 minutes
- Display: temperature, humidity, wind, conditions

### 🎨 Modern and Fluid Interface
- Elegant design with blue/cyan gradients
- Smooth animations (flutter_animate)
- Animated weather icons
- Integrated dark mode
- Intuitive navigation

### 🏙️ Multi-City Management
- Add multiple favorite cities
- Quickly switch between your locations
- Forecasts for all your saved cities

### ⚙️ Customizable Settings
- Enable/disable notifications
- Configure alerts according to your needs
- Manage widget and updates
- Reset your data
- Access privacy policy

### 🔒 Complete Privacy Respect
- No data sent to our servers
- 100% local storage (SharedPreferences)
- No ads, no trackers
- Secure communications (HTTPS)
- GDPR and CCPA compliant
- Data deletion at any time

---

## 📂 Project Structure

```
lib/
├── main.dart                              : Application entry point
│
├── core/                                  : Reusable base code
│   ├── constants/
│   │   └── constants.dart                 : Global constants (colors, API key)
│   └── config/
│       └── app_initializer.dart           : App initialization and routing
│
├── features/                              : Features by domain
│   ├── home/                              : Weather home page
│   │   ├── pages/
│   │   │   └── home_page.dart             : Main screen with current weather
│   │   └── widgets/
│   │       └── weather_item.dart          : Reusable weather item widget
│   │
│   ├── weather/                           : Weather details
│   │   └── pages/
│   │       └── detail_page.dart           : Detailed hourly forecasts page
│   │
│   ├── settings/                          : Settings and configuration
│   │   └── pages/
│   │       ├── settings_page.dart         : Settings and notifications page
│   │       └── privacy_policy_page.dart   : Privacy policy
│   │
│   ├── advice/                            : Personalized advice
│   │   └── pages/
│   │       └── advice_page.dart           : Weather advice + air quality
│   │
│   └── onboarding/                        : First-time use
│       └── pages/
│           ├── get_started_page.dart      : Startup screen with animated logo
│           ├── welcome_page.dart          : Favorite city selection
│           └── user_onboarding_page.dart  : User onboarding
│
└── shared/                                : Shared resources
    ├── models/
    │   └── city.dart                      : City data model (2600+ cities)
    │
    ├── services/                          : Business services
    │   ├── notification_service.dart      : Push notifications management
    │   ├── background_service.dart        : Background service (updates)
    │   ├── weather_widget_service.dart    : Native Android widget service
    │   ├── user_service.dart              : User management and preferences
    │   ├── location_service.dart          : GPS geolocation
    │   ├── air_quality_service.dart       : Air quality API
    │   ├── clothing_advice_service.dart   : Smart clothing recommendations
    │   └── daily_advice_service.dart      : Daily advice service
    │
    └── widgets/                           : Shared widgets
        └── app_logo.dart                  : Reusable animated logo

assets/
├── Logo.png                               : Main HordricWeather logo
├── clear.png, clouds.png, rain.png...     : Weather condition icons
└── [other assets]                         : UI icons (humidity, wind, etc.)

android/
├── app/
│   ├── build.gradle                       : Android build configuration
│   ├── upload-keystore.jks                : Play Store signing key
│   └── src/main/res/
│       ├── layout/                        : Android widget layouts
│       ├── xml/                           : Widget configuration
│       └── mipmap-*/                      : Launcher icons (hdpi to xxxhdpi)
└── key.properties                         : Keystore properties (not versioned)
```

### 🏗️ Architecture

HordricWeather follows the **Feature-First** architecture recommended by Flutter:

- **`core/`**: Global configuration and constants
- **`features/`**: Features organized by business domain (home, weather, settings, etc.)
- **`shared/`**: Reusable code (models, services, common widgets)

This structure facilitates:
- 📦 Project scalability
- 🧪 Unit and integration testing
- 👥 Team collaboration
- 🔄 Maintenance and evolution

---

## 🛠️ Installation and Build

### 🏗️ Prerequisites

- Flutter : 3.32.8 or higher
- Dart : 3.8.1 or higher
- IDE: A configured code editor like VS Code with the Flutter extension or Android Studio
- Git: For cloning the repository.
- Android SDK 34 or higher
- OpenWeather API account (free): [https://openweathermap.org/api](https://openweathermap.org/api)



### ⚙️ Environment Setup
If you are new to Flutter, follow the official documentation to install the SDK on your operating system:

Install Flutter on Windows - https://docs.flutter.dev/get-started

Install Flutter on macOS - https://docs.flutter.dev/get-started

Install Flutter on Linux - https://docs.flutter.dev/get-started

After installation, run flutter doctor in your terminal to verify that your environment is ready. Address any issues it reports.

### 📥Project Installation

#### 1. Clone the Repository
```bash
git clone https://github.com/HordRicJr/HordricWeather.git
cd HordricWeather
```

### 2: Configure your IDE
Open the cloned HordricWeather folder in VS Code or Android Studio. Your IDE should automatically detect it as a Flutter project.

#### 3. Install Dependencies
```bash
flutter pub get
```

#### 4. Configure OpenWeather API
The project already uses a configured OpenWeather API key. If you want to use your own key:

1. Create an account on [OpenWeather](https://openweathermap.org/api)
2. Get your free API key
3. Replace the key in `lib/core/constants/constants.dart`:
```dart
// lib/core/constants/constants.dart
class Constants {
  static const String apiKey = 'YOUR_API_KEY'; // <-- Paste your key here
  // ... other constants
}
```

#### 5. Generate Launcher Icons
```bash
dart run flutter_launcher_icons
```

#### 6. Run the Application

**Debug Mode**
```bash
flutter run
```

**Release Mode (APK)**
```bash
flutter build apk --release
```

**Release Mode (AAB for Play Store)**
```bash
flutter build appbundle --release
```

---

### 🤖 Troubleshooting Common Errors

# Error: flutter command not found

Solution: Ensure the Flutter SDK's bin directory is in your system's PATH variable. Re-run flutter doctor to confirm.

# Error: Android license status unknown

Solution: Run flutter doctor --android-licenses and accept all the licenses.

# Error: Gradle task assembleDebug failed with exit code 1

Solution: This can have many causes. Try these steps:

Run flutter clean to remove old build files.

Ensure your Java Development Kit (JDK) version is compatible. This project is configured for Java 17.

Check for network issues that might prevent Gradle from downloading dependencies.

## App runs but shows an error/no data

Solution: Double-check that your OpenWeather API key is correct and active. A new key can take some time to become active.

## 📦 Main Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.2                          # API requests
  intl: ^0.20.1                         # Internationalization and dates
  flutter_local_notifications: ^17.2.3  # Local notifications
  permission_handler: ^11.3.1           # Permissions management
  geolocator: ^13.0.1                   # Geolocation
  flutter_animate: ^4.5.0               # Animations
  home_widget: ^0.6.0                   # Android widget
  shared_preferences: ^2.3.2            # Local storage
  url_launcher: ^6.3.1                  # Link opening
  flutter_launcher_icons: ^0.14.2       # Icon generation
```

---

## 🌐 API Used

**OpenWeather API**: [https://openweathermap.org/](https://openweathermap.org/)

Endpoints used:
- `/data/2.5/weather`: Current weather
- `/data/2.5/forecast`: Hourly forecasts (5 days)
- `/data/2.5/air_pollution`: Air quality

---

## 🔐 Android Permissions

```xml
<!-- Permissions in AndroidManifest.xml -->
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
<uses-permission android:name="android.permission.WAKE_LOCK" />
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED" />
```

---

## 🏗️ Architecture Details

### Services
- **NotificationService**: Notification management (alerts, daily, lockscreen)
- **BackgroundService**: Automatic background updates (30 min)
- **WeatherWidgetService**: Android widget updates
- **UserService**: User data management
- **AirQualityService**: Air quality calculation and advice
- **ClothingAdviceService**: Clothing recommendations

### Smart Notification System
- **2h Cooldown**: Weather changes and temperature >5°C
- **6h Cooldown**: Extreme weather alerts (heatwave, cold, storms, winds)
- **Anti-duplicate**: Hourly forecasts (storage by hour)
- **Automatic cleanup**: Deletion of old notification flags

### Local Storage (SharedPreferences)
- `background_weather_data`: Current weather cache
- `last_weather_change_notification`: Last change notification timestamp
- `last_alert_notification_{type}`: Alert timestamps by type
- `hourly_notified_{HH:mm}`: Notified hourly forecast flags
- `notifications_enabled`: Global notification state
- `widget_enabled`: Widget state
- Favorite cities, username, preferences

---

## 📚 Documentation

- **[Privacy Policy](https://hordricjr.github.io/HordricWeather/)**: Web version hosted on GitHub Pages
- **CONTRIBUTING.md**: Contribution guide
- **LICENSE**: MIT License

---

## 🧪 Testing

### Run Unit Tests
```bash
flutter test
```

### Code Analysis
```bash
flutter analyze
```

### Cleanup
```bash
flutter clean
```

---

## 👨‍💻 Author

**HordRicJr**
- GitHub: [https://github.com/HordRicJr](https://github.com/HordRicJr)
- Email: assounrodrigue5@gmail.com

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 🤝 Contributing

Contributions are welcome! Feel free to:

1. **Fork the project** and add a star ⭐
2. **Create a branch** for your feature
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. **Commit your changes**
   ```bash
   git commit -m 'Add some AmazingFeature'
   ```
4. **Push to the branch**
   ```bash
   git push origin feature/AmazingFeature
   ```
5. **Open a Pull Request**

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details.

---

## 💬 Support

For any questions or issues:
- Open an [issue](https://github.com/HordRicJr/HordricWeather/issues)
- Check the [documentation](https://hordricjr.github.io/HordricWeather/)
- Email: assounrodrigue5@gmail.com

---

## 👥 Contributors ✨

Thanks to these wonderful people who contributed to this project ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%">
        <a href="https://github.com/HordRicJr">
          <img src="https://avatars.githubusercontent.com/HordRicJr?s=100" width="100px;" alt="HordRicJr"/>
          <br />
          <sub><b>ASSOUN Rodrigue</b></sub>
        </a>
        <br />
        <a href="https://github.com/HordRicJr/HordricWeather/commits?author=HordRicJr" title="Code"></a>
        <a href="#design-HordRicJr" title="Design"></a>
        <a href="https://github.com/HordRicJr/HordricWeather/commits?author=HordRicJr" title="Documentation"></a>
        <a href="#maintenance-HordRicJr" title="Maintenance"></a>
      </td>
      <td align="center" valign="top" width="14.28%">
        <a href="https://github.com/apps/dependabot">
          <img src="https://avatars.githubusercontent.com/in/29110?s=100&v=4" width="100px;" alt="Dependabot"/>
          <br />
          <sub><b>Dependabot</b></sub>
        </a>
        <br />
        <a href="#maintenance-dependabot" title="Maintenance"></a>
        <a href="#security-dependabot" title="Security"></a>
      </td>
      <td align="center" valign="top" width="14.28%">
        <a href="https://github.com/features/copilot">
          <img src="https://avatars.githubusercontent.com/in/44036?s=100&v=4" width="100px;" alt="GitHub Copilot"/>
          <br />
          <sub><b>GitHub Copilot</b></sub>
        </a>
        <br />
        <a href="https://github.com/HordRicJr/HordricWeather/commits?author=copilot" title="Code">💻</a>
        <a href="#ideas-copilot" title="Ideas"></a>
        <a href="#tool-copilot" title="Tools"></a>
      </td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

Ce projet suit la spécification [all-contributors](https://github.com/all-contributors/all-contributors). Les contributions de toute nature sont les bienvenues !

---

## �🙏 Remerciements

- **OpenWeather** : Pour l'API météo gratuite
- **Flutter Team** : Pour le framework incroyable
- **Communauté Flutter** : Pour les packages open-source
- **Hacktoberfest** : Pour encourager les contributions open-source
- **GitHub Actions** : Pour l'automatisation CI/CD

---

## 📝 Changelog

### Version 1.0.0 (October 8, 2025)
- ✨ First public release
- 🌤️ Complete weather with hourly and 5-day forecasts
- 🔔 Smart notification system with cooldowns
- 🌍 Air quality and health advice
- 📱 Customizable Android widget
- 🔒 Complete privacy policy (GDPR/CCPA)
- 🎨 Modern interface with animations
- 💡 Clothing and activity advice
- 🏙️ Multi-city management
- 🚫 No ads, privacy-respecting
- 🤖 CI/CD with GitHub Actions
- 🛡️ Dependabot enabled for automatic updates

---

<div align="center">

**HordricWeather** - Your smart weather companion 🌤️

Made with ❤️ by [HordRicJr](https://github.com/HordRicJr) and the community

[![GitHub stars](https://img.shields.io/github/stars/HordRicJr/HordricWeather?style=social)](https://github.com/HordRicJr/HordricWeather/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/HordRicJr/HordricWeather?style=social)](https://github.com/HordRicJr/HordricWeather/network/members)
[![GitHub watchers](https://img.shields.io/github/watchers/HordRicJr/HordricWeather?style=social)](https://github.com/HordRicJr/HordricWeather/watchers)

[![Star this repo](https://img.shields.io/github/stars/HordRicJr/HordricWeather?style=social)](https://github.com/HordRicJr/HordricWeather)

</div>

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  // Default color (you can change this)
  Color _primaryColor = const Color(0xFF4A90E2);

  Color get primaryColor => _primaryColor;

  ThemeProvider() {
    _loadThemeColor();
  }

  /// Load saved theme color from SharedPreferences
  Future<void> _loadThemeColor() async {
    final prefs = await SharedPreferences.getInstance();
    final colorValue = prefs.getInt('theme_color');
    if (colorValue != null) {
      _primaryColor = Color(colorValue);
      notifyListeners();
    }
  }

  /// Set new theme color and notify listeners
  Future<void> setThemeColor(Color color) async {
    _primaryColor = color;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_color', color.value);
  }

  /// Define a MaterialColor from the selected primary color
  MaterialColor get materialColor {
    return MaterialColor(_primaryColor.value, {
      50: _primaryColor.withOpacity(.1),
      100: _primaryColor.withOpacity(.2),
      200: _primaryColor.withOpacity(.3),
      300: _primaryColor.withOpacity(.4),
      400: _primaryColor.withOpacity(.5),
      500: _primaryColor.withOpacity(.6),
      600: _primaryColor.withOpacity(.7),
      700: _primaryColor.withOpacity(.8),
      800: _primaryColor.withOpacity(.9),
      900: _primaryColor.withOpacity(1),
    });
  }
}

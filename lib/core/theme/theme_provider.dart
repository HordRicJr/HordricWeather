import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provides the current theme color and allows user to change it.
class ThemeProvider extends ChangeNotifier {
  static const _key = 'selected_theme_color';
  Color _primaryColor = Colors.blue;

  ThemeProvider() {
    _loadTheme();
  }

  Color get primaryColor => _primaryColor;

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final colorValue = prefs.getInt(_key);
    if (colorValue != null) {
      _primaryColor = Color(colorValue);
      notifyListeners();
    }
  }

  Future<void> setTheme(Color color) async {
    _primaryColor = color;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, color.value);
  }
}

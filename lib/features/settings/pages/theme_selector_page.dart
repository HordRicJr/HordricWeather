import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/theme_provider.dart';

class ThemeSelectorPage extends StatelessWidget {
  const ThemeSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Color selectedColor = themeProvider.primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose App Theme'),
        backgroundColor: selectedColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Pick your favorite color:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ColorPicker(
              color: selectedColor,
              onColorChanged: (Color color) {
                selectedColor = color;
              },
              pickersEnabled: const <ColorPickerType, bool>{
                ColorPickerType.primary: true,
                ColorPickerType.accent: true,
                ColorPickerType.custom: false,
              },
              enableShadesSelection: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                themeProvider.setTheme(selectedColor);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedColor,
              ),
              child: const Text(
                'Apply Theme',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

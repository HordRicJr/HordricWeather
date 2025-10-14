import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/theme_provider.dart';
import '../../../core/theme/app_theme.dart';

class ThemeSelectorPage extends StatefulWidget {
  const ThemeSelectorPage({super.key});

  @override
  State<ThemeSelectorPage> createState() => _ThemeSelectorPageState();
}

class _ThemeSelectorPageState extends State<ThemeSelectorPage> {
  late Color selectedColor;

  @override
  void initState() {
    super.initState();
    selectedColor =
        Provider.of<ThemeProvider>(context, listen: false).primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select App Theme'),
        backgroundColor: themeProvider.primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.dynamicGradient(themeProvider.primaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ColorPicker(
                color: selectedColor,
                onColorChanged: (Color color) {
                  setState(() => selectedColor = color);
                },
                pickersEnabled: const <ColorPickerType, bool>{
                  ColorPickerType.wheel: true,
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  await themeProvider.setThemeColor(selectedColor);
                  if (context.mounted) Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeProvider.primaryColor,
                  foregroundColor: AppTheme.textOnPrimary,
                ),
                child: const Text('Apply Theme'),
              ),
              const SizedBox(height: 24),
              const Text(
                'Presets:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                children: [
                  _presetColor(Colors.blue, themeProvider),
                  _presetColor(Colors.green, themeProvider),
                  _presetColor(Colors.red, themeProvider),
                  _presetColor(Colors.purple, themeProvider),
                  _presetColor(Colors.orange, themeProvider),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _presetColor(Color color, ThemeProvider provider) {
    return GestureDetector(
      onTap: () async {
        await provider.setThemeColor(color);
        if (context.mounted) Navigator.pop(context);
      },
      child: CircleAvatar(
        backgroundColor: color,
        radius: 22,
        child: const Icon(Icons.check, color: Colors.white),
      ),
    );
  }
}

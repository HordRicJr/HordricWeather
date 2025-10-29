import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'features/home/pages/home_page.dart';

// Responsive helper - make sure you created lib/utils/responsive.dart
// Responsive helper - make sure you created lib/utils/responsive.dart
import 'package:hordricweather/utils/responsive.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HordricWeather',
      theme: AppTheme.buildTheme(themeProvider.primaryColor),
      builder: (context, child) {
        // Apply small responsive adjustments at the app root:
        // scale text slightly on larger breakpoints so tablet looks better.
        final screenSize = Responsive.getSize(context);
        double textScale = 1.0;
        switch (screenSize) {
          case ScreenSize.mobile:
            textScale = 1.0;
            break;
          case ScreenSize.tabletPortrait:
            textScale = 1.05;
            break;
          case ScreenSize.tabletLandscape:
            textScale = 1.12;
            break;
          case ScreenSize.desktop:
            textScale = 1.18;
            break;
        }
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: textScale),
          child: child ?? const SizedBox.shrink(),
        );
      },
      // Keep using your existing Home widget.
      home: const Home(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pv_smart_click/features/presentation/pages/calc_page.dart';
import 'package:pv_smart_click/features/presentation/pages/login_page.dart';
import 'package:pv_smart_click/config/theme/app_themes.dart';
import 'package:pv_smart_click/features/presentation/pages/registration_page.dart';
import 'package:pv_smart_click/features/presentation/pages/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => CalculatorPage(),
        '/login': (context) => LoginPage(),
        '/registration': (context) => RegistrationPage(),
        '/result': (context) => ResultPage(),
      },
    );
  }
}

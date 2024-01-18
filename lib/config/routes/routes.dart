import 'package:flutter/material.dart';

import '../../features/presentation/pages/calc_page.dart';
import '../../features/presentation/pages/login_page.dart';
import '../../features/presentation/pages/registration_page.dart';
import '../../features/presentation/pages/result.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return _materialRoute(CalculatorPage());

      case '/login':
        return _materialRoute(LoginPage());

      case '/registration':
        return _materialRoute(RegistrationPage());

      case '/result':
        return _materialRoute(ResultPage());

      default:
        return _materialRoute(CalculatorPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}

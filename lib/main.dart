import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pv_smart_click/features/presentation/pages/login_page.dart';
import 'package:pv_smart_click/config/theme/app_themes.dart';
import 'features/data/repository/auth_token_provider.dart';
import 'injection_container.dart';
import 'package:pv_smart_click/features/presentation/bloc/login_bloc.dart';
import 'package:pv_smart_click/config/routes/routes.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(
    ChangeNotifierProvider( // Add the ChangeNotifierProvider here
      create: (context) => AuthTokenProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => sl()..add(const PostLogin()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: LoginPage()
      ),
    );
    /*
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: SplashScreen(),
      routes: {
        '/home': (context) => CalculatorPage(),
        '/login': (context) => LoginPage(),
        '/registration': (context) => RegistrationPage(),
        '/result': (context) => ResultPage(),
      },
    );
    */
  }
}
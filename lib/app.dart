import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';


/// This is the main application widget.
/// It sends us straight to the login screen and then the home screen.
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  static const String title = "Selfie Stand App";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: const HomeScreen(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const LoginScreen(),
      fullscreenDialog: true,
    );
  }
}


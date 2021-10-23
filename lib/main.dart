import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'authentication/login.dart';


/// Left off at 18:00 - Enabling user sign in with Firebase auth.
/// https://firebase.flutter.dev/docs/overview








/// This function starts the entire app.
/// It runs MainApp().
void main() {
  runApp(const MainApp());
}


/// The function runs the app from the first page.
/// It first routes to the login screen and then routes to the home screen.
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Selfie Stand App",
      home: HomeScreen(),
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

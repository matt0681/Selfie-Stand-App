import 'package:app_development/screens/wrapper.dart';
import 'package:flutter/material.dart';


/// This function starts the entire app.
/// It runs MainApp().
void main() {
  runApp(const MainApp());
}


/// The function runs the app from the first page.
/// It runs the wrapper first.
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      title: "Selfie Stand App",

      home: Wrapper(),

    );
  }
}


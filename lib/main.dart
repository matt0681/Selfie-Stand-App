import 'dart:ffi';
import 'package:flutter/material.dart';  // Imports Dart.


/// This function runs the entire app.
void main() {
  runApp(const MaterialApp(
    // Uses our home screen defined below
    home: Home(),
  ));
}

/// This is the main application widget.
/// It sends us straight to the Home screen.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String title = "Selfie Stand App";

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: title,
      home: Home(),
    );
  }
}

/// Represents all content shown on the Home screen.
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

/// Represents the state of the Home screen.
class HomeState extends State<Home> {
  // The current / starting page.
  int selectedIndex = 1;

  // List of navigation bar widgets
  static const List<Widget> widgetOptions = <Widget>[
    Selfies_Widget(),
    Map_Widget(),
    Friends_Widget(),
    Account_Widget(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // The Scaffold is a structural/organizational widget which holds other components.
    return Scaffold(

      // This code displays something on the screen, based on what item is pressed at the navigation bar.
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),

      // The bar along the bottom of the app with buttons on it.
      bottomNavigationBar: BottomNavigationBar(
        // Various settings which apply to look/feel.
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.cyan[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        // What to do when an item is pressed in the bar.
        onTap: onItemTapped,
        currentIndex: selectedIndex,
        // The items contained in the bar.
        items: const [
          BottomNavigationBarItem(
            label: "Selfies",
            icon: Icon(Icons.photo_library),
          ),
          BottomNavigationBarItem(
            label: "Map",
            icon: Icon(Icons.explore),
          ),
          BottomNavigationBarItem(
            label: "Friends",
            icon: Icon(Icons.people),
          ),
          BottomNavigationBarItem(
            label: "Account",
            icon: Icon(Icons.account_circle),
          ),
        ],  // items
      )
    );
  }
}



/// Represents all content shown on the Account screen.
class Selfies_Widget extends StatelessWidget {
  const Selfies_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Selfies"),
      ),
    );
  }
}



/// Represents all content shown on the Account screen.
class Map_Widget extends StatelessWidget {
  const Map_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Map"),
      ),
    );
  }
}



/// Represents all content shown on the Account screen.
class Friends_Widget extends StatelessWidget {
  const Friends_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Friends"),
      ),
    );
  }
}



/// Represents all content shown on the Account screen.
class Account_Widget extends StatelessWidget {
  const Account_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}


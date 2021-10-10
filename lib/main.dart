import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';  // Imports Dart.


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
    SelfiesWidget(),
    MapWidget(),
    FriendsWidget(),
    AccountWidget(),
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
class SelfiesWidget extends StatelessWidget {
  const SelfiesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color for the app.
      backgroundColor: Colors.cyan[100],

      // The grid structure holding the cards.
      body: GridView.count(
        crossAxisCount: 2, // How many items across
        padding: const EdgeInsets.all(16.0), // space around the 4 sides of the cards
        childAspectRatio: 8.0 / 9.0, // size of cards based on aspect ratio
        // List of selfie cards.
        children: <Widget>[
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: Image(image: AssetImage('assets/images/ramen_bowl.png')),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text("Place Name"),
                      SizedBox(height: 8.0),
                      Text("See Location"),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



/// Represents all content shown on the Account screen.
class MapWidget extends StatelessWidget {
  const MapWidget({Key? key}) : super(key: key);

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
class FriendsWidget extends StatelessWidget {
  const FriendsWidget({Key? key}) : super(key: key);

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
class AccountWidget extends StatelessWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}


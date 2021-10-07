import 'dart:ffi';

import 'package:flutter/material.dart';  // Imports Dart.

/// This function runs the entire app.
void main() {
  runApp(const MaterialApp(
    // Uses our home screen defined below
    home: Home(),
  ));
}

/// Represents all content shown on the Home screen.
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // The Scaffold is a structural/organizational widget which holds other components.
    return Scaffold(
      // The App Bar widget appears at the top of the app
      appBar: AppBar(

        // Title property - text shown at the top
        title: const Text(
          "Home",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.white,
            fontFamily: 'HeptaSlab',
          ),
        ),

        // Describes the account button and settings button at the top right of the appbar.
        actions: <Widget>[
          // Button to go to the list of locations screen.
          IconButton(
            icon: const Icon(Icons.list),
            tooltip: 'Locations',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Locations(),
                ),
              ); // Navigator push
            },
          ),

          // Button to go to the settings screen.
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Settings(),
                ),
              ); // Navigator push
            }, // onPressed
          ),
        ],

        // The color of the appbar Background.
        backgroundColor: Colors.cyan[600],
      ),

      // Defines all content under the app bar.
      // The Center widget centers everything within it.
      body: const Center(
        // The Text widget contains a string and a styling widget.
        child: Text(
          "GPS MAP",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.black,
            fontFamily: 'HeptaSlab',

          ),
        ),
      ),

      backgroundColor: Colors.cyan[100],

      // Account Button Widget
      floatingActionButton: FloatingActionButton(
        // Action to perform on press
        onPressed: () {},

        // Styling
        backgroundColor:  Colors.cyan[400],


      ),
    );
  } // build
} // Home


/// Represents all content shown on the Settings screen.
class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // The Scaffold is a structural/organizational widget which holds other components.
    return Scaffold(
      // The App Bar widget appears at the top of the app
      appBar: AppBar(

        // Title property - text shown at the top
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.white,
            fontFamily: 'HeptaSlab',
          ),
        ),

        // The color of the appbar Background.
        backgroundColor: Colors.cyan[600],
      ),

      // Defines all content under the app bar.
      // The Center widget centers everything within it.
      body: const Center(
        // The Text widget contains a string and a styling widget.
        child: Text(
          "Settings go here",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.black,
            fontFamily: 'HeptaSlab',
          ),
        ),
      ),

      backgroundColor: Colors.cyan[100],
    );
  } // build
} // Home


/// Represents all content shown on the Settings screen.
class Locations extends StatelessWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // The Scaffold is a structural/organizational widget which holds other components.
    return Scaffold(
      // The App Bar widget appears at the top of the app
      appBar: AppBar(

        // Title property - text shown at the top
        title: const Text(
          "Your Locations",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.white,
            fontFamily: 'HeptaSlab',
          ),
        ),

        // The color of the appbar Background.
        backgroundColor: Colors.cyan[600],
      ),

      // Defines all content under the app bar.
      // The Center widget centers everything within it.
      body: const Center(
        // The Text widget contains a string and a styling widget.
        child: Text(
          "List of your locations/ pictures",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.black,
            fontFamily: 'HeptaSlab',
          ),
        ),
      ),

      backgroundColor: Colors.cyan[100],
    );
  } // build
} // Home
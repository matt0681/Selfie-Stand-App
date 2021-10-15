import 'package:flutter/material.dart';

class SelfiesScreen extends StatelessWidget {
  const SelfiesScreen({Key? key}) : super(key: key);

  // This function will create a collection of cards that contain selfies.
  // The underscore means it is a private function.
  List<Card> _buildGridCards(int count) {
    List<Card> cards = List.generate(
      count,
          (int index) => Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.asset('assets/images/ramen_bowl.png'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
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
      ),
    );
    return cards;
  }

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
        children: _buildGridCards(10),
      ),
    );
  }
}


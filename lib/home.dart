import 'package:flutter/material.dart';


/// Represents all content shown on the Home screen.
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// The Stateful class for the Home Screen.
class _HomeScreenState extends State<HomeScreen> {

  // The current / starting page.
  int _selectedIndex = 1;

  // List of navigation bar widgets
  static const List<Widget> widgetOptions = <Widget>[
    SelfiesWidget(),
    MapWidget(),
    FriendsWidget(),
    AccountWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // The Scaffold is a structural/organizational widget which holds other components.
    return Scaffold(

      // This code displays something on the screen, based on what item is pressed at the navigation bar.
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
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
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
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


/// Represents all content shown on the Selfies page.
class SelfiesWidget extends StatelessWidget {
  const SelfiesWidget({Key? key}) : super(key: key);

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



/// Represents all content shown on the Map page.
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



/// Represents all content shown on the Friends page.
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



/// Represents all content shown on the Account page.
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

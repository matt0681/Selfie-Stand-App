import 'package:app_development/explore.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Floating Action Button
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Explore"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ExploreScreen()),
          );
        },
        icon: Icon(Icons.explore),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}


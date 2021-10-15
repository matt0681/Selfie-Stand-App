import 'package:flutter/material.dart';
import 'account.dart';
import 'friends.dart';
import 'map.dart';
import 'selfies.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 1);

    return Scaffold(
      // Account Button.
      floatingActionButton: ElevatedButton(
        onPressed: () {
          const AccountScreen();
        },
        child: const Icon(Icons.manage_accounts),
      ),

      // Swipe left or right to access different pages.
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: const [
          SelfiesScreen(),
          MapScreen(),
          FriendsScreen(),
        ],
      ),
    );
  }
}


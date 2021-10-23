import 'package:app_development/authentication/authentication.dart';
import 'package:app_development/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'account.dart';
import 'friends.dart';
import 'map.dart';
import 'selfies.dart';


/// The home screen manages all the different pages.
/// It controls the ability to swipe left and right to move between pages and
/// also contains the account button.
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sets the page to start the app on, here this is the map page.
    final PageController controller = PageController(initialPage: 1);

    return Scaffold(

      /// Floating Action Button
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AccountScreen()),
          );
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
          shape: MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
        ),
        child: const Icon(Icons.manage_accounts),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,

      // Swipe left or right to access different pages.
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget>[
          SelfiesScreen(),
          MapScreen(),
          FriendsScreen(),

          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
        ],
      ),
    );
  }
}


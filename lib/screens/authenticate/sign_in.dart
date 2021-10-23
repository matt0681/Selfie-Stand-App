import 'package:app_development/services/auth.dart';
import 'package:flutter/material.dart';


/// This widget handles signing in.
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

/// The widget creates the UI of the sign in screen.
/// It gives options for signing in with an account or anonymously.
class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.cyan[100],

      appBar: AppBar(
        backgroundColor: Colors.cyan[400],
        elevation: 0.0,
        title: Text('Sign in to SelfieStand'),
      ),

      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),

        // Click this button to sign in anonymously. It uses the auth.dart service
        // to create a guest account.
        child: RaisedButton(
          child: Text('Sign in Anonymously'),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if (result == null) {
              print('error signing in');
            } else {
              print('signed in');
              print(result);
            }
          },
        ),
      ),
    );
  }
}
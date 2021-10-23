import 'package:app_development/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';


/// This screen is where users either login or sign up for an account.
class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}


/// This routes the app to a sign in screen.
class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignIn(),
    );
  }
}



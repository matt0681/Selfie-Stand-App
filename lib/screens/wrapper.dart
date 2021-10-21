import 'package:flutter/material.dart';
import 'authenticate/authenticate.dart';


/// The Wrapper class decides whether to take the user directly to the home
/// screen or whether to make then login or create an account for authentication.
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /// Immediately routes the user to the login page.
    return Authenticate();
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/// This is the login screen widget.
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
  
  // @override
  // _LoginScreenState createState() => _LoginScreenState();
}

/// This class builds the layout of the login screen.
class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[

            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/images/ramen_bowl.png'),
                const SizedBox(height: 16.0),
                const Text('SELFIE STAND APP'),
              ],
            ),

            const SizedBox(height: 120.0),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),

            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),

            ButtonBar(
              children: <Widget>[
                TextButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),

                ElevatedButton(
                  child: const Text('NEXT'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


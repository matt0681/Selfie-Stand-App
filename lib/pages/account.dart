import 'package:flutter/material.dart';


class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Settings + Account"),
        titleSpacing: 06.0,
        centerTitle: true,
        toolbarHeight: 60,
        elevation: 0.00,
        backgroundColor: Colors.blue,

        leading: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ///...///
          },
          child: const Text("Sign out"),
        ),
      ),
    );
  }
}


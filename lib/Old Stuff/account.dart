import 'package:flutter/material.dart';
import 'homeOld.dart';


class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text("Settings!"),

        leading: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),

        // flexibleSpace: Container(
        //
        // ),

      ),
    );
  }
}


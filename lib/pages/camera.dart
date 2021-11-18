import 'package:app_development/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'map.dart';


class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}


class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if(!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    (controller != null) ? controller.dispose() : null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(!controller.value.isInitialized) {
      return Container();
    }

    return Scaffold(

      body: Align(
        alignment: Alignment.center,
        child: CameraPreview(controller),
      ),

      /// Floating Action Button
      floatingActionButton: Stack (
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:30, top: 50),
            child: Align(
              alignment: Alignment.topLeft,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                  shape: MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
                ),
                child: const Icon(Icons.arrow_back),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom:30, left: 35),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {

                  // TAKE PICTURE CODE HERE

                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(17)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                  shape: MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
                ),
                child: const Icon(Icons.photo_camera),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


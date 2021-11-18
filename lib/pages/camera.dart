import 'dart:async';
import 'dart:io';
import 'package:app_development/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


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

    controller = CameraController(
        cameras[0],
        ResolutionPreset.medium);

    controller.initialize().then((_) {
      if(!mounted) {
        return;
      }

      setState(() {});
    });
  }

  @override
  void dispose() {
    // (controller != null) ? controller.dispose() : null;
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    if(!controller.value.isInitialized) {
      return Container();
    }

    return Stack(
      children: <Widget>[


        AspectRatio(
          aspectRatio: deviceRatio,
          child: CameraPreview(controller),
        ),

        Stack(
          children: <Widget>[
            Positioned(
              top: 20,
              left: 8,
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

            Positioned(
              bottom: 20,
              left: size.width/2 - (34),
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final image = await controller.takePicture();

                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DisplayPictureScreen(
                          imagePath: image.path,
                        ),
                      ),
                    );

                  } catch (err) {
                    print(err);
                  }
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(17)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                  shape: MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
                ),
                child: const Icon(Icons.photo_camera),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}


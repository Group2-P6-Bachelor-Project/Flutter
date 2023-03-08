import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_application_1/OutputScreen.dart';
import 'package:flutter_application_1/InformationScreen.dart';
import 'package:flutter_application_1/styles.dart';
import 'package:flutter_application_1/PictureButton.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  @override
  void initState() {
    startCamera();
    super.initState();
  }

  void startCamera() async {
    cameras = await availableCameras();

    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {}); //Refreshes the widget
    }).catchError((e) {
      if (kDebugMode) {
        print(e);
      }
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return Scaffold(
          appBar: CustomAppBar(
              title: 'SortItOut',
              trailing: IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InformationScreen()),
                  );
                },
              )),
          body: Stack(
            children: [
              CameraPreview(cameraController),
              GestureDetector(
                onTap: () {
                  cameraController.takePicture().then((XFile? file) {
                    if (mounted) {
                      if (file != null) {
                        if (kDebugMode) {
                          print('Picture saved to ${file.path}');
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OutputScreen()),
                        );
                      }
                    }
                  });
                },
                // ignore: prefer_const_constructors
                child: PictureButton(
                    Icons.camera_alt_outlined, Alignment.bottomCenter),
              ),
            ],
          ));
    } else {
      return const SizedBox();
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:sort_it_out/OutputScreen/OutputScreen.dart';
import 'package:sort_it_out/InformationScreen/InformationScreen.dart';
import 'package:sort_it_out/styles.dart';
import 'package:sort_it_out/CameraScreen/PictureButton.dart';
import 'package:tflite/tflite.dart';
import 'dart:async';
import 'dart:io';
import 'loadingAnimationScreen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  Future<List>? futureRes;
  late List<CameraDescription> cameras;
  CameraController? cameraController;

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/hunded_epoch.tflite", labels: "assets/labels.txt");
  }

  late List _results;
  String _confidence = "";
  String _name = "";
  String numbers = '';

  @override
  void initState() {
    loadModel();
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

    await cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {}); // Refreshes the widget
    }).catchError((e) {
      if (kDebugMode) {
        print(e);
      }
    });
  }

  void takePictureAndUpdateResult() async {
    final image = await cameraController!.takePicture();
    if (mounted) {
      File newfile = File(image.path);
      final result = runModelOnImage(newfile);
      setState(() {
        futureRes = result;
      });
    }
  }

  Future<List> runModelOnImage(File path) async {
    var res = await Tflite.runModelOnImage(
      path: path.path,
      numResults: 7,
      threshold: 0.0,
      imageMean: 117.0,
      imageStd: 1.0,
    );

    print('name: ' + res!.first["index"].toString());
    print('result: $res');
    setState(() {
      _results = res;
    });

    return res;
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController?.value.isInitialized == true) {
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
          ),
        ),
        body: FutureBuilder<List>(
          future: futureRes,
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingAnimationScreen();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              var result = snapshot.data;
              if (result != null) {
                var prediction = result.first["index"];
                var confidence = result.first["confidence"];
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OutputScreen(
                            index: prediction, confidence: confidence)),
                    ((route) => false),
                  );
                });
                return const SizedBox
                    .shrink(); // Empty widget since we navigated away
              } else {
                return Stack(
                  children: [
                    CameraPreview(cameraController!),
                    GestureDetector(
                      onTap: takePictureAndUpdateResult,
                      child: const PictureButton(
                          Icons.camera_alt_outlined, Alignment.bottomCenter),
                    ),
                  ],
                );
              }
            }
          },
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}

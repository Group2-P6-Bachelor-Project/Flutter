import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_application_1/OutputScreen/OutputScreen.dart';
import 'package:flutter_application_1/InformationScreen/InformationScreen.dart';
import 'package:flutter_application_1/styles.dart';
import 'package:flutter_application_1/CameraScreen/PictureButton.dart';
import 'package:tflite/tflite.dart';
import 'dart:async';
import 'dart:io';
import '../MachineLearning/Model.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  //myModel _myModel = myModel();
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/converted_model.tflite", labels: "assets/labels.txt"
    );
  }

  late List _results;
  String _confidence = "";
  String _name = "";
  String numbers = '';

  @override
  void initState() {
    //_myModel.loadModel();
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

    runModelOnImage(File path) async {
    var res = await Tflite.runModelOnImage(
      path: path.path,
      numResults: 7,
      threshold: 0.05,
      imageMean: 0.0,
      imageStd: 255.0,
    );
    print('result: $res');
    setState((){
        _results = res!;
        String str = _results[0]["label"];
        _name = str.substring(7);
        _confidence = _results != null ? (_results[0]['confidence'] * 100.0).toString().substring(0,7) + "%" : "";
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
                  final image =
                      cameraController.takePicture().then((XFile? file) {
                    if (mounted) {
                      if (file != null) {
                        File newfile = File(file.path);
                        runModelOnImage(newfile);
                        print('Label: $_name\nConfidence: $_confidence');
                        if (kDebugMode) {
                          print('Picture saved to ${file.path}');
                        }
                        //_myModel.runModelOnImage(File(file.path));
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OutputScreen()),
                            ((route) => false));
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

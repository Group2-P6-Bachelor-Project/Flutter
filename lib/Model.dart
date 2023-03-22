import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as imglib;
import 'dart:io';

class myModel {
  late Interpreter _interpreter;

  Future<void> loadModel() async {
    try {
      final gpuDelegateV2 = GpuDelegateV2(
        options: GpuDelegateOptionsV2(
          isPrecisionLossAllowed: false,
          inferencePreference: TfLiteGpuInferenceUsage.fastSingleAnswer,
          inferencePriority1: TfLiteGpuInferencePriority.minLatency,
          inferencePriority2: TfLiteGpuInferencePriority.auto,
          inferencePriority3: TfLiteGpuInferencePriority.auto,
        ),
      );

      var interpreterOptions = InterpreterOptions()..addDelegate(gpuDelegateV2);
      _interpreter = await Interpreter.fromAsset(
          'assets/converted_model.tflite',
          options: interpreterOptions);
      print('Model loaded successfully');
    } catch (e) {
      print('Failed to load model: $e');
    }
  } // Add methods to preprocess input, run the model, and process output

  Future<void> runModelOnImage(File image) async {
    // Load the image
    imglib.Image inputImage = imglib.decodeImage(await image.readAsBytes())!;

    // Preprocess the image (resize, convert to grayscale, normalize, etc.)
    // based on your model's specific requirements
    // ...
    // Assuming the preprocessed image is stored in a variable called 'inputImage'
// and the image package is imported as 'imglib'

    int height = inputImage.height;
    int width = inputImage.width;
    int channels = 3;

    var input = inputImage
        .getBytes()
        .buffer
        .asFloat32List()
        .reshape([1, height, width, channels]);
    // Prepare input tensor
    // You need to reshape, convert the image to Float32List, etc., based on your model input requirements
    // ...
    int numClasses =
        6; // Replace this with the actual number of classes in your model
    var output = List<num>.filled(numClasses, 0).reshape([1, numClasses]);
    // Run the model
    _interpreter.run(input, output);
    
    // Find the highest confidence prediction and its index
    int highestConfidenceIndex = 0;
    double highestConfidence = output[0][0];
    for (int i = 1; i < numClasses; i++) {
      if (output[0][i] > highestConfidence) {
        highestConfidence = output[0][i];
        highestConfidenceIndex = i;
      }
    }

    // Print the result
    print(
        'Prediction: class $highestConfidenceIndex with confidence $highestConfidence');
    // Process the output and display results
    // ...
  }
}

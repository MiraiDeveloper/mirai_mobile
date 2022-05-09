import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import 'package:camera/camera.dart';

import 'camera_view.dart';
import 'painters/face_detector_painter.dart';

import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class MyProjectAR extends StatefulWidget {
  const MyProjectAR({Key? key}) : super(key: key);

  @override
  State<MyProjectAR> createState() => _MyProjectARState();
}

class _MyProjectARState extends State<MyProjectAR> {
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableClassification: true,
    ),
  );
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;

  @override
  void dispose() {
    _canProcess = false;
    _faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(
      //     Icons.adb,
      //     color: Colors.white,
      //   ),
      //   title: Text(
      //     'Coba" Buat Project AR',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   actions: <Widget>[
      //     IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
      //     IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app))
      //   ],
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //             colors: [Color(0xff0096ff), Color(0xff6610f2)],
      //             begin: FractionalOffset.topLeft,
      //             end: FractionalOffset.bottomRight),
      //         image: DecorationImage(
      //             image: AssetImage('images/pattern.png'),
      //             fit: BoxFit.none,
      //             repeat: ImageRepeat.repeat)),
      //   ),
      // ),
      // body: Center(
      //     child: SingleChildScrollView(
      //       child: Container(
      //           margin: const EdgeInsets.all(20),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               if (imageScanning) const CircularProgressIndicator(),
      //               if (!imageScanning && imageFile == null)
      //                 Container(
      //                   width: 300,
      //                   height: 300,
      //                   color: Colors.grey[300]!,
      //                 ),
      //               if (imageFile != null) Image.file(File(imageFile!.path)),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Container(
      //                       margin: const EdgeInsets.symmetric(horizontal: 5),
      //                       padding: const EdgeInsets.only(top: 10),
      //                       child: ElevatedButton(
      //                         style: ElevatedButton.styleFrom(
      //                           primary: Colors.white,
      //                           onPrimary: Colors.grey,
      //                           shadowColor: Colors.grey[400],
      //                           elevation: 10,
      //                           shape: RoundedRectangleBorder(
      //                               borderRadius: BorderRadius.circular(8.0)),
      //                         ),
      //                         onPressed: () {
      //                           getImage(ImageSource.gallery);
      //                         },
      //                         child: Container(
      //                           margin: const EdgeInsets.symmetric(
      //                               vertical: 5, horizontal: 5),
      //                           child: Column(
      //                             mainAxisSize: MainAxisSize.min,
      //                             children: [
      //                               Icon(
      //                                 Icons.image,
      //                                 size: 30,
      //                               ),
      //                               Text(
      //                                 "Gallery",
      //                                 style: TextStyle(
      //                                     fontSize: 13, color: Colors.grey[600]),
      //                               )
      //                             ],
      //                           ),
      //                         ),
      //                       )),
      //                   Container(
      //                       margin: const EdgeInsets.symmetric(horizontal: 5),
      //                       padding: const EdgeInsets.only(top: 10),
      //                       child: ElevatedButton(
      //                         style: ElevatedButton.styleFrom(
      //                           primary: Colors.white,
      //                           onPrimary: Colors.grey,
      //                           shadowColor: Colors.grey[400],
      //                           elevation: 10,
      //                           shape: RoundedRectangleBorder(
      //                               borderRadius: BorderRadius.circular(8.0)),
      //                         ),
      //                         onPressed: () {
      //                           getImage(ImageSource.camera);
      //                         },
      //                         child: Container(
      //                           margin: const EdgeInsets.symmetric(
      //                               vertical: 5, horizontal: 5),
      //                           child: Column(
      //                             mainAxisSize: MainAxisSize.min,
      //                             children: [
      //                               Icon(
      //                                 Icons.camera_alt,
      //                                 size: 30,
      //                               ),
      //                               Text(
      //                                 "Camera",
      //                                 style: TextStyle(
      //                                     fontSize: 13, color: Colors.grey[600]),
      //                               )
      //                             ],
      //                           ),
      //                         ),
      //                       )),
      //                 ],
      //               ),
      //               const SizedBox(
      //                 height: 20,
      //               ),
      //               Container(
      //                 child: Text(
      //                   scannedImage,
      //                   style: TextStyle(fontSize: 20),
      //                 ),
      //               )
      //             ],
      //           )),
      //     )),
      body: SafeArea(
        child: Container(
          child: CameraView(
            title: 'Face Detector',
            customPaint: _customPaint,
            text: _text,
            onImage: (inputImage) {
              processImage(inputImage);
            },
            initialDirection: CameraLensDirection.front,
          ),
        ),
      ),
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final faces = await _faceDetector.processImage(inputImage);
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final painter = FaceDetectorPainter(
          faces,
          inputImage.inputImageData!.size,
          inputImage.inputImageData!.imageRotation,
          Colors.pinkAccent
      );
      _customPaint = CustomPaint(painter: painter);
    } else {
      String text = 'Faces found: ${faces.length}\n\n';
      for (final face in faces) {
        text += 'face: ${face.boundingBox}\n\n';
      }
      _text = text;
      // TODO: set _customPaint to draw boundingRect on top of image
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}

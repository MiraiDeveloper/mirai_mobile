import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import 'coordinates_translator.dart';

class FaceDetectorPainter extends CustomPainter {
  FaceDetectorPainter(this.faces, this.absoluteImageSize, this.rotation, this.warna);

  final List<Face> faces;
  final Size absoluteImageSize;
  final InputImageRotation rotation;
  final Color warna;

  @override
  void paint(Canvas canvas, Size size) {
    int counter = 0;
    Point temp = Point(0, 0);

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = Colors.red;

    final Paint paintLineLips = Paint()
      // width 3.0, blur 3.0
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round
      ..color = warna
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2.5);

    final Paint paintLineEye = Paint()
      // width 2.0, blur 7.0
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..color = warna
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 8.0);

    final Paint paintLineEyeBrow = Paint()
      //width 2.0, blur 3.5
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..color = warna
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2.5);

    final Paint paintCircleCheek = Paint()
      //width 40, blur 10
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40.0
      ..color = warna
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 9.0);

    for (final Face face in faces) {
      canvas.drawRect(
        Rect.fromLTRB(
          translateX(face.boundingBox.left, rotation, size, absoluteImageSize, -2),
          translateY(face.boundingBox.top, rotation, size, absoluteImageSize, 0),
          translateX(face.boundingBox.right, rotation, size, absoluteImageSize, 2),
          translateY(
              face.boundingBox.bottom, rotation, size, absoluteImageSize, -3),
        ),
        paint,
      );

      void paintContour(FaceContourType type) {
        final faceContour = face.contours[type];
        if (faceContour?.points != null) {
          for (final Point point in faceContour!.points) {
            if (counter == 0) {
              temp = point;
              counter++;
            } else {
              if (type == FaceContourType.upperLipTop ||
                  type == FaceContourType.lowerLipBottom) {
                canvas.drawLine(
                    Offset(
                      translateX(
                          temp.x.toDouble(), rotation, size, absoluteImageSize, 1),
                      translateY(
                          temp.y.toDouble(), rotation, size, absoluteImageSize, -1.5),
                    ),
                    Offset(
                      translateX(point.x.toDouble(), rotation, size,
                          absoluteImageSize, 1),
                      translateY(point.y.toDouble(), rotation, size,
                          absoluteImageSize, -1.5),
                    ),
                    paintLineLips);
              } else if (type == FaceContourType.leftEye ||
                  type == FaceContourType.rightEye) {
                canvas.drawLine(
                    Offset(
                      translateX(
                          temp.x.toDouble(), rotation, size, absoluteImageSize, 1),
                      translateY(
                          temp.y.toDouble(), rotation, size, absoluteImageSize, 0),
                    ),
                    Offset(
                      translateX(point.x.toDouble(), rotation, size,
                          absoluteImageSize, 1),
                      translateY(point.y.toDouble(), rotation, size,
                          absoluteImageSize, 0),
                    ),
                    paintLineEye);
              } else if (type == FaceContourType.leftEyebrowTop ||
                  type == FaceContourType.rightEyebrowTop) {
                canvas.drawLine(
                    Offset(
                      translateX(
                          temp.x.toDouble(), rotation, size, absoluteImageSize, 1),
                      translateY(
                          temp.y.toDouble(), rotation, size, absoluteImageSize, 0),
                    ),
                    Offset(
                      translateX(point.x.toDouble(), rotation, size,
                          absoluteImageSize, 1),
                      translateY(point.y.toDouble(), rotation, size,
                          absoluteImageSize, 0),
                    ),
                    paintLineEyeBrow);
              }
              temp = point;
            }
            if (type == FaceContourType.leftCheek) {
              canvas.drawCircle(
                  Offset(
                    translateX(
                        point.x.toDouble(), rotation, size, absoluteImageSize, -1.5),
                    translateY(
                        point.y.toDouble(), rotation, size, absoluteImageSize, -1),
                  ),
                  1,
                  paintCircleCheek);
            } else if (type == FaceContourType.rightCheek) {
              canvas.drawCircle(
                  Offset(
                    translateX(
                        point.x.toDouble(), rotation, size, absoluteImageSize, 2),
                    translateY(
                        point.y.toDouble(), rotation, size, absoluteImageSize, -1),
                  ),
                  1,
                  paintCircleCheek);
            }
            // canvas.drawCircle(
            //     Offset(
            //       translateX(
            //           point.x.toDouble(), rotation, size, absoluteImageSize, 0),
            //       translateY(
            //           point.y.toDouble(), rotation, size, absoluteImageSize, 0),
            //     ),
            //     1,
            //     paint);
          }
          counter = 0;
        }
      }

      paintContour(FaceContourType.face);
      paintContour(FaceContourType.leftEyebrowTop);
      paintContour(FaceContourType.leftEyebrowBottom);
      paintContour(FaceContourType.rightEyebrowTop);
      paintContour(FaceContourType.rightEyebrowBottom);
      paintContour(FaceContourType.leftEye);
      paintContour(FaceContourType.rightEye);
      paintContour(FaceContourType.upperLipTop);
      paintContour(FaceContourType.upperLipBottom);
      paintContour(FaceContourType.lowerLipTop);
      paintContour(FaceContourType.lowerLipBottom);
      paintContour(FaceContourType.noseBridge);
      paintContour(FaceContourType.noseBottom);
      paintContour(FaceContourType.leftCheek);
      paintContour(FaceContourType.rightCheek);
    }
  }

  @override
  bool shouldRepaint(FaceDetectorPainter oldDelegate) {
    return oldDelegate.absoluteImageSize != absoluteImageSize ||
        oldDelegate.faces != faces;
  }
}

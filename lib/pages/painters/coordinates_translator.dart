import 'dart:io';
import 'dart:ui';

import 'package:google_mlkit_commons/google_mlkit_commons.dart';

double translateX(double x, InputImageRotation rotation, Size size,
    Size absoluteImageSize, double posisi) {
  switch (rotation) {
    case InputImageRotation.rotation90deg:
      return x *
          size.width /
          (Platform.isIOS ? absoluteImageSize.width : absoluteImageSize.height);
    case InputImageRotation.rotation270deg:
      return (size.width -
              x *
                  size.width /
                  (Platform.isIOS
                      ? absoluteImageSize.width
                      : absoluteImageSize.height)) -
          (absoluteImageSize.height * (posisi / 100));
    default:
      return x * size.width / absoluteImageSize.width;
  }
}

double translateY(double y, InputImageRotation rotation, Size size,
    Size absoluteImageSize, double posisi) {
  switch (rotation) {
    case InputImageRotation.rotation90deg:
    case InputImageRotation.rotation270deg:
      return (y *
              size.height /
              (Platform.isIOS
                  ? absoluteImageSize.height
                  : absoluteImageSize.width)) -
          (absoluteImageSize.width * (posisi / 100));
    default:
      return y * size.height / absoluteImageSize.height;
  }
}

import 'package:flutter/material.dart';

mixin ChevronBlunt {
  Path getChevronBluntPath(Size size) {
    final Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width * .5 / 4, size.height / 2);
    path.close();
    return path;
  }
}

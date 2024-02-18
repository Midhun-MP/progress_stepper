import 'package:flutter/material.dart';

class ChevronBluntClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width * .5 / 4, size.height / 2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(ChevronBluntClipper oldClipper) => this != oldClipper;
}

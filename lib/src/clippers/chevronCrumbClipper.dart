import 'package:flutter/material.dart';

class ChevronClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 3.5/4,0.0);
    path.lineTo(size.width, size.height/2);
    path.lineTo(size.width * 3.5/4, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width * .5/4, size.height/2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(ChevronClipper oldClipper) => this != oldClipper;
}
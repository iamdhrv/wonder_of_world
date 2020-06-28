import 'package:flutter/material.dart';

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 200);
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.45, size.height * 0.85, size.width, size.height * 0.5);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
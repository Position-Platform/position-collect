/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 14:35:29 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-09 14:46:44
 */
import 'package:flutter/material.dart';

class CircularClipper extends CustomClipper<Rect> {
  final Offset? center;
  final double fraction;

  CircularClipper(this.fraction, [this.center]);
  @override
  Rect getClip(Size size) {
    Rect rect = Rect.fromCircle(
        center: center ?? Offset(size.width / 2, size.height / 2),
        radius: size.height * fraction);
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

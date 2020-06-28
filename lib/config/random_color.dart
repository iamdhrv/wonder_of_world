import 'dart:math';

import 'package:flutter/material.dart';

class ColorGenerator {
  static Random random = Random();

  static Color get color => Color.fromARGB(
      255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
}
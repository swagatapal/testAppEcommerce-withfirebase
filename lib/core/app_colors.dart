import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _instance = AppColors._internal();

  factory AppColors() {
    return _instance;
  }

  AppColors._internal();

  //General
  static const Color primaryButtonColor = Color(0xFF00707E);
  static const Color courseContentBackgroundColor = Color(0xFFD9EFF2);

  static const Color white = Color(0xFFFFFFFF);
  static const Color circleBackground = Color(0xFFD9EFF2);
  static const Color colorSecondaryText2 = Color(0xFF7D7D7D);
  static const Color black = Color(0xFF000000);
  static const Color lightBackground = Color(0xFFD9EFF2);
}

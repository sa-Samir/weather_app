import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class Themes {
  static ThemeData get lightTheme => _lightTheme;

  static final ThemeData _lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
    ),
    scaffoldBackgroundColor: AppColors.bgGreyColor,
  );
}

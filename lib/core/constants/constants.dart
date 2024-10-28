import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class Constants {
  static const appName = 'Tokma Weather';

  static const envFile = '.env';

  static const padding = 16.0;
  static const tappableTextPadding = 5.0;

  static const borderRadius = 10.0;

  static const smallIconSize = 25.0;

  static const dialogWidthFactor = .85;

  static const sizedBoxSmall = SizedBox(
    height: 10,
  );

  static const sizedBoxMedium = SizedBox(
    height: 15,
  );

  static const sizedBoxLarge = SizedBox(
    height: 30,
  );

  static const sizedBoxSmallWidth = SizedBox(
    width: 10,
  );

  static const sizedBoxMediumWidth = SizedBox(
    width: 15,
  );

  static final systemOverlay = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarColor: AppColors.primaryColor,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.bgGreyColor,
  );
}

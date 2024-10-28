import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class CustomAssetImage extends StatelessWidget {
  final String imageLocation;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color color;
  final double radius;
  final Color? imageColor;
  const CustomAssetImage({
    super.key,
    required this.imageLocation,
    this.height,
    this.width,
    this.fit = BoxFit.fill,
    this.color = AppColors.transparentColor,
    this.radius = 0,
    this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        imageLocation,
        fit: fit,
        color: imageColor,
        height: height,
        width: width,
        errorBuilder: (context, error, stackTrace) => const Icon(
          Icons.error,
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}

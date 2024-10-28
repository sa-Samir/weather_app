import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {
  final Color? overlayColor;
  final Function onTap;
  final Widget child;
  final double? borderRadius;
  final Color? splashColor;
  final EdgeInsets? padding;
  const CustomInkWell({
    super.key,
    this.overlayColor,
    required this.child,
    this.borderRadius,
    required this.onTap,
    this.splashColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(),
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      overlayColor: WidgetStatePropertyAll(overlayColor),
      splashColor: splashColor,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}

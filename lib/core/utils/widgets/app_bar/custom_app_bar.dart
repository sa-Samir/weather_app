import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? action;
  const CustomAppBar({
    super.key,
    required this.title,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: action,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.whiteColor,
        ),
      ),
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      systemOverlayStyle: Constants.systemOverlay,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

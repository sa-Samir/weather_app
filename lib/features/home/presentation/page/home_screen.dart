import 'package:flutter/material.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../../../../core/utils/widgets/gesture/custom_gesture_detector.dart';
import 'home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGestureDetector(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Home',
          action: [
            IconButton(
              onPressed: () => _navigateToHelp(context),
              icon: const Icon(
                Icons.help,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
        body: const SafeArea(
          child: HomeBody(),
        ),
      ),
    );
  }

  void _navigateToHelp(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.help,
    );
  }
}

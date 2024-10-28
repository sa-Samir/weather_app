import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/services/dependencies/service_locator.dart';
import '../../../../core/services/storage/help_storage.dart';
import '../../../../core/utils/widgets/gesture/custom_ink_well.dart';
import '../../../../core/utils/widgets/image/custom_asset_image.dart';

class HelpBody extends StatefulWidget {
  const HelpBody({super.key});

  @override
  State<HelpBody> createState() => _HelpBodyState();
}

class _HelpBodyState extends State<HelpBody> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const _Background(),
        _Content(
          onSkipTapped: () =>
              _storeDataAndNavigateToHome(helpStorage: sl<HelpStorage>()),
        ),
      ],
    );
  }

  void _startTimer() {
    _timer = Timer(
      const Duration(seconds: 5),
      _navigateToHome,
    );
  }

  void _cancelTimer() {
    _timer.cancel();
  }

  void _navigateToHome() {
    _cancelTimer();
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.popAndPushNamed(context, Routes.home);
    }
  }

  void _storeDataAndNavigateToHome({required HelpStorage helpStorage}) {
    helpStorage.updateShowHelp(false);
    _navigateToHome();
  }
}

class _Content extends StatelessWidget {
  final VoidCallback onSkipTapped;
  const _Content({required this.onSkipTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.padding * 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'We show weather for you',
            textAlign: TextAlign.center,
          ),
          Constants.sizedBoxMedium,
          _SkipButton(
            onSkipTapped: onSkipTapped,
          ),
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: CustomAssetImage(
        imageLocation: Assets.helpBackground,
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  final VoidCallback onSkipTapped;
  const _SkipButton({
    required this.onSkipTapped,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onSkipTapped,
      padding: const EdgeInsets.all(Constants.tappableTextPadding),
      child: Text(
        'Skip',
        style: TextStyles.regular12.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

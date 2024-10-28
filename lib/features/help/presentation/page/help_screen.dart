import 'package:flutter/material.dart';
import '../../../../core/utils/widgets/app_bar/custom_no_app_bar.dart';
import 'help_body.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomNoAppBar(),
      body: SafeArea(
        child: HelpBody(),
      ),
    );
  }
}

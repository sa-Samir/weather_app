import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/text_styles.dart';

void showCustomDialog(
  BuildContext context, {
  required String title,
  required String description,
  required Widget? Function(BuildContext) action,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    useSafeArea: false,
    builder: (context) => Dialog(
      insetPadding: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(Constants.borderRadius * .5)),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * Constants.dialogWidthFactor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(Constants.padding),
              child: Column(
                children: [
                  Text(
                    title,
                  ),
                  if (description.isNotEmpty) ...[
                    Constants.sizedBoxMedium,
                    Text(
                      description,
                      style: TextStyles.regular12,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
            if (action(context) != null) ...[
              action(context)!,
            ],
          ],
        ),
      ),
    ),
  );
}

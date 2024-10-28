import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/dialog/custom_dialog.dart';

class PermissionHelper {
  static void checkLocationPermission(
    BuildContext context, {
    required VoidCallback onGranted,
  }) async {
    var status = await Permission.locationWhenInUse.request();
    switch (status) {
      case PermissionStatus.granted:
        onGranted();
        break;
      case PermissionStatus.denied:
        await Permission.locationWhenInUse.request();
        break;
      default:
        if (context.mounted) {
          _showPermissionDialog(context);
        }
        break;
    }
  }
}

void _showPermissionDialog(BuildContext context) {
  showCustomDialog(
    context,
    title: 'Location Permissions Required',
    description:
        'Location Permissions Required For Accessing This Device\'s Location',
    action: (context) => const TextButton(
      onPressed: openAppSettings,
      child: Text('Open Settings'),
    ),
  );
}

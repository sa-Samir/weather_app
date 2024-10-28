import 'package:flutter/material.dart' show FocusManager;

class GestureHelper {
  static void unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

import 'dart:async';
import 'dart:ui';

class Debouncer {
  Debouncer();
  Timer? _timer;

  void run(VoidCallback action) {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _timer = Timer(
      const Duration(milliseconds: 250),
      action,
    );
  }
}

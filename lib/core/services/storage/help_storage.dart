import 'package:get_storage/get_storage.dart';

class HelpStorage {
  final GetStorage storage;
  HelpStorage({required this.storage});
  static const _showHelpKey = 'SHOWHELP';

  bool get showHelp {
    final data = storage.read(_showHelpKey);
    return data != 'false';
  }

  void updateShowHelp(bool value) {
    storage.write(_showHelpKey, value.toString());
  }
}

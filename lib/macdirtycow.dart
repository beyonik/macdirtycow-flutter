import 'macdirtycow_platform_interface.dart';

class macdirtycow {
  static Future<bool?> grant_filesystem_access() {
    return MacdirtycowPlatform.instance.grantFileSystemAccess();
  }
}

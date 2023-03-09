import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'macdirtycow_method_channel.dart';

abstract class MacdirtycowPlatform extends PlatformInterface {
  MacdirtycowPlatform() : super(token: _token);

  static final Object _token = Object();

  static MacdirtycowPlatform _instance = MethodChannelMacdirtycow();

  static MacdirtycowPlatform get instance => _instance;

  static set instance(MacdirtycowPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> grantFileSystemAccess() {
    throw UnimplementedError(
        'grantFileSystemAccess() has not been implemented.');
  }
}

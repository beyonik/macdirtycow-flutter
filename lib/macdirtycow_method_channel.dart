import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'macdirtycow_platform_interface.dart';

class MethodChannelMacdirtycow extends MacdirtycowPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('macdirtycow');

  @override
  Future<bool?> grantFileSystemAccess() async {
    final success =
        await methodChannel.invokeMethod<bool>('grantFileSystemAccess');
    return success;
  }
}

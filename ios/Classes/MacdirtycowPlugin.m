#import "MacdirtycowPlugin.h"
#import "grant_full_disk_access.h"

@implementation MacdirtycowPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"macdirtycow"
            binaryMessenger:[registrar messenger]];
  MacdirtycowPlugin* instance = [[MacdirtycowPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"grantFileSystemAccess" isEqualToString:call.method]) {
    grant_full_disk_access(^(NSError* err) {
      result(@((bool)(err == nil)));
    });
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end

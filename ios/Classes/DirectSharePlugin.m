#import "DirectSharePlugin.h"
#if __has_include(<direct_share/direct_share-Swift.h>)
#import <direct_share/direct_share-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "direct_share-Swift.h"
#endif

@implementation DirectSharePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDirectSharePlugin registerWithRegistrar:registrar];
}
@end

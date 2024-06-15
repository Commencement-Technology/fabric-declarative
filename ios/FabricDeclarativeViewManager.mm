#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import "RCTBridge.h"

@interface FabricDeclarativeViewManager : RCTViewManager
@end

@implementation FabricDeclarativeViewManager

RCT_EXPORT_MODULE(FabricDeclarativeView)

- (UIView *)view
{
  return [[UIView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(color, NSString)

@end

// This guard prevent this file to be compiled in the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED
#import <React/RCTViewComponentView.h>
#import <UIKit/UIKit.h>

#ifndef FabricDeclarativeViewNativeComponent_h
#define FabricDeclarativeViewNativeComponent_h

NS_ASSUME_NONNULL_BEGIN

@interface FabricDeclarativeView : RCTViewComponentView
@end

NS_ASSUME_NONNULL_END

#endif /* FabricDeclarativeViewNativeComponent_h */
#endif /* RCT_NEW_ARCH_ENABLED */
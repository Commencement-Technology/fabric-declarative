#import "FabricDeclarativeView.h"

#import <react/renderer/components/RNFabricDeclarativeViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNFabricDeclarativeViewSpec/EventEmitters.h>
#import <react/renderer/components/RNFabricDeclarativeViewSpec/Props.h>
#import <react/renderer/components/RNFabricDeclarativeViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

#if __has_include("react_native_fabric_declarative/react_native_fabric_declarative-Swift.h")
#import "react_native_fabric_declarative/react_native_fabric_declarative-Swift.h"
#else
#import "react_native_fabric_declarative-Swift.h"
#endif

using namespace facebook::react;

@interface FabricDeclarativeView () <RCTFabricDeclarativeViewViewProtocol>

@end

@implementation FabricDeclarativeView {
    SwiftUIViewManager * _manager;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<FabricDeclarativeViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const FabricDeclarativeViewProps>();
    _props = defaultProps;

    _manager = [[SwiftUIViewManager alloc] init];

    self.contentView = [_manager getView];
      
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<FabricDeclarativeViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<FabricDeclarativeViewProps const>(props);

    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> FabricDeclarativeViewCls(void)
{
    return FabricDeclarativeView.class;
}

@end

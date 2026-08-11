#import "GameSurfaceView.h"
#import "LauncherPreferences.h"
#import "PLProfiles.h"
#import "utils.h"

@interface GameSurfaceView()
@end

@implementation GameSurfaceView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.layer.drawsAsynchronously = YES;
    self.layer.opaque = YES;

    return self;
}

+ (Class)layerClass {
    NSString *renderer = [PLProfiles resolveKeyForCurrentProfile:@"renderer"];
    if ([renderer isEqualToString:@ RENDERER_NAME_VK_ZINK] ||
        [renderer isEqualToString:@ RENDERER_NAME_VK_ZINK_LEGACY]) {
        return CALayer.class;
    } else {
        return CAMetalLayer.class;
    }
}

@end

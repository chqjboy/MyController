#import "Device.h"
#import "Functions.h"
#import "Animations.h"
#define NavItemWidth 35
#define NavItemHeight 44
#define GLOBAL_COLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define GLOBAL_ACOLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define ALERT_MSG(msg) static UIAlertView *alert; alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
[alert show]
#define GLOBAL_FONT(s) [UIFont systemFontOfSize:s]
#define GLOBAL_ImageLoad(FILENAME) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:FILENAME ofType:@"png"]]
#define ScaleSize(size) ([Device getHScale]*size)
#define SystemFont(size) [UIFont systemFontOfSize:ScaleSize(size)]
#define StatusBarHeight 20.0
#define StatusBarHeightX 44.0
#define TailBarHeightX 30.0
#define TabItemHeight 49.0
#define TabItemHeightX 83.0
typedef NS_ENUM(NSInteger, eAlbumEnumMode)
{
    eAlbumEnumMode_photos = 0,
    eAlbumEnumMode_video,
    eAlbumEnumMode_all
};

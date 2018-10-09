
#import "NavigationCtrler.h"
#import "AlbumView.h"
#import "AlbumDirectoryView.h"

@protocol AlbumCtrlerCallback<NSObject>
-(void)albumSelectedImages:(NSArray<UIImage*>*)images;
-(void)albumSelectedVideos:(NSArray<NSURL*>*)urls;
@end

@interface AlbumCtrler : NavigationCtrler
<
AlbumDirectoryViewDelegate
>
@property(nonatomic, weak) id<AlbumCtrlerCallback> callback;
@property(nonatomic, retain) AlbumDirectoryView* directoryView;
@property(nonatomic, retain) AlbumView* albumView;
@property(nonatomic, retain) UILabel* rightButton;
@property(nonatomic, assign) BOOL sigleselect;
@property(nonatomic, assign) eAlbumEnumMode mode;
@property(nonatomic, retain) PHDirectory* selDirectory;
@property(nonatomic, assign) BOOL isloading;

+(void)showAlbumViewCtrler:(UIViewController*)ctrler andMode:(eAlbumEnumMode)mode andSigleSelect:(BOOL)sigleselect andDelegae:(id)delegate andCallback:(id)callback;
+(void)showAlbumNavViewCtrler:(UINavigationController*)ctrler andMode:(eAlbumEnumMode)mode andSigleSelect:(BOOL)sigleselect andDelegae:(id)delegate andCallback:(id)callback;
@end

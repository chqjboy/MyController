
#import "NavigationCtrler.h"
#import "Global.h"
#import <AVFoundation/AVFoundation.h>
@interface AVPlayerLayerCtrler : NavigationCtrler
<
CoreAnimationCallback
>
@property(nonatomic, retain) AVPlayerLayer* playerLayer;
@property(nonatomic, retain) AVPlayer* player;
@property(nonatomic, retain) UIButton* trans3D;
@property(nonatomic, retain) UIButton* transMirror;
@property(nonatomic, retain) UIButton* rate;
@property(nonatomic, assign) CGFloat ratevalue;
-(void)backClick;
-(void)initViews;
-(void)initLayerWithRect:(CGRect)rect;
@end

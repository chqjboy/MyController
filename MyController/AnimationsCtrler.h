//
//  AnimationsCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/3/25.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "VScrollView.h"
#import "AnimationsCell.h"
#import "AnimationsCell.h"
#import "AnimationDemoCtrlers.h"
@interface AnimationsCtrler : NavigationCtrler
<
AnimationsCellDelegate,
NavigationCtrlerDelegate
>
@property(nonatomic, retain) VScrollView* vscrollView;
@property(nonatomic, retain) AnimationsCell* zoom;
@property(nonatomic, retain) AnimationsCell* fade;
@property(nonatomic, retain) AnimationsCell* hmove;
@property(nonatomic, retain) AnimationsCell* vmove;
@property(nonatomic, retain) AnimationsCell* rotate;
@property(nonatomic, retain) AnimationsCell* shadow;
@property(nonatomic, retain) AnimationsCell* hflip;
@property(nonatomic, retain) AnimationsCell* vcurl;
@property(nonatomic, retain) AnimationsCell* coreAnimation;
@property(nonatomic, retain) AnimationsCell* gifShow;

@property(nonatomic, retain) ZoomCtrler* zoomCtrler;
@property(nonatomic, retain) FadeCtrler* fadeCtrler;
@property(nonatomic, retain) HMoveCtrler* hmoveCtrler;
@property(nonatomic, retain) VMoveCtrler* vmoveCtrler;
@property(nonatomic, retain) RotateCtrler* rotateCtrler;
@property(nonatomic, retain) ShadowCtrler* shadowCtrler;
@property(nonatomic, retain) HFlipCtrler* hflipCtrler;
@property(nonatomic, retain) VCurlCtrler* vcurlCtrler;
@property(nonatomic, retain) CoreAnimationCtrler* coreAnimationCtrler;
@property(nonatomic, retain) GifShowCtrler* gifShowCtrler;

-(void)backClick;
-(void)initViews;
-(void)initVScrollViewWithRect:(CGRect)rect;
-(void)reloadContent;
-(void)initZoomWithRect:(CGRect)rect;
-(void)initFadeWithRect:(CGRect)rect;
-(void)initHMoveWithRect:(CGRect)rect;
-(void)initVModeWithRect:(CGRect)rect;
-(void)initRotateWithRect:(CGRect)rect;
-(void)initShadowWithRect:(CGRect)rect;
-(void)initHFlipWithRect:(CGRect)rect;
-(void)initVCurlWithRect:(CGRect)rect;
-(void)initCoreAnimationWithRect:(CGRect)rect;
-(void)initGifShowWithRect:(CGRect)rect;

-(void)cellClickWithView:(UIView*)view;
-(void)backWithCtrler:(id)ctrler;
@end

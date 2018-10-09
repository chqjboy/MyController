//
//  CoreAnimationCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/3/30.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "VScrollView.h"
#import "AnimationsCell.h"
#import "CoreAnimationDemoCtrler.h"
@interface CoreAnimationCtrler : NavigationCtrler
<
NavigationCtrlerDelegate
>
@property(nonatomic, retain) VScrollView* vscrollView;
@property(nonatomic, retain) AnimationsCell* scale;
@property(nonatomic, retain) AnimationsCell* rotate;
@property(nonatomic, retain) AnimationsCell* move;
@property(nonatomic, retain) AnimationsCell* path;
@property(nonatomic, retain) AnimationsCell* shake;
@property(nonatomic, retain) AnimationsCell* group;
@property(nonatomic, retain) AnimationsCell* layer;
@property(nonatomic, retain) AnimationsCell* shaplayer;
@property(nonatomic, retain) AnimationsCell* textlayer;
@property(nonatomic, retain) AnimationsCell* gradientLayer;
@property(nonatomic, retain) AnimationsCell* replicatorLayer;
@property(nonatomic, retain) AnimationsCell* scrollLayer;
@property(nonatomic, retain) AnimationsCell* emitterLayer;
@property(nonatomic, retain) AnimationsCell* eaglLayer;
@property(nonatomic, retain) AnimationsCell* avPlayerLayer;


@property(nonatomic, retain) CAScaleCtrler* scaleCtrler;
@property(nonatomic, retain) CARotateCtrler* rotateCtrler;
@property(nonatomic, retain) CAMoveCtrler* moveCtrler;
@property(nonatomic, retain) CAPathCtrler* pathCtrler;
@property(nonatomic, retain) CAShakeCtrler* shakeCtrler;
@property(nonatomic, retain) CAGroupCtrler* groupCtrler;
@property(nonatomic, retain) LayerCtrler* layerCtrler;
@property(nonatomic, retain) ShapLayerCtrler* shapLayerCtrler;
@property(nonatomic, retain) TextLayerCtrler* textLayerCtrler;
@property(nonatomic, retain) GradientLayerCtrler* gradientLayerCtrler;
@property(nonatomic, retain) ReplicatorLayerCtrler* replicatorLayerCtrler;
@property(nonatomic, retain) ScrollLayerCtrler* scrollLayerCtrler;
@property(nonatomic, retain) EmitterLayerCtrler* emitterLayerCtrler;
@property(nonatomic, retain) EAGLLayerCtrler* eaglLayerCtrler;
@property(nonatomic, retain) AVPlayerLayerCtrler* avPlayerLayerCtrler;

-(void)backClick;
-(void)initViews;
-(void)initVScrollViewWithRect:(CGRect)rect;
-(void)reloadContent;
-(void)initScaleWithRect:(CGRect)rect;
-(void)initRotateWithRect:(CGRect)rect;
-(void)initMoveWithRect:(CGRect)rect;
-(void)initPathWithRect:(CGRect)rect;
-(void)initShakeWithRect:(CGRect)rect;
-(void)initGroupWithRect:(CGRect)rect;
-(void)initLayerWithRect:(CGRect)rect;
-(void)initShapLayerWithRect:(CGRect)rect;
-(void)initTextLayerWithRect:(CGRect)rect;
-(void)initGradientLayerWithRect:(CGRect)rect;
-(void)initReplicatorLayerWithRect:(CGRect)rect;
-(void)initScrollLayerWithRect:(CGRect)rect;
-(void)initEmitterLayerWithRect:(CGRect)rect;
-(void)initEaglLayerWithRect:(CGRect)rect;
-(void)initAVPlayerLayerWithRect:(CGRect)rect;

-(void)cellClickWithView:(UIView*)view;
-(void)backWithCtrler:(id)ctrler;
@end

//
//  LayerCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/4/5.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "Cubelayer.h"
typedef NS_ENUM(NSInteger, ELayerAccess)
{
    ELayerAccess_bkcolor = 0,
    ELayerAccess_corner,
    ELayerAccess_border,
    ELayerAccess_shadow,
    ELayerAccess_contents_img,
    ELayerAccess_mask_star,
    ELayerAccess_contents_aspect,
    ELayerAccess_contents_center,
    ELayerAccess_contents_scale,
    ELayerAccess_masktobounds,
    ELayerAccess_filter_linear,
    ELayerAccess_filter_trilinear,
    ELayerAccess_filter_nearest,
    ELayerAccess_contents_rect_lu,
    ELayerAccess_contents_rect_ru,
    ELayerAccess_contents_rect_ld,
    ELayerAccess_contents_rect_rd,
    ELayerAccess_contents_rect_all,
    ELayerAccess_stretch_rect_lu,
    ELayerAccess_stretch_rect_ru,
    ELayerAccess_stretch_rect_ld,
    ELayerAccess_stretch_rect_rd,
    ELayerAccess_delegate,
    ELayerAccess_anchorpoint,
    ELayerAccess_anchorpointbk,
    ELayerAccess_zlayer_up,
    ELayerAccess_zlayer_down,
    ELayerAccess_3d_scale,
    ELayerAccess_3d_rotate,
    ELayerAccess_3d_move,
    ELayerAccess_3d_rotate_x,
    ELayerAccess_3d_rotate_y,
    ELayerAccess_3d_rotate_z,
    ELayerAccess_clicklayer,
    ELayerAccess_cub,
    ELayerAccess_cub_rotateX,
    ELayerAccess_cub_rotateY,
    ELayerAccess_cub_rotateZ,
    ELayerAccess_last
};
@interface LayerCtrler : NavigationCtrler
<
CoreAnimationCallback
>
@property(nonatomic, retain) NSTimer* timer;
@property(nonatomic, retain) CALayer* curLayer;
@property(nonatomic, retain) CALayer* zLayer;
@property(nonatomic, retain) Cubelayer* cub;
@property BOOL goon;
@property ELayerAccess access;
-(void)backClick;
-(void)initViews;
-(void)initCurLayer;
-(void)initZLayer;
-(void)initCubLayer;
-(void)initTimer;
-(void)timerAction;

-(void)actionBkColorLayer;
-(void)actionCornerLayer;
-(void)actionBorderLayer;
-(void)actionShadowLayer;
-(void)actionContentImgLayer;
-(void)actionMaskStarLayer;
-(void)actionContentAspectLayer;
-(void)actionContentCenterLayer;
-(void)actionContentScaleLayer;
-(void)actionMaskToBoundsLayer;
-(void)actionFilterLinearLayer;
-(void)actionFilterTrilinearLayer;
-(void)actionFilterNearestLayer;
-(void)actionContentRectLULayer;
-(void)actionContentRectRULayer;
-(void)actionContentRectLDLayer;
-(void)actionContentRectRDLayer;
-(void)actionContentRectAllLayer;
-(void)actionStrectRectLULayer;
-(void)actionStrectRectRULayer;
-(void)actionStrectRectLDLayer;
-(void)actionStrectRectRDLayer;
-(void)actionDelegateLayer;
-(void)actionAnchorPointLayer;
-(void)actionAnchorPointBkLayer;
-(void)actionZLayerUp;
-(void)actionZLayerDown;
-(void)action3DScale;
-(void)action3DRotate;
-(void)action3DMove;
-(void)action3DRotateX;
-(void)action3DRotateY;
-(void)action3DRotateZ;
-(void)actionClickLayer;
-(void)actionCub;
-(void)actionCubRotateX;
-(void)actionCubRotateY;
-(void)actionCubRotateZ;

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx;
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
@end

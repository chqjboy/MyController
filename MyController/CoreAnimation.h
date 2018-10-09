//
//  CoreAnimations.h
//  MyController
//
//  Created by 陈前进 on 16/3/30.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#define FillMode_forewards kCAFillModeForwards
#define FillMode_backwards kCAFillModeBackwards
#define FillMode_both      kCAFillModeBoth
#define FillMode_remove    kCAFillModeRemoved

#define MediaTimeFunc_easein    kCAMediaTimingFunctionEaseIn
#define MediaTimeFunc_easeout   kCAMediaTimingFunctionEaseOut
#define MediaTimeFunc_linear    kCAMediaTimingFunctionLinear
#define MediaTimeFunc_easeinout kCAMediaTimingFunctionEaseInEaseOut
#define MediaTimeFunc_default   kCAMediaTimingFunctionDefault

#define CAKey_scale @"scaleAnimation"
#define CAKey_rotate @"rotateAnimation"
#define CAKey_move @"moveAnimation"
#define CAKey_group @"groupAnimation"

#define CAType_scale @"transform.scale"
#define CAType_rotate_x @"transform.rotation.x"
#define CAType_rotate_y @"transform.rotation.y"
#define CAType_rotate_z @"transform.rotation.z"
#define CAType_move @"position"

@interface Param_CoreAnimation:NSObject
@property BOOL                          undo;
@property BOOL                          autorevers;
@property CGFloat                       repeatcount;
@property CGFloat                       duration;
@property(nonatomic, retain) NSString*  fillmode;
@end

@interface Param_CAScale:Param_CoreAnimation
@property CGFloat fromeScale;
@property CGFloat toScale;
@end

@interface Param_CARotate : Param_CoreAnimation
@property CGFloat fromRadian;
@property CGFloat toRadian;
@property(nonatomic, retain) NSString* type;
@end

@interface Param_CAMove : Param_CoreAnimation
@property CGRect fromRect;
@property CGRect toRect;
@end

@interface Param_CAGroup : Param_CoreAnimation
@property NSArray<CAAnimation*>* animations;
@end

@interface Param_CAPath : Param_CoreAnimation
@property(nonatomic, retain) UIBezierPath* path;
@end

@interface Param_CAShake : Param_CoreAnimation
@property(nonatomic, retain) NSArray<NSNumber*>* keyTimes;
@property(nonatomic, retain) NSArray<NSString*>* keyMediaTimeFuncs;
@property(nonatomic, retain) NSArray<NSValue*>* points;
@end

@protocol CoreAnimationCallback <NSObject>
@optional
-(void)animationDidStart:(id)animation;
-(void)animationDidStop:(id)animation;
@end

@interface CoreAnimation : CABasicAnimation
{
    id<CoreAnimationCallback>callback;
}
@property(nonatomic, retain) id<CoreAnimationCallback>callback;

//缩放
+(CoreAnimation*)scaleLayerAnimation:(CALayer*)layer andParam:(Param_CAScale*)param andCallBack:(id)callback;
//旋转
+(CoreAnimation*)rotateLayerAnimation:(CALayer*)layer andParam:(Param_CARotate*)param andCallBack:(id)callback;
//移动
+(CoreAnimation*)moveLayerAnimation:(CALayer*)layer andParam:(Param_CAMove*)param andCallBack:(id)callback;
//复合
//各个动画应当没有添加到layer上，添加到layer上只有group，所以回调也只有group对象有效
+(CAAnimation*)groupLayerAnimation:(CALayer*)layer andParam:(Param_CAGroup*)param andCallBack:(id)callback;
//沿路径运动动画
+(CAAnimation*)pathLayerAnimation:(CALayer*)layer andParam:(Param_CAPath*)param andCallBack:(id)callback;
//弹抖运动动画
+(CAAnimation*)shakeLayerAnimation:(CALayer*)layer andParam:(Param_CAShake*)param andCallBack:(id)callback;

- (void)animationDidStart:(CAAnimation *)anim;
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag;
@end

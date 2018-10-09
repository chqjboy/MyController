//
//  CoreAnimations.m
//  MyController
//
//  Created by 陈前进 on 16/3/30.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "CoreAnimation.h"
@implementation Param_CoreAnimation
@end

@implementation Param_CAScale
@end

@implementation Param_CARotate
@end

@implementation Param_CAMove
@end

@implementation Param_CAGroup
@end

@implementation Param_CAPath
@end

@implementation Param_CAShake
@end

@implementation CoreAnimation

+(CoreAnimation*)scaleLayerAnimation:(CALayer*)layer andParam:(Param_CAScale*)param andCallBack:(id)callback
{
    //设定剧本
    CoreAnimation* animation = [CoreAnimation animationWithKeyPath:CAType_scale];
    animation.fromValue = [NSNumber numberWithFloat:param.fromeScale];
    animation.toValue = [NSNumber numberWithFloat:param.toScale];
    animation.autoreverses = param.autorevers;
    animation.fillMode = param.fillmode;
    animation.repeatCount = param.repeatcount;
    animation.duration = param.duration;
    animation.delegate = animation;
    animation.callback = callback;
    if (!param.undo)
    {
        //开演
        [layer addAnimation:animation forKey:CAKey_scale];
    }
    return animation;
}
+(CoreAnimation*)rotateLayerAnimation:(CALayer*)layer andParam:(Param_CARotate*)param andCallBack:(id)callback
{
    //设定剧本
    CoreAnimation* animation = [CoreAnimation animationWithKeyPath:param.type];
    animation.fromValue = [NSNumber numberWithFloat:param.fromRadian];
    animation.toValue = [NSNumber numberWithFloat:param.toRadian];
    animation.autoreverses = param.autorevers;
    animation.fillMode = param.fillmode;
    animation.repeatCount = param.repeatcount;
    animation.duration = param.duration;
    animation.delegate = animation;
    animation.callback = callback;
    if (!param.undo)
    {
        //开演
        [layer addAnimation:animation forKey:CAKey_scale];
    }
    return animation;
}

+(CoreAnimation*)moveLayerAnimation:(CALayer*)layer andParam:(Param_CAMove*)param andCallBack:(id)callback
{
    //设定剧本
    CoreAnimation* animation = [CoreAnimation animationWithKeyPath:CAType_move];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(param.fromRect.origin.x+param.fromRect.size.width/2, param.fromRect.origin.y+param.fromRect.size.height/2)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(param.toRect.origin.x+param.toRect.size.width/2, param.toRect.origin.y+param.toRect.size.height/2)];
    animation.autoreverses = param.autorevers;
    animation.fillMode = param.fillmode;
    animation.repeatCount = param.repeatcount;
    animation.duration = param.duration;
    animation.delegate = animation;
    animation.callback = callback;
    if (!param.undo)
    {
        //开演
        [layer addAnimation:animation forKey:CAKey_scale];
    }
    return animation;
}

+(CAAnimation*)groupLayerAnimation:(CALayer*)layer andParam:(Param_CAGroup*)param andCallBack:(id)callback
{
    CoreAnimation* animation = [CoreAnimation animation];
    //设定剧本
    CAAnimationGroup *groupAnnimation = [CAAnimationGroup animation];
    groupAnnimation.duration = param.duration;
    groupAnnimation.autoreverses = param.autorevers;
    groupAnnimation.animations = param.animations;
    groupAnnimation.repeatCount = param.repeatcount;
    groupAnnimation.delegate = animation;
    animation.callback = callback;
    //开演
    [layer addAnimation:groupAnnimation forKey:CAKey_group];
    return animation;
}

+(CAAnimation*)pathLayerAnimation:(CALayer*)layer andParam:(Param_CAPath*)param andCallBack:(id)callback
{
    CoreAnimation* animation = [CoreAnimation animation];
    //设定剧本
    CAKeyframeAnimation* keyframeanimation = [CAKeyframeAnimation animation];
    keyframeanimation.duration = param.duration;
    keyframeanimation.autoreverses = param.autorevers;
    keyframeanimation.repeatCount = param.repeatcount;
    keyframeanimation.delegate = animation;
    keyframeanimation.path = param.path.CGPath;
    animation.callback = callback;
    if (!param.undo)
    {
        //开演
        [layer addAnimation:keyframeanimation forKey:CAType_move];
    }
    return animation;
}

+(CAAnimation*)shakeLayerAnimation:(CALayer*)layer andParam:(Param_CAShake*)param andCallBack:(id)callback
{
    CoreAnimation* animation = [CoreAnimation animation];
    //设定剧本
    CAKeyframeAnimation* keyframeanimation = [CAKeyframeAnimation animation];
    keyframeanimation.duration = param.duration;
    keyframeanimation.autoreverses = param.autorevers;
    keyframeanimation.repeatCount = param.repeatcount;
    keyframeanimation.delegate = animation;
    keyframeanimation.values = param.points;
    NSMutableArray* funcs = [[NSMutableArray alloc]init];
    for (NSString* func in param.keyMediaTimeFuncs)
    {
        [funcs addObject:[CAMediaTimingFunction functionWithName:func]];
    }
    keyframeanimation.timingFunctions = funcs;
    keyframeanimation.keyTimes = param.keyTimes;
    animation.callback = callback;
    if (!param.undo)
    {
        //开演
        [layer addAnimation:keyframeanimation forKey:CAType_move];
    }
    return animation;
}

- (void)animationDidStart:(CAAnimation *)anim
{
    if (self.callback!=nil                                              &&
        [self.callback respondsToSelector:@selector(animationDidStart:)])
    {
        [self.callback animationDidStart:self];
    }
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (self.callback!=nil                                              &&
        [self.callback respondsToSelector:@selector(animationDidStop:)] &&
        flag)
    {
        [self.callback animationDidStop:self];
    }
}
@end

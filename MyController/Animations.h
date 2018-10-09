//
//  Animations.h
//
//  Created by Pulkit Kathuria on 10/8/12.
//  Copyright (c) 2012 Pulkit Kathuria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CoreAnimation.h"
@interface Animations : UIViewController{
}


+ (void)zoomIn: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait;
+ (void)zoomIn: (UIView *)view andAnimationDuration: (float) duration completion:(void (^)(BOOL finished))completion;

+ (void)zoom:(UIView *)view andDuration: (float) duration andScale:(CGFloat)scale andWait:(BOOL) wait;
+ (void)zoom:(UIView *)view andDuration: (float) duration andScale:(CGFloat)scale completion:(void (^)(BOOL finished))completion;

+ (void)buttonPressAnimate: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait;

+ (void)fadeIn: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait;
+ (void)fadeOut: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait;
+ (void)fade: (UIView *)view andAnimationDuration: (float) duration andAlphaBegin:(CGFloat)beginAlpha andEndAlpha:(CGFloat)endAlpha completion:(void (^)(BOOL finished))completion;

+ (void) moveLeft: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait andLength:(float) length;
+ (void) moveLeft: (UIView *)view andAnimationDuration: (float) duration andLength:(float) length completion:(void (^)(BOOL finished))completion;

+ (void) moveRight: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait andLength:(float) length;
+ (void) moveRight: (UIView *)view andAnimationDuration: (float) duration andLength:(float) length completion:(void (^)(BOOL finished))completion;

+ (void) moveUp: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait andLength:(float) length;
+ (void) moveUp: (UIView *)view andAnimationDuration: (float) duration andLength:(float) length completion:(void (^)(BOOL finished))completion;

+ (void) moveDown: (UIView *)view andAnimationDuration: (float) duration andLength:(float) length completion:(void (^)(BOOL finished))completion;
+ (void) moveDown: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait andLength:(float) length;

+ (void) rotate: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait andAngle:(int) angle;
+ (void) rotate: (UIView *)view andAnimationDuration: (float) duration andAngle:(int) angle completion:(void (^)(BOOL finished))completion;

+(void)hflip:(UIView*)view andDuration:(float)duration andIsRignt:(BOOL)isright completion:(void (^)(BOOL finished))completion;
+(void)vcurl:(UIView*)view andDuration:(float)duration andIsUp:(BOOL)isup completion:(void (^)(BOOL finished))completion;

+ (void) frameAndShadow: (UIView *) view;
+ (void) shadowOnView: (UIView *) view andShadowType: (NSString *) shadowType;
+ (void) shadowOnLayer: (CALayer *) view andShadowType: (NSString *) shadowType;

+ (void) background: (UIView *) view andImageFileName: (NSString *) filename;
+ (void) roundedCorners: (UIView *) view;



+(void)transitionWithType:(NSString *)type WithSubtype:(NSString *)subtype ForView:(UIView *)view;
@end

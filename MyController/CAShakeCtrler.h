//
//  CAShakeCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/4/8.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "Global.h"
@interface CAShakeCtrler : NavigationCtrler
<
CoreAnimationCallback
>
@property(nonatomic, retain)UIImageView* imageView;
-(void)backClick;
-(void)initViews;
-(void)initImageViewWithRect:(CGRect)rect;
-(void)initAnimation;
-(void)animationAction;
-(void)animationDidStart:(id)animation;
-(void)animationDidStop:(id)animation;
@end

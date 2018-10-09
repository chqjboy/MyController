//
//  CAGroupCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/3/31.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "Global.h"
@interface CAGroupCtrler : NavigationCtrler
<
CoreAnimationCallback
>
@property(nonatomic, retain)UIImageView* imageView;
@property(nonatomic, retain)CoreAnimation* caRotate;
@property(nonatomic, retain)CoreAnimation* caScale;
@property(nonatomic, retain)CoreAnimation* caMove;
@property(nonatomic, retain)CAAnimation* caGroup;
-(void)backClick;
-(void)initViews;
-(void)initImageViewWithRect:(CGRect)rect;
-(void)initAnimation;
-(CoreAnimation*)getScaleAnimation;
-(CoreAnimation*)getRotateAnimation;
-(CoreAnimation*)getMoveAnimation;
-(void)animationAction;
-(void)animationDidStart:(id)animation;
-(void)animationDidStop:(id)animation;
@end

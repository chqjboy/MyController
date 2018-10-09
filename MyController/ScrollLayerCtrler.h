//
//  ScrollLayerCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/4/7.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "Global.h"
@interface ScrollLayerCtrler : NavigationCtrler
<
CoreAnimationCallback
>
@property(nonatomic, retain) CAScrollLayer* scrolllayer;
@property CGPoint point;
-(void)backClick;
-(void)initViews;
-(void)initScrollLayerWithRect:(CGRect)rect;
-(void)actionPan:(UIPanGestureRecognizer *)recognizer;
@end

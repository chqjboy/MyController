//
//  GradientLayerCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/4/7.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "Global.h"
@interface GradientLayerCtrler : NavigationCtrler
<
CoreAnimationCallback
>
@property(nonatomic, retain) CAGradientLayer* layer1;
@property(nonatomic, retain) CAGradientLayer* layer2;
@property(nonatomic, retain) CAGradientLayer* layer3;
-(void)backClick;
-(void)initViews;
-(void)initLayer1WithRect:(CGRect)rect;
-(void)initLayer2WithRect:(CGRect)rect;
-(void)initlayer3WithRect:(CGRect)rect;
@end

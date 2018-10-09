//
//  FlipCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/3/28.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "Global.h"
@interface HFlipCtrler : NavigationCtrler
@property(nonatomic, retain)UIImageView* imageView;
@property BOOL flag;
-(void)backClick;
-(void)initViews;
-(void)initImageViewWithRect:(CGRect)rect;
-(void)animationAction;
@end

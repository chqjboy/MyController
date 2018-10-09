//
//  ZoomCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/3/27.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationCtrler.h"
#import "Global.h"
@interface ZoomCtrler : NavigationCtrler
@property(nonatomic, retain)UIImageView* imageView;
@property BOOL flag;
-(void)backClick;
-(void)initViews;
-(void)initImageViewWithRect:(CGRect)rect;
-(void)animationAction;
@end

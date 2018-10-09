//
//  VFlipCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/3/28.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "Global.h"
@interface VCurlCtrler : NavigationCtrler
@property(nonatomic, retain)UIView* curlView;
@property(nonatomic, retain)UIImageView* imageView1;
@property(nonatomic, retain)UIImageView* imageView2;
@property BOOL flag;
-(void)backClick;
-(void)initViews;
-(void)initCurlViewWithRect:(CGRect)rect;
-(void)initImageView1WithRect:(CGRect)rect;
-(void)initImageView2WithRect:(CGRect)rect;
-(void)animationAction;
@end

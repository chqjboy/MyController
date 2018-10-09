//
//  ProgressBarCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/10/12.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "AvPlayerProgressBar.h"
@interface ProgressBarCtrler : NavigationCtrler
<
AvPlayerProgressBarDelegate
>
@property(nonatomic, retain) AvPlayerProgressBar* progressBar;

-(void)backClick;
-(void)initViews;
-(void)initProgressBarWithRect:(CGRect)rect;
-(void)pointMovingWithPersent:(CGFloat)persent;
-(void)pointMovedWithPersent:(CGFloat)persent;
@end


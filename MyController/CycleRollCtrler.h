//
//  CycleRollCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/8/4.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationCtrler.h"
#import "CycleHRollView.h"
#import "RefreshVMsgView.h"
#import "SlideMsgView.h"
@interface CycleRollCtrler : NavigationCtrler
@property(nonatomic, retain) CycleHRollView* hScrollView;
@property(nonatomic, retain) RefreshVMsgView* msgView;
@property(nonatomic, retain) SlideMsgView* slideView;
@property(nonatomic, retain) NSTimer* timer;
@property(nonatomic, assign) NSInteger index;
-(void)backClick;
-(void)initViews;
-(void)initHScrollViewWithRect:(CGRect)rect;
-(void)initMsgViewWithRect:(CGRect)rect;
-(void)initSlideViewWithRect:(CGRect)rect;

-(void)initTimer;
-(void)timerAction;
@end

//
//  AutoAVPlayerCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/9/9.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "AutoAVPlayerView.h"
#import "AvPlayerProgressBar.h"
#import "FitLineLabel.h"
@interface AutoAVPlayerCtrler : NavigationCtrler
<
AutoAVPlayerViewDelegate,
AvPlayerProgressBarDelegate
>
@property(nonatomic, retain) AutoAVPlayerView* autoAVPlayerView;
@property(nonatomic, retain) AutoAVPlayerView* autoAVPlayerView2;
@property(nonatomic, retain) UILabel* time;
@property(nonatomic, retain) AvPlayerProgressBar* progressBar;
@property(nonatomic, assign) CGFloat duration;
@property(nonatomic, assign) CGFloat current;

-(void)backClick;
-(void)initViews;
-(void)initAutoAVPlayerViewWithRect:(CGRect)rect;
-(void)initAutoAvPlayerView2WithRect:(CGRect)rect;
-(void)initTimeWithRect:(CGRect)rect;
-(void)initProgressBarWithRect:(CGRect)rect;

-(void)pointReadyMoveWithPersent:(CGFloat)persent;
-(void)pointMovingWithPersent:(CGFloat)persent;
-(void)pointMovedWithPersent:(CGFloat)persent;
-(void)updatePlayerWithDuration:(CGFloat)duration andCurrent:(CGFloat)current;
-(void)updateTime;
@end


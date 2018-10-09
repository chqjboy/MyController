//
//  AutoAVPlayerCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/9/9.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "AutoAVPlayerCtrler.h"

@interface AutoAVPlayerCtrler ()

@end

@implementation AutoAVPlayerCtrler
- (void)viewDidLoad {
    [self.navigationController setNavigationBarHidden:YES];
    //[super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.autoAVPlayerView start];
}
-(void)backClick
{
    [self.autoAVPlayerView stop];
    if (self.delegate!=nil &&
        [self.delegate respondsToSelector:@selector(backWithCtrler:)])
    {
        [self.delegate backWithCtrler:self];
    }
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)initViews
{
    CGRect rect = self.view.bounds;
    [self initAutoAVPlayerViewWithRect:rect];
    
    CGRect rtProgress = rect;
    rtProgress.size.height = 35;
    rtProgress.origin.x = 20;
    rtProgress.size.width = rect.size.width-2*rtProgress.origin.x;
    rtProgress.origin.y = rect.size.height-rtProgress.size.height;
    [self initProgressBarWithRect:rtProgress];
    
    CGRect rtTime = rect;
    rtTime.size.height = 20;
    rtTime.size.width = 100;
    rtTime.origin.x = rtProgress.origin.x+rtProgress.size.width-rtTime.size.width;
    rtTime.origin.y = rtProgress.origin.y-rtTime.size.height;
    [self initTimeWithRect:rtTime];
}
-(void)initAutoAVPlayerViewWithRect:(CGRect)rect
{
    NSArray* urls = @[@"http://1254029882.vod2.myqcloud.com/718a8fc8vodgzp1254029882/c57fbcd09031868223465965644/AYNecu5psOoA.mp4"];
    self.autoAVPlayerView = [[AutoAVPlayerView alloc]initWithFrame:rect andUrls:urls];
    self.autoAVPlayerView.delegate = self;
    [self.view addSubview:self.autoAVPlayerView];
}

-(void)initTimeWithRect:(CGRect)rect
{
    self.time = [[UILabel alloc]initWithFrame:rect];
    [self.time setText:@"00:00/00:00"];
    [self.time setTextColor:[UIColor whiteColor]];
    [self.time setFont:[UIFont systemFontOfSize:13]];
    [self.time setTextAlignment:NSTextAlignmentRight];
    [self.view addSubview:self.time];
}

-(void)initProgressBarWithRect:(CGRect)rect
{
    Param_AvPlayerProgressBar* param = [[Param_AvPlayerProgressBar alloc]init];
    param.clrFront = [UIColor whiteColor];
    param.clrCur = [UIColor whiteColor];
    param.clrBack = GLOBAL_COLOR(204, 204, 204);
    param.slipHeight = 2;
    param.pointHeight = rect.size.height;
    param.gradientWidth = 0;
    param.imgPoint = [UIImage imageNamed:@"progress_point"];
    self.progressBar = [[AvPlayerProgressBar alloc]initWithFrame:rect andParam:param];
    self.progressBar.delegate = self;
    [self.view addSubview:self.progressBar];
}

-(void)pointReadyMoveWithPersent:(CGFloat)persent
{
    [self.autoAVPlayerView pause];
}

-(void)pointMovingWithPersent:(CGFloat)persent
{
    self.current = self.duration*persent;
    [self updateTime];
}
-(void)pointMovedWithPersent:(CGFloat)persent
{
    self.current = self.duration*persent;
    [self updateTime];
    [self.autoAVPlayerView seekTimeWithPersent:persent];
    [self.autoAVPlayerView play];
}
-(void)updatePlayerWithDuration:(CGFloat)duration andCurrent:(CGFloat)current
{
    self.duration = duration;
    self.current = current;
    [self.progressBar setPosition:current/duration];
    [self updateTime];
}
-(void)updateTime
{
    NSInteger inCur = (int)self.current;
    NSInteger inDur = (int)self.duration;
    NSString* current = [NSString stringWithFormat:@"%02d:%02d", inCur/60, inCur%60];
    NSString* duration = [NSString stringWithFormat:@"%02d:%02d", inDur/60, inDur%60];
    [self.time setText:[NSString stringWithFormat:@"%@/%@", current, duration]];
}
@end

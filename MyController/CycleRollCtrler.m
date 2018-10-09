//
//  CycleRollCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/8/4.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "CycleRollCtrler.h"

@implementation CycleRollCtrler
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)backClick
{
    if (self.delegate!=nil &&
        [self.delegate respondsToSelector:@selector(backWithCtrler:)])
    {
        [self.delegate backWithCtrler:self];
    }
    if (self.timer)
    {
        [self.timer invalidate];
        self.timer = nil;
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)initViews
{
    CGRect rect = self.view.bounds;
    
    CGRect rtHScrollView = rect;
    rtHScrollView.size.height = 100;
    rtHScrollView.origin.y = 0;
    [self initHScrollViewWithRect:rtHScrollView];
    
    CGRect rtMsgView = rect;
    rtMsgView.size.height = 120;
    rtMsgView.size.width = 150;
    rtMsgView.origin.x = (rect.size.width-rtMsgView.size.width)/2;
    rtMsgView.origin.y = rtHScrollView.origin.y+rtHScrollView.size.height;
    [self initMsgViewWithRect:rtMsgView];
    
    CGRect rtSlide = rect;
    rtSlide.size.height = 170;
    rtSlide.size.width = 200;
    rtSlide.origin.x = (rect.size.width-rtSlide.size.width)/2;
    rtSlide.origin.y = rtMsgView.origin.y+rtMsgView.size.height;
    [self initSlideViewWithRect:rtSlide];
}
-(void)initHScrollViewWithRect:(CGRect)rect
{
    NSMutableArray* views = [[NSMutableArray alloc]init];
    CGRect rtView = rect;
    rtView.size.width = 192;
    for (int i=0; i<4; i++)
    {
        UIView* view = [[UIView alloc]initWithFrame:rtView];
        [view setBackgroundColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:(i+1)/4.0*0.6]];
        [views addObject:view];
    }
    Param_CycleHRollView* param = [[Param_CycleHRollView alloc]init];
    param.pageWidth = 192;
    param.views = views;
    self.hScrollView = [[CycleHRollView alloc]initWithFrame:rect andParam:param];
    [self.hScrollView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:self.hScrollView];
}
-(void)initMsgViewWithRect:(CGRect)rect
{
    self.msgView = [[RefreshVMsgView alloc]initWithFrame:rect];
    [self.msgView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:self.msgView];
}

-(void)initSlideViewWithRect:(CGRect)rect
{
    Param_SlideMsgView* param = [[Param_SlideMsgView alloc]init];
    param.capHeight = 50;
    param.left = YES;
    self.slideView = [[SlideMsgView alloc]initWithFrame:rect andParam:param];
    [self.slideView setBackgroundColor:[UIColor purpleColor]];
    [self.view addSubview:self.slideView];
}

-(void)initTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}
-(void)timerAction
{
    Param_RefreshVMsgViewCell* param = [[Param_RefreshVMsgViewCell alloc]init];
    if (self.index%2)
    {
        param.header = @"ball";
        param.name = @"我是单数";
        param.message = @"单数单数单数单数单数单数单数单数单数单数单数单数单数单数";
    }else
    {
        param.header = @"ball";
        param.name = @"我是双数";
        param.message = @"双数双数双数双数双数";
    }
    self.index++;
    [self.msgView addCellWithParam:param];
    
    CGRect rect = self.slideView.bounds;
    rect.size.width = 100;
    rect.size.height = 50;
    UIView* view = [[UIView alloc]initWithFrame:rect];
    [view setBackgroundColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:(self.index%5)*0.6/5.0+0.2]];
    [self.slideView addMsgView:view];
}
@end

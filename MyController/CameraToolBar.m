//
//  CameraToolBar.m
//  MyController
//
//  Created by 陈前进 on 16/4/11.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "CameraToolBar.h"
#import "Global.h"
@implementation CameraToolBar
-(CameraToolBar*)initWithFrame:(CGRect)rect
{
    self = [super initWithFrame:rect];
    [self initViews];
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    [self initHScrollViewWithRect:rect];
    [self reloadContent];
}

-(void)initHScrollViewWithRect:(CGRect)rect
{
    self.hscrollView = [[HScrollView alloc]initWithFrame:rect];
    [self addSubview:self.hscrollView];
}
-(void)reloadContent
{
    [self.hscrollView removeAllItems];
    CGRect rect = self.hscrollView.bounds;
    CGRect rtItem = rect;
    rtItem.size.width = rtItem.size.height;
    [self initBtnCloseWithRect:rtItem];
    [self initBtnSwitchWithRect:rtItem];
    [self initBtnCutWithRect:rtItem];
    [self.hscrollView reloadItems];
}

-(void)initBtnCloseWithRect:(CGRect)rect
{
    self.btnClose = [[UIImageView alloc]initWithFrame:rect];
    [self.btnClose setImage:[UIImage imageNamed:@"camera_close"]];
    [Functions addTapEventWithTarget:self View:self.btnClose andAction:@selector(actionClose)];
    [self.hscrollView addItemWithView:self.btnClose];
}

-(void)initBtnSwitchWithRect:(CGRect)rect
{
    self.btnSwitch = [[UIImageView alloc]initWithFrame:rect];
    [self.btnSwitch setImage:[UIImage imageNamed:@"camera_switch"]];
    [Functions addTapEventWithTarget:self View:self.btnSwitch andAction:@selector(actionSwitch)];
    [self.hscrollView addItemWithView:self.btnSwitch];
}
-(void)initBtnCutWithRect:(CGRect)rect
{
    self.btnCut = [[UIImageView alloc]initWithFrame:rect];
    [self.btnCut setImage:[UIImage imageNamed:@"camera_cut"]];
    [Functions addTapEventWithTarget:self View:self.btnCut andAction:@selector(actionCut)];
    [self.hscrollView addItemWithView:self.btnCut];
}
-(void)actionSwitch
{
    if (self.delegate!=nil &&
        [self.delegate respondsToSelector:@selector(actionSwitch)])
    {
        [self.delegate actionSwitch];
    }
}
-(void)actionCut
{
    if (self.delegate!=nil &&
        [self.delegate respondsToSelector:@selector(actionCut)])
    {
        [self.delegate actionCut];
    }
}
-(void)actionClose
{
    if (self.delegate!=nil &&
        [self.delegate respondsToSelector:@selector(actionClose)])
    {
        [self.delegate actionClose];
    }
}
@end

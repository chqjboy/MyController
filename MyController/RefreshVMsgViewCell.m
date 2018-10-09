//
//  RefreshVMsgViewCell.m
//  MyController
//
//  Created by 陈前进 on 16/8/9.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "RefreshVMsgViewCell.h"
@implementation Param_RefreshVMsgViewCell
@end
@implementation RefreshVMsgViewCell
-(RefreshVMsgViewCell*)initWithFrame:(CGRect)rect andParam:(Param_RefreshVMsgViewCell*)param
{
    self = [super initWithFrame:rect];
    self.param = param;
    [self initViews];
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    
    CGRect rtBack = rect;
    [self initBackViewWithRect:rtBack];
    
    CGRect rtHeader = rect;
    rtHeader.origin.x = 5;
    rtHeader.origin.y = 5;
    rtHeader.size.width = 30;
    rtHeader.size.height = rtHeader.size.width;
    [self initHeaderWithRect:rtHeader];
    
    CGRect rtName = rect;
    rtName.origin.x = rtHeader.origin.x+rtHeader.size.width+5;
    rtName.origin.y = rtHeader.origin.y;
    rtName.size.width = rect.size.width-rtName.origin.x-5;
    [self initNameWithRect:rtName];
    rtName = self.name.frame;
    
    CGRect rtMessage = rect;
    rtMessage.origin.x = rtName.origin.x;
    rtMessage.origin.y = rtName.origin.y+rtName.size.height+5;
    rtMessage.size.width = rect.size.width-rtMessage.origin.x-5;
    [self initMessageWithRect:rtMessage];
    rtMessage = self.message.frame;
    
    rtBack.size.height = (rtHeader.origin.y+rtHeader.size.height>rtMessage.origin.y+rtMessage.size.height)?rtHeader.origin.y+rtHeader.size.height+5 : rtMessage.origin.y+rtMessage.size.height+5;
    self.backView.frame = rtBack;
    
    rect = self.frame;
    rect.size.height = rtBack.origin.y+rtBack.size.height+5;
    self.frame = rect;
    
}
-(void)initBackViewWithRect:(CGRect)rect
{
    self.backView = [[UIView alloc]initWithFrame:rect];
    [self.backView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2]];
    [self addSubview:self.backView];
}
-(void)initHeaderWithRect:(CGRect)rect
{
    self.header = [[UIImageView alloc]initWithFrame:rect];
    [self.header setImage:[UIImage imageNamed:self.param.header]];
    [self addSubview:self.header];
}

-(void)initNameWithRect:(CGRect)rect
{
    self.name = [[FitLineLabel alloc]initWithFrame:rect andContent:self.param.name andFont:[UIFont systemFontOfSize:13] andColor:[UIColor colorWithRed:255 green:255 blue:0 alpha:1] andLimitLine:1];
    [self addSubview:self.name];
}
-(void)initMessageWithRect:(CGRect)rect
{
    self.message = [[FitLineLabel alloc]initWithFrame:rect andContent:self.param.message andFont:[UIFont systemFontOfSize:13] andColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:1]];
    [self addSubview:self.message];
}
@end

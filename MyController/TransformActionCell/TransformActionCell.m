//
//  TransformActionCell.m
//  MyController
//
//  Created by 陈前进 on 17/7/4.
//  Copyright © 2017年 mycontroller. All rights reserved.
//
#import "Global.h"
#import "Functions.h"
#import "TransformActionCell.h"
@implementation Param_TransformActionCell

@end
@implementation TransformActionCell
-(instancetype)initWithFrame:(CGRect)frame andParam:(Param_TransformActionCell*)param
{
    self = [super initWithFrame:frame];
    self.param = param;
    [self initViews];
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    
    CGRect rtLabel = rect;
    [self initLabelWithRect:rect];
    rtLabel = self.label.frame;
    
    CGRect rtLine = rect;
    rtLine.size.height = 0.5;
    rtLine.origin.y = rtLabel.origin.y+rtLabel.size.height;
    [Functions drawLineWithRect:rtLine andView:self];
    
    rect = self.frame;
    rect.size.height = rtLine.origin.y+rtLine.size.height;
    self.frame = rect;
}
-(void)initLabelWithRect:(CGRect)rect
{
    rect.size.height = 45;
    self.label = [[UILabel alloc]initWithFrame:rect];
    [self.label setText:self.param.name];
    [self.label setTextColor:GLOBAL_COLOR(105, 105, 105)];
    [self.label setTextAlignment:NSTextAlignmentCenter];
    [self.label setFont:[UIFont systemFontOfSize:15]];
    [self addSubview:self.label];
}
@end

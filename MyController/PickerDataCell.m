//
//  PickerCell.m
//  MyController
//
//  Created by 陈前进 on 17/4/1.
//  Copyright © 2017年 mycontroller. All rights reserved.
//

#import "PickerDataCell.h"
@implementation PickerData
@end

@implementation Param_PickerDataCell : NSObject
@end

@implementation PickerDataCell
-(PickerDataCell*)initWithFrame:(CGRect)rect andParam:(Param_PickerDataCell*)param andData:(PickerData*)data
{
    self = [super initWithFrame:rect];
    self.param = param;
    self.data = data;
    [self initViews];
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    
    CGRect rtTitle = rect;
    [self initTitleWithRect:rtTitle];
}
-(void)initTitleWithRect:(CGRect)rect
{
    self.title = [[UILabel alloc]initWithFrame:rect];
    [self.title setText:self.data.title];
    [self.title setTextAlignment:NSTextAlignmentCenter];
    [self.title setFont:self.param.font];
    [self.title setTextColor:self.param.color];
    [self addSubview:self.title];
}
@end


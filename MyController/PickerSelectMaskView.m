//
//  PickerSelectMaskView.m
//  MyController
//
//  Created by 陈前进 on 17/4/1.
//  Copyright © 2017年 mycontroller. All rights reserved.
//

#import "PickerSelectMaskView.h"
@implementation Param_PickerSelectMaskView
@end
@implementation PickerSelectMaskView
-(PickerSelectMaskView*)initWithFrame:(CGRect)rect andSelRect:(CGRect)selRect andParam:(Param_PickerSelectMaskView*)param
{
    self = [super initWithFrame:rect];
    self.param = param;
    self.selRect = selRect;
    [self initViews];
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    
    CGRect rtPreMask = rect;
    rtPreMask.size.height = self.selRect.origin.y;
    [self initPreMaskWithRect:rtPreMask];
    
    CGRect rtPreIndicator = rect;
    rtPreIndicator.size.height = self.param.indicateorHeight;
    rtPreIndicator.origin.y = rtPreMask.origin.y+rtPreMask.size.height-rtPreIndicator.size.height/2;
    [self initPreIndicatorWithRect:rtPreIndicator];
    
    CGRect rtBckMask = rect;
    rtBckMask.origin.y = self.selRect.origin.y+self.selRect.size.height;
    rtBckMask.size.height = rect.size.height-rtBckMask.origin.y;
    [self initBckMaskWithRect:rtBckMask];
    
    CGRect rtBckIndicator = rtPreIndicator;
    rtBckIndicator.origin.y = rtBckMask.origin.y-rtBckIndicator.size.height/2;
    [self initBckIndicatorWithRect:rtBckIndicator];
}
-(void)initPreMaskWithRect:(CGRect)rect
{
    self.preMask = [[UIView alloc]initWithFrame:rect];
    [self.preMask setBackgroundColor:self.param.clrMask];
    [self addSubview:self.preMask];
}
-(void)initPreIndicatorWithRect:(CGRect)rect
{
    self.preIndicator = [[UIView alloc]initWithFrame:rect];
    [self.preIndicator setBackgroundColor:self.param.clrIndicator];
    [self addSubview:self.preIndicator];
}
-(void)initBckMaskWithRect:(CGRect)rect
{
    self.bckMask = [[UIView alloc]initWithFrame:rect];
    [self.bckMask setBackgroundColor:self.param.clrMask];
    [self addSubview:self.bckMask];
}
-(void)initBckIndicatorWithRect:(CGRect)rect
{
    self.bckIndicator = [[UIView alloc]initWithFrame:rect];
    [self.bckIndicator setBackgroundColor:self.param.clrIndicator];
    [self addSubview:self.bckIndicator];
}
@end

//
//  TransImageShowPan.m
//  MyController
//
//  Created by 陈前进 on 17/7/4.
//  Copyright © 2017年 mycontroller. All rights reserved.
//

#import "TransImageShowPan.h"

@implementation TransImageShowPan
-(instancetype)initWithFrame:(CGRect)frame
{
    self  = [super initWithFrame:frame];
    [self setContentMode:UIViewContentModeScaleAspectFit];
    [self setBackgroundColor:GLOBAL_ACOLOR(11, 123, 223, 0.4)];
    [self initViews];
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    
    CGRect rtMask = rect;
    [self initMaskWithRect:rtMask];
    
    CGRect rtLabel = rect;
    [self initLabelWithRect:rtLabel];
}
-(void)initMaskWithRect:(CGRect)rect
{
    self.mask = [[UIView alloc]initWithFrame:rect];
    [self.mask setBackgroundColor:GLOBAL_ACOLOR(0, 0, 0, 0.2)];
    [self addSubview:self.mask];
}
-(void)initLabelWithRect:(CGRect)rect
{
    self.label = [[UILabel alloc]initWithFrame:rect];
    [self.label setTextAlignment:NSTextAlignmentCenter];
    [self.label setTextColor:GLOBAL_COLOR(201, 201, 201)];
    [self.label setFont:[UIFont systemFontOfSize:18]];
    [self addSubview:self.label];
}
-(void)setImage:(UIImage *)image
{
    [super setImage:image];
    uint width = CGImageGetWidth(image.CGImage);
    uint height = CGImageGetHeight(image.CGImage);
    NSString* text = [NSString stringWithFormat:@"%dX%d", width, height];
    [self.label setText:text];
}
@end

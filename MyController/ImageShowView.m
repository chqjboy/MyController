//
//  ImageShowView.m
//  MyController
//
//  Created by 陈前进 on 16/9/7.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "ImageShowView.h"
#import "Functions.h"
@implementation ImageShowView
-(ImageShowView*)initWithFrame:(CGRect)rect andImage:(UIImage*)image
{
    self = [super initWithFrame:rect];
    self.image = image;
    [self initViews];
    [self setBackgroundColor:[UIColor blackColor]];
    [Functions addTapEventWithTarget:self View:self andAction:@selector(viewClick)];
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    CGRect rtImage = rect;
    rtImage.origin.x = 20;
    rtImage.origin.y = 50;
    rtImage.size.width = rect.size.width-2*rtImage.origin.x;
    rtImage.size.height = rtImage.size.width*self.image.size.height/self.image.size.width;
    [self initImageViewWithRect:rtImage];
}
-(void)initImageViewWithRect:(CGRect)rect
{
    self.imageView = [[UIImageView alloc]initWithFrame:rect];
    [self.imageView setImage:self.image];
    [self addSubview:self.imageView];
}
-(void)viewClick
{
    [self removeFromSuperview];
}
@end

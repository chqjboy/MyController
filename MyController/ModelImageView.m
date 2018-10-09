//
//  ModelImageView.m
//  MyController
//
//  Created by 陈前进 on 16/4/11.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "ModelImageView.h"
#import "Global.h"
@implementation ModelImageView
-(ModelImageView*)initWithImage:(UIImage*)image
{
    self = [super init];
    self.layer.contents = (__bridge id)image.CGImage;
    self.layer.backgroundColor = GLOBAL_ACOLOR(0, 0, 0, 1).CGColor;
    self.layer.contentsGravity = kCAGravityResizeAspectFill;
    self.layer.contentsScale = [UIScreen mainScreen].scale;
    [Functions addTapEventWithTarget:self View:self andAction:@selector(fadeModel)];
    return self;
}
-(void)doModel
{
    UIWindow* keyWindow = [UIApplication sharedApplication].keyWindow;
    [self setFrame:keyWindow.bounds];
    [keyWindow addSubview:self];
}
-(void)fadeModel
{
    [self removeFromSuperview];
}
@end

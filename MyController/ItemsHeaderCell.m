//
//  ItemsHeaderCell.m
//  MyController
//
//  Created by 陈前进 on 16/4/25.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "ItemsHeaderCell.h"
#import "Global.h"
@implementation ItemsHeaderCell
-(ItemsHeaderCell*)initWithFrame:(CGRect)rect andImage:(NSString*)image
{
    self = [super initWithFrame:rect];
    self.image = image;
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    [self initImageViewWithRect:rect];
}
-(void)initImageViewWithRect:(CGRect)rect
{
    UIImage* image = [UIImage imageNamed:self.image];
    if (image==nil)
    {
        return;
    }
    self.layer.contents = (__bridge id)image.CGImage;
    self.layer.contentsGravity = kCAGravityResizeAspectFill;
}
@end

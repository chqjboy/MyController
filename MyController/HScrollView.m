//
//  HScrollView.m
//  MyController
//
//  Created by 陈前进 on 16/4/25.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "HScrollView.h"

@implementation HScrollView
-(HScrollView*)initWithFrame:(CGRect)rect
{
    self = [super initWithFrame:rect];
    self.views = [[NSMutableArray alloc]initWithCapacity:20];
    return self;
}
-(void)addItemWithView:(UIView*)view
{
    [self.views addObject:view];
}
-(void)removeAllItems
{
    for (UIView* view in self.views)
    {
        [view removeFromSuperview];
    }
    [self.views removeAllObjects];
}
-(void)reloadItems
{
    CGRect rect = self.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    for (UIView* view in self.views)
    {
        CGRect rtView = view.frame;
        rtView.origin = rect.origin;
        view.frame = rtView;
        [self addSubview:view];
        rect.origin.x += rtView.size.width;
    }
    [self setContentSize:CGSizeMake(rect.origin.x, rect.size.height)];
}
@end

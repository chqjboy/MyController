//
//  AutoScrollView.m
//  MyController
//
//  Created by 陈前进 on 16/3/23.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "VScrollView.h"

@implementation VScrollView
-(VScrollView*)initWithFrame:(CGRect)rect
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
        rect.origin.y += rtView.size.height;
    }
    [self setContentSize:CGSizeMake(rect.size.width, rect.origin.y)];
}
@end

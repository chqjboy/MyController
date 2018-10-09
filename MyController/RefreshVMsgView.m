//
//  RefreshVMsgView.m
//  MyController
//
//  Created by 陈前进 on 16/8/9.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "RefreshVMsgView.h"

@implementation RefreshVMsgView
-(RefreshVMsgView*)initWithFrame:(CGRect)rect
{
    self = [super initWithFrame:rect];
    self.cells = [[NSMutableArray alloc]init];
    [self initViews];
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    
    CGRect rtScroll = rect;
    [self initScrollViewWithRect:rtScroll];
}
-(void)initScrollViewWithRect:(CGRect)rect
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:rect];
    [self.scrollView setContentSize:CGSizeMake(rect.size.width, rect.size.height)];
    [self.scrollView setDecelerationRate:UIScrollViewDecelerationRateFast];
    [self addSubview:self.scrollView];
}
-(void)addCellWithParam:(Param_RefreshVMsgViewCell*)param
{
    CGRect rect = self.scrollView.bounds;
    RefreshVMsgViewCell* cell = [[RefreshVMsgViewCell alloc]initWithFrame:rect andParam:param];
    CGRect rtCell = cell.frame;
    if (self.cells==nil ||
        self.cells.count<=0)
    {
        [self.scrollView addSubview:cell];
    }else
    {
        UIView* last = [self.cells objectAtIndex:self.cells.count-1];
        CGRect rtLast = last.frame;
        
        rtCell.origin.y = rtLast.origin.y+rtLast.size.height;
        cell.frame = rtCell;
        [self.scrollView addSubview:cell];
    }
    if (rtCell.origin.y+rtCell.size.height>rect.size.height)
    {
        [self.scrollView setContentSize:CGSizeMake(rect.size.width, rtCell.origin.y+rtCell.size.height)];
        [self.scrollView setContentOffset:CGPointMake(0, rtCell.origin.y+rtCell.size.height-rect.size.height) animated:YES];
    }
    [self.cells addObject:cell];
}
@end

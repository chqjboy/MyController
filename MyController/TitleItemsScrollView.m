//
//  TabItemsScrollView.m
//  MyController
//
//  Created by 陈前进 on 16/8/10.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "TitleItemsScrollView.h"
#import "Functions.h"
@implementation Param_TitleItem
@end

@implementation Param_TitleItemsScrollView
@end

@implementation TitleItemsScrollView
-(TitleItemsScrollView*)initWithFrame:(CGRect)rect andParam:(Param_TitleItemsScrollView*)param
{
    self = [super initWithFrame:rect];
    self.param = param;
    [self initViews];
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    
    CGRect rtTitleScroll = rect;
    rtTitleScroll.size.height = self.param.titleHeight;
    [self initTitleScrollViewWithRect:rtTitleScroll];
    
    CGRect rtItemScroll = rect;
    rtItemScroll.size.height = rect.size.height-rtTitleScroll.size.height;
    rtItemScroll.origin.y = rtTitleScroll.origin.y+rtTitleScroll.size.height;
    [self initItemScrollViewWithRect:rtItemScroll];
}
-(void)initTitleScrollViewWithRect:(CGRect)rect
{
    self.titleScrollView = [[HScrollView alloc]initWithFrame:rect];
    [self.titleScrollView setShowsVerticalScrollIndicator:NO];
    [self.titleScrollView setShowsHorizontalScrollIndicator:NO];
    [self.titleScrollView setClipsToBounds:YES];
    [self addSubview:self.titleScrollView];
    
    for (Param_TitleItem* titleitem in self.param.titleItems)
    {
        [Functions addTapEventWithTarget:self View:titleitem.title andAction:@selector(titleClick:)];
        [self.titleScrollView addItemWithView:titleitem.title];
    }
    [self.titleScrollView reloadItems];
}
-(void)initItemScrollViewWithRect:(CGRect)rect
{
    self.itemScrollView = [[HScrollView alloc]initWithFrame:rect];
    [self.itemScrollView setShowsHorizontalScrollIndicator:NO];
    [self.itemScrollView setShowsVerticalScrollIndicator:NO];
    [self.itemScrollView setClipsToBounds:YES];
    [self.itemScrollView setPagingEnabled:YES];
    self.itemScrollView.delegate = self;
    [self addSubview:self.itemScrollView];
    
    for (Param_TitleItem* titleitem in self.param.titleItems)
    {
        
        [self.itemScrollView addItemWithView:titleitem.item];
    }
    [self.itemScrollView reloadItems];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = [self getCurPageIndex];
    [self moveTitleCenterWithIndex:index];
}
-(NSInteger)getCurPageIndex
{
    return (int)(self.itemScrollView.contentOffset.x/self.itemScrollView.bounds.size.width);
}
-(void)moveTitleCenterWithIndex:(NSInteger)index
{
    CGFloat width = self.titleScrollView.bounds.size.width;
    CGFloat sizewidth = self.titleScrollView.contentSize.width;
    if (width>sizewidth)
    {
        return;
    }
    Param_TitleItem* titleItem = [self.param.titleItems objectAtIndex:index];
    CGFloat x = titleItem.title.center.x;
    if (x<=width/2)
    {
        [self.titleScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }else if(x>=sizewidth-width/2)
    {
        [self.titleScrollView setContentOffset:CGPointMake(sizewidth-width, 0) animated:YES];
    }else
    {
        [self.titleScrollView setContentOffset:CGPointMake(x-width/2, 0) animated:YES];
    }
    
    if (self.delegate!=nil &&
        [self.delegate respondsToSelector:@selector(titleItemsUpdateToParam:andIndex:)])
    {
        [self.delegate titleItemsUpdateToParam:[self.param.titleItems objectAtIndex:index] andIndex:index];
    }
}
-(void)titleClick:(id)sender
{
    UITapGestureRecognizer* gesture = sender;
    for (Param_TitleItem* titleItem in self.param.titleItems)
    {
        if (titleItem.title==gesture.view)
        {
            [self setCurpage:[self.param.titleItems indexOfObject:titleItem]];
        }
    }
}
-(void)setCurpage:(NSInteger)index
{
    [self.itemScrollView setContentOffset:CGPointMake(index*self.itemScrollView.bounds.size.width, 0) animated:NO];
    [self moveTitleCenterWithIndex:index];
}
@end

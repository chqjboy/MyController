//
//  ItemsScrollView.m
//  MyController
//
//  Created by 陈前进 on 16/4/25.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "ItemsScrollView.h"
#import "Device.h"
@implementation Param_ItemsScrollView
@end
@implementation ItemsScrollView
-(ItemsScrollView*)initWithFrame:(CGRect)rect andParam:(Param_ItemsScrollView*)param
{
    self = [super initWithFrame:rect];
    self.param = param;
    [self initViews];
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    
    CGRect rtGridView = rect;
    if (self.param.headers!=nil && self.param.headers.count>0)
    {
        rtGridView.origin.x = 5*[Device getHScale];
        rtGridView.size.width = rect.size.width-2*rtGridView.origin.x;
        rtGridView.size.height = self.param.headerheight;
        [self initGridViewWithRect:rtGridView];
    }else
    {
        rtGridView.size.height=0;
    }
    
    CGRect rtHScroll = rect;
    rtHScroll.origin.y = rtGridView.origin.y+rtGridView.size.height;
    rtHScroll.size.height = rect.size.height-rtGridView.size.height;
    [self initHScrollWithRect:rtHScroll];
}
-(void)initGridViewWithRect:(CGRect)rect
{
    Param_GridView* param = [[Param_GridView alloc]init];
    param.colum = self.param.headers.count;
    param.height = self.param.headerheight;
    param.cells = [NSMutableArray arrayWithArray:self.param.headers];
    
    self.gridView = [[GridView alloc]initWithFrame:rect andParam:param];
    [self addSubview:self.gridView];
}
-(void)initHScrollWithRect:(CGRect)rect
{
    self.hscroll = [[HScrollView alloc]initWithFrame:rect];
    self.hscroll.delegate = self;
    self.hscroll.pagingEnabled = YES;
    for (UIView* view in self.param.items)
    {
        [self.hscroll addItemWithView:view];
    }
    [self.hscroll reloadItems];
    [self addSubview:self.hscroll];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x/scrollView.bounds.size.width!=self.selPageIndex)
    {
        self.selPageIndex = scrollView.contentOffset.x/scrollView.bounds.size.width;
        if (self.delegate!=nil&&
            [self.delegate respondsToSelector:@selector(selItemWithIndex:)])
        {
            [self.delegate selItemWithIndex:self.selPageIndex];
        }
    }
}
@end

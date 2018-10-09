//
//  PickerColumnView.m
//  MyController
//
//  Created by 陈前进 on 17/4/1.
//  Copyright © 2017年 mycontroller. All rights reserved.
//

#import "PickerColumnView.h"
@implementation PickerColumn
@end

@implementation Param_PickerColumnView
@end

@implementation PickerColumnView
@synthesize delegate = _delegate;
-(PickerColumnView*)initWithFrame:(CGRect)rect andParam:(Param_PickerColumnView*)param andData:(PickerColumn*)data
{
    self = [super initWithFrame:rect];
    self.param = param;
    self.data = data;
    if (self.param.showlines==0)
    {
        self.param.showlines = 1;
    }
    [self initViews];
    [self reloadContent];
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    [self initVScrollViewWithRect:rect];
    [self initMaskViewWithRect:rect];
}
-(void)initVScrollViewWithRect:(CGRect)rect
{
    self.vscrollView = [[VScrollView alloc]initWithFrame:rect];
    [self.vscrollView setShowsHorizontalScrollIndicator:NO];
    [self.vscrollView setShowsVerticalScrollIndicator:NO];
    self.vscrollView.delegate = self;
    [self addSubview:self.vscrollView];
}
-(void)initMaskViewWithRect:(CGRect)rect
{
    CGRect rtSelRect = rect;
    rtSelRect.origin.x = 0;
    CGFloat height = [self getLineHeight];
    rtSelRect.origin.y = self.param.selIndex*height;
    rtSelRect.size.height = height;
    self.maskView = [[PickerSelectMaskView alloc]initWithFrame:rect andSelRect:rtSelRect andParam:self.param.paramMask];
    self.maskView.userInteractionEnabled = NO;
    [self.layer addSublayer:self.maskView.layer];
}
-(void)reloadContent
{
    [self.vscrollView removeAllItems];
    CGRect rect = self.vscrollView.bounds;
    CGRect rtCell = rect;
    rtCell.size.height  = [self getLineHeight];
    
    [self loadPreAddtionCellWithRect:rtCell];
    [self loadCellsWithRect:rtCell];
    [self loadBckAddtionCellWithRect:rtCell];
    [self.vscrollView reloadItems];
    [self.vscrollView setContentOffset:CGPointMake(0, 0)];
}
-(void)loadPreAddtionCellWithRect:(CGRect)rect
{
    for (int i=0; i<[self getPreAdditionCellCount]; i++)
    {
        UIView* view = [[UIView alloc]initWithFrame:rect];
        [self.vscrollView addItemWithView:view];
    }
}
-(void)loadCellsWithRect:(CGRect)rect
{
    for (PickerData* data in self.data.items)
    {
        PickerDataCell* cell = [[PickerDataCell alloc]initWithFrame:rect andParam:self.param.paramCell andData:data];
        [self.vscrollView addItemWithView:cell];
    }
}
-(void)loadBckAddtionCellWithRect:(CGRect)rect
{
    for (int i=0; i<[self getBckAdditionCellCount]; i++)
    {
        UIView* view = [[UIView alloc]initWithFrame:rect];
        [self.vscrollView addItemWithView:view];
    }
}
-(void)reloadData:(PickerColumn*)data
{
    self.data = data;
    [self reloadContent];
}
-(NSInteger)getPreAdditionCellCount
{
    if (self.data.items==nil ||
        self.data.items.count<=0)
    {
        return 0;
    }
    return self.param.selIndex;
}
-(CGFloat)getLineHeight
{
    return self.vscrollView.bounds.size.height/self.param.showlines;
}
-(NSInteger)getBckAdditionCellCount
{
    if (self.data.items==nil ||
        self.data.items.count<=0)
    {
        return 0;
    }
    return self.param.showlines-1-self.param.selIndex;
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self selectData];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
    {
        scrollView.decelerationRate = 0.5;
        CGFloat lineHeight = [self getLineHeight];
        CGFloat offset = scrollView.contentOffset.y;
        
        NSInteger index = (NSInteger)(offset/lineHeight);
        if (offset-index*lineHeight>=0.5*lineHeight)
        {
            index++;
        }
        if (offset!=index*lineHeight)
        {
            [scrollView setContentOffset:CGPointMake(0, index*lineHeight) animated:YES];
        }else
        {
            [self selectData];
        }
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat lineHeight = [self getLineHeight];
    CGFloat offset = scrollView.contentOffset.y;
    
    NSInteger index = (NSInteger)(offset/lineHeight);
    if (offset-index*lineHeight>=0.5*lineHeight)
    {
        index++;
    }
    if (offset!=index*lineHeight)
    {
        [scrollView setContentOffset:CGPointMake(0, index*lineHeight) animated:YES];
    }else
    {
        [self selectData];
    }
}
-(void)selectData
{
    if (self.delegate!=nil &&
        [self.delegate respondsToSelector:@selector(pickerColumnViewSelected:)])
    {
        PickerData* data = [self getSelectedData];
        if (self.selData != data)
        {
            self.selData = data;
            [self.delegate pickerColumnViewSelected:self];
        }
    }
}
-(PickerData*)getSelectedData
{
    if (![self.vscrollView isDecelerating])
    {
        CGFloat offset = self.vscrollView.contentOffset.y;
        CGFloat lineHeight = [self getLineHeight];
        
        NSInteger index = (NSInteger)(offset/lineHeight);
        index = index+self.param.selIndex-[self getPreAdditionCellCount];
        if (index <0 || index>=self.data.items.count)
        {
            return nil;
        }
        return self.data.items[index];
    }
    return nil;
}
@end

//
//  GridView.m
//  上门预健
//
//  Created by 陈前进 on 15/12/17.
//  Copyright (c) 2015年 上门预健. All rights reserved.
//

#import "GridView.h"
@implementation Param_GridView
@end
@implementation GridView
-(GridView*)initWithFrame:(CGRect)rect andParam:(Param_GridView*)param
{
    self = [super initWithFrame:rect];
    self.param = param;
    [self initViews];
    return self;
}
-(void)initViews
{
    CGRect rect = self.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    
    CGRect rtCell = rect;
    [self initCellsWithRect:rtCell];
    
    rect = self.frame;
    rect.size.height = self.param.cells.count/self.param.colum*self.param.height;
    if (self.param.cells.count%self.param.colum)
    {
        rect.size.height += self.param.height;
    }
    self.frame = rect;
}
-(void)initCellsWithRect:(CGRect)rect
{
    CGFloat width = rect.size.width/self.param.colum;
    CGFloat height = self.param.height;
    for (int i=0; i<self.param.cells.count; i++)
    {
        UIView* view = [self.param.cells objectAtIndex:i];
        CGRect rtCell = view.frame;
        rtCell.origin.x = width*(i%self.param.colum)+(width-rtCell.size.width)/2;
        rtCell.origin.y = height*(i/self.param.colum)+(height-rtCell.size.height)/2;
        view.frame = rtCell;
        [self addSubview:view];
    }
}
@end

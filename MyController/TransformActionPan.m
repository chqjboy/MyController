//
//  TransformActionPan.m
//  MyController
//
//  Created by 陈前进 on 17/7/4.
//  Copyright © 2017年 mycontroller. All rights reserved.
//

#import "TransformActionPan.h"

@implementation TransformActionPan
@synthesize delegate=_delegate;
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self initViews];
    [self setBackgroundColor:GLOBAL_ACOLOR(31, 224, 149, 0.5)];
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    [self initScrollWithRect:rect];
}
-(void)initScrollWithRect:(CGRect)rect
{
    self.vscrollView = [[VScrollView alloc]initWithFrame:rect];
    [self reloadContent];
    [self addSubview:self.vscrollView];
}
-(void)reloadContent
{

    [self.vscrollView removeAllItems];
    NSArray* items = @[
                       @{
                           @"name":@"默认设置",
                           @"action":@(eTransformAction_def)
                        },
                       @{
                           @"name":@"切图(0,0,50,100)",
                           @"action":@(eTransformAction_atrect)
                        },
                       @{
                           @"name":@"修改尺寸(+10,+20)",
                           @"action":@(eTransformAction_insize)
                        },
                       @{
                           @"name":@"等比缩放(X1.5)",
                           @"action":@(eTransformAction_scale)
                        },
                       @{
                           @"name":@"内置(0,0,500,100)",
                           @"action":@(eTransformAction_scaleinrect)
                        },
                       @{
                           @"name":@"外围(0,0,100,500)",
                           @"action":@(eTransformAction_scalewraprect)
                        },
                       @{
                           @"name":@"旋转(+M_PI_2)",
                           @"action":@(eTransformAction_rotate)
                        }
                       ];
    CGRect rect = self.vscrollView.bounds;
    for (NSDictionary* dic in items)
    {
        Param_TransformActionCell* param = [[Param_TransformActionCell alloc]init];
        [param setValuesForKeysWithDictionary:dic];
        TransformActionCell* cell = [[TransformActionCell alloc]initWithFrame:rect andParam:param];
        [Functions addTapEventWithTarget:self View:cell andAction:@selector(cellClick:)];
        [self.vscrollView addItemWithView:cell];
    }
    [self.vscrollView reloadItems];
}
-(void)cellClick:(UIGestureRecognizer*)recognize
{
    TransformActionCell* cell = (TransformActionCell*)recognize.view;
    if (self.delegate!=nil &&
        [self.delegate respondsToSelector:@selector(transformAction:)])
    {
        [self.delegate transformAction:cell.param.action.integerValue];
    }
}
@end

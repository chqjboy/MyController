//
//  GridView.h
//  上门预健
//
//  Created by 陈前进 on 15/12/17.
//  Copyright (c) 2015年 上门预健. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface Param_GridView:NSObject
@property NSInteger colum;
@property CGFloat height;
@property(nonatomic, retain) NSMutableArray* cells;
@end

@interface GridView : UIView
@property(nonatomic, retain) Param_GridView* param;
-(GridView*)initWithFrame:(CGRect)rect andParam:(Param_GridView*)param;
-(void)initViews;
-(void)initCellsWithRect:(CGRect)rect;
@end

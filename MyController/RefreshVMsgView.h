//
//  RefreshVMsgView.h
//  MyController
//
//  Created by 陈前进 on 16/8/9.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshVMsgViewCell.h"
@interface RefreshVMsgView : UIView
@property(nonatomic, retain) UIScrollView* scrollView;
@property(nonatomic, retain) NSMutableArray* cells;
-(RefreshVMsgView*)initWithFrame:(CGRect)rect;
-(void)initViews;
-(void)initScrollViewWithRect:(CGRect)rect;
-(void)addCellWithParam:(Param_RefreshVMsgViewCell*)param;
@end

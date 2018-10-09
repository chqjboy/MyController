//
//  RefreshVMsgViewCell.h
//  MyController
//
//  Created by 陈前进 on 16/8/9.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitLineLabel.h"
@interface Param_RefreshVMsgViewCell:NSObject
@property(nonatomic, retain) NSString* header;
@property(nonatomic, retain) NSString* name;
@property(nonatomic, retain) NSString* message;
@end
@interface RefreshVMsgViewCell : UIView
@property(nonatomic, retain) Param_RefreshVMsgViewCell* param;
@property(nonatomic, retain) UIView* backView;
@property(nonatomic, retain) UIImageView* header;
@property(nonatomic, retain) FitLineLabel* name;
@property(nonatomic, retain) FitLineLabel* message;


-(RefreshVMsgViewCell*)initWithFrame:(CGRect)rect andParam:(Param_RefreshVMsgViewCell*)param;
-(void)initViews;
-(void)initBackViewWithRect:(CGRect)rect;
-(void)initHeaderWithRect:(CGRect)rect;
-(void)initNameWithRect:(CGRect)rect;
-(void)initMessageWithRect:(CGRect)rect;
@end

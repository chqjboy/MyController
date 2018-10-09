//
//  TransformActionCell.h
//  MyController
//
//  Created by 陈前进 on 17/7/4.
//  Copyright © 2017年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface Param_TransformActionCell:NSObject
@property(nonatomic, retain) NSString* name;
@property(nonatomic, retain) NSString* action;
@end
@interface TransformActionCell : UIView
@property(nonatomic, retain) Param_TransformActionCell* param;
@property(nonatomic, retain) UILabel* label;

-(instancetype)initWithFrame:(CGRect)frame andParam:(Param_TransformActionCell*)param;

@end

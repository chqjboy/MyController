//
//  PickerCell.h
//  MyController
//
//  Created by 陈前进 on 17/4/1.
//  Copyright © 2017年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PickerData : NSObject
@property(nonatomic, retain) NSString* title;
@property(nonatomic, retain) id data;
@end

@interface Param_PickerDataCell : NSObject
@property(nonatomic, retain) UIFont* font;
@property(nonatomic, retain) UIColor* color;
@end

@interface PickerDataCell : UIView
@property(nonatomic, retain) PickerData* data;
@property(nonatomic, retain) Param_PickerDataCell* param;

@property(nonatomic, retain) UILabel* title;

-(PickerDataCell*)initWithFrame:(CGRect)rect andParam:(Param_PickerDataCell*)param andData:(PickerData*)data;
@end

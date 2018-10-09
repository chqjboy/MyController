//
//  SDateTimePickerView.h
//  MyController
//
//  Created by 陈前进 on 17/4/5.
//  Copyright © 2017年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerColumnView.h"
#import "Global.h"
#import "FitLineLabel.h"
@interface Param_SDateTimePickerView:NSObject
@property(nonatomic, retain) Param_PickerColumnView* paramPickerColumnView;
@property(nonatomic, retain) PickerColumn* date;
@end

@interface SDateTimePickerView : UIView
<
PickerColumnViewDelegate
>
@property(nonatomic, retain) NSArray<NSString*>* timstamps;
@property(nonatomic, retain) Param_SDateTimePickerView* param;
@property(nonatomic, retain) PickerColumnView* date;
@property(nonatomic, retain) PickerColumnView* hour;
@property(nonatomic, retain) FitLineLabel* label;
@property(nonatomic, retain) PickerColumnView* minute;

-(SDateTimePickerView*)initWithFrame:(CGRect)rect andParam:(NSArray*)timestamps;
-(NSString*)getSelectTimeStamp;
@end

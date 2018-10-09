//
//  PickerSelectMaskView.h
//  MyController
//
//  Created by 陈前进 on 17/4/1.
//  Copyright © 2017年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface Param_PickerSelectMaskView : NSObject
@property(nonatomic, retain) UIColor* clrMask;
@property(nonatomic, retain) UIColor* clrIndicator;
@property(nonatomic, assign) CGFloat indicateorHeight;
@end
@interface PickerSelectMaskView : UIView
@property(nonatomic, retain) Param_PickerSelectMaskView* param;
@property(nonatomic, assign) CGRect selRect;
@property(nonatomic, retain) UIView* preMask;
@property(nonatomic, retain) UIView* preIndicator;
@property(nonatomic, retain) UIView* bckMask;
@property(nonatomic, retain) UIView* bckIndicator;

-(PickerSelectMaskView*)initWithFrame:(CGRect)rect andSelRect:(CGRect)selRect andParam:(Param_PickerSelectMaskView*)param;

@end

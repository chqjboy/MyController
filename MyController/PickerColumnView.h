//
//  PickerColumnView.h
//  MyController
//
//  Created by 陈前进 on 17/4/1.
//  Copyright © 2017年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerDataCell.h"
#import "VScrollView.h"
#import "PickerSelectMaskView.h"
@interface PickerColumn :NSObject
@property(nonatomic, retain) NSMutableArray<PickerData*>* items;
@property(nonatomic, retain) id data;
@end

@interface Param_PickerColumnView : NSObject
@property(nonatomic, retain) Param_PickerDataCell* paramCell;
@property(nonatomic, assign) NSInteger showlines; //显示的行数
@property(nonatomic, assign) NSInteger selIndex; //被选项在显示行数中的序号（由0开始）
@property(nonatomic, retain) Param_PickerSelectMaskView* paramMask;
@end

@class PickerColumnView;

@protocol PickerColumnViewDelegate <NSObject>
-(void)pickerColumnViewSelected:(PickerColumnView*)pickerView;
@end
@interface PickerColumnView : UIView
<
UIScrollViewDelegate
>
{
    id<PickerColumnViewDelegate> _delegate;
}
@property(nonatomic, retain) id<PickerColumnViewDelegate> delegate;
@property(nonatomic, retain) Param_PickerColumnView* param;
@property(nonatomic, retain) PickerColumn* data;
@property(nonatomic, retain) VScrollView* vscrollView;
@property(nonatomic, retain) PickerSelectMaskView* maskView;
@property(nonatomic, retain) PickerData* selData;
-(PickerColumnView*)initWithFrame:(CGRect)rect andParam:(Param_PickerColumnView*)param andData:(PickerColumn*)data;
-(void)reloadData:(PickerColumn*)data;
-(PickerData*)getSelectedData;
@end

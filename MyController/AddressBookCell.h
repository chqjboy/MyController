//
//  AddressBookCell.h
//  MyController
//
//  Created by 陈前进 on 16/11/1.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import "FitLineLabel.h"
@protocol AddressBookCellDelegate<NSObject>
-(void)cellClickWithView:(UIView*)view;
@end
@interface AddressBookCell : UIView
{
    id<AddressBookCellDelegate>delegate;
}
@property(nonatomic, retain) id<AddressBookCellDelegate>delegate;
@property(nonatomic, retain) FitLineLabel* name;
@property(nonatomic, retain) UIImageView* arrow;
@property(nonatomic, retain) NSString* nameValue;

-(AddressBookCell*)initWithFrame:(CGRect)rect andName:(NSString*)name;
-(void)initViews;
-(void)initNameWithRect:(CGRect)rect;
-(void)initArrowWithRect:(CGRect)rect;
-(void)cellClick;
@end

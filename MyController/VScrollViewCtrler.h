//
//  VScrollViewCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/3/24.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "VScrollView.h"
#import "VScrollCell.h"
@interface VScrollViewCtrler : NavigationCtrler
<
UITextFieldDelegate
>
@property(nonatomic, retain) UITextField* textField;
@property(nonatomic, retain) VScrollView* vscrollView;
@property(nonatomic, retain) NSMutableArray* strings;//nsstring

-(void)initViews;
-(void)initTextFieldWithRect:(CGRect)rect;
-(void)initVScrollViewWithRect:(CGRect)rect;
-(void)reloadContent;
-(void)backClick;
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
@end

//
//  HScrollView.h
//  MyController
//
//  Created by 陈前进 on 16/4/25.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HScrollView : UIScrollView
@property(nonatomic, retain) NSMutableArray* views;
-(HScrollView*)initWithFrame:(CGRect)rect;
-(void)addItemWithView:(UIView*)view;
-(void)removeAllItems;
-(void)reloadItems;
@end

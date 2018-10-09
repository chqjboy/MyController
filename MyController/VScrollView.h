//
//  AutoScrollView.h
//  MyController
//
//  Created by 陈前进 on 16/3/23.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VScrollView : UIScrollView
@property(nonatomic, retain) NSMutableArray* views;
-(VScrollView*)initWithFrame:(CGRect)rect;
-(void)addItemWithView:(UIView*)view;
-(void)removeAllItems;
-(void)reloadItems;
@end

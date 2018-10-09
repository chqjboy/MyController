//
//  TabbarCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/3/24.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationCtrler.h"
#import "Global.h"
#import "TabItemCtrler.h"
@interface Param_TabItem:NSObject
@property(nonatomic, retain) TabItemCtrler* ctrler;
@property(nonatomic, retain) NSString* selimage;
@property(nonatomic, retain) NSString* nomimage;
@property(nonatomic, retain) NSString* title;
@end
@interface TabbarCtrler : UITabBarController
@property(nonatomic, retain) NSArray* items; //Param_TabItem
-(TabbarCtrler*)initWithItems:(NSArray*)items;
-(void)loadItems;
@end

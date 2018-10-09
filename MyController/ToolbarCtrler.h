//
//  ToolbarCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/3/23.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "Global.h"
#import "NavigationCtrler.h"
#import "TabbarCtrler.h"
#import "TabItemCtrler.h"
@interface ToolbarCtrler : NavigationCtrler
<
NavigationCtrlerDelegate
>
@property(nonatomic, retain) TabbarCtrler* tabbarCtrler;
-(void)backClick;
-(void)initViews;
-(void)initTabbarCtrler;
-(void)backWithCtrler:(id)ctrler;
@end

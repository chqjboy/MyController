//
//  RootViewCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/3/23.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import "RootViewCell.h"
#import "NavigationCtrler.h"
#import "VScrollView.h"
#import "ImageTransform.h"

@interface RootViewCtrler : NavigationCtrler
<
NavigationCtrlerDelegate
>
@property(nonatomic, retain) NSArray* cells;
@property(nonatomic, retain) VScrollView* vscrollView;
@property(nonatomic, retain) ImageTransform* imageTrans;
@end


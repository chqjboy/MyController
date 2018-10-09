//
//  RootViewCell.h
//  MyController
//
//  Created by 陈前进 on 16/3/23.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationCtrler.h"
#import "Global.h"
#import "FitLineLabel.h"
#import "AlbumCtrler.h"
@interface Param_RootViewCell:NSObject
{
    NSString* _title;
    Class _clsCtrler;
}
@property(nonatomic, retain) NSString* title;
@property(nonatomic, assign) Class clsCtrler;
@end
@interface RootViewCell : UIView
<
NavigationCtrlerDelegate,
AlbumCtrlerCallback
>
@property(nonatomic, retain) FitLineLabel* name;
@property(nonatomic, retain) UIImageView* arrow;
@property(nonatomic, retain) Param_RootViewCell* param;
@property(nonatomic, retain) NavigationCtrler* ctrler;

-(RootViewCell*)initWithFrame:(CGRect)rect andParam:(Param_RootViewCell*)param;

@end

//
//  VScrollCell.h
//  MyController
//
//  Created by 陈前进 on 16/3/25.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitLineLabel.h"
#import "Global.h"
@interface VScrollCell : UIView
@property(nonatomic, retain) FitLineLabel* name;
@property(nonatomic, retain) NSString* nameValue;
-(VScrollCell*)initWithFrame:(CGRect)rect andName:(NSString*)name;
-(void)initViews;
-(void)initNameWithRect:(CGRect)rect;
@end

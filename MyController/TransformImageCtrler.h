//
//  TransformImageCtrler.h
//  MyController
//
//  Created by 陈前进 on 17/7/4.
//  Copyright © 2017年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "TransImageShowPan.h"
#import "TransformActionPan.h"
#import "TransformImage.h"
@interface TransformImageCtrler : NavigationCtrler
<
TransformActionPanDelegate
>
@property(nonatomic, retain) TransImageShowPan* show;
@property(nonatomic, retain) TransformActionPan* action;
@property(nonatomic, retain) UIImage* image;
@end

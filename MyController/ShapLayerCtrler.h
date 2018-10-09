//
//  ShapLayerCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/4/6.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "Global.h"
@interface ShapLayerCtrler : NavigationCtrler
<
CoreAnimationCallback
>
-(void)backClick;
-(void)initViews;
@end

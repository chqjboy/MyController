//
//  EmitterLayerCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/4/7.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "Global.h"
@interface EmitterLayerCtrler : NavigationCtrler
<
CoreAnimationCallback
>
@property(nonatomic, retain) CAEmitterLayer* layer;
-(void)backClick;
-(void)initViews;
-(void)initLayerWithRect:(CGRect)rect;
@end

//
//  ReplicatorLayer.h
//  MyController
//
//  Created by 陈前进 on 16/4/7.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "Global.h"
@interface ReplicatorLayerCtrler : NavigationCtrler
<
CoreAnimationCallback
>
@property(nonatomic, retain) CAReplicatorLayer* layer1;
@property(nonatomic, retain) CAReplicatorLayer* layer2;
-(void)backClick;
-(void)initViews;
-(void)initLayer1WithRect:(CGRect)rect;
-(void)initLayer2WithRect:(CGRect)rect;
@end

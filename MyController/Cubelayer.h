//
//  Cubelayer.h
//  MyController
//
//  Created by 陈前进 on 16/4/6.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cubelayer : CALayer
@property(nonatomic, retain)CALayer* layer1;
@property(nonatomic, retain)CALayer* layer2;
@property(nonatomic, retain)CALayer* layer3;
@property(nonatomic, retain)CALayer* layer4;
@property(nonatomic, retain)CALayer* layer5;
@property(nonatomic, retain)CALayer* layer6;

-(Cubelayer*)initWithFrame:(CGRect)rect;
-(void)initLayers;
@end

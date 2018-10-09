//
//  Cubelayer.m
//  MyController
//
//  Created by 陈前进 on 16/4/6.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "Cubelayer.h"

@implementation Cubelayer

-(Cubelayer*)initWithFrame:(CGRect)rect
{
    self = [super init];
    self.frame = rect;
    [self initLayers];
    return self;
}

-(void)initLayers
{
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    self.sublayerTransform = perspective;
    
    CGRect rect = self.bounds;
    CGFloat offset = rect.size.height/2;
    
    self.layer1 = [[CALayer alloc]init];
    self.layer1.frame = rect;
    self.layer1.backgroundColor= [UIColor orangeColor].CGColor;
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, offset);
    self.layer1.transform = transform;
    [self addSublayer:self.layer1];
    
    self.layer2 = [[CALayer alloc]init];
    self.layer2.frame = rect;
    self.layer2.backgroundColor= [UIColor yellowColor].CGColor;
    transform = CATransform3DMakeTranslation(offset, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    self.layer2.transform = transform;
    [self addSublayer:self.layer2];
    
    self.layer3 = [[CALayer alloc]init];
    self.layer3.frame = rect;
    self.layer3.backgroundColor= [UIColor redColor].CGColor;
    transform = CATransform3DMakeTranslation(0, -offset, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    self.layer3.transform = transform;
    [self addSublayer:self.layer3];
    
    self.layer4 = [[CALayer alloc]init];
    self.layer4.frame = rect;
    self.layer4.backgroundColor= [UIColor greenColor].CGColor;
    transform = CATransform3DMakeTranslation(0, offset, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    self.layer4.transform = transform;
    [self addSublayer:self.layer4];
    
    self.layer5 = [[CALayer alloc]init];
    self.layer5.frame = rect;
    self.layer5.backgroundColor= [UIColor grayColor].CGColor;
    transform = CATransform3DMakeTranslation(-offset, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    self.layer5.transform = transform;
    [self addSublayer:self.layer5];
    
    self.layer6 = [[CALayer alloc]init];
    self.layer6.frame = rect;
    self.layer6.backgroundColor= [UIColor blueColor].CGColor;
    transform = CATransform3DMakeTranslation(0, 0, -offset);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    self.layer6.transform = transform;
    [self addSublayer:self.layer6];
}
@end

//
//  ReplicatorLayer.m
//  MyController
//
//  Created by 陈前进 on 16/4/7.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "ReplicatorLayerCtrler.h"

@interface ReplicatorLayerCtrler ()

@end

@implementation ReplicatorLayerCtrler

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)backClick
{
    if (self.delegate!=nil &&
        [self.delegate respondsToSelector:@selector(backWithCtrler:)])
    {
        [self.delegate backWithCtrler:self];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)initViews
{
    CGRect rect = self.view.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    
    CGRect rtLayer1 = rect;
    rtLayer1.size.height = 100;
    rtLayer1.size.width = 300;
    rtLayer1.origin.x = (rect.size.width-rtLayer1.size.width)/2;
    rtLayer1.origin.y = 20;
    [self initLayer1WithRect:rtLayer1];
    
    CGRect rtLayer2=rtLayer1;
    rtLayer2.origin.y = rtLayer1.origin.y+rtLayer1.size.height+20;
    [self initLayer2WithRect:rtLayer2];
}

-(void)initLayer1WithRect:(CGRect)rect
{//偏移复制
    self.layer1 = [CAReplicatorLayer layer];
    self.layer1.frame = rect;
    [self.view.layer addSublayer:self.layer1];
    //configure the replicator
    self.layer1.instanceCount = 3;
    //apply a transform for each instance
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 100, 0, 0);
    //transform = CATransform3DRotate(transform, M_PI / 5.0, 0, 0, 1);
    //transform = CATransform3DTranslate(transform, 0, -200, 0);
    self.layer1.instanceTransform = transform;
    self.layer1.instanceBlueOffset = -0.33;
    self.layer1.instanceGreenOffset = -0.33;

    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(10, 10, 80.0f, 80.0f);
    layer.backgroundColor = [UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1].CGColor;
    [self.layer1 addSublayer:layer];
}
-(void)initLayer2WithRect:(CGRect)rect
{//反射
    self.layer2 = [CAReplicatorLayer layer];
    self.layer2.frame = rect;
    [self.view.layer addSublayer:self.layer2];
    //configure the replicator
    self.layer2.instanceCount = 2;
    CATransform3D transform = CATransform3DIdentity;
    CGFloat verticalOffset = self.layer2.bounds.size.height + 2;
    transform = CATransform3DTranslate(transform, 0, verticalOffset, 0);
    transform = CATransform3DScale(transform, 1, -1, 0);
    self.layer2.instanceTransform = transform;
    //reduce alpha of reflection layer
    self.layer2.instanceAlphaOffset = -0.6;
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
    layer.backgroundColor = [UIColor grayColor].CGColor;
    layer.contents = (__bridge id)[UIImage imageNamed:@"digit"].CGImage;
    layer.contentsGravity = kCAGravityResizeAspect;
    layer.masksToBounds = YES;
    [self.layer2 addSublayer:layer];
}
@end

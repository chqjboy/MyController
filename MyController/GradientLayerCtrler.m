//
//  GradientLayerCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/4/7.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "GradientLayerCtrler.h"

@interface GradientLayerCtrler ()

@end

@implementation GradientLayerCtrler

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
    rtLayer1.size.width = 100;
    rtLayer1.origin.x = (rect.size.width-rtLayer1.size.width)/2;
    rtLayer1.origin.y = 20;
    [self initLayer1WithRect:rtLayer1];
    
    CGRect rtLayer2=rtLayer1;
    rtLayer2.origin.y = rtLayer1.origin.y+rtLayer1.size.height+20;
    [self initLayer2WithRect:rtLayer2];
    
    CGRect rtLayer3 = rtLayer1;
    rtLayer3.origin.y = rtLayer2.origin.y+rtLayer2.size.height+20;
    [self initlayer3WithRect:rtLayer3];
}

-(void)initLayer1WithRect:(CGRect)rect
{//双色连续单渐变
    self.layer1 = [[CAGradientLayer alloc]init];
    self.layer1.frame = rect;
    
    //set gradient colors
    self.layer1.colors = @[(__bridge id)[UIColor redColor].CGColor,
                           (__bridge id)[UIColor blueColor].CGColor];
    self.layer1.startPoint = CGPointMake(0, 0);
    self.layer1.endPoint = CGPointMake(1, 1);
    
    [self.view.layer addSublayer:self.layer1];
}
-(void)initLayer2WithRect:(CGRect)rect
{//三色连续双渐变
    self.layer2 = [CAGradientLayer layer];
    self.layer2.frame = rect;
    
    self.layer2.colors = @[(__bridge id)[UIColor redColor].CGColor,
                           (__bridge id)[UIColor yellowColor].CGColor,
                           (__bridge id)[UIColor greenColor].CGColor];
    self.layer2.locations = @[@0.0, @0.5, @1];
    self.layer2.startPoint = CGPointMake(0, 0);
    self.layer2.endPoint = CGPointMake(1, 1);
    
    [self.view.layer addSublayer:self.layer2];
}

-(void)initlayer3WithRect:(CGRect)rect
{//四色连续三渐变
    self.layer3 = [CAGradientLayer layer];
    self.layer3.frame = rect;
    
    self.layer3.colors = @[(__bridge id)[UIColor redColor].CGColor,
                           (__bridge id)[UIColor yellowColor].CGColor,
                           (__bridge id)[UIColor greenColor].CGColor,
                           (__bridge id)[UIColor blackColor].CGColor];
    self.layer3.locations = @[@0.0, @0.33, @0.66, @1];
    self.layer3.startPoint = CGPointMake(0, 0);
    self.layer3.endPoint = CGPointMake(1, 1);
    
    [self.view.layer addSublayer:self.layer3];
}

@end

//
//  CAScaleCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/3/30.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "CAScaleCtrler.h"

@interface CAScaleCtrler ()

@end

@implementation CAScaleCtrler

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initAnimation];
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
    
    CGRect rtImage = rect;
    [self initImageViewWithRect:rtImage];
}
-(void)initImageViewWithRect:(CGRect)rect
{
    self.imageView = [[UIImageView alloc]initWithFrame:rect];
    [self.imageView setImage:[UIImage imageNamed:@"animation_picture"]];
    [self.view addSubview:self.imageView];
}

-(void)initAnimation
{
    Param_CAScale* param = [[Param_CAScale alloc]init];
    param.fromeScale = 1.0;
    param.toScale = 0.5;
    param.autorevers = YES;
    param.fillmode = FillMode_forewards;
    param.repeatcount = MAXFLOAT;
    param.duration = 0.5;
    [CoreAnimation scaleLayerAnimation:self.imageView.layer andParam:param andCallBack:self];
}

-(void)animationDidStart:(id)animation
{
    NSLog(@"animationDidStart");
}
-(void)animationDidStop:(id)animation
{
    NSLog(@"animationDidStop");
}

@end

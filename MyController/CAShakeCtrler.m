//
//  CAShakeCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/4/8.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "CAShakeCtrler.h"

@interface CAShakeCtrler ()

@end

@implementation CAShakeCtrler
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
    rtImage.size.width = 50;
    rtImage.size.height = 50;
    rtImage.origin.x = 150-25;
    rtImage.origin.y = 100-25;
    [self initImageViewWithRect:rtImage];
}
-(void)initImageViewWithRect:(CGRect)rect
{
    self.imageView = [[UIImageView alloc]initWithFrame:rect];
    [self.imageView setImage:[UIImage imageNamed:@"ball"]];
    [self.view addSubview:self.imageView];
}

-(void)initAnimation
{
    Param_CAShake* param = [[Param_CAShake alloc]init];
    param.autorevers = NO;
    param.fillmode = FillMode_forewards;
    param.repeatcount = 2;
    param.duration = 1;

    param.keyTimes = @[@0.0, @0.3, @0.5, @0.7, @0.8, @0.9, @0.95, @1.0];
    param.keyMediaTimeFuncs = @[MediaTimeFunc_easein, MediaTimeFunc_easeout,
                                MediaTimeFunc_easein, MediaTimeFunc_easeout,
                                MediaTimeFunc_easein, MediaTimeFunc_easeout,
                                MediaTimeFunc_easein];
    param.points =  @[
                      [NSValue valueWithCGPoint:CGPointMake(150, 32)],
                      [NSValue valueWithCGPoint:CGPointMake(150, 268)],
                      [NSValue valueWithCGPoint:CGPointMake(150, 140)],
                      [NSValue valueWithCGPoint:CGPointMake(150, 268)],
                      [NSValue valueWithCGPoint:CGPointMake(150, 220)],
                      [NSValue valueWithCGPoint:CGPointMake(150, 268)],
                      [NSValue valueWithCGPoint:CGPointMake(150, 250)],
                      [NSValue valueWithCGPoint:CGPointMake(150, 268)]
                      ];
    [CoreAnimation shakeLayerAnimation:self.imageView.layer andParam:param andCallBack:self];
}

-(void)animationDidStart:(id)animation
{
    NSLog(@"animationDidStart");
    CGRect rtImage = self.imageView.frame;
    rtImage.origin.y = 268-25;
    self.imageView.frame = rtImage;
}
-(void)animationDidStop:(id)animation
{
    NSLog(@"animationDidStop");
}
@end

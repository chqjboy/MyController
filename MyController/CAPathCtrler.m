//
//  CAPathCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/4/8.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "CAPathCtrler.h"

@interface CAPathCtrler ()

@end

@implementation CAPathCtrler

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
    rtImage.origin.x = (rect.size.width-rtImage.size.width)/2;
    rtImage.origin.y = (rect.size.height-rtImage.size.height)/2;
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
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150)
                  controlPoint1:CGPointMake(75, 0)
                  controlPoint2:CGPointMake(225, 300)];
     
    Param_CAPath* param = [[Param_CAPath alloc]init];
    param.autorevers = YES;
    param.fillmode = FillMode_forewards;
    param.repeatcount = MAXFLOAT;
    param.duration = 4;
    param.path = bezierPath;
    [CoreAnimation pathLayerAnimation:self.imageView.layer andParam:param andCallBack:self];
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

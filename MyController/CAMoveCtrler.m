//
//  CAMoveCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/3/31.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "CAMoveCtrler.h"

@interface CAMoveCtrler ()

@end

@implementation CAMoveCtrler

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
    Param_CAMove* param = [[Param_CAMove alloc]init];
    param.autorevers = YES;
    param.fillmode = FillMode_forewards;
    param.repeatcount = MAXFLOAT;
    param.duration = 3;
    CGRect fromRect = self.imageView.frame;
    param.fromRect = fromRect;
    CGRect toRect = self.imageView.frame;
    toRect.origin.x += self.imageView.frame.size.width;
    toRect.origin.y += self.imageView.frame.size.height;
    param.toRect = toRect;
    [CoreAnimation moveLayerAnimation:self.imageView.layer andParam:param andCallBack:self];
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

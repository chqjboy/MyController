//
//  RotateCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/3/27.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "RotateCtrler.h"

@interface RotateCtrler ()

@end

@implementation RotateCtrler
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(animationAction) userInfo:nil repeats:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)animationAction
{
    if (self.flag)
    {
        [Animations rotate:self.imageView andAnimationDuration:3 andAngle:-180 completion:^(BOOL finished) {
            self.flag = NO;
            [self animationAction];
        }];
    }else
    {
        [Animations rotate:self.imageView andAnimationDuration:3 andAngle:0 completion:^(BOOL finished) {
            self.flag = YES;
            [self animationAction];
        }];
    }
}
-(void)backClick
{
    if (self.delegate!=nil &&
        [self.delegate respondsToSelector:@selector(backWithCtrler:)])
    {
        [self.delegate backWithCtrler:self];
    }
    [self.imageView setHidden:YES];
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

@end

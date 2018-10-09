//
//  ShadowCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/3/28.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "ShadowCtrler.h"

@interface ShadowCtrler ()

@end

@implementation ShadowCtrler

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
    if (self.antype==nil || [self.antype isEqualToString:@"Curl"])
    {
        self.antype = @"Trapezoidal";
    }else if([self.antype isEqualToString:@"Trapezoidal"])
    {
        self.antype = @"Elliptical";
    }else if([self.antype isEqualToString:@"Elliptical"])
    {
        self.antype = @"Curl";
    }
    [Animations zoom:self.imageView andDuration:3 andScale:0.5 completion:^(BOOL finished) {
        [Animations shadowOnView:self.imageView andShadowType:self.antype];
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerAction) userInfo:nil repeats:NO];
    }];
}

-(void) timerAction
{
    [self.imageView removeFromSuperview];
    CGRect rect = self.view.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    [self initImageViewWithRect:rect];
    [self animationAction];
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

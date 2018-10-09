//
//  VFlipCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/3/28.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "VCurlCtrler.h"

@interface VCurlCtrler ()

@end

@implementation VCurlCtrler
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
    NSInteger index1 = [[self.curlView subviews]indexOfObject:self.imageView1];
    NSInteger index2 = [[self.curlView subviews]indexOfObject:self.imageView2];
    [self.curlView exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
    [Animations vcurl:self.curlView andDuration:3 andIsUp:YES completion:^(BOOL finished) {
        [self animationAction];
    }];
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
    [self initCurlViewWithRect:rtImage];
    [self initImageView1WithRect:rtImage];
    [self initImageView2WithRect:rtImage];
}
-(void)initCurlViewWithRect:(CGRect)rect
{
    self.curlView = [[UIView alloc]initWithFrame:rect];
    [self.view addSubview:self.curlView];
}
-(void)initImageView1WithRect:(CGRect)rect
{
    self.imageView1 = [[UIImageView alloc]initWithFrame:rect];
    [self.imageView1 setImage:[UIImage imageNamed:@"animation_picture"]];
    [self.curlView addSubview:self.imageView1];
}
-(void)initImageView2WithRect:(CGRect)rect
{
    self.imageView2 = [[UIImageView alloc]initWithFrame:rect];
    [self.imageView2 setImage:[UIImage imageNamed:@"animation_pic"]];
    [self.curlView addSubview:self.imageView2];
}
@end

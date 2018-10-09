//
//  VMoveCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/3/27.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "VMoveCtrler.h"

@interface VMoveCtrler ()

@end

@implementation VMoveCtrler

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
        [Animations moveUp:self.imageView andAnimationDuration:2 andLength:self.view.frame.size.height completion:^(BOOL finished) {
            self.flag = NO;
            CGRect rtImageView = self.imageView.frame;
            rtImageView.origin.y = 0;
            self.imageView.frame = rtImageView;
            [self animationAction];
        }];
    }else
    {
        [Animations moveDown:self.imageView andAnimationDuration:2 andLength:self.view.frame.size.height completion:^(BOOL finished) {
            self.flag = YES;
            CGRect rtImageView = self.imageView.frame;
            rtImageView.origin.y = 0;
            self.imageView.frame = rtImageView;
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

//
//  ProgressBarCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/10/12.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "ProgressBarCtrler.h"

@interface ProgressBarCtrler ()

@end

@implementation ProgressBarCtrler

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor grayColor]];
    [self initViews];
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
    CGRect rect = self.view.bounds;
    
    CGRect rtProgress = rect;
    rtProgress.size.height = 35;
    rtProgress.origin.x = 20;
    rtProgress.size.width = rect.size.width-2*rtProgress.origin.x;
    rtProgress.origin.y = (rect.size.height-rtProgress.size.height)/2;
    [self initProgressBarWithRect:rtProgress];
    
}
-(void)initProgressBarWithRect:(CGRect)rect
{
    Param_AvPlayerProgressBar* param = [[Param_AvPlayerProgressBar alloc]init];
    param.clrFront = [UIColor whiteColor];
    param.clrCur = [UIColor whiteColor];
    param.clrBack = GLOBAL_COLOR(204, 204, 204);
    param.slipHeight = 2;
    param.pointHeight = rect.size.height;
    param.gradientWidth = 0;
    param.imgPoint = [UIImage imageNamed:@"progress_point"];
    self.progressBar = [[AvPlayerProgressBar alloc]initWithFrame:rect andParam:param];
    self.progressBar.delegate = self;
    [self.view addSubview:self.progressBar];
}
-(void)pointMovingWithPersent:(CGFloat)persent
{
    NSLog(@"pointMovingWithPersent:%0.2f", persent);
}
-(void)pointMovedWithPersent:(CGFloat)persent
{
    NSLog(@"pointMovedWithPersent:%0.2f", persent);
}
@end

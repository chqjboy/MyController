//
//  CutPictureCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/9/7.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "CutPictureCtrler.h"

@interface CutPictureCtrler ()

@end

@implementation CutPictureCtrler

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
    CGRect rect = self.view.bounds;
    [self initCutPictureViewWithRect:rect];
}
-(void)initCutPictureViewWithRect:(CGRect)rect
{
    Param_CutPictureView* param = [[Param_CutPictureView alloc]init];
    param.image = [UIImage imageNamed:@"cut_image1"];
    param.cutsize = CGSizeMake(640, 388);
    self.cutPictureView = [[CutPictureView alloc]initWithFrame:rect andParam:param];
    self.cutPictureView.delegate = self;
    [self.view addSubview:self.cutPictureView];
}
-(void)cancelCutPicture
{
    [self backClick];
}
@end

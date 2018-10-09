//
//  CustomCameraCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/4/11.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "CustomCameraCtrler.h"

@interface CustomCameraCtrler ()

@end

@implementation CustomCameraCtrler

- (void)viewDidLoad {
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //plist 需要添加一项View controller-based status bar appearance为NO 才能隐藏状态栏
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backClick
{
    [self.cameraView stop];
    [super backClick];
}
-(void)initViews
{
    CGRect rect = self.view.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    [self initCameraViewWithRect:rect];
    
    CGRect rtTool = rect;
    rtTool.size.height = 50*[Device getHScale];
    [self initToolBarWithRect:rtTool];
}

-(void)initCameraViewWithRect:(CGRect)rect
{
    Param_CameraView* param = [[Param_CameraView alloc]init];
    param.eDevice = E_CAMERA_DEVICE_front;
    
    self.cameraView = [[CameraView alloc]initWithFrame:rect andParam:param];
    self.cameraView.delegate = self;
    [self.view addSubview:self.cameraView];
    [self.cameraView start];
}
-(void)initToolBarWithRect:(CGRect)rect
{
    self.toolBar = [[CameraToolBar alloc]initWithFrame:rect];
    [self.toolBar setBackgroundColor:GLOBAL_ACOLOR(0, 0, 0, 0.4)];
    self.toolBar.delegate = self;
    [self.view addSubview:self.toolBar];
}

-(void)actionSwitch
{
    if (self.cameraView && self.cameraView.checkResult==E_CAMERA_CHECK_ok)
    {
        [self.cameraView switchCamera];
    }
}
-(void)actionCut
{
    if (self.cameraView && self.cameraView.checkResult==E_CAMERA_CHECK_ok)
    {
        [self.cameraView cutImage];
    }
}
-(void)actionClose
{
    [self backClick];
}
-(void)cutWithImage:(UIImage*)image
{
    ModelImageView* view = [[ModelImageView alloc]initWithImage:image];
    [view doModel];
}

@end

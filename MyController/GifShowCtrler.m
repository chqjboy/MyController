//
//  GifShowCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/4/11.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "GifShowCtrler.h"

@interface GifShowCtrler ()

@end

@implementation GifShowCtrler

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
    [self.gifView stop];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)initViews
{
    CGRect rect = self.view.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    
    CGRect rtImage = rect;
    [self initGifViewWithRect:rtImage];
    
    CGRect rtButton = rect;
    rtButton.origin.x = 20;
    rtButton.origin.y = 20;
    rtButton.size.width = ScaleSize(100);
    rtButton.size.height = ScaleSize(40);
    [self initButtonWithRect:rtButton];
}
-(void)initGifViewWithRect:(CGRect)rect
{
    self.gifView = [[GifView alloc]initWithFrame:rect];
    [self.view addSubview:self.gifView];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"gif.gif" ofType:nil];
    [self.gifView setGifData:[NSData dataWithContentsOfFile:imagePath]];
    self.gifView.sleep = 3;
}
-(void)initButtonWithRect:(CGRect)rect
{
    self.button = [[UIButton alloc]initWithFrame:rect];
    [self.button setTitle:@"开始" forState: UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.button setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:self.button];
}
-(void)buttonClick
{
    if ([self.gifView isPlay])
    {
        [self.gifView stop];
        [self.button setTitle:@"开始" forState:UIControlStateNormal];
    }else
    {
        [self.gifView start];
        [self.button setTitle:@"停止" forState:UIControlStateNormal];
    }
}
@end

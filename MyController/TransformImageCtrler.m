//
//  TransformImageCtrler.m
//  MyController
//
//  Created by 陈前进 on 17/7/4.
//  Copyright © 2017年 mycontroller. All rights reserved.
//

#import "TransformImageCtrler.h"

@interface TransformImageCtrler ()

@end

@implementation TransformImageCtrler

- (void)viewDidLoad {
    self.image = [UIImage imageNamed:@"cut_image"];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initViews
{
    CGRect rect = self.view.bounds;
    
    CGRect rtShow = rect;
    rtShow.origin.x = 20;
    rtShow.size.width = rect.size.width-2*rtShow.origin.x;
    rtShow.size.height = 200;
    rtShow.origin.y = 20;
    [self initShowWithRect:rtShow];
    
    CGRect rtAction = rect;
    rtAction.origin.y = rtShow.origin.y+rtShow.size.height+10;
    rtAction.size.height = rect.size.height-rtAction.origin.y;
    [self initActionWithRect:rtAction];
}
-(void)initShowWithRect:(CGRect)rect
{
    self.show = [[TransImageShowPan alloc]initWithFrame:rect];
    [self.show setImage:self.image];
    [self.view addSubview:self.show];
}
-(void)initActionWithRect:(CGRect)rect
{
    self.action = [[TransformActionPan alloc]initWithFrame:rect];
    self.action.delegate = self;
    [self.view addSubview:self.action];
}
-(void)transformAction:(eTransformAction)action
{
    UIImage* image = self.show.image;
    CGFloat width = CGImageGetWidth(image.CGImage);
    CGFloat height = CGImageGetHeight(image.CGImage);
    NSData* data = UIImagePNGRepresentation(image);
    TransformImage* transImg = [[TransformImage alloc]initWithData:data];
    if (action==eTransformAction_def)
    {
        image = self.image;
    }else if(action==eTransformAction_atrect)
    {
        image = [transImg imageAtRect:CGRectMake(0, 0, 50, 100)];
    }else if(action==eTransformAction_insize)
    {
        image = [transImg imageInSize:CGSizeMake(width+10, height+20)];
    }else if(action==eTransformAction_scale)
    {
        image = [transImg imageScale:1.5];
    }else if(action==eTransformAction_scaleinrect)
    {
        image = [transImg imageScaleInSize:CGSizeMake(500, 100)];
    }else if(action==eTransformAction_scalewraprect)
    {
        image = [transImg imageScaleInSize:CGSizeMake(100, 500)];
    }else if(action==eTransformAction_rotate)
    {
        image = [transImg imageRotate:M_PI_2+M_PI andBack:[UIColor redColor]];
    }
    [self.show setImage:image];
}
@end

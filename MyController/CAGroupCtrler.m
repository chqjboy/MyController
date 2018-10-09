//
//  CAGroupCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/3/31.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "CAGroupCtrler.h"

@interface CAGroupCtrler ()

@end

@implementation CAGroupCtrler

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
    rtImage.size.height = rect.size.height/5;
    rtImage.size.width = rect.size.width/5;
    rtImage.origin.x = (rect.size.width-rtImage.size.width)/2;
    rtImage.origin.y = (rect.size.height-rtImage.size.height)/2;
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
    NSMutableArray* animations = [[NSMutableArray alloc]initWithCapacity:20];
    
    [animations addObject:[self getScaleAnimation]];
    [animations addObject:[self getRotateAnimation]];
    [animations addObject:[self getMoveAnimation]];
    
    Param_CAGroup* param = [[Param_CAGroup alloc]init];
    param.autorevers = YES;
    param.fillmode = FillMode_forewards;
    param.repeatcount = 1;
    param.duration = 3;
    param.animations = animations;
    self.caGroup = [CoreAnimation groupLayerAnimation:self.imageView.layer andParam:param andCallBack:self];
}

-(CoreAnimation*)getScaleAnimation
{
    Param_CAScale* param = [[Param_CAScale alloc]init];
    param.undo = YES;
    param.fromeScale = 1.0;
    param.toScale = 0.5;
    param.autorevers = YES;
    param.fillmode = FillMode_forewards;
    param.repeatcount = 1;
    param.duration = 3;
    self.caRotate = [CoreAnimation scaleLayerAnimation:self.imageView.layer andParam:param andCallBack:self];
    return self.caRotate;
}
-(CoreAnimation*)getRotateAnimation
{
    Param_CARotate* param = [[Param_CARotate alloc]init];
    param.undo = YES;
    param.autorevers = YES;
    param.fillmode = FillMode_forewards;
    param.repeatcount = 1;
    param.duration = 3;
    param.fromRadian = 0;
    param.toRadian = 6*M_PI;
    param.type = CAType_rotate_y;
    self.caRotate = [CoreAnimation rotateLayerAnimation:self.imageView.layer andParam:param andCallBack:self];
    return self.caRotate;
}
-(CoreAnimation*)getMoveAnimation
{
    
    Param_CAMove* param = [[Param_CAMove alloc]init];
    param.undo = YES;
    param.autorevers = YES;
    param.fillmode = FillMode_forewards;
    param.repeatcount = 1;
    param.duration = 3;
    CGRect fromRect = self.imageView.frame;
    fromRect.origin.x = 0;
    fromRect.origin.y = 0;
    param.fromRect = fromRect;
    CGRect toRect = self.imageView.frame;
    toRect.size.width /=2;
    toRect.size.height /=2;
    toRect.origin.x = self.view.frame.size.width-toRect.size.width;
    toRect.origin.y = self.view.frame.size.height-toRect.size.height;
    param.toRect = toRect;
    self.caMove = [CoreAnimation moveLayerAnimation:self.imageView.layer andParam:param andCallBack:self];
    return self.caMove;
}

-(void)animationDidStart:(id)animation
{
    NSLog(@"animationDidStart");
}
-(void)animationDidStop:(id)animation
{
    NSLog(@"animationDidStop");
    if (animation==self.caScale)
    {
        NSLog(@"caScale");
    }else if (animation==self.caMove)
    {
        NSLog(@"caMove");
    }else if (animation==self.caRotate)
    {
        NSLog(@"caRotate");
    }else if (animation==self.caGroup)
    {
        NSLog(@"caGroup");
    }
}

@end

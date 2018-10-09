//
//  CoreAnimationCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/3/30.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "CoreAnimationCtrler.h"

@interface CoreAnimationCtrler ()

@end

@implementation CoreAnimationCtrler
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
    CGRect rect = self.view.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    
    CGRect rtScroll = rect;
    [self initVScrollViewWithRect:rtScroll];
}
-(void)initVScrollViewWithRect:(CGRect)rect
{
    self.vscrollView = [[VScrollView alloc]initWithFrame:rect];
    [self.view addSubview:self.vscrollView];
    [self reloadContent];
}
-(void)reloadContent
{
    CGRect rect = self.vscrollView.frame;
    [self.vscrollView removeAllItems];
    [self initScaleWithRect:rect];
    [self initRotateWithRect:rect];
    [self initMoveWithRect:rect];
    [self initPathWithRect:rect];
    [self initShakeWithRect:rect];
    [self initGroupWithRect:rect];
    [self initLayerWithRect:rect];
    [self initShapLayerWithRect:rect];
    [self initTextLayerWithRect:rect];
    [self initGradientLayerWithRect:rect];
    [self initReplicatorLayerWithRect:rect];
    [self initScrollLayerWithRect:rect];
    [self initEmitterLayerWithRect:rect];
    [self initEaglLayerWithRect:rect];
    [self initAVPlayerLayerWithRect:rect];
    [self.vscrollView reloadItems];
}
-(void)initScaleWithRect:(CGRect)rect
{
    self.scale = [[AnimationsCell alloc]initWithFrame:rect andName:@"缩放动画CAScale"];
    self.scale.delegate = self;
    [self.vscrollView addItemWithView:self.scale];
}
-(void)initRotateWithRect:(CGRect)rect
{
    self.rotate = [[AnimationsCell alloc]initWithFrame:rect andName:@"旋转动画CARotate"];
    self.rotate.delegate = self;
    [self.vscrollView addItemWithView:self.rotate];
}
-(void)initMoveWithRect:(CGRect)rect
{
    self.move = [[AnimationsCell alloc]initWithFrame:rect andName:@"移动动画CAMove"];
    self.move.delegate = self;
    [self.vscrollView addItemWithView:self.move];
}
-(void)initPathWithRect:(CGRect)rect
{
    self.path = [[AnimationsCell alloc]initWithFrame:rect andName:@"路径动画CAPath"];
    self.path.delegate = self;
    [self.vscrollView addItemWithView:self.path];
}
-(void)initShakeWithRect:(CGRect)rect
{
    self.shake = [[AnimationsCell alloc]initWithFrame:rect andName:@"弹抖动画CAShake"];
    self.shake.delegate = self;
    [self.vscrollView addItemWithView:self.shake];
}
-(void)initGroupWithRect:(CGRect)rect
{
    self.group = [[AnimationsCell alloc]initWithFrame:rect andName:@"复合动画CAGroup"];
    self.group.delegate = self;
    [self.vscrollView addItemWithView:self.group];
}
-(void)initLayerWithRect:(CGRect)rect
{
    self.layer = [[AnimationsCell alloc]initWithFrame:rect andName:@"图层应用CALayer"];
    self.layer.delegate = self;
    [self.vscrollView addItemWithView:self.layer];
}
-(void)initShapLayerWithRect:(CGRect)rect
{
    self.shaplayer = [[AnimationsCell alloc]initWithFrame:rect andName:@"绘图图层CAShapLayer"];
    self.shaplayer.delegate = self;
    [self.vscrollView addItemWithView:self.shaplayer];
}
-(void)initTextLayerWithRect:(CGRect)rect
{
    self.textlayer = [[AnimationsCell alloc]initWithFrame:rect andName:@"文本图层CATextLayer"];
    self.textlayer.delegate = self;
    [self.vscrollView addItemWithView:self.textlayer];
}
-(void)initGradientLayerWithRect:(CGRect)rect
{
    self.gradientLayer = [[AnimationsCell alloc]initWithFrame:rect andName:@"颜色渐变CAGradientLayer"];
    self.gradientLayer.delegate = self;
    [self.vscrollView addItemWithView:self.gradientLayer];
}
-(void)initReplicatorLayerWithRect:(CGRect)rect
{
    self.replicatorLayer = [[AnimationsCell alloc]initWithFrame:rect andName:@"复制图层CAReplicatorLayer"];
    self.replicatorLayer.delegate = self;
    [self.vscrollView addItemWithView:self.replicatorLayer];
}
-(void)initScrollLayerWithRect:(CGRect)rect
{
    self.scrollLayer = [[AnimationsCell alloc]initWithFrame:rect andName:@"滚动图层CAScrollLayer"];
    self.scrollLayer.delegate = self;
    [self.vscrollView addItemWithView:self.scrollLayer];
}
-(void)initEmitterLayerWithRect:(CGRect)rect
{
    self.emitterLayer = [[AnimationsCell alloc]initWithFrame:rect andName:@"粒子流图层CAEmitterLayer"];
    self.emitterLayer.delegate = self;
    [self.vscrollView addItemWithView:self.emitterLayer];
}
-(void)initEaglLayerWithRect:(CGRect)rect
{
    self.eaglLayer = [[AnimationsCell alloc]initWithFrame:rect andName:@"OPenGL图层CAEAGLLayer"];
    self.eaglLayer.delegate = self;
    [self.vscrollView addItemWithView:self.eaglLayer];
}
-(void)initAVPlayerLayerWithRect:(CGRect)rect
{
    self.avPlayerLayer = [[AnimationsCell alloc]initWithFrame:rect andName:@"视频图层AVPlayerLayer"];
    self.avPlayerLayer.delegate = self;
    [self.vscrollView addItemWithView:self.avPlayerLayer];
}
-(void)cellClickWithView:(UIView*)view
{
    if (self.scale==view)
    {
        if (self.scaleCtrler==nil)
        {
            self.scaleCtrler = [[CAScaleCtrler alloc]init];
            self.scaleCtrler.title = @"缩放动画CAScale";
            self.scaleCtrler.delegate = self;
            [self.navigationController pushViewController:self.scaleCtrler animated:YES];
        }
    }else if(self.rotate==view)
    {
        if (self.rotateCtrler==nil)
        {
            self.rotateCtrler = [[CARotateCtrler alloc]init];
            self.rotateCtrler.title = @"旋转动画CARotate";
            self.rotateCtrler.delegate = self;
            [self.navigationController pushViewController:self.rotateCtrler animated:YES];
        }
    }else if(self.move==view)
    {
        if (self.moveCtrler==nil)
        {
            self.moveCtrler = [[CAMoveCtrler alloc]init];
            self.moveCtrler.title = @"移动动画CAMove";
            self.moveCtrler.delegate = self;
            [self.navigationController pushViewController:self.moveCtrler animated:YES];
        }
    }else if(self.path==view)
    {
        if (self.pathCtrler==nil)
        {
            self.pathCtrler = [[CAPathCtrler alloc]init];
            self.pathCtrler.title = @"路径动画CAMove";
            self.pathCtrler.delegate = self;
            [self.navigationController pushViewController:self.pathCtrler animated:YES];
        }
    }else if(self.shake==view)
    {
        if (self.shakeCtrler==nil)
        {
            self.shakeCtrler = [[CAShakeCtrler alloc]init];
            self.shakeCtrler.title = @"弹抖动画CAShake";
            self.shakeCtrler.delegate = self;
            [self.navigationController pushViewController:self.shakeCtrler animated:YES];
        }
    }else if (self.group==view)
    {
        if (self.groupCtrler==nil)
        {
            self.groupCtrler = [[CAGroupCtrler alloc]init];
            self.groupCtrler.title = @"复合动画CAGroup";
            self.groupCtrler.delegate = self;
            [self.navigationController pushViewController:self.groupCtrler animated:YES];
        }
    }else if (self.layer==view)
    {
        if (self.layerCtrler==nil)
        {
            self.layerCtrler = [[LayerCtrler alloc]init];
            self.layerCtrler.title = @"图层应用Layer";
            self.layerCtrler.delegate = self;
            [self.navigationController pushViewController:self.layerCtrler animated:YES];
        }
    }else if (self.shaplayer==view)
    {
        if (self.shapLayerCtrler==nil)
        {
            self.shapLayerCtrler = [[ShapLayerCtrler alloc]init];
            self.shapLayerCtrler.title = @"绘图图层CAShapLayer";
            self.shapLayerCtrler.delegate = self;
            [self.navigationController pushViewController:self.shapLayerCtrler animated:YES];
        }
    }else if(self.textlayer==view)
    {
        if (self.textLayerCtrler==nil)
        {
            self.textLayerCtrler = [[TextLayerCtrler alloc]init];
            self.textLayerCtrler.title = @"文本图层CATextLayer";
            self.textLayerCtrler.delegate = self;
            [self.navigationController pushViewController:self.textLayerCtrler animated:YES];
        }
    }else if(self.gradientLayer==view)
    {
        if (self.gradientLayerCtrler==nil)
        {
            self.gradientLayerCtrler = [[GradientLayerCtrler alloc]init];
            self.gradientLayerCtrler.title = @"颜色渐变CAGradientLayer";
            self.gradientLayerCtrler.delegate = self;
            [self.navigationController pushViewController:self.gradientLayerCtrler animated:YES];
        }
    }else if(self.replicatorLayer==view)
    {
        if (self.replicatorLayerCtrler==nil)
        {
            self.replicatorLayerCtrler = [[ReplicatorLayerCtrler alloc]init];
            self.replicatorLayerCtrler.title = @"复制图层CAReplicatorLayer";
            self.replicatorLayerCtrler.delegate = self;
            [self.navigationController pushViewController:self.replicatorLayerCtrler animated:YES];
        }
    }else if(self.scrollLayer==view)
    {
        if (self.scrollLayerCtrler==nil)
        {
            self.scrollLayerCtrler = [[ScrollLayerCtrler alloc]init];
            self.scrollLayerCtrler.title = @"滚动图层CAScrollLayer";
            self.scrollLayerCtrler.delegate = self;
            [self.navigationController pushViewController:self.scrollLayerCtrler animated:YES];
        }
    }else if(self.emitterLayer==view)
    {
        if (self.emitterLayerCtrler==nil)
        {
            self.emitterLayerCtrler = [[EmitterLayerCtrler alloc]init];
            self.emitterLayerCtrler.title = @"粒子流图层CAEmitterLayer";
            self.emitterLayerCtrler.delegate = self;
            [self.navigationController pushViewController:self.emitterLayerCtrler animated:YES];
        }
    }else if(self.eaglLayer==view)
    {
        if (self.eaglLayerCtrler==nil)
        {
            self.eaglLayerCtrler = [[EAGLLayerCtrler alloc]init];
            self.eaglLayerCtrler.title = @"OPenGL图层CAEAGLLayer";
            self.eaglLayerCtrler.delegate = self;
            [self.navigationController pushViewController:self.eaglLayerCtrler animated:YES];
        }
    }else if(self.avPlayerLayer==view)
    {
        if (self.avPlayerLayerCtrler==nil)
        {
            self.avPlayerLayerCtrler = [[AVPlayerLayerCtrler alloc]init];
            self.avPlayerLayerCtrler.title = @"视频图层AVPlayerLayer";
            self.avPlayerLayerCtrler.delegate = self;
            [self.navigationController pushViewController:self.avPlayerLayerCtrler animated:YES];
        }
    }
}
-(void)backWithCtrler:(id)ctrler
{
    if (ctrler==self.scaleCtrler)
    {
        self.scaleCtrler=nil;
    }else if(ctrler==self.rotateCtrler)
    {
        self.rotateCtrler=nil;
    }else if(ctrler==self.moveCtrler)
    {
        self.moveCtrler=nil;
    }else if(ctrler==self.pathCtrler)
    {
        self.pathCtrler=nil;
    }else if(ctrler==self.shakeCtrler)
    {
        self.shakeCtrler=nil;
    }else if(ctrler==self.groupCtrler)
    {
        self.groupCtrler=nil;
    }else if(ctrler==self.layerCtrler)
    {
        self.layerCtrler=nil;
    }else if(ctrler==self.shapLayerCtrler)
    {
        self.shapLayerCtrler=nil;
    }else if(ctrler==self.textLayerCtrler)
    {
        self.textLayerCtrler=nil;
    }else if(ctrler==self.gradientLayerCtrler)
    {
        self.gradientLayerCtrler=nil;
    }else if (ctrler==self.replicatorLayerCtrler)
    {
        self.replicatorLayerCtrler=nil;
    }else if (ctrler==self.scrollLayerCtrler)
    {
        self.scrollLayerCtrler=nil;
    }else if (ctrler==self.emitterLayerCtrler)
    {
        self.emitterLayerCtrler=nil;
    }else if (ctrler==self.eaglLayerCtrler)
    {
        self.eaglLayerCtrler=nil;
    }else if (ctrler==self.avPlayerLayerCtrler)
    {
        self.avPlayerLayerCtrler=nil;
    }
}
@end

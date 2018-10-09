//
//  LayerCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/4/5.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "LayerCtrler.h"

@interface LayerCtrler ()

@end

@implementation LayerCtrler

- (void)viewDidLoad {
    self.access = ELayerAccess_bkcolor;
    self.goon = YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self timerAction];
    [self initTimer];
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
    if (self.timer!=nil)
    {
        [self.timer invalidate];
        self.timer = nil;
    }
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)initViews
{
    CGRect rect = self.view.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    [self initCurLayer];
}

-(void)initCurLayer
{
    CGRect rect = self.view.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    CGRect rtLayer = rect;
    rtLayer.size.width = 150;
    rtLayer.size.height = 150;
    rtLayer.origin.x = (rect.size.width-rtLayer.size.width)/2;
    rtLayer.origin.y = (rect.size.height-rtLayer.size.height)/2;
    self.curLayer = [[CALayer alloc]init];
    self.curLayer.frame = rtLayer;
    [self.view.layer addSublayer:self.curLayer];
}

-(void)initZLayer
{
    CGRect rect = self.view.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    CGRect rtLayer = rect;
    rtLayer.size.width = 150;
    rtLayer.size.height = 150;
    rtLayer.origin.x = rect.size.width/2;
    rtLayer.origin.y = rect.size.height/2;
    self.zLayer = [[CALayer alloc]init];
    self.zLayer.frame = rtLayer;
    self.zLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.zLayer];
}

-(void)initCubLayer
{
    CGRect rect = self.view.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    CGRect rtLayer = rect;
    rtLayer.size.width = 150;
    rtLayer.size.height = 150;
    rtLayer.origin.x = (rect.size.width-rtLayer.size.width)/2;
    rtLayer.origin.y = (rect.size.height-rtLayer.size.height)/2;
    self.cub = [[Cubelayer alloc]initWithFrame:rtLayer];
    [self.view.layer addSublayer:self.cub];
}

-(void)initTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}
-(void)timerAction
{
    if (!self.goon)
    {
        return;
    }
    if (self.access == ELayerAccess_bkcolor)
    {
        if (self.curLayer!=nil)
        {
            [self.curLayer removeFromSuperlayer];
        }
        [self initCurLayer];
        if (self.zLayer!=nil)
        {
            [self.zLayer removeFromSuperlayer];
            self.zLayer=nil;
        }
        if (self.cub!=nil)
        {
            [self.cub removeFromSuperlayer];
            self.cub=nil;
        }
        [self actionBkColorLayer];
    }else if (self.access==ELayerAccess_corner)
    {
        [self actionCornerLayer];
    }else if (self.access==ELayerAccess_border)
    {
        [self actionBorderLayer];
    }else if (self.access==ELayerAccess_shadow)
    {
        [self actionShadowLayer];
    }else if (self.access==ELayerAccess_contents_img)
    {
        [self actionContentImgLayer];
    }else if (self.access==ELayerAccess_mask_star)
    {
        [self actionMaskStarLayer];
    }else if(self.access==ELayerAccess_contents_aspect)
    {
        if (self.curLayer.mask!=nil)
        {
            self.curLayer.mask=nil;
        }
        [self actionContentAspectLayer];
    }else if(self.access==ELayerAccess_contents_center)
    {
        [self actionContentCenterLayer];
    }else if(self.access==ELayerAccess_contents_scale)
    {
        [self actionContentScaleLayer];
    }else if(self.access==ELayerAccess_masktobounds)
    {
        [self actionMaskToBoundsLayer];
    }else if(self.access==ELayerAccess_filter_linear)
    {
        [self actionFilterLinearLayer];
    }else if(self.access==ELayerAccess_filter_trilinear)
    {
        [self actionFilterTrilinearLayer];
    }else if(self.access==ELayerAccess_filter_nearest)
    {
        [self actionFilterNearestLayer];
    }else if(self.access==ELayerAccess_contents_rect_lu)
    {
        [self actionContentRectLULayer];
    }else if(self.access==ELayerAccess_contents_rect_ru)
    {
        [self actionContentRectRULayer];
    }else if(self.access==ELayerAccess_contents_rect_ld)
    {
        [self actionContentRectLDLayer];
    }else if(self.access==ELayerAccess_contents_rect_rd)
    {
        [self actionContentRectRDLayer];
    }else if (self.access==ELayerAccess_contents_rect_all)
    {
        [self actionContentRectAllLayer];
    }else if (self.access==ELayerAccess_stretch_rect_lu)
    {
        [self actionStrectRectLULayer];
    }else if (self.access==ELayerAccess_stretch_rect_ru)
    {
        [self actionStrectRectRULayer];
    }else if (self.access==ELayerAccess_stretch_rect_ld)
    {
        [self actionStrectRectLDLayer];
    }else if (self.access==ELayerAccess_stretch_rect_rd)
    {
        [self actionStrectRectRDLayer];
    }else if(self.access==ELayerAccess_delegate)
    {
        [self actionDelegateLayer];
    }else if(self.access==ELayerAccess_anchorpoint)
    {
        [self actionAnchorPointLayer];
    }else if(self.access==ELayerAccess_anchorpointbk)
    {
        [self actionAnchorPointBkLayer];
    }else if(self.access==ELayerAccess_zlayer_up)
    {
        [self actionZLayerUp];
    }else if(self.access==ELayerAccess_zlayer_down)
    {
        [self actionZLayerDown];
    }else if(self.access==ELayerAccess_3d_scale)
    {
        if (self.zLayer!=nil)
        {
            [self.zLayer removeFromSuperlayer];
            self.zLayer = nil;
        }
        [self action3DScale];
    }else if(self.access==ELayerAccess_3d_rotate)
    {
        [self action3DRotate];
    }else if(self.access==ELayerAccess_3d_move)
    {
        [self action3DMove];
    }else if(self.access==ELayerAccess_3d_rotate_x)
    {
        [self action3DRotateX];
    }else if(self.access==ELayerAccess_3d_rotate_y)
    {
        [self action3DRotateY];
    }else if(self.access==ELayerAccess_3d_rotate_z)
    {
        [self action3DRotateZ];
    }else if(self.access==ELayerAccess_clicklayer)
    {
        [self actionClickLayer];
    }else if(self.access==ELayerAccess_cub)
    {
        [self actionCub];
    }else if(self.access==ELayerAccess_cub_rotateX)
    {
        [self actionCubRotateX];
    }else if(self.access==ELayerAccess_cub_rotateY)
    {
        [self actionCubRotateY];
    }else if(self.access==ELayerAccess_cub_rotateZ)
    {
        [self actionCubRotateZ];
    }
    
    self.access++;
    if (self.access>=ELayerAccess_last)
    {
        self.access=ELayerAccess_bkcolor;
    }
}

-(void)actionBkColorLayer
{
    self.title = @"背景颜色BkColorLayer";
    self.curLayer.backgroundColor = [UIColor blueColor].CGColor;
}

-(void)actionCornerLayer
{
    self.title = @"图层圆角CornerLayer";
    self.curLayer.cornerRadius = 10;
}

-(void)actionBorderLayer
{
    self.title = @"图层边框BorderLayer";
    self.curLayer.borderWidth = 5;
    self.curLayer.borderColor = [UIColor grayColor].CGColor;
}

-(void)actionShadowLayer
{
    self.title = @"图层阴影ShadowLayer";
    CGSize size = self.curLayer.bounds.size;
    self.curLayer.shadowColor = [UIColor blackColor].CGColor;
    
    self.curLayer.shadowOpacity = 0.7f;
    self.curLayer.shadowOffset = CGSizeMake(10.0f, 10.0f);
    self.curLayer.shadowRadius = 5.0f;
    self.curLayer.masksToBounds = NO;
    //也可指定阴影路径
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(size.width * 0.33f, size.height * 0.66f)];
//    [path addLineToPoint:CGPointMake(size.width * 0.66f, size.height * 0.66f)];
//    [path addLineToPoint:CGPointMake(size.width * 1.15f, size.height * 1.15f)];
//    [path addLineToPoint:CGPointMake(size.width * -0.15f, size.height * 1.15f)];
//    self.curLayer.shadowPath = path.CGPath;
}

-(void)actionContentImgLayer
{
    self.title = @"寄宿图平铺ContentImg";
    self.curLayer.contents = (__bridge id)[UIImage imageNamed:@"animation_picture"].CGImage;
}

-(void)actionMaskStarLayer
{
    self.title = @"图形蒙层mask";
    CALayer* mask = [[CALayer alloc]init];
    mask.frame = self.curLayer.bounds;
    mask.contents = (__bridge id)[UIImage imageNamed:@"layer_maskstar"].CGImage;
    self.curLayer.mask = mask;
}

-(void)actionContentAspectLayer
{
    self.title = @"寄宿图适应ContentAspect";
    self.curLayer.contentsGravity = kCAGravityResizeAspect;
}

-(void)actionContentCenterLayer
{
    self.title = @"寄宿图居中ContentCenter";
    self.curLayer.contentsGravity = kCAGravityCenter;
}

-(void)actionContentScaleLayer
{
    self.title = @"寄宿图分辨率ContentScale";
    self.curLayer.contentsScale = [UIScreen mainScreen].scale;
}

-(void)actionMaskToBoundsLayer
{
    self.title = @"寄宿图内置MaskToBounds";
    self.curLayer.masksToBounds = YES;
}
-(void)actionFilterLinearLayer
{
    self.title = @"二维线性取样Linear";
    self.curLayer.magnificationFilter = kCAFilterLinear;
    self.curLayer.minificationFilter = kCAFilterLinear;
}
-(void)actionFilterTrilinearLayer
{
    self.title = @"三维维线性取样Linear";
    self.curLayer.magnificationFilter = kCAFilterTrilinear;
    self.curLayer.minificationFilter = kCAFilterTrilinear;
}
-(void)actionFilterNearestLayer
{
    self.title = @"最近过滤Linear";
    self.curLayer.magnificationFilter = kCAFilterNearest;
    self.curLayer.minificationFilter = kCAFilterNearest;
}
-(void)actionContentRectLULayer
{
    self.title = @"寄宿图单位坐标区域(左上)";
    self.curLayer.contents = (__bridge id)[UIImage imageNamed:@"layer_contentrect"].CGImage;
    self.curLayer.contentsGravity = kCAGravityResizeAspect;
    self.curLayer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
}
-(void)actionContentRectRULayer
{
    self.title = @"寄宿图单位坐标区域(右上)";
    self.curLayer.contentsRect = CGRectMake(0.5, 0, 0.5, 0.5);
}
-(void)actionContentRectLDLayer
{
    self.title = @"寄宿图单位坐标区域(左下)";
    self.curLayer.contentsRect = CGRectMake(0, 0.5, 0.5, 0.5);
}
-(void)actionContentRectRDLayer
{
    self.title = @"寄宿图单位坐标区域(右下)";
    self.curLayer.contentsRect = CGRectMake(0.5, 0.5, 0.5, 0.5);
}
-(void)actionContentRectAllLayer
{
    self.title = @"寄宿图单位坐标区域(全景)";
    self.curLayer.contentsRect = CGRectMake(0, 0, 1, 1);
}

-(void)actionStrectRectLULayer
{
    self.title = @"拉伸单位坐标区域(左上)";
    self.curLayer.contentsCenter = CGRectMake(0, 0, 0.5, 0.5);
}
-(void)actionStrectRectRULayer
{
    self.title = @"拉伸单位坐标区域(右上)";
    self.curLayer.contentsCenter = CGRectMake(0.5, 0, 0.5, 0.5);
}
-(void)actionStrectRectLDLayer
{
    self.title = @"拉伸单位坐标区域(左下)";
    self.curLayer.contentsCenter = CGRectMake(0, 0.5, 0.5, 0.5);
}
-(void)actionStrectRectRDLayer
{
    self.title = @"拉伸单位坐标区域(右下)";
    self.curLayer.contentsCenter = CGRectMake(0.5, 0.5, 0.5, 0.5);
}
-(void)actionDelegateLayer
{
    self.title = @"直接绘制Delegate";
    self.curLayer.delegate = self;
    [self.curLayer display];
}
-(void)actionAnchorPointLayer
{
    self.title = @"锚点AnchorPoint(0,0)";
    self.curLayer.anchorPoint = CGPointMake(0, 0);
}
-(void)actionAnchorPointBkLayer
{
    self.title = @"锚点AnchorPoint(0.5,0.5)";
    self.curLayer.anchorPoint = CGPointMake(0.5, 0.5);
}
-(void)actionZLayerUp
{
    self.title = @"Z轴位置居上";
    self.curLayer.zPosition = 2;
    if (self.zLayer==nil)
    {
        [self initZLayer];
    }
    self.zLayer.zPosition = 3;
}
-(void)actionZLayerDown
{
    self.title = @"Z轴位置居下";
    self.curLayer.zPosition = 2;
    if (self.zLayer==nil)
    {
        [self initZLayer];
    }
    self.zLayer.zPosition = 1;
}
-(void)action3DScale
{
    self.title = @"3D变换(缩放)";
    self.curLayer.affineTransform = CGAffineTransformIdentity;
    self.curLayer.affineTransform = CGAffineTransformScale(self.curLayer.affineTransform, 0.5, 0.5);
}
-(void)action3DRotate
{
    //Z轴
    self.title = @"3D变换(旋转)";
    self.curLayer.affineTransform = CGAffineTransformRotate(self.curLayer.affineTransform, M_PI_4);
}
-(void)action3DMove
{//会受到旋转的影响
    self.title = @"3D变换(位移)";
    self.curLayer.affineTransform = CGAffineTransformTranslate(self.curLayer.affineTransform, 50, 50);
}
-(void)action3DRotateX
{
    self.title = @"3D旋转(X)";
    CATransform3D transform = CATransform3DIdentity;
    //apply perspective
    transform.m34 = - 1.0 / 500.0;
    //rotate by 45 degrees along the Y axis
    transform = CATransform3DRotate(transform, M_PI_4, 1, 0, 0);
    self.curLayer.transform = transform;
}
-(void)action3DRotateY
{
    self.title = @"3D旋转(Y)";
    CATransform3D transform = CATransform3DIdentity;
    //apply perspective
    transform.m34 = - 1.0 / 500.0;
    //rotate by 45 degrees along the Y axis
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);

    self.curLayer.transform = transform;
}
-(void)action3DRotateZ
{
    self.title = @"3D旋转(Z)";

    self.curLayer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
}
-(void)actionClickLayer
{
    self.title = @"点击继续";
    self.goon = NO;
}
-(void)actionCub
{
    self.title = @"立方体";
    if (self.cub==nil)
    {
        [self initCubLayer];
    }
}
-(void)actionCubRotateX
{
    self.cub.sublayerTransform = CATransform3DRotate(self.cub.sublayerTransform, M_PI_4, 1, 0, 0);
}
-(void)actionCubRotateY
{
    self.cub.sublayerTransform = CATransform3DRotate(self.cub.sublayerTransform, M_PI_4, 0, 1, 0);
}
-(void)actionCubRotateZ
{
    self.cub.sublayerTransform = CATransform3DRotate(self.cub.sublayerTransform, M_PI_4, 0, 0, 1);
}
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextSetLineWidth(ctx, 2.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
    layer.delegate=nil;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.access<=ELayerAccess_clicklayer)
    {
        return;
    }
//    方法一
//    CGPoint point = [[touches anyObject] locationInView:self.view];
//    point = [self.curLayer convertPoint:point fromLayer:self.view.layer];
//    if ([self.curLayer containsPoint:point])
//    {
//        self.goon=YES;
//        [self timerAction];
//    }
//    方法二
    CGPoint point = [[touches anyObject] locationInView:self.view];
    CALayer *layer = [self.curLayer hitTest:point];
    if (layer == self.curLayer)
    {
        self.goon=YES;
        [self timerAction];
    }
    if (self.curLayer!=nil)
    {
        [self.curLayer removeFromSuperlayer];
        self.curLayer=nil;
    }
}
@end

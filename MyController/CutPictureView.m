//
//  CutPictureView.m
//  MyController
//
//  Created by 陈前进 on 16/9/7.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "CutPictureView.h"
#import "Functions.h"
#import "ImageShowView.h"
@implementation Param_CutPictureView

@end
@implementation CutPictureView
-(CutPictureView*)initWithFrame:(CGRect)rect andParam:(Param_CutPictureView*)param
{
    self = [super initWithFrame:rect];
    [self setBackgroundColor:[UIColor grayColor]];
    self.param = param;
    self.userInteractionEnabled = YES;
    [self initViews];
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    
    CGRect rtFrame = rect;
    rtFrame.origin.x = 15;
    rtFrame.size.width = rect.size.width-2*rtFrame.origin.x;
    rtFrame.size.height = rtFrame.size.width*self.param.cutsize.height/self.param.cutsize.width;
    rtFrame.origin.y = (rect.size.height-rtFrame.size.height)/2;
    self.rtFrame = rtFrame;
    
    CGRect rtCutImage = rect;
    CGSize imagesize = self.param.image.size;
    
    if (imagesize.width/imagesize.height>rtFrame.size.width/rtFrame.size.height)
    {
        rtCutImage.size.height = rtFrame.size.height;
        rtCutImage.size.width = rtCutImage.size.height*imagesize.width/imagesize.height;
    }else
    {
        rtCutImage.size.width = rtFrame.size.width;
        rtCutImage.size.height = rtCutImage.size.width*imagesize.height/imagesize.width;
    }
    rtCutImage.origin.x = (rect.size.width-rtCutImage.size.width)/2;
    rtCutImage.origin.y = (rect.size.height-rtCutImage.size.height)/2;
    [self initCutImageViewWithRect:rtCutImage andEdgeFrame:rtFrame];
    [self initCutFrameViewWithRect:rtFrame];
    
    CGRect rtBtnCancel = rect;
    rtBtnCancel.size.height = 40;
    rtBtnCancel.size.width = 40;
    rtBtnCancel.origin.x = rtFrame.origin.x;
    rtBtnCancel.origin.y = rect.size.height-rtBtnCancel.size.height;
    [self initBtnCancelWithRect:rtBtnCancel];
    
    CGRect rtBtnOk = rtBtnCancel;
    rtBtnOk.origin.x = rect.size.width-15-rtBtnOk.size.width;
    [self initBtnOkWithRect:rtBtnOk];
    
}
-(void)initCutImageViewWithRect:(CGRect)rect andEdgeFrame:(CGRect)edge
{
    self.cutImageView = [[CutImageView alloc]initWithFrame:rect andImage:self.param.image andEdgeFrame:edge];
    [self addSubview:self.cutImageView];
}
-(void)initCutFrameViewWithRect:(CGRect)rect
{
    UIBezierPath* outPath = [UIBezierPath bezierPathWithRect:self.bounds];
    UIBezierPath* inPath = [UIBezierPath bezierPathWithRect:rect];
    [outPath appendPath:inPath];
    [outPath setUsesEvenOddFillRule:YES];
    
    CAShapeLayer* fillLayer = [CAShapeLayer layer];
    fillLayer.path = outPath.CGPath;
    fillLayer.fillRule =kCAFillRuleEvenOdd;
    fillLayer.fillColor = [UIColor blackColor].CGColor;
    fillLayer.opacity =0.7;
    [self.layer addSublayer:fillLayer];
    
    CAShapeLayer* layer = [CAShapeLayer layer];
    UIBezierPath* linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(rect.origin.x, rect.origin.y)];
    [linePath addLineToPoint:CGPointMake(rect.origin.x+rect.size.width, rect.origin.y)];
    [linePath addLineToPoint:CGPointMake(rect.origin.x+rect.size.width, rect.origin.y+rect.size.height)];
    [linePath addLineToPoint:CGPointMake(rect.origin.x, rect.origin.y+rect.size.height)];
    [linePath addLineToPoint:CGPointMake(rect.origin.x, rect.origin.y)];
    [linePath closePath];
    
    [layer setBackgroundColor:[UIColor clearColor].CGColor];
    layer.strokeColor = [UIColor whiteColor].CGColor;
    layer.path = linePath.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 1;
    layer.opacity = 1;
    [self.layer addSublayer:layer];
}
-(void)initBtnOkWithRect:(CGRect)rect
{
    self.btnOk = [[UIButton alloc]initWithFrame:rect];
    [self.btnOk setTitle:@"完成" forState:UIControlStateNormal];
    [self.btnOk setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnOk addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btnOk];
}
-(void)initBtnCancelWithRect:(CGRect)rect
{
    self.btnCancel = [[UIButton alloc]initWithFrame:rect];
    [self.btnCancel setTitle:@"取消" forState:UIControlStateNormal];
    [self.btnCancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnCancel addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btnCancel];
}

-(UIImage*)cutImage
{
    CGSize size = self.cutImageView.frame.size;
    size.width *= 2;
    size.height *= 2;
    
    CGRect rect = self.cutImageView.frame;
    rect.origin.x = (self.rtFrame.origin.x-rect.origin.x)*2;
    rect.origin.y = (self.rtFrame.origin.y-rect.origin.y)*2;
    rect.size = self.rtFrame.size;
    rect.size.width *= 2;
    rect.size.height *= 2;
    
    UIImage* image = [Functions cutImage:self.param.image andTargetSize:size andCutRect:rect];
   image = [Functions scaleImage:image toSize:self.param.cutsize];
    return image;
}
-(void)buttonClick:(id)sender
{
    if (sender==self.btnOk)
    {
        NSLog(@"ok");
        UIImage* image = [self cutImage];
        UIWindow* window = [UIApplication sharedApplication].keyWindow;
        ImageShowView* view = [[ImageShowView alloc]initWithFrame:window.bounds andImage:[self cutImage]];
        [window addSubview:view];
        if (self.delegate!=nil &&
            [self.delegate respondsToSelector:@selector(cutPicture:)])
        {
            [self.delegate cutPicture:image];
        }
    }else
    {
        NSLog(@"cancel");
        if (self.delegate!=nil &&
            [self.delegate respondsToSelector:@selector(cancelCutPicture)])
        {
            [self.delegate cancelCutPicture];
        }
    }
}
@end

//
//  ProgressBar.m
//  MyController
//
//  Created by 陈前进 on 16/10/12.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "AvPlayerProgressBar.h"
@implementation Param_AvPlayerProgressBar
@end
@implementation AvPlayerProgressBar

-(AvPlayerProgressBar*)initWithFrame:(CGRect)rect andParam:(Param_AvPlayerProgressBar*)param
{
    self = [super initWithFrame:rect];
    self.param = param;
    [self initViews];
    [self addTapMoveAction];
    [self addTapClickAction];
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    
    CGRect rtSlip = rect;
    rtSlip.size.height = self.param.slipHeight;
    rtSlip.origin.y = (rect.size.height-rtSlip.size.height)/2;
    rtSlip.size.width = rect.size.width-self.param.pointHeight;
    rtSlip.origin.x = self.param.pointHeight/2;
    [self initSlipWithRect:rtSlip];
    
    CGRect rtPoint = rect;
    rtPoint.size.height = self.param.pointHeight;
    rtPoint.size.width = rtPoint.size.height;
    rtPoint.origin.y = (rect.size.height-rtPoint.size.height)/2;
    [self initPointWithRect:rtPoint];
}

-(void)initSlipWithRect:(CGRect)rect
{
    self.slip = [[CAGradientLayer alloc]init];
    [self.slip setFrame:rect];
    [self.slip setBackgroundColor:self.param.clrBack.CGColor];
    [self.layer addSublayer:self.slip];
}

-(void)initPointWithRect:(CGRect)rect
{
    self.point = [[UIView alloc]initWithFrame:rect];
    [self.point.layer setContents:(__bridge id)self.param.imgPoint.CGImage];
    [self.point.layer setContentsGravity:kCAGravityResizeAspectFill];
    [self addSubview:self.point];
}

-(void)setPosition:(CGFloat)percent
{
    self.persent = percent;
    CGRect rtGradient = [self getGradianRect:percent];
    CGRect rect = self.slip.bounds;
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    if (rtGradient.origin.x<=0)
    {
        self.slip.colors = @[(__bridge id)self.param.clrFront.CGColor,
                             (__bridge id)self.param.clrCur.CGColor,
                             (__bridge id)self.param.clrBack.CGColor,
                             (__bridge id)self.param.clrBack.CGColor];
        self.slip.locations = @[@0.0,
                                @(percent),
                                @(percent),
                                @1];
    }else
    {
        self.slip.colors = @[(__bridge id)self.param.clrFront.CGColor,
                             (__bridge id)self.param.clrFront.CGColor,
                             (__bridge id)self.param.clrCur.CGColor,
                             (__bridge id)self.param.clrBack.CGColor,
                             (__bridge id)self.param.clrBack.CGColor];
        self.slip.locations = @[@0.0,
                                @(rtGradient.origin.x/rect.size.width),
                                @(percent),
                                @(percent),
                                @1];
    }
    self.slip.startPoint = CGPointMake(0, 0);
    self.slip.endPoint = CGPointMake(1, 0);
    
    [CATransaction commit];
    
    CGPoint point = self.point.center;
    point.x = rect.size.width*percent+self.param.pointHeight/2;
    self.point.center = point;
}
-(CGRect)getGradianRect:(CGFloat)percent
{
    CGRect rect = self.slip.bounds;
    CGRect rtRet = rect;
    CGFloat width = rect.size.width*percent;
    rtRet.size.width = width;
    if (width>self.param.gradientWidth)
    {
        rtRet.size.width = self.param.gradientWidth;
        rtRet.origin.x = width-rtRet.size.width;
    }
    return rtRet;
}

-(void)resetSize
{
    CGRect rect = self.bounds;
    
    CGRect rtSlip = rect;
    rtSlip.size.height = self.param.slipHeight;
    rtSlip.origin.y = (rect.size.height-rtSlip.size.height)/2;
    rtSlip.size.width = rect.size.width-self.param.pointHeight;
    rtSlip.origin.x = self.param.pointHeight/2;
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [self.slip setFrame:rtSlip];
    [CATransaction commit];
    
    [self setPosition:self.persent];
}

-(void)addTapClickAction
{
    UITapGestureRecognizer* tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                    initWithTarget:self
                                                    action:@selector(tapClickAction:)];
    [self.point addGestureRecognizer:tapGestureRecognizer];
}

-(void)tapClickAction:(UITapGestureRecognizer*) recognizer
{
    NSLog(@"kkkk");
}

-(void)addTapMoveAction
{
    UIPanGestureRecognizer* panGestureRecognizer = [[UIPanGestureRecognizer alloc]
                                                    initWithTarget:self
                                                    action:@selector(tapMoveAction:)];
    [self.point addGestureRecognizer:panGestureRecognizer];
}

-(void)tapMoveAction:(UIPanGestureRecognizer*) recognizer
{
    if (recognizer.numberOfTouches>1)
    {
        return;
    }
    CGPoint point = [recognizer translationInView:self];

    if (recognizer.state==UIGestureRecognizerStateBegan)
    {
        self.ptMove = point;
        if (self.delegate!=nil &&
            [self.delegate respondsToSelector:@selector(pointReadyMoveWithPersent:)])
        {
            [self.delegate pointReadyMoveWithPersent:self.persent];
        }
        return;
    }else if(recognizer.state==UIGestureRecognizerStateCancelled    ||
             recognizer.state==UIGestureRecognizerStateEnded        ||
             recognizer.state==UIGestureRecognizerStateFailed)
    {
        if (self.delegate!=nil &&
            [self.delegate respondsToSelector:@selector(pointMovedWithPersent:)])
        {
            [self.delegate pointMovedWithPersent:self.persent];
        }
        return;
    }
    CGFloat xoffset = point.x-self.ptMove.x;
    CGRect rtSlip = self.slip.frame;
    CGRect rtPoint = self.point.frame;
    rtPoint.origin.x += xoffset;
    if (rtPoint.origin.x<rtSlip.origin.x-self.param.pointHeight/2)
    {
        rtPoint.origin.x = rtSlip.origin.x-self.param.pointHeight/2;
    }else if(rtPoint.origin.x>rtSlip.origin.x+rtSlip.size.width-self.param.pointHeight/2)
    {
        rtPoint.origin.x = rtSlip.origin.x+rtSlip.size.width-self.param.pointHeight/2;
    }
    
    CGFloat persent = (rtPoint.origin.x+self.param.pointHeight/2-rtSlip.origin.x)/rtSlip.size.width;
    [self setPosition:persent];
    self.point.frame = rtPoint;
    self.ptMove = point;
    
    if (self.delegate!=nil &&
        [self.delegate respondsToSelector:@selector(pointMovingWithPersent:)])
    {
        [self.delegate pointMovingWithPersent:self.persent];
    }
}

@end

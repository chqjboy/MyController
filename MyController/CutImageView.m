//
//  CutImageView.m
//  MyController
//
//  Created by 陈前进 on 16/9/7.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "CutImageView.h"

@implementation CutImageView
-(CutImageView*)initWithFrame:(CGRect)rect andImage:(UIImage*)image andEdgeFrame:(CGRect)edgeFrame
{
    self = [super initWithFrame:rect];
    self.initFrame = rect;
    self.edgeFrame = edgeFrame;
    self.image = image;
    [self setBackgroundColor:[UIColor blackColor]];
    self.userInteractionEnabled = YES;
    self.scale = 1;
    [self addTapMoveAction];
    [self addTapScaleAction];
    return self;
}

-(void)addTapMoveAction
{
    UIPanGestureRecognizer* panGestureRecognizer = [[UIPanGestureRecognizer alloc]
                                                    initWithTarget:self
                                                    action:@selector(tapMoveAction:)];
    [self addGestureRecognizer:panGestureRecognizer];
}
-(void)addTapScaleAction
{
    UIPinchGestureRecognizer* panGestureRecognizer = [[UIPinchGestureRecognizer alloc]
                                                      initWithTarget:self
                                                      action:@selector(tapScaleAction:)];
    [self addGestureRecognizer:panGestureRecognizer];
}

-(void)tapMoveAction:(UIPanGestureRecognizer*) recognizer
{
    if (recognizer.numberOfTouches>1)
    {
        return;
    }
    CGPoint point = [recognizer translationInView:self];
    point = CGPointMake(point.x*self.scale, point.y*self.scale);
    if (recognizer.state==UIGestureRecognizerStateBegan)
    {
        self.ptMove = point;
        return;
    }else if(recognizer.state==UIGestureRecognizerStateCancelled    ||
             recognizer.state==UIGestureRecognizerStateEnded        ||
             recognizer.state==UIGestureRecognizerStateFailed)
    {
        [self adjustEndAction];
        return;
    }
    CGRect rect = self.frame;
    rect.origin.x += (point.x-self.ptMove.x);
    rect.origin.y += (point.y-self.ptMove.y);
    self.frame = rect;
    self.ptMove = point;
    NSLog(@"pointx:%0.2f, pointy:%0.2f", point.x, point.y);
    [self adjustEndAction];
}
-(void)tapScaleAction:(UIPinchGestureRecognizer*) recognizer
{
    if (recognizer.numberOfTouches>2)
    {
        return;
    }
    CGFloat scale = self.scale*recognizer.scale;
    if (recognizer.state==UIGestureRecognizerStateBegan)
    {
        CGPoint onoPoint = [recognizer locationOfTouch:0 inView:recognizer.view];
        CGPoint twoPoint = [recognizer locationOfTouch:1 inView:recognizer.view];
        
        CGPoint anchorPoint;
        anchorPoint.x = (onoPoint.x + twoPoint.x) / 2 / recognizer.view.bounds.size.width;
        anchorPoint.y = (onoPoint.y + twoPoint.y) / 2 / recognizer.view.bounds.size.height;
        
        [self setAnchorPoint:anchorPoint forView:recognizer.view];
    }else if(recognizer.state==UIGestureRecognizerStateCancelled    ||
             recognizer.state==UIGestureRecognizerStateEnded        ||
             recognizer.state==UIGestureRecognizerStateFailed)
    {
        self.scale=scale;
        [self adjustEndAction];
        return;
    }
    self.transform = CGAffineTransformMakeScale(scale, scale);
    NSLog(@"recognizer:%0.2f, self.scale:%0.2f", recognizer.scale, self.scale);
    
}

- (void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view
{
    CGPoint oldOrigin = view.frame.origin;
    view.layer.anchorPoint = anchorPoint;
    CGPoint newOrigin = view.frame.origin;
    
    CGPoint transition;
    transition.x = newOrigin.x - oldOrigin.x;
    transition.y = newOrigin.y - oldOrigin.y;
    
    view.center = CGPointMake (view.center.x - transition.x, view.center.y - transition.y);
}

- (void)setDefaultAnchorPointforView:(UIView *)view
{
    [self setAnchorPoint:CGPointMake(0.5f, 0.5f) forView:view];
}

-(void)adjustEndAction
{
    if (self.scale<1)
    {
        self.transform = CGAffineTransformMakeScale(1, 1);
        self.scale = 1;
        [self setDefaultAnchorPointforView:self];
        self.frame = self.initFrame;
    }else
    {
        CGRect rect = self.frame;
        if (rect.origin.x+rect.size.width<self.edgeFrame.origin.x+self.edgeFrame.size.width)
        {
            rect.origin.x = self.edgeFrame.origin.x+self.edgeFrame.size.width-rect.size.width;
        }
        if (rect.origin.x>self.edgeFrame.origin.x)
        {
            rect.origin.x = self.edgeFrame.origin.x;
        }
        
        if (rect.origin.y+rect.size.height<self.edgeFrame.origin.y+self.edgeFrame.size.height)
        {
            rect.origin.y = self.edgeFrame.origin.y+self.edgeFrame.size.height-rect.size.height;
        }
        if (rect.origin.y>self.edgeFrame.origin.y)
        {
            rect.origin.y=self.edgeFrame.origin.y;
        }
        self.frame = rect;
    }
}
@end

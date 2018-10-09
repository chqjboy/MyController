//
//  CycleScrollView.m
//  MyController
//
//  Created by 陈前进 on 16/8/4.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "CycleHRollView.h"
#import "Animations.h"
@implementation Param_CycleHRollView

@end
@implementation CycleHRollView
-(CycleHRollView*)initWithFrame:(CGRect)rect andParam:(Param_CycleHRollView*)param
{
    self = [super initWithFrame:rect];
    self.param = param;
    [self addPanGesture];
    [self initCaps];
    self.clipsToBounds = YES;
    return self;
}
-(void)addPanGesture
{
    UIPanGestureRecognizer* gest = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureAction:)];
    [self addGestureRecognizer:gest];
}

-(void)initCaps
{
    NSInteger count =(int)floor(self.bounds.size.width/self.param.pageWidth);
    self.inset = (self.bounds.size.width-count*self.param.pageWidth)/2;
    count += 2;
    CGRect rtCap = CGRectMake(0, 0, self.param.pageWidth, self.bounds.size.height);
    NSMutableArray* caps = [[NSMutableArray alloc]init];
    for (int i=0; i<count; i++)
    {
        rtCap.origin.x = self.inset-self.param.pageWidth+i*self.param.pageWidth;
        UIView* cap = [[UIView alloc]initWithFrame:rtCap];
        [cap setBackgroundColor:[UIColor blackColor]];
        [cap.layer setCornerRadius:15];
        [caps addObject:cap];
        [self addSubview:cap];
        
        UIView* view = [self.param.views objectAtIndex:(i%self.param.views.count)];
        CGRect rtView = view.frame;
        rtView.origin.x = (rtCap.size.width-rtView.size.width)/2;
        rtView.origin.y = (rtCap.size.height-rtView.size.height)/2;
        view.frame = rtView;
        [cap addSubview:view];
    }
    self.caps = caps;
}

-(void)panGestureAction:(UIPanGestureRecognizer*)rec
{
    CGPoint point = [rec translationInView:self];
    
    if (rec.state == UIGestureRecognizerStateBegan)
    {
        self.ptMove = point;
        return;
    }else if(rec.state==UIGestureRecognizerStateChanged)
    {
        CGFloat distance = point.x-self.ptMove.x;
        [self adjustCapsWithDistance:distance];
        self.ptMove = point;
    }else if(rec.state==UIGestureRecognizerStateEnded ||
             rec.state==UIGestureRecognizerStateFailed ||
             rec.state==UIGestureRecognizerStatePossible)
    {
        [self adjustCapsWithAnimate];
    }
}

-(UIView*)copyView:(UIView*)view
{
    NSData * tempArchive = [NSKeyedArchiver archivedDataWithRootObject:view];
    return [NSKeyedUnarchiver unarchiveObjectWithData:tempArchive];
}

-(void)adjustCapsWithDistance:(CGFloat)distance
{
    for (UIView* cap in self.caps)
    {
        CGRect rect = cap.frame;
        rect.origin.x += distance;
        cap.frame = rect;
    }
    UIView* firstcap = [self.caps objectAtIndex:0];
    UIView* lastcap = [self.caps objectAtIndex:self.caps.count-1];
    if (distance>0)
    {
        CGRect rect = firstcap.frame;
        if (rect.origin.x>=0)
        {
            [self.caps removeObject:lastcap];
            rect.origin.x -= rect.size.width;
            lastcap.frame = rect;
            [self.caps insertObject:lastcap atIndex:0];
            [(UIView*)[lastcap.subviews objectAtIndex:0] removeFromSuperview];
            [self adjustCapContent:lastcap andFirst:YES];
        }
        
    }else if (distance<0)
    {
        CGRect rect = lastcap.frame;
        if (rect.origin.x+rect.size.width<=self.bounds.size.width)
        {
            [self.caps removeObject:firstcap];
            rect.origin.x += rect.size.width;
            firstcap.frame = rect;
            [self.caps addObject:firstcap];
            [(UIView*)[firstcap.subviews objectAtIndex:0] removeFromSuperview];
            [self adjustCapContent:firstcap andFirst:NO];
        }
    }
}

-(void)adjustCapContent:(UIView*)cap andFirst:(BOOL)first
{
    NSInteger index = 0;
    if (first)
    {
        UIView* capsec = [self.caps objectAtIndex:1];
        index = [self.param.views indexOfObject:[capsec.subviews objectAtIndex:0]];
        index -= 1;
        if (index<0)
        {
            index += self.param.views.count;
        }
    }else
    {
        UIView* capsec = [self.caps objectAtIndex:self.caps.count-2];
        index = [self.param.views indexOfObject:[capsec.subviews objectAtIndex:0]];
        index += 1;
        if (index>self.param.views.count-1)
        {
            index -= self.param.views.count;
        }
    }
    UIView* view = [self.param.views objectAtIndex:index];
    CGRect rtView = view.frame;
    CGRect rtCap = cap.bounds;
    rtView.origin.x = (rtCap.size.width-rtView.size.width)/2;
    rtView.origin.y = (rtCap.size.height-rtView.size.height)/2;
    view.frame = rtView;
    [cap addSubview:view];
}

-(void)adjustCapsWithAnimate
{
    UIView* cap = [self.caps objectAtIndex:0];
    CGPoint origin = cap.frame.origin;
    CGFloat space = self.inset-origin.x-self.param.pageWidth;
    for (UIView* cap in self.caps)
    {
        [Animations moveRight:cap andAnimationDuration:0.2 andLength:space completion:^(BOOL finished) {
            
        }];
    }
}
@end

//
//  LeftSlideMsgView.m
//  MyController
//
//  Created by 陈前进 on 16/8/9.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "SlideMsgView.h"
#import "Animations.h"
@implementation Param_SlideMsgCap
@end
@implementation Param_SlideMsgView
@end
@implementation SlideMsgView
-(SlideMsgView*)initWithFrame:(CGRect)rect andParam:(Param_SlideMsgView*)param
{
    self = [super initWithFrame:rect];
    self.param = param;
    self.caps = [[NSMutableArray alloc]init];
    self.bufViews = [[NSMutableArray alloc]init];
    [self initViews];
    self.clipsToBounds = YES;
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    [self initCapsWithRect:rect];
}
-(void)initCapsWithRect:(CGRect)rect
{
    NSInteger count = (int)(rect.size.height/self.param.capHeight);
    CGFloat space = (rect.size.height-count*self.param.capHeight)/(count+1);
    CGRect rtCap = rect;
    rtCap.size.height = self.param.capHeight;
    for (int i=0; i<count; i++)
    {
        rtCap.origin.y = (i+1)*space+i*self.param.capHeight;
        Param_SlideMsgCap* pcap = [[Param_SlideMsgCap alloc]init];
        pcap.empty = YES;
        pcap.frame = rtCap;
        [self.caps addObject:pcap];
    }
}

-(void)addMsgView:(UIView*)view
{
    [self.bufViews addObject:view];
    [self updateCaps];
}

-(void)updateCaps
{
    Param_SlideMsgCap* cap = [self getEmptyCap];
    if (cap==nil)
    {
        return;
    }
    UIView* view = nil;
    if (self.bufViews.count>0)
    {
        view = [self.bufViews objectAtIndex:0];
        [self.bufViews removeObjectAtIndex:0];
    }
    if (view==nil)
    {
        return;
    }
    cap.view = view;
    cap.empty = NO;
    [self actionSlideCap:cap];
}

-(Param_SlideMsgCap*)getEmptyCap
{
    for (Param_SlideMsgCap* cap in self.caps)
    {
        if (cap.empty)
        {
            return cap;
        }
    }
    return nil;
}

-(void)actionSlideCap:(Param_SlideMsgCap*)cap
{
    CGRect rect = cap.view.frame;
    CGFloat length = 0;
    rect.origin.y = cap.frame.origin.y+(cap.frame.size.height-rect.size.height)/2;
    if (self.param.left)
    {
        rect.origin.x = -rect.size.width;
        length = cap.frame.size.width;
    }else
    {
        rect.origin.x = cap.frame.size.width;
        length = -cap.frame.size.width;
    }
    cap.view.frame = rect;
    [self addSubview:cap.view];
    [Animations moveRight:cap.view andAnimationDuration:0.3 andLength:length completion:^(BOOL finished)
     {
        [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(actionFade:) userInfo:cap repeats:NO];
    }];
}

-(void)actionFade:(NSTimer*)timer
{
    Param_SlideMsgCap* cap = timer.userInfo;
    [cap.view removeFromSuperview];
    cap.empty = YES;
    [self updateCaps];
}
@end

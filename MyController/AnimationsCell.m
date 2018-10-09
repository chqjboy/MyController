//
//  AnimationsCell.m
//  MyController
//
//  Created by 陈前进 on 16/3/25.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "AnimationsCell.h"

@implementation AnimationsCell
-(AnimationsCell*)initWithFrame:(CGRect)rect andName:(NSString*)name
{
    self = [super initWithFrame:rect];
    self.nameValue = name;
    [self initViews];
    [Functions addTapEventWithTarget:self View:self andAction:@selector(cellClick)];
    return self;
}
-(void)initViews
{
    CGRect rect = self.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    
    CGRect rtName = rect;
    rtName.origin.x = 10*[Device getHScale];
    rtName.origin.y = 10*[Device getVScale];
    [self initNameWithRect:rtName];
    rtName = self.name.frame;
    
    CGRect rtArrow = rect;
    rtArrow.size.height = rtName.size.height;
    rtArrow.origin.y = rtName.origin.y;
    [self initArrowWithRect:rtArrow];
    rtArrow = self.arrow.frame;
    
    CGRect rtLine = rect;
    rtLine.size.height = 0.5;
    rtLine.origin.y = 2*rtName.origin.y+rtName.size.height;
    [Functions drawLineWithRect:rtLine andView:self];
    
    CGRect rtLast = rtLine;
    rect = self.frame;
    rect.size.height = rtLast.origin.y+rtLast.size.height;
    self.frame = rect;
}
-(void)initNameWithRect:(CGRect)rect
{
    self.name = [[FitLineLabel alloc]initWithFrame:rect
                                        andContent:self.nameValue
                                           andFont:GLOBAL_FONT(17*[Device getHScale])
                                          andColor:GLOBAL_COLOR(102, 102, 102)];
    [self addSubview:self.name];
}
-(void)initArrowWithRect:(CGRect)rect
{
    CGRect rtArrow = rect;
    rtArrow.size.height = 15*[Device getHScale];
    UIImage* image = [UIImage imageNamed:@"arrow"];
    rtArrow.size.width = rtArrow.size.height*image.size.width/image.size.height;
    rtArrow.origin.y = rect.origin.y+(rect.size.height-rtArrow.size.height)/2;
    rtArrow.origin.x = rect.size.width-rtArrow.size.width-10*[Device getHScale];
    self.arrow = [[UIImageView alloc]initWithFrame:rtArrow];
    [self.arrow setImage:image];
    [self addSubview:self.arrow];
}
-(void)cellClick
{
    if (self.delegate!=nil &&
        [self.delegate respondsToSelector:@selector(cellClickWithView:)])
    {
        [self.delegate cellClickWithView:self];
    }
}
@end

//
//  VScrollCell.m
//  MyController
//
//  Created by 陈前进 on 16/3/25.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "VScrollCell.h"

@implementation VScrollCell
-(VScrollCell*)initWithFrame:(CGRect)rect andName:(NSString*)name
{
    self = [super initWithFrame:rect];
    self.nameValue = name;
    [self initViews];
    return self;
}
-(void)initViews
{
    CGRect rect = self.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    
    CGRect rtName = rect;
    rtName.origin.x = 10*[Device getHScale];
    rtName.size.width = rect.size.width-2*rtName.origin.x;
    rtName.origin.y = 10*[Device getHScale];
    [self initNameWithRect:rtName];
    rtName = self.name.frame;
    
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
    self.name = [[FitLineLabel alloc]initWithFrame:rect andContent:self.nameValue andFont:GLOBAL_FONT(15*[Device getHScale]) andColor:GLOBAL_COLOR(102, 102, 102)];
    [self addSubview:self.name];
}
@end

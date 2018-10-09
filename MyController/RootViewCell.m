//
//  RootViewCell.m
//  MyController
//
//  Created by 陈前进 on 16/3/23.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "RootViewCell.h"
#import "AlbumCtrler.h"
@implementation Param_RootViewCell
@synthesize title = _title;
@synthesize clsCtrler = _clsCtrler;
@end
@implementation RootViewCell

-(RootViewCell*)initWithFrame:(CGRect)rect andParam:(Param_RootViewCell*)param
{
    self = [super initWithFrame:rect];
    self.param = param;
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
                                        andContent:self.param.title
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
    self.ctrler = [Functions getInstanceWithClass:self.param.clsCtrler];
    self.ctrler.title = self.param.title;
    self.ctrler.delegate = self;
    if ([self.ctrler isKindOfClass:[AlbumCtrler class]])
    {
        [AlbumCtrler showAlbumNavViewCtrler:[Functions getSuperViewCtrler:self].navigationController andMode:eAlbumEnumMode_all andSigleSelect:NO andDelegae:self andCallback:self];
    }else
    {
        [[Functions getSuperViewCtrler:self].navigationController pushViewController:self.ctrler animated:YES];
    }
}

-(void)backWithCtrler:(id)ctrler
{
    self.ctrler = nil;
}
-(void)albumSelectedImages:(NSArray<UIImage *> *)images
{
    NSLog(@"%zd", images.count);
}
-(void)albumSelectedVideos:(NSArray<NSURL *> *)urls
{
    for (NSURL* url in urls)
    {
        NSLog(@"albumSelectedVideos:%@", url.absoluteString);
    }
    
}
@end

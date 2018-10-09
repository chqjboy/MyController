//
//  FitSizeLabel.m
//  ucare
//
//  Created by 陈前进 on 15/9/5.
//  Copyright (c) 2015年 yujian. All rights reserved.
//

#import "FitLineLabel.h"

@implementation FitLineLabel
-(FitLineLabel*) initWithFrame:(CGRect)rect andContent:(NSString*)content andFont:(UIFont*)font andColor:(UIColor*)color
{
    self = [super initWithFrame:rect];
    [self setFont:font];
    [self setTextColor:color];
    [self setText:content];
    
    self.numberOfLines = 0;
    self.lineBreakMode = UILineBreakModeWordWrap;
    CGSize size = CGSizeMake(self.frame.size.width, MAXFLOAT);
    size = [self sizeThatFits:size];
    rect.size = size;
    [self setFrame:rect];
    return self;
}

-(FitLineLabel*)initWithFrame:(CGRect)rect andContent:(NSMutableAttributedString*)content
{
    self = [super initWithFrame:rect];
    [self setAttributedText:content];
    
    self.numberOfLines = 0;
    self.lineBreakMode = UILineBreakModeWordWrap;
    CGSize size = CGSizeMake(self.frame.size.width, MAXFLOAT);
    size = [self sizeThatFits:size];
    rect.size = size;
    [self setFrame:rect];
    return self;
}
-(FitLineLabel*) initWithFrame:(CGRect)rect andContent:(NSString*)content andFont:(UIFont*)font andColor:(UIColor*)color andLimitLine:(NSInteger)lines
{
    self = [super initWithFrame:rect];
    [self setFont:font];
    [self setTextColor:color];
    [self setText:content];
    
    self.numberOfLines = lines;
    self.lineBreakMode = UILineBreakModeTailTruncation;
    
    NSString* text = @"测";
    for (int i=0; i<lines-1; i++)
    {
        text = [text stringByAppendingString:@"\n测"];
    }
    CGSize sizeTest = [text sizeWithFont:font];
    
    
    CGSize size = CGSizeMake(self.frame.size.width, MAXFLOAT);
    size.height = sizeTest.height;
    size = [self sizeThatFits:size];
    rect.size.height = size.height;
    [self setFrame:rect];
    return self;
}
@end

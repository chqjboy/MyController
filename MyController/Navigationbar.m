//
//  Navigationbar.m
//  MyController
//
//  Created by 陈前进 on 16/3/23.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "Navigationbar.h"

@implementation Navigationbar

- (void)drawRect:(CGRect)rect
{
    [[UIImage imageNamed:@"nav_bg_image.png"] drawInRect:rect];
}


- (void)setNeedsLayout
{
    [super setNeedsLayout];
    
    self.barStyle = (self.stateBarStyle)?[self.stateBarStyle integerValue]:UIBarStyleBlackOpaque;
    UIView *view = [self viewWithTag:99900];
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, -20, self.bounds.size.width, 20)];
        view.backgroundColor = (self.stateBarColor)?self.stateBarColor:[UIColor blackColor];
        [self addSubview:view];
    }
    
    /**< 起到在IOS 7中navbar 和state bar 不 悬浮的作用*/
    self.translucent = NO;
    
    self.tintColor = [UIColor clearColor];
}

- (void)setStateBarColor:(UIColor *)stateBarColor
{
    _stateBarColor = stateBarColor;
    UIView *view = [self viewWithTag:99900];
    if (!view&&stateBarColor) {
        [self setNeedsLayout];
    }
}

- (void)setCusBarStyele:(UIBarStyle)cusBarStyele
{
    _stateBarStyle = [NSNumber numberWithInteger:cusBarStyele];
    [self setNeedsLayout];
}

- (void)setDefault
{
    self.stateBarColor = [UIColor blackColor];
    self.cusBarStyele = UIBarStyleBlackOpaque;
}
@end

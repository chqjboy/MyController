//
//  ASTextView.m
//  MyController
//
//  Created by 陈前进 on 2018/1/12.
//  Copyright © 2018年 mycontroller. All rights reserved.
//

#import "ASTextView.h"

@implementation ASTextView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.placeHolder = @"请输入您的内容";
    self.placeHolderColor = [UIColor grayColor];
    self.contentColor = [UIColor whiteColor];
    self.placeHold = YES;
    [self registNotifications];
    return self;
}
-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    [self fitSize];
}
-(void)registNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textBeginEditing:) name:UITextViewTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChanged:) name:UITextViewTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textEndEditing:) name:UITextViewTextDidEndEditingNotification object:nil];
    
}
-(void)removeNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)textBeginEditing:(NSNotification*)notification
{
    if (self.placeHold)
    {
        [self setPlaceHold:NO];
        [self setText:@""];
    }
}
-(void)textDidChanged:(NSNotification*)notification
{
    [self setPlaceHold:NO];
    [self fitSize];
}
-(void)textEndEditing:(NSNotification*)notification
{
    if (self.text==nil || self.text.length<=0 || [self.text isEqualToString:self.placeHolder])
    {
        [self setPlaceHold:YES];
    }
}
-(void)setPlaceHolder:(NSString *)placeHolder
{
    _placeHolder=placeHolder;
    self.placeHold = YES;
}
-(void)setPlaceHolderColor:(UIColor *)placeHolderColor
{
    _placeHolderColor=placeHolderColor;
    self.placeHold = YES;
}
-(void)setContentColor:(UIColor *)contentColor
{
    _contentColor = contentColor;
    if (!self.placeHold)
    {
        [super setTextColor:contentColor];
    }
}
-(void)setTextColor:(UIColor *)textColor
{
    self.contentColor = textColor;
    if (!self.placeHold)
    {
        [super setTextColor:textColor];
    }
}
-(void)setPlaceHold:(BOOL)placeHold
{
    _placeHold = placeHold;
    if (placeHold)
    {
        self.text = self.placeHolder;
        [super setTextColor:self.placeHolderColor];
    }else
    {
        self.textColor = self.contentColor;
    }
}
-(void)setAutoFitsize:(BOOL)autoFitsize
{
    _autoFitsize=autoFitsize;
    [self fitSize];
}
-(void)fitSize
{
    if (self.autoFitsize)
    {
        CGSize size = [self sizeThatFits:CGSizeMake(self.bounds.size.width, MAXFLOAT)];
        CGRect rect = self.frame;
        if (rect.size.height!=size.height)
        {
            if (self.maxHeight>0 && self.maxHeight<size.height)
            {
                return;
            }
            rect.size.height = size.height;
            self.frame = rect;
            if (self.frameChangeBlock)
            {
                self.frameChangeBlock(self);
            }
        }
    }
}
-(void)deleteBackward
{
    if (self.placeHold)
    {
        [self setPlaceHold:NO];
        [self setText:@""];
    }else
    {
        [super deleteBackward];
    }
}
@end

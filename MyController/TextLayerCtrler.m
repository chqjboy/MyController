//
//  TextLayerCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/4/6.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "TextLayerCtrler.h"

@interface TextLayerCtrler ()

@end

@implementation TextLayerCtrler

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)backClick
{
    if (self.delegate!=nil &&
        [self.delegate respondsToSelector:@selector(backWithCtrler:)])
    {
        [self.delegate backWithCtrler:self];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)initViews
{
    CGRect rect = self.view.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = self.view.bounds;
    //set text attributes
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    //choose a font
    UIFont *font = [UIFont systemFontOfSize:15];
    //set layer font
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
//    textLayer.font = fontRef;
//    textLayer.fontSize = font.pointSize;
    //choose some text
//    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing \ elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \ leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel \ fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \ lobortis";
//    textLayer.string = text;
    
    //choose some text
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing \ elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \ leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc \ elementum, libero ut porttitor dictum, diam odio congue lacus, vel \ fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \ lobortis";
    //create attributed string
    NSMutableAttributedString *string = nil;
    string = [[NSMutableAttributedString alloc] initWithString:text];
    //convert UIFont to a CTFont
    //set text attributes
    
    NSDictionary *attribs = @{
                              NSForegroundColorAttributeName:[UIColor blackColor]
                              };
    [string setAttributes:attribs range:NSMakeRange(0, [text length])];
    attribs = @{
                NSForegroundColorAttributeName:[UIColor redColor],
                NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)
                };
    [string setAttributes:attribs range:NSMakeRange(6, 5)];
    //release the CTFont we created earlier
    //CFRelease(fontRef);   
    //set layer text
    textLayer.string = string;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    [self.view.layer addSublayer:textLayer];
}
@end

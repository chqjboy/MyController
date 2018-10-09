//
//  AutoSizeTextViewCtrler.m
//  MyController
//
//  Created by 陈前进 on 2018/1/12.
//  Copyright © 2018年 mycontroller. All rights reserved.
//

#import "AutoSizeTextViewCtrler.h"

@interface AutoSizeTextViewCtrler ()

@end

@implementation AutoSizeTextViewCtrler

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [Functions addTapEventWithTarget:self View:self.view andAction:@selector(viewClick)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initViews
{
    CGRect rect = self.view.bounds;
    
    CGRect rtText = rect;
    rtText.size.width = 150;
    rtText.origin.x = (rect.size.width-rtText.size.width)/2;
    rtText.origin.y = 100;
    rtText.size.height = 40;
    self.textView = [[ASTextView alloc]initWithFrame:rtText];
    [self.textView setBackgroundColor:GLOBAL_COLOR(31, 47, 50)];
    [self.textView setTextColor:GLOBAL_COLOR(238, 238, 238)];
    [self.textView setFont:[UIFont systemFontOfSize:12]];
    [self.textView setMaxHeight:60];
    [self.textView setAutoFitsize:YES];
    [self.textView setFrameChangeBlock:^(ASTextView* textView) {
        NSLog(@"height:%0.2f", textView.bounds.size.height);
    }];
    [self.view addSubview:self.textView];
}
-(void)viewClick
{
    [self.view endEditing:YES];
}
@end

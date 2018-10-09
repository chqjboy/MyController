//
//  PickerViewCtrler.m
//  MyController
//
//  Created by 陈前进 on 17/4/1.
//  Copyright © 2017年 mycontroller. All rights reserved.
//

#import "PickerViewCtrler.h"

@implementation PickerViewCtrler
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
    CGRect rect = self.view.bounds;
    
    CGRect rtPicker = rect;
    rtPicker.size.height = 3*40;
    rtPicker.size.width = 215;
    rtPicker.origin.x = (rect.size.width-rtPicker.size.width)/2;
    rtPicker.origin.y = (rect.size.height-rtPicker.size.height)/2;
    [self initPickerViewWithRect:rtPicker];
    
    [Functions addTapEventWithTarget:self View:self.view andAction:@selector(click)];
}

-(void)click
{
    NSString* timestamp = [self.pickerView getSelectTimeStamp];
    if (timestamp)
    {
        NSString* time = [Functions getDateString:[Functions getDateFromTimestamp:timestamp] andFormat:@"yyyy年MM月dd日 HH:mm"];
        [Functions showCancelAlertWithTitle:@"" andMessage:time andDelegate:nil andCancelBtn:@"确定"];
    }
}

-(void)initPickerViewWithRect:(CGRect)rect
{
    NSMutableArray* array = [[NSMutableArray alloc]init];
    NSTimeInterval now = [NSDate date].timeIntervalSince1970;
    for (int i=0; i<500; i++)
    {
        NSString* timestamp = [NSString stringWithFormat:@"%0.3f", now+i*10*60];
        [array addObject:timestamp];
        NSString* date = [Functions getDateString:[Functions getDateFromTimestamp:timestamp] andFormat:@"MM月dd日 HH:mm"];
        NSLog(@"%@",date);
    }
    self.pickerView = [[SDateTimePickerView alloc]initWithFrame:rect andParam:array];
    [self.pickerView.layer setBorderColor:GLOBAL_ACOLOR(120, 130, 112, 1).CGColor];
    [self.pickerView.layer setBorderWidth:0.5];
    [self.pickerView.layer setMasksToBounds:YES];
    [self.view addSubview:self.pickerView];
}

@end

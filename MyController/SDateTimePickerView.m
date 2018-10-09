//
//  SDateTimePickerView.m
//  MyController
//
//  Created by 陈前进 on 17/4/5.
//  Copyright © 2017年 mycontroller. All rights reserved.
//

#import "SDateTimePickerView.h"
@implementation Param_SDateTimePickerView
@end
@implementation SDateTimePickerView
-(SDateTimePickerView*)initWithFrame:(CGRect)rect andParam:(NSArray*)timestamps
{
    self = [super initWithFrame:rect];
    self.timstamps = timestamps;
    [self initParam];
    [self initViews];
    [self updateHours];
    [self updateMinutes];
    return self;
}
-(void)initParam
{
    self.param = [[Param_SDateTimePickerView alloc]init];
    Param_PickerColumnView* paramPickerColumnView = [[Param_PickerColumnView alloc]init];
    paramPickerColumnView.showlines = 3;
    paramPickerColumnView.selIndex = 1;
    paramPickerColumnView.paramCell = [[Param_PickerDataCell alloc]init];
    paramPickerColumnView.paramCell.font = [UIFont systemFontOfSize:13];
    paramPickerColumnView.paramCell.color = [UIColor blackColor];
    paramPickerColumnView.paramMask = [[Param_PickerSelectMaskView alloc]init];
    paramPickerColumnView.paramMask.clrMask = GLOBAL_ACOLOR(255, 255, 255, 0.5);
    paramPickerColumnView.paramMask.clrIndicator = GLOBAL_ACOLOR(95, 200, 241, 1);
    paramPickerColumnView.paramMask.indicateorHeight = 2;
    self.param.paramPickerColumnView = paramPickerColumnView;
    
    [self anlyDateTime];
}

-(void)anlyDateTime
{
    if (self.param.date==nil || self.param.date.items==nil)
    {
        self.param.date = [[PickerColumn alloc]init];
        self.param.date.items = [[NSMutableArray alloc]init];
    }
    [self.param.date.items removeAllObjects];
    
    for (NSString* timestamp in self.timstamps)
    {
        [self addDateWithTimeStamp:timestamp];
    }
    
    for (NSString* timestamp in self.timstamps)
    {
        [self addHourWithTimeStamp:timestamp];
    }
    
    for (NSString* timestamp in self.timstamps)
    {
        [self addMinuteWithTimeStamp:timestamp];
    }
}

-(void)addDateWithTimeStamp:(NSString*)timestamp
{
    BOOL find = NO;
    NSString* title = nil;
    NSString* today = [NSString stringWithFormat:@"%0.3f", [NSDate date].timeIntervalSince1970];
    NSInteger days = [Functions naturaldaysForTimeStamp:timestamp fromTimeStamp:today];
    if (days==0)
    {
        title = @"今天";
    }else if(days==1)
    {
        title = @"明天";
    }else if(days==2)
    {
        title = @"后天";
    }else
    {
        title = [Functions getDateString:[Functions getDateFromTimestamp:timestamp] andFormat:@"MM月dd日"];
    }
    for (PickerData* data in self.param.date.items)
    {
        if ([data.title isEqualToString:title])
        {
            find = YES;
            break;
        }
    }
    if (!find)
    {
        PickerData* data = [[PickerData alloc]init];
        data.title = title;
        PickerColumn* column = [[PickerColumn alloc]init];
        column.items = [[NSMutableArray alloc]init];
        column.data = timestamp;
        data.data = column;
        [self.param.date.items addObject:data];
    }
    return;
}
-(void)addHourWithTimeStamp:(NSString*)timestamp
{
    NSString* hour = [Functions getDateString:[Functions getDateFromTimestamp:timestamp] andFormat:@"HH"];
    for (PickerData* data in self.param.date.items)
    {
        PickerColumn* column = (PickerColumn*)data.data;
        NSString* tmpTs = column.data;
        NSInteger days = [Functions naturaldaysForTimeStamp:timestamp fromTimeStamp:tmpTs];
        if (days==0)
        {
            BOOL find = NO;
            for (PickerData* datahour in column.items)
            {
                if ([datahour.title isEqualToString:hour])
                {
                    find = YES;
                    break;
                }
            }
            if (!find)
            {
                PickerData* hourData = [[PickerData alloc]init];
                hourData.title = hour;
                PickerColumn* hourColumn = [[PickerColumn alloc]init];
                hourColumn.items = [[NSMutableArray alloc]init];
                hourColumn.data = timestamp;
                hourData.data = hourColumn;
                [column.items addObject:hourData];
            }
            break;
        }
    }
}
-(void)addMinuteWithTimeStamp:(NSString*)timestamp
{
    NSString* minute = [Functions getDateString:[Functions getDateFromTimestamp:timestamp] andFormat:@"mm"];
    for (PickerData* data in self.param.date.items)
    {
        PickerColumn* column = (PickerColumn*)data.data;
        NSString* tmpTs = column.data;
        NSInteger days = [Functions naturaldaysForTimeStamp:timestamp fromTimeStamp:tmpTs];
        if (days==0)
        {
            for (PickerData* hourData in column.items)
            {
                PickerColumn* hourColumn = (PickerColumn*)hourData.data;
                NSString* tmpHs = hourColumn.data;
                NSInteger hours = [Functions naturalHoursForTimeStamp:timestamp fromTimeStamp:tmpHs];
                if (hours==0)
                {
                    BOOL find = NO;
                    for (PickerData* dataMinute in hourColumn.items) {
                        if ([dataMinute.title isEqualToString:minute])
                        {
                            find = YES;
                            break;
                        }
                    }
                    if (!find)
                    {
                        PickerData* minuteData = [[PickerData alloc]init];
                        minuteData.title = minute;
                        minuteData.data = timestamp;
                        [hourColumn.items addObject:minuteData];
                    }
                    break;
                }
            }
            break;
        }
        
    }
}

-(void)updateHours
{
    PickerData* date = [self.date getSelectedData];
    if ([date.data isKindOfClass:[PickerColumn class]])
    {
        PickerColumn* column = date.data;
        [self.hour reloadData:column];
    }
}
-(void)updateMinutes
{
    PickerData* hour = [self.hour getSelectedData];
    if ([hour.data isKindOfClass:[PickerColumn class]])
    {
        PickerColumn* column = hour.data;
        [self.minute reloadData:column];
    }
}


-(void)initViews
{
    CGRect rect = self.bounds;
    
    CGRect rtDate = rect;
    rtDate.size.width = 72.5;
    [self initDateWithRect:rtDate];
    
    CGRect rtHour = rect;
    rtHour.size.width=50;
    rtHour.origin.x = rtDate.origin.x+rtDate.size.width+28;
    [self initHourWithRect:rtHour];
    
    CGRect rtMinute = rect;
    rtMinute.size.width = rtHour.size.width;
    rtMinute.origin.x = rect.size.width-rtMinute.size.width;
    [self initMinuteWithRect:rtMinute];
    
    CGRect rtLabel = rect;
    [self initLabelWithRect:rtLabel];
    rtLabel = self.label.frame;
    rtLabel.origin.x = rtHour.origin.x+rtHour.size.width+(rtMinute.origin.x-rtHour.origin.x-rtHour.size.width-rtLabel.size.width)/2;
    rtLabel.origin.y = (rect.size.height-rtLabel.size.height)/2;
    self.label.frame = rtLabel;
}
-(void)initPickerColumnViewWithRect:(CGRect)rect
{
    Param_PickerColumnView* param = [[Param_PickerColumnView alloc]init];
    param.showlines = 3;
    param.selIndex = 1;
    param.paramCell = [[Param_PickerDataCell alloc]init];
    param.paramCell.font = [UIFont systemFontOfSize:13];
    param.paramCell.color = [UIColor blackColor];
    param.paramMask = [[Param_PickerSelectMaskView alloc]init];
    param.paramMask.clrMask = GLOBAL_ACOLOR(255, 255, 255, 0.5);
    param.paramMask.clrIndicator = GLOBAL_ACOLOR(95, 200, 241, 1);
    param.paramMask.indicateorHeight = 2;
    
    [self anlyDateTime];
}
-(void)initDateWithRect:(CGRect)rect
{
    self.date = [[PickerColumnView alloc]initWithFrame:rect andParam:self.param.paramPickerColumnView andData:self.param.date];
    self.date.delegate = self;
    [self addSubview:self.date];
}
-(void)initHourWithRect:(CGRect)rect
{
    PickerColumn* column = nil;
    
    self.hour = [[PickerColumnView alloc]initWithFrame:rect andParam:self.param.paramPickerColumnView andData:column];
    self.hour.delegate = self;
    [self addSubview:self.hour];
}
-(void)initLabelWithRect:(CGRect)rect
{
    NSString* text = @":";
    self.label = [[FitLineLabel alloc]initWithFrame:rect andContent:text andFont:[UIFont systemFontOfSize:13] andColor:[UIColor blackColor]];
    [self addSubview:self.label];
}
-(void)initMinuteWithRect:(CGRect)rect
{
    PickerColumn* column = nil;
    
    self.minute = [[PickerColumnView alloc]initWithFrame:rect andParam:self.param.paramPickerColumnView andData:column];
    self.minute.delegate = self;
    [self addSubview:self.minute];
}
-(void)pickerColumnViewSelected:(PickerColumnView*)pickerView
{
    if (pickerView==self.date)
    {
        [self updateHours];
        [self updateMinutes];
    }else if(pickerView==self.hour)
    {
        [self updateMinutes];
    }
    NSLog(@"pickerView==%@", [pickerView getSelectedData].title);
}
-(NSString*)getSelectTimeStamp
{
    PickerData* time = [self.minute getSelectedData];
    return time.data;
}
@end

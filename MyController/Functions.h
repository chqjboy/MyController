//
//  Functions.h
//  MyController
//
//  Created by 陈前进 on 16/3/23.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"

#define TAG_INDICATORVIEW 8888
#define TAG_INDICATOR     6666

@interface Functions : NSObject
+(void)drawLineWithRect:(CGRect)rect andView:(UIView*)view;
+(void)addTapEventWithTarget:(id)target View:(UIView*)view andAction:(SEL)action;
+(UIImage*)cutImage:(UIImage*)image andTargetSize:(CGSize)size andCutRect:(CGRect)rect;
+(UIImage*)scaleImage:(UIImage*)image toSize:(CGSize)size;
+(UIImage*)cutImage:(UIImage*)image toRect:(CGRect)rect;
+(id)getInstanceWithClass:(Class)cls;
+(UIViewController*)getSuperViewCtrler:(UIView*)view;
+(NSDate*)getDateFromTimestamp:(NSString*)timestamp;
+(NSString*)getDateString:(NSDate*)date andFormat:(NSString*)format;
+(NSString*)getDateTimeWithTimeStatmp:(NSString*)timestamp andFormat:(NSString*)format;
+(NSInteger)naturaldaysForTimeStamp:(NSString*)timestamp1 fromTimeStamp:(NSString*)timestamp2;
+(NSInteger)naturalHoursForTimeStamp:(NSString*)timestamp1 fromTimeStamp:(NSString*)timestamp2;
+(void)showCancelAlertWithTitle:(NSString*)title andMessage:(NSString*)message andDelegate:(id)delegate andCancelBtn:(NSString*)cancel;
+(void)registNotifyWithObserver:(id)obj selector:(SEL)select message:(NSString*)message;
+(void)releaseNotifyWithObserver:(id)obj;
+(UIInterfaceOrientation)getWindowOrientation;
+(UIInterfaceOrientationMask)getWindowOrientationMask;
+(void)setWindowOrientation:(UIInterfaceOrientation)orientation;
+(BOOL)isIPhoneX;
+(CGFloat)tabBarHeight;
+(void)startActIndicatorWithView:(UIView*)view;
+(void)stopActIndicatorWithView:(UIView*)view;
@end

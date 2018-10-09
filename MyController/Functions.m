//
//  Functions.m
//  MyController
//
//  Created by 陈前进 on 16/3/23.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "Functions.h"
#import <objc/runtime.h>
#import <objc/objc.h>
UIInterfaceOrientation g_orientation = UIInterfaceOrientationPortrait;
@implementation Functions
+(void)drawLineWithRect:(CGRect)rect andView:(UIView*)view
{
    UIView* lineview = [[UIView alloc]initWithFrame:rect];
    [lineview setBackgroundColor:[UIColor colorWithRed:198.0/255.0 green:198.0/255.0 blue:198.0/255.0 alpha:1]];
    [view addSubview:lineview];
}
+(void)addTapEventWithTarget:(id)target View:(UIView*)view andAction:(SEL)action
{
    view.userInteractionEnabled = YES;
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    [view addGestureRecognizer:tapGesture];
}

+(UIImage*)cutImage:(UIImage*)image andTargetSize:(CGSize)size andCutRect:(CGRect)rect
{
    UIImage* newImage = [Functions scaleImage:image toSize:size];
    newImage = [Functions cutImage:newImage toRect:rect];
    return newImage;
}

+(UIImage*)scaleImage:(UIImage*)image toSize:(CGSize)size
{
    UIImage *sourceImage = image;
    UIImage *newImage = nil;
    
    CGFloat targetWidth = size.width;
    CGFloat targetHeight = size.height;
    
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    // this is actually the interesting part:
    
    UIGraphicsBeginImageContext(size);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if(newImage == nil) NSLog(@"could not scale image");
    return newImage ;
}
+(UIImage*)cutImage:(UIImage*)image toRect:(CGRect)rect
{
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    UIImage* subImage = [UIImage imageWithCGImage: imageRef];
    CGImageRelease(imageRef);
    return subImage;
}
+(id)getInstanceWithClass:(Class)cls
{
    id instance = [[cls alloc]init];
    return instance;
}
+(UIViewController*)getSuperViewCtrler:(UIView*)view
{
    for (UIView* next = [view superview]; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
+(NSDate*)getDateFromTimestamp:(NSString*)timestamp
{
    return [NSDate dateWithTimeIntervalSince1970:timestamp.doubleValue];
}
+(NSString*)getDateString:(NSDate*)date andFormat:(NSString*)format
{
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:format];
    
    return [dateformatter stringFromDate:date];
}
+(NSString*)getDateTimeWithTimeStatmp:(NSString*)timestamp andFormat:(NSString*)format
{
    return [Functions getDateString:[Functions getDateFromTimestamp:timestamp] andFormat:format];
}
+(NSInteger)naturaldaysForTimeStamp:(NSString*)timestamp1 fromTimeStamp:(NSString*)timestamp2
{
    double ts1 = (timestamp1.doubleValue+8*60*60)/(24*60*60);
    double ts2 = (timestamp2.doubleValue+8*60*60)/(24*60*60);
    return ((int)ts1) - ((int)ts2);
}

+(NSInteger)naturalHoursForTimeStamp:(NSString*)timestamp1 fromTimeStamp:(NSString*)timestamp2
{
    double ts1 = timestamp1.doubleValue/(60*60);
    double ts2 = timestamp2.doubleValue/(60*60);
    return ((int)ts1) - ((int)ts2);
}
+(void)showCancelAlertWithTitle:(NSString*)title andMessage:(NSString*)message andDelegate:(id)delegate andCancelBtn:(NSString*)cancel
{
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancel otherButtonTitles:nil];
    [alert show];
}
+(void)registNotifyWithObserver:(id)obj selector:(SEL)select message:(NSString*)message
{
    [[NSNotificationCenter defaultCenter] addObserver:obj selector:select name:message object:nil];
}
+(void)releaseNotifyWithObserver:(id)obj
{
    [[NSNotificationCenter defaultCenter] removeObserver:obj];
}
+(UIInterfaceOrientation)getWindowOrientation
{
    return g_orientation;
}
+(UIInterfaceOrientationMask)getWindowOrientationMask
{
    UIInterfaceOrientation orientation = [Functions getWindowOrientation];
    if (orientation==UIInterfaceOrientationLandscapeRight)
    {
        return UIInterfaceOrientationMaskLandscapeRight;
    }else
    {
        return UIInterfaceOrientationMaskPortrait;
    }
}
+(void)setWindowOrientation:(UIInterfaceOrientation)orientation
{
    if (g_orientation==orientation)
    {
        return;
    }
    g_orientation = orientation;
    [[UIApplication sharedApplication].delegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:[UIApplication sharedApplication].keyWindow];
    if([[UIDevice currentDevice]respondsToSelector:@selector(setOrientation:)])
    {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = orientation;//横屏
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
    [UIViewController attemptRotationToDeviceOrientation];
}
+(BOOL)isIPhoneX
{
    if ([[Device stringByDevice] isEqualToString:@"iPhoneX"])
    {
        return YES;
    }
    return NO;
}
+(CGFloat)tabBarHeight
{
    if ([[Device stringByDevice] isEqualToString:@"iPhoneX"])
    {
        return TabItemHeightX;
    }
    return TabItemHeight;
}
+(void)startActIndicatorWithView:(UIView*)view
{
    if ([view viewWithTag:TAG_INDICATORVIEW])
    {
        return;
    }
    UIView *viewAct = [[UIView alloc] initWithFrame:CGRectMake(0,0,view.frame.size.width , view.frame.size.height)];
    viewAct.backgroundColor = [UIColor clearColor];
    viewAct.tag = TAG_INDICATORVIEW;
    
    
    UIActivityIndicatorView* actView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    actView.color = [UIColor whiteColor];
    actView.tag = TAG_INDICATOR;
    actView.center = CGPointMake(viewAct.frame.size.width/2, viewAct.frame.size.height/2);
    
    [actView startAnimating];
    [viewAct addSubview:actView];
    [view addSubview:viewAct];
}

+(void)stopActIndicatorWithView:(UIView*)view
{
    if (view==nil)
    {
        return;
    }
    UIView *viewAct = (UIView *)[view viewWithTag:TAG_INDICATORVIEW];
    UIActivityIndicatorView* actView = (UIActivityIndicatorView*)[viewAct viewWithTag:TAG_INDICATOR];
    if (actView==nil)
    {
        return;
    }
    [actView stopAnimating];
    [actView setHidden:YES];
    [viewAct removeFromSuperview];
}
@end

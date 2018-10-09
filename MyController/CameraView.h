//
//  CameraView.h
//  MyController
//
//  Created by 陈前进 on 16/4/11.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "ImageFilter.h"
typedef NS_ENUM(NSInteger, E_CAMERA_CHECK)
{
    E_CAMERA_CHECK_ok = 0,
    E_CAMERA_CHECK_authorlimit,       //摄像头权限访问受限
    E_CAMERA_CHECK_cntreachfront,     //未获取到前置摄像头
    E_CAMERA_CHECK_cntreachback,      //为获取到后置摄像头
    E_CAMERA_CHECK_cntaddinput,       //摄像头输入不可用
    E_CAMERA_CHECK_cntaddoutput       //摄像头输出不可用
};
typedef NS_ENUM(NSInteger, E_CAMERA_DEVICE)
{
    E_CAMERA_DEVICE_front = 0,
    E_CAMERA_DEVICE_back = 1
};

@interface Param_CameraView:NSObject
@property E_CAMERA_DEVICE eDevice;
@end

@protocol CameraViewDelegate <NSObject>
-(void)cutWithImage:(UIImage*)image;
@end

@interface CameraView : UIView
<
AVCaptureVideoDataOutputSampleBufferDelegate
>
{
    id<CameraViewDelegate>delegate;
}
@property(nonatomic, retain) id<CameraViewDelegate>delegate;
@property(nonatomic, retain) AVCaptureSession* session;
@property(nonatomic, retain) AVCaptureDeviceInput* deviceInput;
@property(nonatomic, retain) AVCaptureStillImageOutput* stillImageOutput;
@property(nonatomic, retain) AVCaptureVideoDataOutput*  videoDataOutput;
@property(nonatomic, retain) AVCaptureVideoPreviewLayer* previewLayer;
@property(nonatomic, retain) UIImageView* imageView;
@property(nonatomic, retain) CIContext* context;
@property BOOL canDraw;
@property BOOL isDrawing;

@property(nonatomic, retain) Param_CameraView* param;
@property E_CAMERA_CHECK checkResult;

+(E_CAMERA_CHECK)checkCameraAuthors;
+(AVCaptureDevice*)frontCamera;
+(AVCaptureDevice*)backCamera;

-(CameraView*)initWithFrame:(CGRect)rect andParam:(Param_CameraView*)param;
-(void)initSession;
-(void)initPreviewLayer;
-(void)initImageView;
-(void)start;
-(void)stop;
-(void)switchCamera;
-(void)actionSwitch;
-(void)cutImage;
- (UIImage *)fixOrientation:(UIImage*)image;
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection;
@end

//
//  CameraView.m
//  MyController
//
//  Created by 陈前进 on 16/4/11.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "CameraView.h"
@implementation Param_CameraView
@end
@implementation CameraView
+(E_CAMERA_CHECK)checkCameraAuthors
{
    NSString * mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus  authorizationStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if (authorizationStatus == AVAuthorizationStatusRestricted|| authorizationStatus == AVAuthorizationStatusDenied)
    {
        return E_CAMERA_CHECK_authorlimit;
    }
    if (nil==[CameraView frontCamera])
    {
        return E_CAMERA_CHECK_cntreachfront;
    }
    if (nil==[CameraView backCamera])
    {
        return E_CAMERA_CHECK_cntreachback;
    }
    return E_CAMERA_CHECK_ok;
}
+(AVCaptureDevice*)frontCamera
{
    NSArray* devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice* device in devices)
    {
        if ([device position] == AVCaptureDevicePositionFront)
        {
            return device;
        }
    }
    return nil;
}
+(AVCaptureDevice*)backCamera
{
    NSArray* devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice* device in devices)
    {
        if ([device position] == AVCaptureDevicePositionBack)
        {
            return device;
        }
    }
    return nil;
}
-(CameraView*)initWithFrame:(CGRect)rect andParam:(Param_CameraView*)param
{
    self = [super initWithFrame:rect];
    self.checkResult = [CameraView checkCameraAuthors];
    self.param = param;
    self.canDraw=true;
    [self initSession];
    return self;
}
-(void)initSession
{
    //这个方法的执行我放在init方法里了
    self.session = [[AVCaptureSession alloc] init];
    if (self.param.eDevice==E_CAMERA_DEVICE_front)
    {
        self.deviceInput = [[AVCaptureDeviceInput alloc] initWithDevice:[CameraView frontCamera] error:nil];
    }else
    {
        self.deviceInput = [[AVCaptureDeviceInput alloc] initWithDevice:[CameraView backCamera] error:nil];
    }
    
    //设置图片输出
    self.stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary * outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG,AVVideoCodecKey, nil];
    [self.stillImageOutput setOutputSettings:outputSettings];
    
    //设置视频流输出
    self.videoDataOutput = [[AVCaptureVideoDataOutput alloc]init];
    self.videoDataOutput.videoSettings = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:kCVPixelFormatType_32BGRA] forKey:(id)kCVPixelBufferPixelFormatTypeKey];
    self.videoDataOutput.alwaysDiscardsLateVideoFrames=YES;
    dispatch_queue_t queue;
    queue = dispatch_queue_create("cameraQueue", NULL);
    [self.videoDataOutput setSampleBufferDelegate:self queue:queue];
    
    if ([self.session canAddInput:self.deviceInput])
    {
        [self.session addInput:self.deviceInput];
    }else
    {
        self.checkResult = E_CAMERA_CHECK_cntaddinput;
    }
    
    if ([self.session canAddOutput:self.stillImageOutput]&&
        [self.session canAddOutput:self.videoDataOutput])
    {
        [self.session addOutput:self.stillImageOutput];
        [self.session addOutput:self.videoDataOutput];
    }else
    {
        self.checkResult = E_CAMERA_CHECK_cntaddoutput;
    }
    
    self.context = [CIContext contextWithEAGLContext:[[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2] options:[NSDictionary dictionaryWithObjects:@[[NSNull alloc]] forKeys:@[kCIContextWorkingColorSpace]]];
}

-(void)initImageView
{
    self.imageView = [[UIImageView alloc]initWithFrame:self.bounds];
    [self.imageView setBackgroundColor:[UIColor blackColor]];
    [self addSubview:self.imageView];
}
-(void)start
{
    if (self.session&&self.checkResult==E_CAMERA_CHECK_ok)
    {
        [self.session startRunning];
    }
}
-(void)stop
{
    if (self.session)
    {
        [self.session stopRunning];
    }
}

-(void)switchCamera
{
    if (self.checkResult==E_CAMERA_CHECK_ok)
    {
        NSUInteger cameraCount = [[AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo] count];
        if (cameraCount>1)
        {
            if (self.canDraw)
            {
                self.canDraw=false;
                [NSThread detachNewThreadSelector:@selector(actionSwitch) toTarget:self withObject:nil];
            }
        }
    }
}

-(void)actionSwitch
{
    while (true)
    {
        if (!self.isDrawing)
        {
            NSError* error;
            AVCaptureDeviceInput* newinput;
            AVCaptureDevicePosition position = [[self.deviceInput device] position];
            if (position==AVCaptureDevicePositionBack)
            {
                newinput = [[AVCaptureDeviceInput alloc] initWithDevice:[CameraView frontCamera] error:&error];
            }else if (position == AVCaptureDevicePositionFront)
            {
                newinput = [[AVCaptureDeviceInput alloc] initWithDevice:[CameraView backCamera] error:&error];
            }else
            {
                return;
            }
            
            if (newinput!=nil)
            {
                [self.session beginConfiguration];
                [self.session removeInput:self.deviceInput];
                if ([self.session canAddInput:newinput])
                {
                    [self.session addInput:newinput];
                    self.deviceInput = newinput;
                    if (position == AVCaptureDevicePositionFront)
                    {
                        self.param.eDevice = E_CAMERA_DEVICE_back;
                    }else
                    {
                        self.param.eDevice = E_CAMERA_DEVICE_front;
                    }
                }else
                {
                    [self.session addInput:self.deviceInput];
                }
                [self.session commitConfiguration];
                self.canDraw=true;
            }
            return;
        }else
        {
            [NSThread sleepForTimeInterval:0.01];
        }
    }
}

-(void)cutImage
{
    AVCaptureConnection* connect = [self.stillImageOutput connectionWithMediaType:AVMediaTypeVideo];
    if (!connect)
    {
        return;
    }
    [self.stillImageOutput captureStillImageAsynchronouslyFromConnection:connect completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error)
    {
        if (imageDataSampleBuffer==NULL)
        {
            return ;
        }
        NSData * imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
        UIImage * image = [UIImage imageWithData:imageData];
        image = [self fixOrientation:image];
        if (self.delegate!=nil &&
            [self.delegate respondsToSelector:@selector(cutWithImage:)])
        {
            [self.delegate cutWithImage:image];
        }
    }];
}

- (UIImage *)fixOrientation:(UIImage*)image
{
    if (image.imageOrientation == UIImageOrientationUp) return image;

    CGAffineTransform transform = CGAffineTransformIdentity;
    CGSize size = image.size;
    switch (image.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, image.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            
            transform = CGAffineTransformTranslate(transform, 0, image.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            if (self.param.eDevice==E_CAMERA_DEVICE_front)
            {
                transform = CGAffineTransformTranslate(transform, 0, image.size.width);
                transform = CGAffineTransformScale(transform, 1, -1);
            }
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (image.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    CGContextRef ctx = CGBitmapContextCreate(NULL, image.size.width, image.size.height,
                                             CGImageGetBitsPerComponent(image.CGImage), 0,
                                             CGImageGetColorSpace(image.CGImage),
                                             CGImageGetBitmapInfo(image.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (image.imageOrientation)
    {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.height,image.size.width), image.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.width,image.size.height), image.CGImage);
            break;
    }
    
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    size = img.size;
    return img;
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer
       fromConnection:(AVCaptureConnection *)connection
{
    if (!self.canDraw)
    {
        return;
    }
    self.isDrawing = YES;
    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    CIImage* outputImage = [CIImage imageWithCVPixelBuffer:imageBuffer];
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    CGAffineTransform t = CGAffineTransformIdentity;
    if (self.param.eDevice == E_CAMERA_DEVICE_front)
    {
        if (orientation == UIDeviceOrientationPortrait)
        {
            t = CGAffineTransformMakeRotation(-M_PI_2);
            t = CGAffineTransformScale(t, 1, -1);
        } else if (orientation == UIDeviceOrientationPortraitUpsideDown)
        {
            t = CGAffineTransformMakeRotation(-M_PI_2);
            t = CGAffineTransformScale(t, 1, -1);
        } else if (orientation == UIDeviceOrientationLandscapeRight)
        {
            t = CGAffineTransformMakeRotation(-M_PI_2);
            t = CGAffineTransformScale(t, 1, -1);
        } else
        {
            t = CGAffineTransformMakeRotation(-M_PI_2);
            t = CGAffineTransformScale(t, 1, -1);
        }
    }else
    {
        if (orientation == UIDeviceOrientationPortrait)
        {
            t = CGAffineTransformMakeRotation(-M_PI_2);
        } else if (orientation == UIDeviceOrientationPortraitUpsideDown)
        {
            t = CGAffineTransformMakeRotation(-M_PI_2);
        } else if (orientation == UIDeviceOrientationLandscapeRight)
        {
            t = CGAffineTransformMakeRotation(-M_PI_2);
        } else
        {
            t = CGAffineTransformMakeRotation(-M_PI_2);
        }
    }
    
    outputImage = [outputImage imageByApplyingTransform:t];
    
    CGImageRef cgImage = [self.context createCGImage:outputImage fromRect:outputImage.extent];
    dispatch_sync(dispatch_get_main_queue(), ^{
        self.layer.contents = (__bridge id)cgImage;
        self.layer.contentsGravity = kCAGravityResizeAspectFill;
    });
    CGImageRelease(cgImage);
    self.isDrawing = NO;
}

- (UIImage *) imageFromSampleBuffer:(CMSampleBufferRef) sampleBuffer
{
    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    CVPixelBufferLockBaseAddress(imageBuffer,0);
    size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
    size_t width = CVPixelBufferGetWidth(imageBuffer);
    size_t height = CVPixelBufferGetHeight(imageBuffer);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    if (!colorSpace)
    {
        NSLog(@"CGColorSpaceCreateDeviceRGB failure");
        return nil;
    }
    void *baseAddress = CVPixelBufferGetBaseAddress(imageBuffer);
    size_t bufferSize = CVPixelBufferGetDataSize(imageBuffer);
    CGDataProviderRef provider = CGDataProviderCreateWithData(NULL, baseAddress, bufferSize,NULL);
    CGImageRef cgImage =CGImageCreate(
                                      width,
                                      height,
                                      8,
                                      32,
                                      bytesPerRow,
                                      colorSpace,
                                      kCGImageAlphaNoneSkipFirst | kCGBitmapByteOrder32Little,
                                      provider,
                                      NULL,
                                      true,
                                      kCGRenderingIntentDefault);
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpace);
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    CVPixelBufferUnlockBaseAddress(imageBuffer, 0);
    return image;
}
@end

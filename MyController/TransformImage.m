//
//  TransformImage.m
//  MyController
//
//  Created by 陈前进 on 17/7/4.
//  Copyright © 2017年 mycontroller. All rights reserved.
//

#import "TransformImage.h"
#import <math.h>
@implementation TransformImage
+(TransformImage*)instanceWithImage:(UIImage*)image
{
    TransformImage* instance = [[TransformImage alloc]initWithImage:image];
    return instance;
}
-(TransformImage*)initWithImage:(UIImage*)image
{
    if (image==nil)
    {
        return nil;
    }
    NSData* data = UIImagePNGRepresentation(image);
    self = [super initWithData:data];
    return self;
}
//截取部分图片
-(UIImage*)imageAtRect:(CGRect)rect
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage* newImage = [UIImage imageWithCGImage: imageRef];
    CGImageRelease(imageRef);
    
    return newImage;
}
//修改为指定大小的图片
-(UIImage*)imageInSize:(CGSize)size
{
    return [self imageInSize:size andBack:nil];
}
-(UIImage*)imageInSize:(CGSize)size andBack:(UIColor*)backColor
{
    UIGraphicsBeginImageContext(size);
    if (backColor)
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(context, backColor.CGColor);
        CGContextSetFillColorWithColor(context, backColor.CGColor);
        CGRect rtBack = CGRectMake(0, 0, size.width, size.height);
        CGContextAddRect(context, rtBack);
        CGContextDrawPath(context, kCGPathFillStroke);
    }
    
    
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
//等比缩放
-(UIImage*)imageScale:(CGFloat)scale
{
    return [self imageScale:scale andBack:nil];
}
-(UIImage*)imageScale:(CGFloat)scale andBack:(UIColor*)backColor
{
    CGFloat width = CGImageGetWidth(self.CGImage)*scale;
    CGFloat height = CGImageGetHeight(self.CGImage)*scale;
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
    if (backColor)
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(context, backColor.CGColor);
        CGContextSetFillColorWithColor(context, backColor.CGColor);
        CGRect rtBack = CGRectMake(0, 0, width, height);
        CGContextAddRect(context, rtBack);
        CGContextDrawPath(context, kCGPathFillStroke);
    }
    
    
    [self drawInRect:CGRectMake(0, 0, width, height)];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
//等比缩放并置于制定区域内居中，且保证图片至少有一个方向（垂直或水平）贴边
-(UIImage*)imageScaleInSize:(CGSize)size
{
    return [self imageScaleInSize:size andBack:nil];
}
-(UIImage*)imageScaleInSize:(CGSize)size andBack:(UIColor*)backColor
{
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    CGFloat scale = (size.width/width<size.height/height)?size.width/width : size.height/height;
    CGPoint point = CGPointMake((size.width-width*scale)/2, (size.height-height*scale)/2);
    
    UIGraphicsBeginImageContext(size);
    
    if (backColor)
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(context, backColor.CGColor);
        CGContextSetFillColorWithColor(context, backColor.CGColor);
        CGRect rtBack = CGRectMake(0, 0, size.width, size.height);
        CGContextAddRect(context, rtBack);
        CGContextDrawPath(context, kCGPathFillStroke);
    }
    
    
    [self drawInRect:CGRectMake(point.x, point.y, width*scale, height*scale)];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
}
//等比缩放并能包含制定区域，且保证图片至少有一个方向贴边，超出部分将截去
-(UIImage*)imageScaleWrapSize:(CGSize)size
{
    return [self imageScaleWrapSize:size andBack:nil];
}
-(UIImage*)imageScaleWrapSize:(CGSize)size andBack:(UIColor*)backColor
{
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    CGFloat scale = (size.width/width>size.height/height)?size.width/width : size.height/height;
    CGPoint point = CGPointMake((size.width-width*scale)/2, (size.height-height*scale)/2);
    
    UIGraphicsBeginImageContext(size);
    if (backColor)
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(context, backColor.CGColor);
        CGContextSetFillColorWithColor(context, backColor.CGColor);
        CGRect rtBack = CGRectMake(0, 0, size.width, size.height);
        CGContextAddRect(context, rtBack);
        CGContextDrawPath(context, kCGPathFillStroke);
    }
    
    
    [self drawInRect:CGRectMake(point.x, point.y, width*scale, height*scale)];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
//旋转图片方向;
-(UIImage*)imageRotate:(CGFloat)radian
{
    return [self imageRotate:radian andBack:nil];
}
-(UIImage*)imageRotate:(CGFloat)radian andBack:(UIColor*)backColor
{
    // calculate the size of the rotated view's containing box for our drawing space
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat heigth = CGImageGetHeight(self.CGImage);
    CGFloat radius = sqrt(width*width+heigth*heigth);
    CGFloat diameter = radius*2;
    // Create the bitmap context
    UIGraphicsBeginImageContext(CGSizeMake(radius*2, radius*2));
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (backColor)
    {
        CGContextSetStrokeColorWithColor(context, backColor.CGColor);
        CGContextSetFillColorWithColor(context, backColor.CGColor);
        CGRect rtBack = CGRectMake(0, 0, diameter, diameter);
        CGContextAddRect(context, rtBack);
        CGContextDrawPath(context, kCGPathFillStroke);
    }
    
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, radius, -radius);
    CGContextRotateCTM(context, radian);
    CGContextDrawImage(context, CGRectMake(0, 0, width, heigth), self.CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //裁剪
    CGRect cutRect = [self rect:CGRectMake(0, 0, width, heigth) andRotate:radian];
    cutRect.origin.x = round(cutRect.origin.x+radius);
    cutRect.origin.y = round(radius-cutRect.origin.y);
    TransformImage* trans = [[TransformImage alloc]initWithImage:newImage];
    newImage = [trans imageAtRect:cutRect];
    return newImage;
}


-(CGPoint)point:(CGPoint)point andRotate:(CGFloat)radian
{
    CGFloat radius = sqrtf(point.x*point.x+point.y*point.y);
    if (radius==0)
    {
        return point;
    }
    
    CGPoint ret = point;
    
    ret.x = point.x*cos(radian)-point.y*sin(radian);
    ret.y = point.x*sin(radian)+point.y*cos(radian);
    return ret;
}

-(CGRect)rect:(CGRect)rect andRotate:(CGFloat)radian
{
    CGPoint pt0 = rect.origin;
    CGPoint pt1 = CGPointMake(pt0.x+rect.size.width, pt0.y);
    CGPoint pt2 = CGPointMake(pt0.x+rect.size.width, pt0.y+rect.size.height);
    CGPoint pt3 = CGPointMake(pt0.x, pt0.y+rect.size.height);
    pt0 = [self point:pt0 andRotate:radian];
    pt1 = [self point:pt1 andRotate:radian];
    pt2 = [self point:pt2 andRotate:radian];
    pt3 = [self point:pt3 andRotate:radian];
    CGFloat left = round(MIN(pt0.x, MIN(pt1.x, MIN(pt2.x, pt3.x))));
    CGFloat right = round(MAX(pt0.x, MAX(pt1.x, MAX(pt2.x, pt3.x))));
    CGFloat top = round(MAX(pt0.y, MAX(pt1.y, MAX(pt2.y, pt3.y))));
    CGFloat bottom = round(MIN(pt0.y, MIN(pt1.y, MIN(pt2.y, pt3.y))));
    CGRect ret = CGRectMake(left, top, right-left, top-bottom);
    return ret;
}
@end

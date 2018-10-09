//
//  TransformImage.h
//  MyController
//
//  Created by 陈前进 on 17/7/4.
//  Copyright © 2017年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransformImage : UIImage
+(TransformImage*)instanceWithImage:(UIImage*)image;
-(TransformImage*)initWithImage:(UIImage*)image;

//截取部分图片
-(UIImage*)imageAtRect:(CGRect)rect;

//修改为指定大小的图片
-(UIImage*)imageInSize:(CGSize)size;
-(UIImage*)imageInSize:(CGSize)size andBack:(UIColor*)backColor;

//等比缩放
-(UIImage*)imageScale:(CGFloat)scale;
-(UIImage*)imageScale:(CGFloat)scale andBack:(UIColor*)backColor;

//等比缩放并置于制定区域内居中，且保证图片至少有一个方向（垂直或水平）贴边
-(UIImage*)imageScaleInSize:(CGSize)size;
-(UIImage*)imageScaleInSize:(CGSize)size andBack:(UIColor*)backColor;

//等比缩放并能包含制定区域，且保证图片至少有一个方向贴边，超出部分将截去
-(UIImage*)imageScaleWrapSize:(CGSize)size;
-(UIImage*)imageScaleWrapSize:(CGSize)size andBack:(UIColor*)backColor;

//旋转图片方向;
-(UIImage*)imageRotate:(CGFloat)radius;
-(UIImage*)imageRotate:(CGFloat)radian andBack:(UIColor*)backColor;
@end

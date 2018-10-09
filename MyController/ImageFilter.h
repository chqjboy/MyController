//
//  ImageFilter.h
//  MyController
//
//  Created by 陈前进 on 16/4/21.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, E_IMAGEFILTER)
{
    E_IMAGEFILTER_lomo = 0,
    E_IMAGEFILTER_heibai,
    E_IMAGEFILTER_fugu,
    E_IMAGEFILTER_gete,
    E_IMAGEFILTER_ruihua,
    E_IMAGEFILTER_danya,
    E_IMAGEFILTER_jiuhong,
    E_IMAGEFILTER_qingning,
    E_IMAGEFILTER_langman,
    E_IMAGEFILTER_guangyun,
    E_IMAGEFILTER_landiao,
    E_IMAGEFILTER_menghuan,
    E_IMAGEFILTER_yese
};
@interface ImageFilter : UIView
+ (UIImage *)imageWithImage:(UIImage*)inImage withImageFilter:(E_IMAGEFILTER)eImageFileter;
+ (CGImageRef)imagefWithImagef:(CGImageRef)inImage withImageFilter:(E_IMAGEFILTER)eImageFileter;
@end

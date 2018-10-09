//
//  FitSizeLabel.h
//  ucare
//
//  Created by 陈前进 on 15/9/5.
//  Copyright (c) 2015年 yujian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FitLineLabel : UILabel
-(FitLineLabel*) initWithFrame:(CGRect)rect andContent:(NSString*)content andFont:(UIFont*)font andColor:(UIColor*)color;
-(FitLineLabel*)initWithFrame:(CGRect)rect andContent:(NSMutableAttributedString*)content;
-(FitLineLabel*) initWithFrame:(CGRect)rect andContent:(NSString*)content andFont:(UIFont*)font andColor:(UIColor*)color andLimitLine:(NSInteger)lines;
@end

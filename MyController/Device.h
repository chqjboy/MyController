//
//  Device.h
//  MyController
//
//  Created by 陈前进 on 16/3/23.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Device : UIView
+(CGFloat)getScreenHeight;
+(CGFloat)getScreenWidth;
+(CGFloat)getHScale;
+(CGFloat)getVScale;
+(NSString*)stringByDevice;
@end

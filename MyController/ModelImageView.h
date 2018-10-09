//
//  ModelImageView.h
//  MyController
//
//  Created by 陈前进 on 16/4/11.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModelImageView : UIView
-(ModelImageView*)initWithImage:(UIImage*)image;
-(void)doModel;
-(void)fadeModel;
@end

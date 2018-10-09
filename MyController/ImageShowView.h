//
//  ImageShowView.h
//  MyController
//
//  Created by 陈前进 on 16/9/7.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageShowView : UIView
@property(nonatomic, retain) UIImageView* imageView;
@property(nonatomic, retain) UIImage* image;

-(ImageShowView*)initWithFrame:(CGRect)rect andImage:(UIImage*)image;
-(void)initViews;
-(void)initImageViewWithRect:(CGRect)rect;
-(void)viewClick;

@end

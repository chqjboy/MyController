//
//  ItemsHeaderCell.h
//  MyController
//
//  Created by 陈前进 on 16/4/25.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemsHeaderCell : UIView
@property(nonatomic, retain) UIImageView* imageView;
@property(nonatomic, retain) NSString* image;

-(ItemsHeaderCell*)initWithFrame:(CGRect)rect andImage:(NSString*)image;
-(void)initViews;
-(void)initImageViewWithRect:(CGRect)rect;
@end

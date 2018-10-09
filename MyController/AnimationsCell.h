//
//  AnimationsCell.h
//  MyController
//
//  Created by 陈前进 on 16/3/25.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import "FitLineLabel.h"
@protocol AnimationsCellDelegate<NSObject>
-(void)cellClickWithView:(UIView*)view;
@end
@interface AnimationsCell : UIView
{
    id<AnimationsCellDelegate>delegate;
}
@property(nonatomic, retain) id<AnimationsCellDelegate>delegate;
@property(nonatomic, retain) FitLineLabel* name;
@property(nonatomic, retain) UIImageView* arrow;
@property(nonatomic, retain) NSString* nameValue;

-(AnimationsCell*)initWithFrame:(CGRect)rect andName:(NSString*)name;
-(void)initViews;
-(void)initNameWithRect:(CGRect)rect;
-(void)initArrowWithRect:(CGRect)rect;
-(void)cellClick;
@end

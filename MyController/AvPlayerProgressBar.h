//
//  ProgressBar.h
//  MyController
//
//  Created by 陈前进 on 16/10/12.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface Param_AvPlayerProgressBar:NSObject
@property(nonatomic, retain) UIColor* clrFront;     //进度点前的颜色
@property(nonatomic, retain) UIColor* clrCur;       //进度点附近渐变结束颜色
@property(nonatomic, retain) UIColor* clrBack;      //进度点后的颜色
@property(nonatomic, assign) CGFloat slipHeight;    //进度条高度
@property(nonatomic, assign) CGFloat pointHeight;   //进度点半径
@property(nonatomic, assign) CGFloat gradientWidth; //渐变色最大宽度
@property(nonatomic, retain) UIImage* imgPoint;
@end
@protocol AvPlayerProgressBarDelegate <NSObject>
-(void)pointReadyMoveWithPersent:(CGFloat)persent;
-(void)pointMovingWithPersent:(CGFloat)persent;
-(void)pointMovedWithPersent:(CGFloat)persent;
@end

@interface AvPlayerProgressBar : UIView
{
    id<AvPlayerProgressBarDelegate>delegate;
}
@property(nonatomic, retain) id<AvPlayerProgressBarDelegate>delegate;
@property(nonatomic, retain) Param_AvPlayerProgressBar* param;
@property(nonatomic, retain) CAGradientLayer* slip;
@property(nonatomic, retain) UIView* point;
@property(nonatomic, assign) CGFloat persent;
@property(nonatomic, assign) CGPoint ptMove;

-(AvPlayerProgressBar*)initWithFrame:(CGRect)rect andParam:(Param_AvPlayerProgressBar*)param;
-(void)initViews;
-(void)initSlipWithRect:(CGRect)rect;
-(void)initPointWithRect:(CGRect)rect;
-(void)setPosition:(CGFloat)percent;
-(CGRect)getGradianRect:(CGFloat)percent;
-(void)resetSize;

-(void)addTapClickAction;
-(void)addTapMoveAction;
-(void)tapMoveAction:(UIPanGestureRecognizer*) recognizer;
-(void)tapScaleAction:(UIPinchGestureRecognizer*) recognizer;
-(void)tapClickAction:(UITapGestureRecognizer*)recognizer;
@end

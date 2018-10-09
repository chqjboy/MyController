//
//  CutImageView.h
//  MyController
//
//  Created by 陈前进 on 16/9/7.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CutImageView : UIImageView
<
UIGestureRecognizerDelegate
>
@property(nonatomic, assign) CGPoint ptMove;
@property(nonatomic, assign) CGFloat scale;
@property(nonatomic, assign) CGRect initFrame;
@property(nonatomic, assign) CGRect edgeFrame;

-(CutImageView*)initWithFrame:(CGRect)rect andImage:(UIImage*)image andEdgeFrame:(CGRect)edgeFrame;
-(void)addTapMoveAction;
-(void)addTapScaleAction;
-(void)tapMoveAction:(UIPanGestureRecognizer*) recognizer;
-(void)tapScaleAction:(UIPinchGestureRecognizer*) recognizer;
- (void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view;
- (void)setDefaultAnchorPointforView:(UIView *)view;
-(void)adjustEndAction;
@end

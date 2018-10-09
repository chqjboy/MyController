//
//  CycleScrollView.h
//  MyController
//
//  Created by 陈前进 on 16/8/4.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface Param_CycleHRollView:NSObject
@property(nonatomic, assign) CGFloat pageWidth;             //cell宽度
@property(nonatomic, retain) NSArray<UIView*>* views;   //所有Views
@end
@interface CycleHRollView : UIView
@property(nonatomic, retain) Param_CycleHRollView* param;
@property(nonatomic, retain) NSMutableArray<UIView*>* caps;
@property(nonatomic, assign) CGFloat inset;
@property(nonatomic, assign) CGPoint ptMove;

-(CycleHRollView*)initWithFrame:(CGRect)rect andParam:(Param_CycleHRollView*)param;
-(void)addPanGesture;
-(void)initCaps;
-(void)panGestureAction:(UIPanGestureRecognizer*)rec;
-(UIView*)copyView:(UIView*)view;
-(void)adjustCapsWithDistance:(CGFloat)distance;
-(void)adjustCapContent:(UIView*)cap andFirst:(BOOL)first;
-(void)adjustCapsWithAnimate;
@end

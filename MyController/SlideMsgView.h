//
//  LeftSlideMsgView.h
//  MyController
//
//  Created by 陈前进 on 16/8/9.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface Param_SlideMsgCap:NSObject
@property(nonatomic, assign) CGRect frame;
@property(nonatomic, assign) BOOL empty;
@property(nonatomic, retain) UIView* view;
@end
@interface Param_SlideMsgView : NSObject
@property(nonatomic, assign) CGFloat capHeight;
@property(nonatomic, assign) BOOL left; //方向
@end
@interface SlideMsgView : UIView
@property(nonatomic, retain) NSMutableArray<Param_SlideMsgCap*>* caps;
@property(nonatomic, retain) NSMutableArray* bufViews;
@property(nonatomic, retain) Param_SlideMsgView* param;

-(SlideMsgView*)initWithFrame:(CGRect)rect andParam:(Param_SlideMsgView*)param;
-(void)initViews;
-(void)initCapsWithRect:(CGRect)rect;
-(void)addMsgView:(UIView*)view;
-(void)updateCaps;
-(Param_SlideMsgCap*)getEmptyCap;
-(void)actionSlideCap:(Param_SlideMsgCap*)cap;
-(void)actionFade:(NSTimer*)timer;
@end

//
//  GifShowCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/4/11.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "Global.h"
#import "GifView.h"
@interface GifShowCtrler : NavigationCtrler
@property(nonatomic, retain) GifView* gifView;
@property(nonatomic, retain) UIButton* button;
@property BOOL flag;
-(void)backClick;
-(void)initViews;
-(void)initGifViewWithRect:(CGRect)rect;
@end

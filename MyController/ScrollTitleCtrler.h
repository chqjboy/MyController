//
//  ScrollTitleCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/8/10.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "TitleItemsScrollView.h"
@interface ScrollTitleCtrler : NavigationCtrler
<
TitleItemsScrollViewDelegate
>
@property(nonatomic, retain) TitleItemsScrollView* titleItemsScrollView;

-(void)backClick;
-(void)initViews;
-(void)initTitleItemsScrollViewWithRect:(CGRect)rect;
-(void)titleItemsUpdateToParam:(Param_TitleItem*)param andIndex:(NSInteger)index;
@end

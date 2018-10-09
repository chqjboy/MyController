//
//  TabItemsScrollView.h
//  MyController
//
//  Created by 陈前进 on 16/8/10.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HScrollView.h"
@interface Param_TitleItem : NSObject
@property(nonatomic, retain) UIView* title;
@property(nonatomic, retain) UIView* item;

@end

@interface Param_TitleItemsScrollView : NSObject
@property(nonatomic, assign) CGFloat titleHeight;
@property(nonatomic, retain) NSArray<Param_TitleItem*>* titleItems;
@end

@protocol TitleItemsScrollViewDelegate <NSObject>
-(void)titleItemsUpdateToParam:(Param_TitleItem*)param andIndex:(NSInteger)index;
@end

@interface TitleItemsScrollView : UIView
<
UIScrollViewDelegate
>
{
    id<TitleItemsScrollViewDelegate>delegate;
}
@property(nonatomic, retain) id<TitleItemsScrollViewDelegate>delegate;
@property(nonatomic, retain) HScrollView* titleScrollView;
@property(nonatomic, retain) HScrollView* itemScrollView;
@property(nonatomic, retain) Param_TitleItemsScrollView* param;

-(TitleItemsScrollView*)initWithFrame:(CGRect)rect andParam:(Param_TitleItemsScrollView*)param;
-(void)initViews;
-(void)initTitleScrollViewWithRect:(CGRect)rect;
-(void)initItemScrollViewWithRect:(CGRect)rect;

//UIScrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
-(NSInteger)getCurPageIndex;
-(void)moveTitleCenterWithIndex:(NSInteger)index;
-(void)titleClick:(id)sender;
-(void)setCurpage:(NSInteger)index;
@end

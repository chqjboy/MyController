//
//  ItemsScrollView.h
//  MyController
//
//  Created by 陈前进 on 16/4/25.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HScrollView.h"
#import "VScrollView.h"
#import "GridView.h"
@interface Param_ItemsScrollView:NSObject
@property(nonatomic, retain) NSArray<UIView*>* headers;
@property(nonatomic, retain) NSArray<UIView*>* items;
@property CGFloat headerheight;
@end
@protocol ItemsScrollViewDelegate <NSObject>
-(void)selItemWithIndex:(NSInteger)index;
@end
@interface ItemsScrollView : UIView
<
UIScrollViewDelegate
>
{
    id<ItemsScrollViewDelegate>delegate;
}
@property(nonatomic, retain) id<ItemsScrollViewDelegate>delegate;
@property(nonatomic, retain) GridView* gridView;
@property(nonatomic, retain) HScrollView* hscroll;
@property(nonatomic, retain) Param_ItemsScrollView* param;
@property NSInteger selPageIndex;

-(ItemsScrollView*)initWithFrame:(CGRect)rect andParam:(Param_ItemsScrollView*)param;
-(void)initViews;
-(void)initGridViewWithRect:(CGRect)rect;
-(void)initHScrollWithRect:(CGRect)rect;

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView; 
@end

//
//  ItemsScrollCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/4/25.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationCtrler.h"
#import "ItemsScrollView.h"
#import "ItemsHeaderCell.h"
#import "ItemsScrollCell.h"
@interface ItemsScrollCtrler : NavigationCtrler
<
ItemsScrollViewDelegate
>
@property(nonatomic, retain) ItemsScrollView* itemsScrollView;
@property(nonatomic, retain) NSArray* headers;
@property(nonatomic, retain) NSArray* items;

-(void)backClick;
-(void)initViews;
-(void)initItemsScrollViewWithRect:(CGRect)rect;
-(ItemsHeaderCell*)getHeaderCellWithRect:(CGRect)rect andImage:(NSString*)image;
-(ItemsScrollCell*)getScrollCellWithRect:(CGRect)rect andImage:(NSString*)image;
-(void)selItemWithIndex:(NSInteger)index;
-(void)updateHeaderShadowWithIndex:(NSInteger)index;
@end

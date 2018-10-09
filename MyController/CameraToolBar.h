//
//  CameraToolBar.h
//  MyController
//
//  Created by 陈前进 on 16/4/11.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HScrollView.h"
@protocol CameraToolBarDelegate<NSObject>
-(void)actionSwitch;
-(void)actionCut;
-(void)actionClose;
@end
@interface CameraToolBar : UIView
{
    id<CameraToolBarDelegate>delegate;
}
@property(nonatomic, retain)id<CameraToolBarDelegate>delegate;
@property(nonatomic, retain) HScrollView* hscrollView;
@property(nonatomic, retain)UIImageView* btnClose;
@property(nonatomic, retain)UIImageView* btnSwitch;
@property(nonatomic, retain)UIImageView* btnCut;


-(CameraToolBar*)initWithFrame:(CGRect)rect;
@end

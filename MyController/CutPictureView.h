//
//  CutPictureView.h
//  MyController
//
//  Created by 陈前进 on 16/9/7.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CutImageView.h"
@interface Param_CutPictureView:NSObject
@property(nonatomic, retain) UIImage* image;
@property(nonatomic, assign) CGSize cutsize;
@end
@protocol CutPictureViewDelegate <NSObject>
-(void)cancelCutPicture;
-(void)cutPicture:(UIImage*)image;
@end
@interface CutPictureView : UIImageView
{
    id<CutPictureViewDelegate>delegate;
}
@property(nonatomic, retain) id<CutPictureViewDelegate>delegate;
@property(nonatomic, assign) CGRect rtFrame;
@property(nonatomic, retain) Param_CutPictureView* param;
@property(nonatomic, retain) CutImageView* cutImageView;
@property(nonatomic, retain) UIButton* btnOk;
@property(nonatomic, retain) UIButton* btnCancel;

-(CutPictureView*)initWithFrame:(CGRect)rect andParam:(Param_CutPictureView*)param;
-(void)initViews;
-(void)initCutImageViewWithRect:(CGRect)rect andEdgeFrame:(CGRect)edge;
-(void)initCutFrameViewWithRect:(CGRect)rect;
-(void)initBtnOkWithRect:(CGRect)rect;
-(void)initBtnCancelWithRect:(CGRect)rect;
-(UIImage*)cutImage;
-(void)buttonClick:(id)sender;
@end

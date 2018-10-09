//
//  CutPictureCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/9/7.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "CutPictureView.h"
@interface CutPictureCtrler : NavigationCtrler
<
CutPictureViewDelegate
>
@property(nonatomic, retain) UIImage* image;
@property(nonatomic, retain) CutPictureView* cutPictureView;

-(void)backClick;
-(void)initViews;
-(void)initCutPictureViewWithRect:(CGRect)rect;
@end

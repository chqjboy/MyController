//
//  CustomCameraCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/4/11.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "CameraView.h"
#import "CameraToolBar.h"
#import "ModelImageView.h"
@interface CustomCameraCtrler : NavigationCtrler
<
CameraToolBarDelegate,
CameraViewDelegate
>
@property(nonatomic, retain) CameraView* cameraView;
@property(nonatomic, retain) CameraToolBar* toolBar;
@end

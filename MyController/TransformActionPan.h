//
//  TransformActionPan.h
//  MyController
//
//  Created by 陈前进 on 17/7/4.
//  Copyright © 2017年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VScrollView.h"
#import "TransformActionCell.h"
typedef NS_ENUM(NSInteger, eTransformAction)
{
    eTransformAction_def = 0,
    eTransformAction_atrect,
    eTransformAction_insize,
    eTransformAction_scale,
    eTransformAction_scaleinrect,
    eTransformAction_scalewraprect,
    eTransformAction_rotate
};
@protocol TransformActionPanDelegate <NSObject>

-(void)transformAction:(eTransformAction)action;

@end
@interface TransformActionPan : UIView
{
    id<TransformActionPanDelegate>_delegate;
}
@property(nonatomic, retain) id<TransformActionPanDelegate>delegate;
@property(nonatomic, retain) VScrollView* vscrollView;

@end

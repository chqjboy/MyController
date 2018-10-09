//
//  ASTextView.h
//  MyController
//
//  Created by 陈前进 on 2018/1/12.
//  Copyright © 2018年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ASTextView;
typedef void(^ASTextViewFrameChangedBlock)(ASTextView* textView);
@interface ASTextView : UITextView
@property(nonatomic, retain) NSString* placeHolder;
@property(nonatomic, retain) UIColor* placeHolderColor;
@property(nonatomic, retain) UIColor* contentColor;
@property(nonatomic, assign) CGFloat maxHeight;
@property(nonatomic, assign) BOOL autoFitsize;
@property(nonatomic, assign) BOOL placeHold;
@property(nonatomic, strong) ASTextViewFrameChangedBlock frameChangeBlock;
-(void)removeNotifications;
@end

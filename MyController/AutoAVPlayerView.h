//
//  AutoAVPlayerView.h
//  MyController
//
//  Created by 陈前进 on 16/9/9.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@protocol AutoAVPlayerViewDelegate<NSObject>
-(void)updatePlayerWithDuration:(CGFloat)duration andCurrent:(CGFloat)current;
@end
@interface AutoAVPlayerView : UIView
{
    id<AutoAVPlayerViewDelegate>delegate;
}
@property(nonatomic, retain) id<AutoAVPlayerViewDelegate>delegate;
@property(nonatomic, retain) NSMutableArray<AVPlayerItem*>* avItems;
@property(nonatomic, retain) AVPlayerLayer* avLayer;
@property(nonatomic, assign) NSInteger index;

@property(nonatomic, retain) AVPlayer* avPlayer;
@property(nonatomic, retain) NSTimer* timer;

-(AutoAVPlayerView*)initWithFrame:(CGRect)rect andUrls:(NSArray*)urls;
-(void)initViews;
-(void)initAVLayerWithRect:(CGRect)rect;
-(void)initNotifications;
-(void)releaseNotifications;
-(void)start;
-(void)pause;
-(void)play;
-(void)stop;
-(void)beginPlayWithIndex:(NSInteger)index;
-(void)prepareNext;
-(void)avPlayerEnd:(NSNotification*)notification;
-(void)timerAction;
-(void)seekTimeWithPersent:(CGFloat)persent;
@end

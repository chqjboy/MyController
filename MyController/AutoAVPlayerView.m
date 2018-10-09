//
//  AutoAVPlayerView.m
//  MyController
//
//  Created by 陈前进 on 16/9/9.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "AutoAVPlayerView.h"

@implementation AutoAVPlayerView
-(AutoAVPlayerView*)initWithFrame:(CGRect)rect andUrls:(NSArray*)urls
{
    self = [super initWithFrame:rect];
    self.avItems = [[NSMutableArray alloc]init];
    for (NSString* url in urls)
    {
        AVPlayerItem* item = [[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:url]];
        [self.avItems addObject:item];
    }
    [self initViews];
    return self;
}

-(void)initViews
{
    CGRect rect = self.bounds;
    [self initAVLayerWithRect:rect];
}
-(void)initAVLayerWithRect:(CGRect)rect
{
    self.avLayer = [[AVPlayerLayer alloc]init];
    [self.avLayer setFrame:rect];
    [self.avLayer setBackgroundColor:[UIColor blackColor].CGColor];
    [self.layer addSublayer:self.avLayer];
}

-(void)initNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(avPlayerEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(avPlayerFailed:) name:AVPlayerItemFailedToPlayToEndTimeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(avPlayerStalled:) name:AVPlayerItemPlaybackStalledNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(avPlayerJumped:) name:AVPlayerItemTimeJumpedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(avPlayerNewErrorLog:) name:AVPlayerItemNewErrorLogEntryNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(avPlayerNewAccessLog:) name:AVPlayerItemNewAccessLogEntryNotification object:nil];
}
-(void)avPlayerEnd:(NSNotification*)notification
{
    NSLog(@"end%d", self.index);
    if (self.index<self.avItems.count-1)
    {
        self.index++;
        [self beginPlayWithIndex:self.index];
    }
    NSLog(@"avPlayerEnd");
}
-(void)avPlayerFailed:(NSNotification*)notification
{
    NSLog(@"avPlayerFailed");
}
-(void)avPlayerStalled:(NSNotification*)notification
{
    NSLog(@"avPlayerStalled");
}
-(void)avPlayerJumped:(NSNotification*)notification
{
    NSLog(@"avPlayerJumped");
}

-(void)avPlayerNewErrorLog:(NSNotification*)notification
{
    NSLog(@"avPlayerNewErrorLog");
}
-(void)avPlayerNewAccessLog:(NSNotification*)notification
{
    NSLog(@"avPlayerNewAccessLog");
}
-(void)releaseNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)start
{
    [self initNotifications];
    if (self.avItems==nil || self.avItems.count<=0)
    {
        return;
    }
    [self beginPlayWithIndex:0];
    if (self.timer!=nil)
    {
        [self.timer invalidate];
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}
-(void)pause
{
    if (self.avPlayer!=nil)
    {
        [self.avPlayer pause];
        [self.timer invalidate];
    }
}
-(void)play
{
    if (self.avPlayer!=nil)
    {
        [self.avPlayer play];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    }
}
-(void)stop
{
    if (self.avLayer.player!=nil)
    {
        [self.avLayer.player pause];
    }
    [self releaseNotifications];
    if (self.timer!=nil)
    {
        [self.timer invalidate];
        self.timer = nil;
    }
}

-(void)beginPlayWithIndex:(NSInteger)index
{
    if (self.avItems==nil || self.avItems.count<=0 || index<0 || index>self.avItems.count-1)
    {
        return;
    }
    self.index = index;
    AVPlayerItem* item = [self.avItems objectAtIndex:index];
    AVPlayer* player = [AVPlayer playerWithPlayerItem:item];
    [self.avLayer setPlayer:player];
    [self.avLayer setFrame:self.bounds];
    [self.avLayer setBackgroundColor:[UIColor blackColor].CGColor];
    self.avPlayer = player;
    [self addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self forKeyPath:@"avPlayer.currentItem.status" options:NSKeyValueObservingOptionNew context:nil];
    [self play];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"keyPath:%@==>>change:%@", keyPath, change);
    NSLog(@"===>>%@", self.avPlayer.currentItem.error);
}

-(void)timerAction
{
    if (self.avPlayer==nil)
    {
        return;
    }
    CGFloat duration = self.avPlayer.currentItem.duration.value*1.0/self.avPlayer.currentItem.duration.timescale;
    CGFloat current = self.avPlayer.currentTime.value*1.0/self.avPlayer.currentTime.timescale;
    if (self.delegate!=nil &&
        [self.delegate respondsToSelector:@selector(updatePlayerWithDuration:andCurrent:)] &&
        duration>0)
    {
        [self.delegate updatePlayerWithDuration:duration andCurrent:current];
    }
}
-(void)seekTimeWithPersent:(CGFloat)persent
{
    if (self.avPlayer==nil)
    {
        return;
    }
    NSError* error = self.avPlayer.currentItem.error;
    if (error)
    {
        return;
    }
    [self.avPlayer seekToTime:CMTimeMake(persent*self.avPlayer.currentItem.duration.value, self.avPlayer.currentItem.duration.timescale)];
}
@end

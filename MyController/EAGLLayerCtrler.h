//
//  EAGLLayerCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/4/7.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "Global.h"
#import <GLKit/GLKit.h>
@interface EAGLLayerCtrler : NavigationCtrler
<
CoreAnimationCallback
>
@property (nonatomic, strong) EAGLContext *glContext;
@property (nonatomic, strong) CAEAGLLayer *glLayer;
@property (nonatomic, assign) GLuint framebuffer;
@property (nonatomic, assign) GLuint colorRenderbuffer;
@property (nonatomic, assign) GLint framebufferWidth;
@property (nonatomic, assign) GLint framebufferHeight;
@property (nonatomic, strong) GLKBaseEffect *effect;
-(void)backClick;
-(void)setUpBuffers;
-(void)tearDownBuffers;
-(void)initViews;
-(void)initLayerWithRect:(CGRect)rect;
@end

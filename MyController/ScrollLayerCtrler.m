//
//  ScrollLayerCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/4/7.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "ScrollLayerCtrler.h"

@interface ScrollLayerCtrler ()

@end

@implementation ScrollLayerCtrler

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.point = CGPointZero;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)backClick
{
    if (self.delegate!=nil &&
        [self.delegate respondsToSelector:@selector(backWithCtrler:)])
    {
        [self.delegate backWithCtrler:self];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)initViews
{
    CGRect rect = self.view.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    
    CGRect rtScroll=rect;
    rtScroll.origin.x = 20;
    rtScroll.origin.y = 20;
    rtScroll.size.width = rect.size.width-2*rtScroll.origin.x;
    rtScroll.size.height = rect.size.height-2*rtScroll.origin.y;
    [self initScrollLayerWithRect:rtScroll];
    
    UIPanGestureRecognizer *recognizer = nil;
    recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(actionPan:)];
    [self.view addGestureRecognizer:recognizer];
}

-(void)initScrollLayerWithRect:(CGRect)rect
{
    self.scrolllayer = [CAScrollLayer layer];
    self.scrolllayer.frame = rect;
    self.scrolllayer.backgroundColor = [UIColor redColor].CGColor;
    self.scrolllayer.borderColor = [UIColor grayColor].CGColor;
    self.scrolllayer.borderWidth = 2;
    self.scrolllayer.contents = (__bridge id)[UIImage imageNamed:@"animation_picture"].CGImage;
    //self.scrolllayer.masksToBounds = YES;
    [self.view.layer addSublayer:self.scrolllayer];
    
    CALayer* layer = [CALayer layer];
    layer.frame = CGRectMake(rect.size.width/2, rect.size.height/2, rect.size.width, rect.size.height);
    [layer setBackgroundColor:[UIColor greenColor].CGColor];
    [self.scrolllayer addSublayer:layer];
}

-(void)actionPan:(UIPanGestureRecognizer *)recognizer
{
    CGPoint point = self.point;
    point.x -= [recognizer translationInView:self.view].x;
    point.y -= [recognizer translationInView:self.view].y;
    //offset = [self.scrolllayer convertPoint:offset fromLayer:self.view.layer];
    NSLog(@"x:%0.2f, y:%0.2f", self.point.x, self.point.y);
    //scroll the layer
    [self.scrolllayer scrollToPoint:self.point];
    self.point = point;
    //reset the pan gesture translation
    [recognizer setTranslation:CGPointZero inView:self.view];
}
@end

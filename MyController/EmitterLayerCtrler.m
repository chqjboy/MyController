//
//  EmitterLayerCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/4/7.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "EmitterLayerCtrler.h"

@interface EmitterLayerCtrler ()

@end

@implementation EmitterLayerCtrler

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    CGRect rtLayer = rect;
    rtLayer.size.height = 200;
    rtLayer.size.width = 200;
    rtLayer.origin.x = (rect.size.width-rtLayer.size.width)/2;
    rtLayer.origin.y = (rect.size.height-rtLayer.size.height)/2;
    [self initLayerWithRect:rtLayer];
}

-(void)initLayerWithRect:(CGRect)rect
{
    self.layer = [CAEmitterLayer layer];
    self.layer.frame = self.view.bounds;
    [self.view.layer addSublayer:self.layer];

    self.layer.renderMode = kCAEmitterLayerAdditive;
    //self.layer.renderMode = kCAEmitterLayerOldestLast;
    self.layer.emitterPosition = CGPointMake(self.layer.frame.size.width / 2.0, self.layer.frame.size.height / 2.0);
    
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"emitter"].CGImage;
    cell.birthRate = 150;
    cell.lifetime = 20;
    cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
    //cell.color = [UIColor blueColor].CGColor;
    cell.alphaSpeed = -0.4;
    cell.velocity = 50;
    cell.velocityRange = 50;
    cell.emissionRange =M_PI;

    self.layer.emitterCells = @[cell];
}
@end

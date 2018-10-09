//
//  ToolbarCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/3/23.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "ToolbarCtrler.h"

@interface ToolbarCtrler ()

@end

@implementation ToolbarCtrler

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

-(void)viewDidUnload
{
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning
{
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
    
    [self initTabbarCtrler];
}

-(void)initTabbarCtrler
{
    CGRect rect = [UIScreen mainScreen].bounds;
    self.tabbarCtrler = [[TabbarCtrler alloc]initWithItems:[self getToolBarItems]];
    self.tabbarCtrler.view.frame  = CGRectMake(0, 0, rect.size.width, rect.size.height);
    [self.view addSubview:self.tabbarCtrler.view];
    
    NSLog(@"kkkk");
}

-(NSArray*)getToolBarItems
{
    Param_TabItem* param = nil;
    NSMutableArray* items = [[NSMutableArray alloc]initWithCapacity:20];
    
    param = [[Param_TabItem alloc]init];
    param.ctrler = [[TabItemCtrler alloc]init];
    param.ctrler.delegate = self;
    param.selimage = @"homeselect";
    param.nomimage = @"homenone";
    param.title = @"首页";
    [items addObject:param];
    
    param = [[Param_TabItem alloc]init];
    param.ctrler = [[TabItemCtrler alloc]init];
    param.ctrler.delegate = self;
    param.selimage = @"msgselect";
    param.nomimage = @"msgnone";
    param.title = @"消息";
    [items addObject:param];
    
    param = [[Param_TabItem alloc]init];
    param.ctrler = [[TabItemCtrler alloc]init];
    param.ctrler.delegate = self;
    param.selimage = @"orderselect";
    param.nomimage = @"ordernone";
    param.title = @"订单";
    [items addObject:param];
    
    param = [[Param_TabItem alloc]init];
    param.ctrler = [[TabItemCtrler alloc]init];
    param.ctrler.delegate = self;
    param.selimage = @"discoverselect";
    param.nomimage = @"discover";
    param.title = @"发现";
    [items addObject:param];
    
    param = [[Param_TabItem alloc]init];
    param.ctrler = [[TabItemCtrler alloc]init];
    param.ctrler.delegate = self;
    param.selimage = @"myselect";
    param.nomimage = @"mynone";
    param.title = @"我的";
    [items addObject:param];
    
    return items;
}

-(void)backWithCtrler:(id)ctrler
{
    if ([ctrler isKindOfClass:[TabItemCtrler class]])
    {
        [self backClick];
    }
}

@end

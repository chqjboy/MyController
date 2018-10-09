//
//  TabItemCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/3/24.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "TabItemCtrler.h"

@interface TabItemCtrler ()

@end

@implementation TabItemCtrler

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
    if (self.delegate!=nil&&
        [self.delegate respondsToSelector:@selector(backWithCtrler:)])
    {
        [self.delegate backWithCtrler:self];
    }
}

@end

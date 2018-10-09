//
//  TabbarCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/3/24.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "TabbarCtrler.h"
#import "Navigationbar.h"
@implementation Param_TabItem
@end
@implementation TabbarCtrler

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(TabbarCtrler*)initWithItems:(NSArray*)items
{
    self = [super init];
    self.items = items;
    [self loadItems];
    return self;
}
-(void)loadItems
{
    NSMutableArray* ctrlers = [[NSMutableArray alloc]initWithCapacity:20];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       GLOBAL_COLOR(122, 122, 122), UITextAttributeTextColor,
                                                       nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       GLOBAL_COLOR(153, 102, 203), UITextAttributeTextColor,
                                                       nil] forState:UIControlStateSelected];
    for (Param_TabItem* item in self.items)
    {
        UINavigationController* nav = [[UINavigationController alloc]initWithNavigationBarClass:[Navigationbar class] toolbarClass:nil];
        nav.viewControllers = @[item.ctrler];
        [item.ctrler.tabBarItem setFinishedSelectedImage:GLOBAL_ImageLoad(item.selimage)
                             withFinishedUnselectedImage:GLOBAL_ImageLoad(item.nomimage)];
        [item.ctrler setTitle:item.title];
        [ctrlers addObject:nav];
    }
    self.viewControllers = ctrlers;
}

@end

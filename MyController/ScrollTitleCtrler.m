//
//  ScrollTitleCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/8/10.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "ScrollTitleCtrler.h"

@implementation ScrollTitleCtrler
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
    CGRect rect = self.view.bounds;
    
    [self initTitleItemsScrollViewWithRect:rect];
}

-(void)initTitleItemsScrollViewWithRect:(CGRect)rect
{
    Param_TitleItemsScrollView* param = [[Param_TitleItemsScrollView alloc]init];
    param.titleHeight = 50;
    NSMutableArray* titleItems = [[NSMutableArray alloc]init];
    CGRect rtTab = rect;
    rtTab.size.height = param.titleHeight;
    CGRect rtItem = rect;
    rtItem.size.height = rect.size.height-param.titleHeight;
    for (int i=0; i<10; i++)
    {
        Param_TitleItem* titleItem = [[Param_TitleItem alloc]init];
        
        rtTab.size.width = 50+i%5*10;
        titleItem.title = [[UIView alloc]initWithFrame:rtTab];
        [titleItem.title setBackgroundColor:GLOBAL_ACOLOR(200*(i/10.0), 155*(i/10.0), 0, 1)];
        
        titleItem.item = [[UIView alloc]initWithFrame:rtItem];
        [titleItem.item setBackgroundColor:GLOBAL_ACOLOR(200*(i/10.0), 155*(i/10.0), 0, 1)];
        
        [titleItems addObject:titleItem];
    }
    param.titleItems = titleItems;
    self.titleItemsScrollView = [[TitleItemsScrollView alloc]initWithFrame:rect andParam:param];
    self.titleItemsScrollView.delegate = self;
    [self.titleItemsScrollView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:self.titleItemsScrollView];
}
-(void)titleItemsUpdateToParam:(Param_TitleItem*)param andIndex:(NSInteger)index
{
    NSLog(@"%d", index);
}
@end

//
//  RootViewCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/3/23.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "RootViewCtrler.h"
#import "ToolbarCtrler.h"
#import "TabItemCtrler.h"
#import "VScrollViewCtrler.h"
#import "AnimationsCtrler.h"
#import "ItemsScrollCtrler.h"
#import "CycleRollCtrler.h"
#import "ScrollTitleCtrler.h"
#import "CutPictureCtrler.h"
#import "AutoAVPlayerCtrler.h"
#import "ProgressBarCtrler.h"
#import "AddressBookCtrler.h"
#import "PickerViewCtrler.h"
#import "CustomCameraCtrler.h"
#import "AlbumCtrler.h"
#import "TransformImageCtrler.h"
#import "TableViewCtrler.h"
#import "AutoSizeTextViewCtrler.h"
@interface RootViewCtrler ()

@end

@implementation RootViewCtrler

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的控件库";
    [self.btnBack setHidden:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initCells];
    [self initViews];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO  animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initCells
{
    self.cells = @[@{
                       @"title":      @"工具栏ToolBar",
                       @"clsCtrler":  ToolbarCtrler.class
                    },
                   @{
                       @"title":      @"垂直自动加载ViewVScrollView",
                       @"clsCtrler":  VScrollViewCtrler.class
                    },
                   @{
                       @"title":      @"动画效果Animations",
                       @"clsCtrler":  AnimationsCtrler.class
                    },
                   @{
                       @"title":      @"摄像头应用Camera",
                       @"clsCtrler":  CustomCameraCtrler.class
                    },
                   @{
                       @"title":      @"分页滚动",
                       @"clsCtrler":  ItemsScrollCtrler.class
                    },
                   @{
                       @"title":      @"循环滚动",
                       @"clsCtrler":  CycleRollCtrler.class
                    },
                   @{
                       @"title":      @"滚动标题",
                       @"clsCtrler":  ScrollTitleCtrler.class
                    },
                   @{
                       @"title":      @"裁切图片",
                       @"clsCtrler":  CutPictureCtrler.class
                    },
                   @{
                       @"title":      @"自动视频播放器",
                       @"clsCtrler":  AutoAVPlayerCtrler.class
                    },
                   @{
                       @"title":      @"进度条",
                       @"clsCtrler":  ProgressBarCtrler.class
                    },
                   @{
                       @"title":      @"通信录",
                       @"clsCtrler":  AddressBookCtrler.class
                    },
                   @{
                       @"title":      @"数据提取器",
                       @"clsCtrler":  PickerViewCtrler.class
                    },
                   @{
                       @"title":      @"自定义相册",
                       @"clsCtrler":  AlbumCtrler.class
                    },
                   @{
                       @"title":      @"图片转换",
                       @"clsCtrler":  TransformImageCtrler.class
                       },
                   @{
                       @"title":    @"复用TableCell",
                       @"clsCtrler": TableViewCtrler.class
                       },
                   @{
                       @"title":    @"自适应文本输入框",
                       @"clsCtrler": AutoSizeTextViewCtrler.class
                       }
                   ];
}

-(void)initViews
{
    CGRect rect = self.view.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    
    CGRect rtScrollView = rect;
    [self initVScrollViewWithRect:rtScrollView];
    [self reloadContent];
}
-(void)initVScrollViewWithRect:(CGRect)rect
{
    self.vscrollView = [[VScrollView alloc]initWithFrame:rect];
    [self.view addSubview:self.vscrollView];
}

-(void)reloadContent
{
    [self.vscrollView removeAllItems];
    CGRect rect = self.vscrollView.frame;
    [self loadCellsWithRect:rect];
    [self.vscrollView reloadItems];
}

-(void)loadCellsWithRect:(CGRect)rect
{
    for (NSDictionary* dic in self.cells)
    {
        Param_RootViewCell* param = [[Param_RootViewCell alloc]init];
        [param setValuesForKeysWithDictionary:dic];
        RootViewCell* cell = [[RootViewCell alloc]initWithFrame:rect andParam:param];
        [self.vscrollView addItemWithView:cell];
    }
}

@end

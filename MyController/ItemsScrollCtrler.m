//
//  ItemsScrollCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/4/25.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "ItemsScrollCtrler.h"

@implementation ItemsScrollCtrler
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
    [self initItemsScrollViewWithRect:rect];
}

-(void)initItemsScrollViewWithRect:(CGRect)rect
{
    Param_ItemsScrollView* param = [[Param_ItemsScrollView alloc]init];
    param.headerheight = 90*[Device getVScale];
    NSMutableArray* headers = [[NSMutableArray alloc]init];
    NSMutableArray* items = [[NSMutableArray alloc]init];
    
    CGRect rtHeaderCell = rect;
    rtHeaderCell.size.height = 80*[Device getVScale];
    rtHeaderCell.size.width = (rect.size.width-10)/4-3;
    
    CGRect rtScrollCell = rect;
    
    ItemsHeaderCell* header = nil;
    ItemsScrollCell* item = nil;
    
    header = [self getHeaderCellWithRect:rtHeaderCell andImage:@""];
    item = [self getScrollCellWithRect:rtScrollCell andImage:@""];
    [headers addObject:header];
    [items addObject:item];
    [header setBackgroundColor:[UIColor blueColor]];
    [item setBackgroundColor:[UIColor blueColor]];
    header.tag = 0;
    item.tag=0;
    
    header = [self getHeaderCellWithRect:rtHeaderCell andImage:@""];
    item = [self getScrollCellWithRect:rtScrollCell andImage:@""];
    [headers addObject:header];
    [items addObject:item];
    [header setBackgroundColor:[UIColor redColor]];
    [item setBackgroundColor:[UIColor redColor]];
    header.tag=1;
    item.tag=1;
    
    header = [self getHeaderCellWithRect:rtHeaderCell andImage:@""];
    item = [self getScrollCellWithRect:rtScrollCell andImage:@""];
    [headers addObject:header];
    [items addObject:item];
    [header setBackgroundColor:[UIColor yellowColor]];
    [item setBackgroundColor:[UIColor yellowColor]];
    header.tag=2;
    item.tag=2;
    
    header = [self getHeaderCellWithRect:rtHeaderCell andImage:@""];
    item = [self getScrollCellWithRect:rtScrollCell andImage:@""];
    [headers addObject:header];
    [items addObject:item];
    [header setBackgroundColor:[UIColor greenColor]];
    [item setBackgroundColor:[UIColor greenColor]];
    header.tag=3;
    item.tag=3;
    
    param.headers = headers;
    param.items = items;
    self.headers = headers;
    self.items = items;
    self.itemsScrollView = [[ItemsScrollView alloc]initWithFrame:rect andParam:param];
    self.itemsScrollView.delegate = self;
    [self.view addSubview:self.itemsScrollView];
    [self selItemWithIndex:0];
}

-(ItemsHeaderCell*)getHeaderCellWithRect:(CGRect)rect andImage:(NSString*)image
{
    ItemsHeaderCell* cell = [[ItemsHeaderCell alloc]initWithFrame:rect andImage:image];
    return cell;
}
-(ItemsScrollCell*)getScrollCellWithRect:(CGRect)rect andImage:(NSString*)image
{
    ItemsScrollCell* cell = [[ItemsScrollCell alloc]initWithFrame:rect andImage:image];
    return cell;
}
-(void)selItemWithIndex:(NSInteger)index
{
    [self updateHeaderShadowWithIndex:index];
}
-(void)updateHeaderShadowWithIndex:(NSInteger)index
{
    for (int i=0; i<self.headers.count; i++)
    {
        UIView* view = [self.headers objectAtIndex:i];
        if (i==index)
        {
            view.transform = CGAffineTransformMakeScale(1.05, 1.05);
            view.layer.shadowOpacity = 0.7f;
            view.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
            view.layer.shadowRadius = 5.0f;
            view.layer.masksToBounds = NO;
            view.layer.zPosition = 1;
            
//            CGSize size = view.bounds.size;
//            UIBezierPath *path = [UIBezierPath bezierPath];
//            [path moveToPoint:CGPointMake(size.width * 0.33f, size.height * 0.66f)];
//            [path addLineToPoint:CGPointMake(size.width * 0.66f, size.height * 0.66f)];
//            [path addLineToPoint:CGPointMake(size.width * 1.15f, size.height * 1.15f)];
//            [path addLineToPoint:CGPointMake(size.width * -0.15f, size.height * 1.15f)];
//            view.layer.shadowPath = path.CGPath;
        }else
        {
            view.transform = CGAffineTransformMakeScale(1, 1);
            view.layer.zPosition = 0;
            view.layer.shadowOpacity = 0.0f;
            //view.layer.shadowOffset = CGSizeMake(10.0f, 10.0f);
        }
    }
}
@end

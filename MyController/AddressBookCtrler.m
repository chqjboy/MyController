//
//  AddressBookCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/11/1.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "AddressBookCtrler.h"

@interface AddressBookCtrler ()

@end

@implementation AddressBookCtrler

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self reloadContent];
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
    
    CGRect rtScroll = rect;
    [self initVScrollViewWithRect:rtScroll];
}
-(void)initVScrollViewWithRect:(CGRect)rect
{
    self.vscrollView = [[VScrollView alloc]initWithFrame:rect];
    [self.view addSubview:self.vscrollView];
}
-(void)reloadContent
{
    CGRect rect = self.vscrollView.bounds;
    [self.vscrollView removeAllItems];
    [self initPickerWithRect:rect];
    [self.vscrollView reloadItems];
}
-(void)initPickerWithRect:(CGRect)rect
{
    self.picker = [[AddressBookCell alloc]initWithFrame:rect andName:@"选择并显示通信录联系人"];
    self.picker.delegate = self;
    [self.vscrollView addItemWithView:self.picker];
}
-(void)initAdderWithRect:(CGRect)rect
{
    
}
-(void)initMenderWithRect:(CGRect)rect
{
    
}
-(void)cellClickWithView:(UIView*)view
{
    if (view==self.picker)
    {
        [self showPicker];
    }
}
-(void)showPicker
{
    if (self.pickerCtrler==nil)
    {
        self.pickerCtrler = [[ABPeoplePickerNavigationController alloc]init];
        self.pickerCtrler.delegate = self;
        self.pickerCtrler.peoplePickerDelegate = self;
        [self presentViewController:self.pickerCtrler animated:YES completion:nil];
    }
}

-(void)showInfo
{
    
}

-(void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person
{
    NSLog(@"success");
    self.pickerCtrler = nil;
}
-(void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    NSLog(@"success:%d", identifier);
    self.pickerCtrler = nil;
}
-(void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    NSLog(@"cancel");
    self.pickerCtrler = nil;
}
@end

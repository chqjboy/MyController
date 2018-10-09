//
//  VScrollViewCtrler.m
//  MyController
//
//  Created by 陈前进 on 16/3/24.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "VScrollViewCtrler.h"

@interface VScrollViewCtrler ()

@end

@implementation VScrollViewCtrler

- (void)viewDidLoad {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.strings = [[NSMutableArray alloc]initWithCapacity:20];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    NSLog(@"dealloc");
}

-(void)initViews
{
    CGRect rect = self.view.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    
    CGRect rtTextField = rect;
    rtTextField.size.height = 40;
    rtTextField.origin.x = 10;
    rtTextField.origin.y = 10;
    rtTextField.size.width = rect.size.width-2*rtTextField.origin.x;
    [self initTextFieldWithRect:rtTextField];
    
    CGRect rtLine = rect;
    rtLine.size.height = 0.5;
    rtLine.origin.y = 2*rtTextField.origin.y+rtTextField.size.height;
    [Functions drawLineWithRect:rtLine andView:self.view];
    
    CGRect rtScroll = rect;
    rtScroll.origin.y = rtLine.origin.y+rtLine.size.height;
    rtScroll.size.height = rect.size.height-rtScroll.origin.y;
    [self initVScrollViewWithRect:rtScroll];
}
-(void)initTextFieldWithRect:(CGRect)rect
{
    self.textField = [[UITextField alloc] initWithFrame:rect];
    self.textField.delegate = self;
    [self.textField setFont:GLOBAL_FONT(15*[Device getHScale])];
    [self.textField setTextColor:GLOBAL_COLOR(102, 102, 102)];
    [self.textField setKeyboardType:UIKeyboardTypeDefault];
    [self.textField setReturnKeyType:UIReturnKeyDone];
    [self.textField setPlaceholder:@"请输入文本字符串"];
    [self.textField.layer setBorderWidth:0.5];
    [self.textField.layer setBorderColor:GLOBAL_COLOR(128, 128, 128).CGColor];
    [self.textField.layer setCornerRadius:5*[Device getHScale]];
    [self.textField.layer setMasksToBounds:YES];
    //左边缩进5；
    CGRect rtPreview = CGRectMake(0, 0, 5, 5);
    [self.textField setLeftView:[[UIView alloc]initWithFrame:rtPreview]];
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:self.textField];
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
    for (NSString* string in self.strings)
    {
        VScrollCell* cell = [[VScrollCell alloc]initWithFrame:rect andName:string];
        [self.vscrollView addItemWithView:cell];
    }
    [self.vscrollView reloadItems];
}

-(void)backClick
{
    if (self.delegate!=nil && [self.delegate respondsToSelector:@selector(backWithCtrler:)])
    {
        [self.delegate backWithCtrler:self];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"])
    {
        if (textField.text!=nil && textField.text.length>0)
        {
            [self.strings addObject:textField.text];
            [self reloadContent];
            textField.text = @"";
        }
        [self.view endEditing:YES];
        return FALSE;
    }
    return TRUE;
}



@end

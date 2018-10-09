//
//  AddressBookCtrler.h
//  MyController
//
//  Created by 陈前进 on 16/11/1.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "NavigationCtrler.h"
#import "AddressBookCell.h"
#import "VScrollView.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
@interface AddressBookCtrler : NavigationCtrler
<
AddressBookCellDelegate,
UINavigationControllerDelegate,
ABPeoplePickerNavigationControllerDelegate
>
@property(nonatomic, retain) VScrollView* vscrollView;
@property(nonatomic, retain) AddressBookCell* picker;
@property(nonatomic, retain) AddressBookCell* adder;
@property(nonatomic, retain) AddressBookCell* mender;

@property(nonatomic, retain) ABPeoplePickerNavigationController* pickerCtrler;

-(void)backClick;
-(void)initViews;
-(void)initVScrollViewWithRect:(CGRect)rect;
-(void)reloadContent;
-(void)initPickerWithRect:(CGRect)rect;
-(void)initAdderWithRect:(CGRect)rect;
-(void)initMenderWithRect:(CGRect)rect;
-(void)cellClickWithView:(UIView*)view;
-(void)showPicker;
-(void)showInfo;


//ABPeoplePickerNavigationControllerDelegate
-(void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person;
-(void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier;
-(void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker;
@end

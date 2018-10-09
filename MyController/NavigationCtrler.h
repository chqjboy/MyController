
#import <UIKit/UIKit.h>
#import "Navigationbar.h"
@protocol NavigationCtrlerDelegate<NSObject>
@optional
-(void)backWithCtrler:(id)ctrler;
@end
@interface NavigationCtrler : UIViewController
{
    id<NavigationCtrlerDelegate>_delegate;
    BOOL _hittest;
}
@property(nonatomic, retain) id<NavigationCtrlerDelegate>delegate;
@property(nonatomic, retain) UIView* rightView;
@property(nonatomic, retain) UIButton* btnBack;
@property(nonatomic, assign) BOOL isPresent;
@property(nonatomic, retain) UIViewController* backto;

-(BOOL)canBackto;
-(void)backClick;
-(void)initViews;
-(void)rightClick;
-(NSArray<UIView*>*)appendLeftButtons;
-(UIView*)installRightButton;
-(UIView*)installTitleView;
- (void) registerForKeyboardNotifications;

-(void) keyboardWasHide:(NSNotification*)notify;
- (void) keyboardWasShown:(NSNotification *) notify;
-(void)keyboardFrameChanged:(NSNotification*)notify;
-(void)removeKeyboardNotifications;
-(void)resizeWithKeyboardHeight:(CGFloat)height;

@end

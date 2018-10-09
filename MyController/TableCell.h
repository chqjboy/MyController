
#import <UIKit/UIKit.h>
#import "FitLineLabel.h"

@interface TableCellParam:NSObject
@property(nonatomic, assign) CGFloat cellHeight;
@end

@interface TableCell : UITableViewCell
@property(nonatomic, retain) TableCellParam* frame;
@property(nonatomic, retain) FitLineLabel* title;
+(instancetype)cellWithTableView:(UITableView*)tableView;
-(void)initSubViews;
-(void)reloadParam:(TableCellParam*)param;
@end

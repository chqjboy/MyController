
#import "NavigationCtrler.h"
#import "TableCell.h"

@interface TableViewCtrler : NavigationCtrler
<
UITableViewDelegate,
UITableViewDataSource
>
@property(nonatomic, retain) UITableView* table;
@property(nonatomic, retain) NSMutableArray<TableCellParam*>* params;
@end

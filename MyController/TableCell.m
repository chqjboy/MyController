
#import "TableCell.h"
#import <objc/runtime.h>

@implementation TableCellParam
-(CGFloat)cellHeight
{
    return 40;
}
@end
@implementation TableCell
+(instancetype)cellWithTableView:(UITableView*)tableView
{
    static NSString* identifier = @"tablecell";
    TableCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil)
    {
        cell = [[TableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self initSubViews];
    return self;
}
-(void)initSubViews
{
    
}
-(void)reloadParam:(TableCellParam*)param
{
    
}
@end


#import <UIKit/UIKit.h>
#import "AlbumDirectoryCell.h"
@protocol AlbumDirectoryViewDelegate<NSObject>
-(void)selectDirectory:(PHDirectory*)directory;
@end
@interface AlbumDirectoryView : UIView
<
UITableViewDelegate,
UITableViewDataSource,
AlbumDirectoryCellCallback
>
@property(nonatomic, weak) id<AlbumDirectoryViewDelegate>delegate;
@property(nonatomic, retain) UITableView* table;
@property(nonatomic, retain) NSMutableArray<AlbumDirectoryCellParam*>* directorys;
@property(nonatomic, assign) eAlbumEnumMode mode;
-(instancetype)initWithFrame:(CGRect)frame mode:(eAlbumEnumMode)mode;
-(void)anlyDirectorys;
@end

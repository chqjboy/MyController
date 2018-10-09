
#import "AlbumDirectoryView.h"

@implementation AlbumDirectoryView
-(instancetype)initWithFrame:(CGRect)frame mode:(eAlbumEnumMode)mode
{
    self = [super initWithFrame:frame];
    self.directorys = [[NSMutableArray alloc]init];
    self.mode = mode;
    [self initViews];
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    [self initTableWithRect:rect];
}
-(void)initTableWithRect:(CGRect)rect
{
    self.table = [[UITableView alloc]initWithFrame:rect];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.table setAllowsSelection:NO];
    [self.table setEditing:NO];
    [self.table setBackgroundColor:[UIColor clearColor]];
    [self.table setBackgroundView:nil];
    [self addSubview:self.table];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AlbumDirectoryCell* cell = [AlbumDirectoryCell cellWithTableView:tableView param:[self.directorys objectAtIndex:indexPath.row]];
    cell.callback = self;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AlbumDirectoryCellParam* param = [self.directorys objectAtIndex:indexPath.row];
    return param.cellHeight;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self tableView:tableView heightForRowAtIndexPath:indexPath];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.directorys.count;
}

-(void)anlyDirectorys
{
    [self anlyDirectorysWithType:PHAssetCollectionTypeSmartAlbum];
    [self anlyDirectorysWithType:PHAssetCollectionTypeAlbum];
    [self.table reloadData];
}
-(void)anlyDirectorysWithType:(PHAssetCollectionType)type
{
    PHFetchResult* result = [PHAssetCollection fetchAssetCollectionsWithType:type subtype:PHAssetCollectionSubtypeAny options:nil];
    for (NSInteger i = 0; i < result.count; i++) {
        PHAssetCollection *collection = result[i];
        //遍历获取相册
        if ([collection isKindOfClass:[PHAssetCollection class]])
        {
            PHAssetMediaType mediaType = PHAssetMediaTypeUnknown;
            if (self.mode==eAlbumEnumMode_video)
            {
                mediaType = PHAssetMediaTypeVideo;
            }else if(self.mode==eAlbumEnumMode_photos)
            {
                mediaType = PHAssetMediaTypeImage;
            }
            PHDirectory* directory = [[PHDirectory alloc]initWithCollection:collection mediaType:mediaType];
            AlbumDirectoryCellParam* param = [[AlbumDirectoryCellParam alloc]initWithWidth:self.table.bounds.size.width directory:directory];
            NSLog(@"anlyDirectorysWithType:%@", collection.localizedTitle);
            if ([collection.localizedTitle isEqualToString:@"All Photos"])
            {
                [self.directorys insertObject:param atIndex:0];
            }else
            {
                [self.directorys addObject:param];
            }
        }
    }
}

-(void)selectDirectory:(PHDirectory*)directory
{
    if ([self.delegate respondsToSelector:@selector(selectDirectory:)])
    {
        [self.delegate selectDirectory:directory];
    }
}
@end

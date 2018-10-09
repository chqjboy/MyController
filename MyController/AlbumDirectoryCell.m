
#import "AlbumDirectoryCell.h"
@implementation PHDirectory
-(instancetype)initWithCollection:(PHAssetCollection*)collection mediaType:(PHAssetMediaType)mediaType
{
    self = [super init];
    self.collection = collection;
    self.mediaType = mediaType;
    [self anlyAssetsWithCollection:collection];
    return self;
}
-(void)anlyAssetsWithCollection:(PHAssetCollection*)collection
{
    if (!self.assets)
    {
        PHFetchOptions* options = [[PHFetchOptions alloc]init];
        if (self.mediaType!=PHAssetMediaTypeUnknown)
        {
            options.predicate = [NSPredicate predicateWithFormat:@"mediaType = %d", self.mediaType];
        }
        options.sortDescriptors  = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
        self.assets = [PHAsset fetchAssetsInAssetCollection:collection options:options];
    }
}
@end
@implementation AlbumDirectoryCellParam
-(instancetype)initWithWidth:(CGFloat)width directory:(PHDirectory*)directory
{
    self = [super init];
    self.cellWidth = width;
    self.cellHeight = ScaleSize(70);
    self.directory = directory;
    [self anlyFrames];
    return self;
}
-(void)anlyFrames
{
    CGRect rect = CGRectMake(0, 0, self.cellWidth, self.cellHeight);
    
    CGRect rtImage = rect;
    rtImage.size.height = ScaleSize(50);
    rtImage.size.width = rtImage.size.height;
    rtImage.origin.x = ScaleSize(12);
    rtImage.origin.y = (rect.size.height-rtImage.size.height)/2;
    self.imageFrame = rtImage;
    
    CGRect rtArrow = rect;
    rtArrow.size.width = ScaleSize(7);
    rtArrow.size.height = ScaleSize(13);
    rtArrow.origin.x = rect.size.width-rtArrow.size.width-ScaleSize(12);
    rtArrow.origin.y = (rect.size.height-rtArrow.size.height)/2;
    self.arrowFrame = rtArrow;
    
    CGRect rtTitle = rect;
    rtTitle.origin.x = rtImage.origin.x+rtImage.size.width+ScaleSize(12);
    rtTitle.size.width = rtArrow.origin.x-rtTitle.origin.x-ScaleSize(12);
    self.titleFrame = rtTitle;
    
    CGRect rtSplite = rect;
    rtSplite.size.height = 0.5;
    rtSplite.origin.y = rect.size.height-rtSplite.size.height;
    self.spliteFrame = rtSplite;
}
@end
@implementation AlbumDirectoryCell
+(instancetype)cellWithTableView:(UITableView*)tableView param:(AlbumDirectoryCellParam*)param
{
    NSString* identifier = [self identifier];
    AlbumDirectoryCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil)
    {
        cell = [[[self class] alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier param:param];
    }
    [cell setParam:param];
    return cell;
}
+(NSString*)identifier
{
    return NSStringFromClass([self class]);
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier param:(AlbumDirectoryCellParam*)param
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.param = param;
    [self setBackgroundView:nil];
    [self setBackgroundColor:[UIColor clearColor]];
    [self initSubViews];
    [Functions addTapEventWithTarget:self View:self andAction:@selector(selectCell:)];
    return self;
}

-(void)initSubViews
{
    self.image = [[UIImageView alloc]init];
    [self.image.layer setMasksToBounds:YES];
    [self.image.layer setContentsGravity:kCAGravityResizeAspectFill];
    [self.contentView addSubview:self.image];
    
    self.title = [[UILabel alloc]init];
    [self.contentView addSubview:self.title];
    
    self.arrow = [[UIImageView alloc]init];
    [self.arrow setImage:GLOBAL_ImageLoad(@"arrow")];
    [self.contentView addSubview:self.arrow];
    
    self.splite = [[UIView alloc]init];
    [self.splite setBackgroundColor:[UIColor grayColor]];
    [self.contentView addSubview:self.splite];
}
-(void)layoutSubviews
{
    [self.image setFrame:self.param.imageFrame];
    [self.title setFrame:self.param.titleFrame];
    [self.arrow setFrame:self.param.arrowFrame];
    [self.splite setFrame:self.param.spliteFrame];
}
-(void)setParam:(AlbumDirectoryCellParam *)param
{
    _param = param;
    [self anlyDirectory];
    
    [self.image setImage:self.param.directory.poster];
    
    NSString* name = self.param.directory.title;
    NSString* count = [NSString stringWithFormat:@"（%@）", self.param.directory.count];
    NSString* title = [NSString stringWithFormat:@"%@%@", name, count];
    NSMutableAttributedString* attribute = [[NSMutableAttributedString alloc]initWithString:title];
    [attribute addAttribute:NSFontAttributeName value:SystemFont(13) range:NSMakeRange(0, name.length)];
    [attribute addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, name.length)];
    [attribute addAttribute:NSFontAttributeName value:SystemFont(10) range:NSMakeRange(name.length, count.length)];
    [attribute addAttribute:NSForegroundColorAttributeName value:GLOBAL_COLOR(116, 119, 130) range:NSMakeRange(name.length, count.length)];
    NSMutableParagraphStyle* style = [[NSMutableParagraphStyle alloc]init];
    [style setLineBreakMode:NSLineBreakByTruncatingTail];
    [attribute addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, title.length)];
    [self.title setAttributedText:attribute];
}
-(void)anlyDirectory
{
    if (!self.param.directory.poster)
    {
        [self anlyPosterFromDirectory:self.param.directory];
    }
    if (self.param.directory.title==nil)
    {
        self.param.directory.title = [self titleFromCollection:self.param.directory.collection];
    }
    if (self.param.directory.count==nil)
    {
        self.param.directory.count = @(self.param.directory.assets.count);
    }
}
-(NSString*)titleFromCollection:(PHCollection*)collection
{
    if (collection==nil)
    {
        return nil;
    }
    NSString* title =  collection.localizedTitle;
    if ([title isEqualToString:@"Slo-mo"]) {
        return @"慢动作";
    }else if ([title isEqualToString:@"All Photos"]) {
        return @"全部";
    }else if ([title isEqualToString:@"Selfies"]) {
        return @"自拍";
    }else if ([title isEqualToString:@"Bursts"]) {
        return @"爆发";
    }else if ([title isEqualToString:@"Long Exposure"]) {
        return @"长曝光";
    }else if ([title isEqualToString:@"Portrait"]) {
        return @"人像";
    }else if ([title isEqualToString:@"Panoramas"]) {
        return @"全景照片";
    }else if ([title isEqualToString:@"Animated"]) {
        return @"动图";
    }else if ([title isEqualToString:@"Live Photos"]) {
        return @"实况照片";
    }else if ([title isEqualToString:@"Screenshots"]) {
        return @"屏幕快照";
    }else if ([title isEqualToString:@"Videos"]) {
        return @"视频";
    }else if ([title isEqualToString:@"Hidden"]) {
        return @"隐藏";
    }else if ([title isEqualToString:@"Recently Added"]) {
        return @"最近添加";
    }else if ([title isEqualToString:@"Favorites"]) {
        return @"个人收藏";
    }else if ([title isEqualToString:@"Time-lapse"]) {
        return @"延时摄影";
    }
    return title;
}
-(void)anlyPosterFromDirectory:(PHDirectory*)directory
{
    if (directory==nil)
    {
        return ;
    }
    PHImageManager* manager = [PHImageManager defaultManager];
    PHImageRequestOptions* options = [[PHImageRequestOptions alloc] init];
    PHFetchResult* result = self.param.directory.assets;
    __block typeof(directory) blkDirectory = directory;
    if (result.count>0)
    {
        PHAsset* asset = result.lastObject;
        [manager requestImageForAsset:asset
                           targetSize:CGSizeMake(100, 100)
                          contentMode:PHImageContentModeAspectFill
                              options:options
                        resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info){
                            blkDirectory.poster = result;
                            if (self.param.directory==blkDirectory)
                            {
                                [self.image setImage:result];
                            }
                        }];
    }else
    {
        blkDirectory.poster = GLOBAL_ImageLoad(@"def_picture");
    }
    return;
}
-(NSInteger)countFromCollection:(PHAssetCollection*)collection
{
    if (collection==nil)
    {
        return 0;
    }
    return self.param.directory.assets.count;
}
-(void)selectCell:(UIGestureRecognizer*)recognize
{
    if ([self.callback respondsToSelector:@selector(selectDirectory:)])
    {
        [self.callback selectDirectory:self.param.directory];
    }
}

@end

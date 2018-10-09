
#import "AlbumCell.h"
@implementation Param_AlbumCell
-(instancetype)init
{
    self = [super init];
    self.defimage = [UIImage imageNamed:@"def_picture"];
    return self;
}
@end
@implementation AlbumCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self initViews];
    [Functions addTapEventWithTarget:self View:self andAction:@selector(cellClick)];
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    [self initImageViewWithRect:rect];
    
    CGRect rtSelect = rect;
    rtSelect.size.height = 20;
    rtSelect.size.width = 20;
    rtSelect.origin.x = rect.size.width-rtSelect.size.width-5;
    rtSelect.origin.y = rect.size.height-rtSelect.size.height-5;
    [self initImgSelectWithRect:rtSelect];
}
-(void)initImageViewWithRect:(CGRect)rect
{
    self.imageView = [[UIImageView alloc]initWithFrame:rect];
    [self.imageView setImage:GLOBAL_ImageLoad(@"def_picture")];
    [self.imageView.layer setContentsGravity:kCAGravityResizeAspectFill];
    [self.imageView.layer setMasksToBounds:YES];
    [self addSubview:self.imageView];
}
-(void)initImgSelectWithRect:(CGRect)rect
{
    self.imgSelect = [[UIImageView alloc]initWithFrame:rect];
    [self.imgSelect setHidden:YES];
    [self.imgSelect setImage:[UIImage imageNamed:@"album_item_select"]];
    [self addSubview:self.imgSelect];
}
-(void)setParam:(Param_AlbumCell *)param
{
    _param = param;
    [self.imgSelect setHidden:!param.select];
    if (param.image==nil)
    {
        [self.imageView setImage:param.defimage];
        [self anlyPoster];
    }else
    {
        [self.imageView setImage:param.image];
    }
}
-(void)anlyPoster
{
    PHImageManager* manager = [PHImageManager defaultManager];
    PHImageRequestOptions* options = [[PHImageRequestOptions alloc] init];
    options.deliveryMode = PHImageRequestOptionsDeliveryModeOpportunistic;
    PHAsset* asset = self.param.asset;
    __block typeof(self.param) blkParam = self.param;
    [manager requestImageForAsset:asset
                       targetSize:CGSizeMake(200, 200)
                      contentMode:PHImageContentModeAspectFit
                          options:options
                    resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info){
                        blkParam.image = result;
                        if (self.param==blkParam)
                        {
                            [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:blkParam.image waitUntilDone:YES];
                        }
                    }];
}
-(void)cellClick
{
    if ([self.delegate respondsToSelector:@selector(selectCell:)])
    {
        [self.delegate selectCell:self];
    }
}

@end

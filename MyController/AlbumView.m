
#import "AlbumView.h"
@implementation Param_AlbumView
@end
@implementation AlbumView
-(instancetype)initWithFrame:(CGRect)frame andParam:(Param_AlbumView*)param
{
    self = [super initWithFrame:frame];
    self.param = param;
    self.cells = [[NSMutableArray alloc]init];
    [self initViews];
    return self;
}

-(void)initViews
{
    CGRect rect = self.bounds;
    [self initCollectionViewWithRect:rect];
}
-(void)initCollectionViewWithRect:(CGRect)rect
{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    //每张图片宽度
    CGFloat width = (rect.size.width - self.param.space * (self.param.columns - 1)) / self.param.columns;
    layout.itemSize = CGSizeMake(width, self.param.height);
    layout.minimumLineSpacing      = self.param.space;
    layout.minimumInteritemSpacing = self.param.space;
    self.collectionView = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView setBackgroundColor:GLOBAL_COLOR(255, 255, 255)];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self addSubview:self.collectionView];
}
-(void)reloadCellsWithCollection:(PHAssetCollection*)collection assets:(PHFetchResult*)assets
{
    self.collection = collection;
    self.assets = assets;
    if (self.cells==nil)
    {
        self.cells = [[NSMutableArray alloc]init];
    }
    [self.cells removeAllObjects];
    for (int i=0; i<self.assets.count; i++)
    {
        PHAsset* asset = self.assets[i];
        Param_AlbumCell* param = [[Param_AlbumCell alloc]init];
        param.asset = asset;
        [self.cells addObject:param];
    }
    [self.collectionView reloadData];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.cells.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [UICollectionViewCell new];
    }
    AlbumCell* cll = nil;
    for (UIView* view in cell.subviews)
    {
        if ([view isKindOfClass:[AlbumCell class]])
        {
            cll = (AlbumCell*)view;
        }else
        {
            [view removeFromSuperview];
        }
    }
    if (cll==nil)
    {
        cll = [[AlbumCell alloc] initWithFrame:cell.bounds];
        cll.delegate = self;
    }
    [cll setParam:self.cells[indexPath.row]];
    [cell addSubview:cll];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
}
-(void)selectCell:(AlbumCell*)cell
{
    if (self.param.sigleselect)
    {
        for (Param_AlbumCell* param in self.cells)
        {
            if (cell.param==param)
            {
                param.select = !param.select;
            }else
            {
                param.select = NO;
            }
        }
        [self.collectionView reloadData];
    }else
    {
        cell.param.select = !cell.param.select;
        [cell setParam:cell.param];
    }
}
-(NSArray<PHAsset*>*)getSelectedAlAssets
{
    NSMutableArray* assets = [[NSMutableArray alloc]init];
    [self.cells enumerateObjectsUsingBlock:^(Param_AlbumCell * _Nonnull param, NSUInteger idx, BOOL * _Nonnull stop) {
        if (param.select)
        {
            [assets addObject:param.asset];
        }
    }];
    return assets;
}
@end

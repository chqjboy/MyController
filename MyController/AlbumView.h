
#import <UIKit/UIKit.h>
#import "AlbumCell.h"

@interface Param_AlbumView : NSObject
@property(nonatomic, assign) NSInteger columns;
@property(nonatomic, assign) CGFloat height;
@property(nonatomic, assign) CGFloat space;
@property(nonatomic, assign) BOOL sigleselect;
@property(nonatomic, assign) eAlbumEnumMode mode;
@end

@interface AlbumView : UIView
<
UICollectionViewDelegate,
UICollectionViewDataSource,
AlbumCellDelegate
>
@property(nonatomic, retain) Param_AlbumView* param;
@property(nonatomic, retain) UICollectionView* collectionView;
@property(nonatomic, retain) PHAssetCollection* collection;
@property(nonatomic, retain) PHFetchResult* assets;
@property(nonatomic, retain) NSMutableArray<Param_AlbumCell*>* cells;
-(instancetype)initWithFrame:(CGRect)frame andParam:(Param_AlbumView*)param;
-(void)reloadCellsWithCollection:(PHAssetCollection*)collection assets:(PHFetchResult*)assets;
-(NSArray<PHAsset*>*)getSelectedAlAssets;
@end

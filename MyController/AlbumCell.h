
#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
@interface Param_AlbumCell : NSObject
@property(nonatomic, assign) BOOL select;
@property(nonatomic, retain) UIImage* image;
@property(nonatomic, retain) UIImage* defimage;
@property(nonatomic, retain) PHAsset* asset;
@end
@class AlbumCell;
@protocol AlbumCellDelegate<NSObject>
-(void)selectCell:(AlbumCell*)cell;
@end
@interface AlbumCell : UIView
@property(nonatomic, weak) id<AlbumCellDelegate>delegate;
@property(nonatomic, retain) Param_AlbumCell* param;
@property(nonatomic, retain) UIImageView* imageView;
@property(nonatomic, retain) UIImageView* imgSelect;
@end

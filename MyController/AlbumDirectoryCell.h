
#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
@interface PHDirectory : NSObject
@property(nonatomic, retain) NSString* title;

@property(nonatomic, retain) PHAssetCollection* collection;
@property(nonatomic, retain) PHFetchResult* assets;
@property(nonatomic, retain) UIImage* poster;
@property(nonatomic, retain) NSNumber* count;
@property(nonatomic, assign) PHAssetMediaType mediaType;

-(instancetype)initWithCollection:(PHAssetCollection*)collection mediaType:(PHAssetMediaType)mediaType;
@end

@interface AlbumDirectoryCellParam : NSObject
@property(nonatomic, assign) CGFloat cellHeight;
@property(nonatomic, assign) CGFloat cellWidth;
@property(nonatomic, assign) CGRect imageFrame;
@property(nonatomic, assign) CGRect titleFrame;
@property(nonatomic, assign) CGRect countFrame;
@property(nonatomic, assign) CGRect arrowFrame;
@property(nonatomic, assign) CGRect spliteFrame;
@property(nonatomic, retain) PHDirectory* directory;
-(instancetype)initWithWidth:(CGFloat)width directory:(PHDirectory*)directory;
@end

@protocol AlbumDirectoryCellCallback<NSObject>
-(void)selectDirectory:(PHDirectory*)directory;
@end

@interface AlbumDirectoryCell : UITableViewCell
<
UIGestureRecognizerDelegate
>
@property(nonatomic, weak) id<AlbumDirectoryCellCallback>callback;
@property(nonatomic, retain) UIImageView* image;
@property(nonatomic, retain) UILabel* title;
@property(nonatomic, retain) UIImageView* arrow;
@property(nonatomic, retain) UIView* splite;
@property(nonatomic, retain) AlbumDirectoryCellParam* param;

+(instancetype)cellWithTableView:(UITableView*)tableView param:(AlbumDirectoryCellParam*)param;

@end

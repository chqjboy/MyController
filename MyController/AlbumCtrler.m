
#import "AlbumCtrler.h"
#import "BaseNavigationCtrler.h"
#import "Animations.h"
@interface AlbumCtrler ()

@end

@implementation AlbumCtrler
+(void)showAlbumViewCtrler:(UIViewController*)ctrler andMode:(eAlbumEnumMode)mode andSigleSelect:(BOOL)sigleselect andDelegae:(id)delegate andCallback:(id)callback
{
    AlbumCtrler* controler = [[AlbumCtrler alloc]init];
    controler.delegate = delegate;
    controler.callback = callback;
    controler.isPresent = YES;
    controler.mode = mode;
    controler.sigleselect = sigleselect;
    if (mode==eAlbumEnumMode_all)
    {
        controler.title = @"相册";
    }else if (mode==eAlbumEnumMode_video)
    {
        controler.title = @"相册-视频";
    }else if(mode==eAlbumEnumMode_photos)
    {
        controler.title = @"相册-照片";
    }
    
    UINavigationController *nav = [[BaseNavigationCtrler alloc] initWithNavigationBarClass:[Navigationbar class] toolbarClass:nil];
    nav.viewControllers = @[controler];
    [ctrler presentViewController:nav animated:YES completion:^(void) {}];
}
+(void)showAlbumNavViewCtrler:(UINavigationController*)ctrler andMode:(eAlbumEnumMode)mode andSigleSelect:(BOOL)sigleselect andDelegae:(id)delegate andCallback:(id)callback
{
    AlbumCtrler* controler = [[AlbumCtrler alloc]init];
    controler.delegate = delegate;
    controler.callback = callback;
    controler.mode = mode;
    controler.sigleselect = sigleselect;
    if (mode==eAlbumEnumMode_all)
    {
        controler.title = @"相册";
    }else if (mode==eAlbumEnumMode_video)
    {
        controler.title = @"相册-视频";
    }else if(mode==eAlbumEnumMode_photos)
    {
        controler.title = @"相册-照片";
    }
    [ctrler pushViewController:controler animated:YES];
}

- (void)viewDidLoad {
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.navigationController setNavigationBarHidden:NO];
    [super viewDidLoad];
    [self checkAlbumAuthor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIView*)installRightButton
{
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, NavItemWidth, NavItemHeight)];
    [label setFont:SystemFont(13)];
    [label setText:@"使用"];
    [label setTextAlignment:NSTextAlignmentRight];
    [label setTextColor:GLOBAL_COLOR(255, 255, 255)];
    [label setHidden:YES];
    self.rightButton = label;
    return label;
}
-(void)rightClick
{
    if (self.isloading)
    {
        return;
    }
    __block NSArray* assets = [self.albumView getSelectedAlAssets];
    if (assets==nil || assets.count<=0)
    {
        ALERT_MSG(@"请选择对象");
        return;
    }
    
    [Functions startActIndicatorWithView:self.view];
    self.isloading = YES;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        PHImageRequestOptions* options = [[PHImageRequestOptions alloc] init];
        options.deliveryMode = PHImageRequestOptionsDeliveryModeOpportunistic;
        options.synchronous = YES;
        
        PHVideoRequestOptions *optionsVideo = [[PHVideoRequestOptions alloc] init];
        options.deliveryMode = PHImageRequestOptionsDeliveryModeOpportunistic;
        options.synchronous = YES;
        
        __block NSMutableArray* items = [[NSMutableArray alloc]init];
        PHImageManager* manager = [PHImageManager defaultManager];
        for (PHAsset* asset in assets)
        {
            if (self.mode==eAlbumEnumMode_video)
            {
                dispatch_semaphore_t    semaphore = dispatch_semaphore_create(0);
                [manager requestAVAssetForVideo:asset options:optionsVideo resultHandler:^(AVAsset * _Nullable asset, AVAudioMix * _Nullable audioMix, NSDictionary * _Nullable info) {
                    if ([asset isKindOfClass:[AVURLAsset class]])
                    {
                        AVURLAsset *urlAsset = (AVURLAsset *)asset;
                        NSURL *url = urlAsset.URL;
                        [items addObject:url];
                    }else if([asset isKindOfClass:[AVComposition class]])
                    {
                        NSString* token = [info objectForKey:@"PHImageFileSandboxExtensionTokenKey"];
                        if (token)
                        {
                            NSString* str = [token componentsSeparatedByString:@";"].lastObject;
                            [items addObject:[NSURL URLWithString:str]];
                        }
                    }
                    dispatch_semaphore_signal(semaphore);
                }];
                dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            }else
            {
                [manager requestImageForAsset:asset
                                   targetSize:PHImageManagerMaximumSize
                                  contentMode:PHImageContentModeAspectFit
                                      options:options
                                resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info){
                                    [items addObject:result];
                                }];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.mode==eAlbumEnumMode_video)
            {
                if ([self.callback respondsToSelector:@selector(albumSelectedVideos:)])
                {
                    [self.callback albumSelectedVideos:items];
                }
            }else
            {
                if ([self.callback respondsToSelector:@selector(albumSelectedImages:)])
                {
                    [self.callback albumSelectedImages:items];
                }
            }
            self.isloading = NO;
            [Functions stopActIndicatorWithView:self.view];
            [super backClick];
        });
    });
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
-(void)backClick
{
    if (self.isloading)
    {
        return;
    }
    CGRect rtAlbum = self.albumView.frame;
    if (rtAlbum.origin.x<=0)
    {
        [self switchShowAlbum];
        self.selDirectory = nil;
    }else
    {
        [super backClick];
    }
}
-(void)initViews
{
    [self.view setBackgroundColor:GLOBAL_COLOR(23, 24, 39)];
    CGRect rect = self.view.bounds;
    CGRect rtDirectory = rect;
    [self initDirectoryViewWithRect:rtDirectory];
    
    CGRect rtAlbum = rect;
    rtAlbum.origin.x += rtAlbum.size.width;
    [self initAlbumViewWithRect:rtAlbum];
}
-(void)initAlbumViewWithRect:(CGRect)rect
{
    Param_AlbumView* param = [[Param_AlbumView alloc]init];
    if (rect.size.width>rect.size.height)
    {
        param.columns = 5;
    }else
    {
        param.columns = 3;
    }
    param.height = rect.size.width/param.columns;
    param.space = 0;
    param.sigleselect = self.sigleselect;
    param.mode = self.mode;
    self.albumView = [[AlbumView alloc]initWithFrame:rect andParam:param];
    [self.view addSubview:self.albumView];
}
-(void)initDirectoryViewWithRect:(CGRect)rect
{
    self.directoryView = [[AlbumDirectoryView alloc]initWithFrame:rect mode:self.mode];
    self.directoryView.delegate = self;
    [self.view addSubview:self.directoryView];
}
-(void)checkAlbumAuthor
{
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    switch (status)
    {
        case PHAuthorizationStatusNotDetermined:
        {
            NSLog(@"PHAuthorizationStatusNotDetermined");
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status){
                dispatch_async(dispatch_get_main_queue(), ^{
                    switch (status) {
                        case PHAuthorizationStatusAuthorized:
                        {
                            [self.directoryView anlyDirectorys];
                            break;
                        }
                        default:
                        {
                            [self backClick];
                            break;
                        }
                    }
                });
            }];
            break;
        }
        case PHAuthorizationStatusRestricted:
        case PHAuthorizationStatusDenied:
        {
            ALERT_MSG(@"请打开您的相册权限");
            [self backClick];
            break;
        }
        case PHAuthorizationStatusAuthorized:
        {
            [self.directoryView anlyDirectorys];
            break;
        }
        default:
        {
            NSLog(@"default");
            break;
        }
    }
}
-(void)selectDirectory:(PHDirectory*)directory
{
    self.selDirectory = directory;
    [self switchShowAlbum];
}
-(void)switchShowAlbum
{
    CGRect rtAlbum = self.albumView.frame;
    if (rtAlbum.origin.x>0)
    {
        [Animations moveLeft:self.albumView andAnimationDuration:0.3 andLength:rtAlbum.size.width completion:^(BOOL finished) {
            [self.rightButton setHidden:NO];
        }];
        [self.albumView reloadCellsWithCollection:self.selDirectory.collection assets:self.selDirectory.assets];
    }else
    {
        [Animations moveRight:self.albumView andAnimationDuration:0.3 andLength:rtAlbum.size.width completion:^(BOOL finished) {
            [self.albumView reloadCellsWithCollection:nil assets:nil];
        }];
        [self.rightButton setHidden:YES];
    }
}

@end

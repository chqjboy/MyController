
#import "AnimationsCtrler.h"

@interface AnimationsCtrler ()

@end

@implementation AnimationsCtrler

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backClick
{
    if (self.delegate!=nil &&
        [self.delegate respondsToSelector:@selector(backWithCtrler:)])
    {
        [self.delegate backWithCtrler:self];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)initViews
{
    CGRect rect = self.view.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    
    CGRect rtScroll = rect;
    [self initVScrollViewWithRect:rtScroll];
}
-(void)initVScrollViewWithRect:(CGRect)rect
{
    self.vscrollView = [[VScrollView alloc]initWithFrame:rect];
    [self.view addSubview:self.vscrollView];
    [self reloadContent];
}
-(void)reloadContent
{
    CGRect rect = self.vscrollView.frame;
    [self.vscrollView removeAllItems];
    [self initZoomWithRect:rect];
    [self initFadeWithRect:rect];
    [self initHMoveWithRect:rect];
    [self initVModeWithRect:rect];
    [self initRotateWithRect:rect];
    [self initShadowWithRect:rect];
    [self initHFlipWithRect:rect];
    [self initVCurlWithRect:rect];
    [self initCoreAnimationWithRect:rect];
    [self initGifShowWithRect:rect];
    [self.vscrollView reloadItems];
}
-(void)initZoomWithRect:(CGRect)rect
{
    self.zoom = [[AnimationsCell alloc]initWithFrame:rect andName:@"缩放动画Zoom"];
    self.zoom.delegate = self;
    [self.vscrollView addItemWithView:self.zoom];
}
-(void)initFadeWithRect:(CGRect)rect
{
    self.fade = [[AnimationsCell alloc]initWithFrame:rect andName:@"淡入淡出Fade"];
    self.fade.delegate = self;
    [self.vscrollView addItemWithView:self.fade];
}
-(void)initHMoveWithRect:(CGRect)rect
{
    self.hmove = [[AnimationsCell alloc]initWithFrame:rect andName:@"水平移动HMove"];
    self.hmove.delegate = self;
    [self.vscrollView addItemWithView:self.hmove];
}
-(void)initVModeWithRect:(CGRect)rect
{
    self.vmove = [[AnimationsCell alloc]initWithFrame:rect andName:@"垂直移动VMove"];
    self.vmove.delegate = self;
    [self.vscrollView addItemWithView:self.vmove];
}

-(void)initRotateWithRect:(CGRect)rect
{
    self.rotate = [[AnimationsCell alloc]initWithFrame:rect andName:@"旋转角度Rotate"];
    self.rotate.delegate = self;
    [self.vscrollView addItemWithView:self.rotate];
}
-(void)initShadowWithRect:(CGRect)rect
{
    self.shadow = [[AnimationsCell alloc]initWithFrame:rect andName:@"阴影展现Shadow"];
    self.shadow.delegate = self;
    [self.vscrollView addItemWithView:self.shadow];
}
-(void)initHFlipWithRect:(CGRect)rect
{
    self.hflip = [[AnimationsCell alloc]initWithFrame:rect andName:@"水平翻牌HFlip"];
    self.hflip.delegate = self;
    [self.vscrollView addItemWithView:self.hflip];
}
-(void)initVCurlWithRect:(CGRect)rect
{
    self.vcurl = [[AnimationsCell alloc]initWithFrame:rect andName:@"垂直翻页VCurl"];
    self.vcurl.delegate = self;
    [self.vscrollView addItemWithView:self.vcurl];
}
-(void)initCoreAnimationWithRect:(CGRect)rect
{
    self.coreAnimation = [[AnimationsCell alloc]initWithFrame:rect andName:@"CoreAnimations"];
    self.coreAnimation.delegate = self;
    [self.vscrollView addItemWithView:self.coreAnimation];
}
-(void)initGifShowWithRect:(CGRect)rect
{
    self.gifShow = [[AnimationsCell alloc]initWithFrame:rect andName:@"Gif图片播放"];
    self.gifShow.delegate = self;
    [self.vscrollView addItemWithView:self.gifShow];
}
-(void)cellClickWithView:(UIView*)view
{
    if (view==self.zoom)
    {
        if (self.zoomCtrler==nil)
        {
            self.zoomCtrler = [[ZoomCtrler alloc]init];
            self.zoomCtrler.delegate = self;
            self.zoomCtrler.title = @"缩放动画Zoom";
            [self.navigationController pushViewController:self.zoomCtrler animated:YES];
        }
    }else if(view==self.fade)
    {
        if (self.fadeCtrler==nil)
        {
            self.fadeCtrler = [[FadeCtrler alloc]init];
            self.fadeCtrler.delegate = self;
            self.fadeCtrler.title = @"淡入淡出Fade";
            [self.navigationController pushViewController:self.fadeCtrler animated:YES];
        }
    }else if(view==self.hmove)
    {
        if (self.hmoveCtrler==nil)
        {
            self.hmoveCtrler = [[HMoveCtrler alloc]init];
            self.hmoveCtrler.delegate = self;
            self.hmoveCtrler.title = @"水平移动HMove";
            [self.navigationController pushViewController:self.hmoveCtrler animated:YES];
        }
    }else if(view==self.vmove)
    {
        if (self.vmoveCtrler==nil)
        {
            self.vmoveCtrler = [[VMoveCtrler alloc]init];
            self.vmoveCtrler.delegate = self;
            self.vmoveCtrler.title = @"垂直移动HMove";
            [self.navigationController pushViewController:self.vmoveCtrler animated:YES];
        }
    }else if(view==self.rotate)
    {
        if (self.rotateCtrler==nil)
        {
            self.rotateCtrler = [[RotateCtrler alloc]init];
            self.rotateCtrler.delegate = self;
            self.rotateCtrler.title = @"旋转角度Rotate";
            [self.navigationController pushViewController:self.rotateCtrler animated:YES];
        }
    }else if(view==self.shadow)
    {
        if (self.shadowCtrler==nil)
        {
            self.shadowCtrler = [[ShadowCtrler alloc]init];
            self.shadowCtrler.delegate = self;
            self.shadowCtrler.title = @"阴影展现Shadow";
            [self.navigationController pushViewController:self.shadowCtrler animated:YES];
        }
    }else if(view==self.hflip)
    {
        if (self.hflipCtrler==nil)
        {
            self.hflipCtrler = [[HFlipCtrler alloc]init];
            self.hflipCtrler.delegate = self;
            self.hflipCtrler.title = @"水平翻牌HFlip";
            [self.navigationController pushViewController:self.hflipCtrler animated:YES];
        }
    }else if(view==self.vcurl)
    {
        if (self.vcurlCtrler==nil)
        {
            self.vcurlCtrler = [[VCurlCtrler alloc]init];
            self.vcurlCtrler.delegate = self;
            self.vcurlCtrler.title = @"垂直翻页VCurl";
            [self.navigationController pushViewController:self.vcurlCtrler animated:YES];
        }
    }else if(view==self.coreAnimation)
    {
        if (self.coreAnimationCtrler==nil)
        {
            self.coreAnimationCtrler = [[CoreAnimationCtrler alloc]init];
            self.coreAnimationCtrler.delegate = self;
            self.coreAnimationCtrler.title = @"CoreAnimations";
            [self.navigationController pushViewController:self.coreAnimationCtrler animated:YES];
        }
    }else if(view==self.gifShow)
    {
        if (self.gifShowCtrler==nil)
        {
            self.gifShowCtrler = [[GifShowCtrler alloc]init];
            self.gifShowCtrler.delegate = self;
            self.gifShowCtrler.title = @"Gif图片播放";
            [self.navigationController pushViewController:self.gifShowCtrler animated:YES];
        }
    }
}
-(void)backWithCtrler:(id)ctrler
{
    if (ctrler==self.zoomCtrler)
    {
        self.zoomCtrler=nil;
    }else if(ctrler==self.fadeCtrler)
    {
        self.fadeCtrler=nil;
    }else if(ctrler==self.hmoveCtrler)
    {
        self.hmoveCtrler=nil;
    }else if(ctrler==self.vmoveCtrler)
    {
        self.vmoveCtrler=nil;
    }else if(ctrler==self.rotateCtrler)
    {
        self.rotateCtrler=nil;
    }else if(ctrler==self.shadowCtrler)
    {
        self.shadowCtrler=nil;
    }else if(ctrler==self.hflipCtrler)
    {
        self.hflipCtrler=nil;
    }else if(ctrler==self.vcurlCtrler)
    {
        self.vcurlCtrler=nil;
    }else if(ctrler==self.coreAnimationCtrler)
    {
        self.coreAnimationCtrler=nil;
    }else if(ctrler==self.gifShowCtrler)
    {
        self.gifShowCtrler=nil;
    }
}
@end

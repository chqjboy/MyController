
#import "AVPlayerLayerCtrler.h"

@interface AVPlayerLayerCtrler ()

@end

@implementation AVPlayerLayerCtrler
- (void)viewDidLoad {
    self.ratevalue = 1.0;
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
    
    CGRect rtLayer = rect;
    rtLayer.size.height = 200;
    rtLayer.origin.x = (rect.size.width-rtLayer.size.width)/2;
    rtLayer.origin.y = (rect.size.height-rtLayer.size.height)/2;
    [self initLayerWithRect:rtLayer];
    
    CGRect rt3D = rect;
    rt3D.size.width = 60;
    rt3D.size.height = 30;
    rt3D.origin.x = 30;
    rt3D.origin.y = 30;
    [self init3DWithRect:rt3D];
    
    CGRect rtMirror = rt3D;
    rtMirror.origin.x = rt3D.origin.x+rt3D.size.width+5;
    [self initMirrorWithRect:rtMirror];
    
    CGRect rtRate = rtMirror;
    rtRate.origin.x = rtMirror.origin.x+rtMirror.size.width+5;
    [self initRateWithRect:rtRate];
}

-(void)initLayerWithRect:(CGRect)rect
{
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"vidio.mp4" withExtension:nil];
    //create player and player layer

    self.player = [AVPlayer playerWithURL:URL];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.backgroundColor = [UIColor blackColor].CGColor;
    //set player layer frame and attach it to our view
    playerLayer.frame = rect;
    //transform layer
    //add rounded corners and border
    playerLayer.masksToBounds = YES;
    playerLayer.cornerRadius = 20.0;
    playerLayer.borderColor = [UIColor redColor].CGColor;
    playerLayer.borderWidth = 5.0;
    [self.view.layer addSublayer:playerLayer];
    //play the video
    [self.player play];
    self.playerLayer = playerLayer;
}
-(void)init3DWithRect:(CGRect)rect
{
    self.trans3D = [[UIButton alloc]initWithFrame:rect];
    [self.trans3D setBackgroundColor:[UIColor grayColor]];
    [self.trans3D.titleLabel setFont:SystemFont(12)];
    [self.trans3D setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.trans3D setTitle:@"3D变换" forState:UIControlStateNormal];
    [self.trans3D addTarget:self action:@selector(transFor3D) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.trans3D];
}
-(void)initMirrorWithRect:(CGRect)rect
{
    self.transMirror = [[UIButton alloc]initWithFrame:rect];
    [self.transMirror setBackgroundColor:[UIColor grayColor]];
    [self.transMirror.titleLabel setFont:SystemFont(12)];
    [self.transMirror setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.transMirror setTitle:@"镜像变换" forState:UIControlStateNormal];
    [self.transMirror addTarget:self action:@selector(transForMirror) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.transMirror];
}

-(void)initRateWithRect:(CGRect)rect
{
    self.rate = [[UIButton alloc]initWithFrame:rect];
    [self.rate setBackgroundColor:[UIColor grayColor]];
    [self.rate.titleLabel setFont:SystemFont(12)];
    [self.rate setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.rate setTitle:@"1.0X" forState:UIControlStateNormal];
    [self.rate addTarget:self action:@selector(rateClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.rate];
}

-(void)transFor3D
{
    
    CATransform3D transform = CATransform3DIdentity;
    //transform.m34 = -1.0 / 500.0;
    transform = CATransform3DRotate(transform, M_PI_4, 1, 1, 0);
    self.playerLayer.transform = transform;
}
-(void)transForMirror
{
    CATransform3D transform = CATransform3DIdentity;
    if (CATransform3DEqualToTransform(transform, self.playerLayer.transform))
    {
        transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    }
    self.playerLayer.transform = transform;
}
-(void)rateClick
{
    CGFloat rate = self.ratevalue;
    if (rate==1)
    {
        [self.player setRate:0.8];
        self.ratevalue = 0.8;
    }else if (rate == 0.8)
    {
        [self.player setRate:0.67];
        self.ratevalue = 0.6;
    }else if (rate == 0.6)
    {
        [self.player setRate:0.5];
        self.ratevalue = 0.4;
    }else
    {
        [self.player setRate:1.0];
        self.ratevalue = 1.0;
    }
    [self.rate setTitle:[NSString stringWithFormat:@"%0.1fX", self.ratevalue] forState:UIControlStateNormal];
}
@end

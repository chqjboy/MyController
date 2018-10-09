//
//  Animations.m
//  test
//
//  Created by Pulkit Kathuria on 10/8/12.
//  Copyright (c) 2012 Pulkit Kathuria. All rights reserved.
//

#import "Animations.h"

#define degreesToRadians(x)(M_PI*x/180.0)

@implementation Animations


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


+ (void)zoomIn: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait{
    __block BOOL done = wait; //wait =  YES wait to finish animation
    view.transform = CGAffineTransformMakeScale(0, 0);
    [UIView animateWithDuration:duration animations:^{
        view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        done = NO;
    }];
    // wait for animation to finish
    while (done == YES)
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
}

+ (void)zoomIn: (UIView *)view andAnimationDuration: (float) duration completion:(void (^)(BOOL finished))completion
{
    view.transform = CGAffineTransformMakeScale(0, 0);
    [UIView animateWithDuration:duration animations:^{
        view.transform = CGAffineTransformIdentity;
    } completion:completion];
}

+ (void)zoom:(UIView *)view andDuration: (float) duration andScale:(CGFloat)scale andWait:(BOOL) wait
{
    __block BOOL done = wait; //wait =  YES wait to finish animation
    [UIView animateWithDuration:duration animations:^{
        view.transform = CGAffineTransformScale(view.transform, scale, scale);
    } completion:^(BOOL finished) {
        done = NO;
    }];
    // wait for animation to finish
    while (done == YES)
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
}

+ (void)zoom:(UIView *)view andDuration: (float) duration andScale:(CGFloat)scale completion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:duration animations:^{
        view.transform = CGAffineTransformScale(view.transform, scale, scale);
    } completion:completion];
}

+ (void)buttonPressAnimate: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait{
    //Usually Changes the position
    __block BOOL done = wait; //wait =  YES wait to finish animation
    [UIView animateWithDuration:duration animations:^{
        view.transform = CGAffineTransformMakeScale(1.05, 1.05);
        view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        done = NO;
    }];
    // wait for animation to finish
    while (done == YES)
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
}

+ (void)fadeIn: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait{
    __block BOOL done = wait; //wait =  YES wait to finish animation
    [view setAlpha:0.0];
    [UIView animateWithDuration:duration animations:^{
        [view setAlpha:1.0];
    } completion:^(BOOL finished) {
        done = NO;
    }];
    // wait for animation to finish
    while (done == YES)
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
}
+ (void)fadeOut: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait{
    __block BOOL done = wait; //wait =  YES wait to finish animation
    [view setAlpha:1.0];
    [UIView animateWithDuration:duration animations:^{
        [view setAlpha:0.0];
    } completion:^(BOOL finished) {
        done = NO;
    }];
    // wait for animation to finish
    while (done == YES)
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
}
+ (void)fade: (UIView *)view andAnimationDuration: (float) duration andAlphaBegin:(CGFloat)beginAlpha andEndAlpha:(CGFloat)endAlpha completion:(void (^)(BOOL finished))completion
{
    [view setAlpha:beginAlpha];
    [UIView animateWithDuration:duration animations:^{
        [view setAlpha:endAlpha];
    } completion:completion];
}
+ (void) moveLeft: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait andLength:(float) length{
    __block BOOL done = wait; //wait =  YES wait to finish animation
    [UIView animateWithDuration:duration animations:^{
        view.center = CGPointMake(view.center.x - length, view.center.y);
        
    } completion:^(BOOL finished) {
        done = NO;
    }];
    // wait for animation to finish
    while (done == YES)
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
}

+ (void) moveLeft: (UIView *)view andAnimationDuration: (float) duration andLength:(float) length completion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:duration animations:^{
        view.center = CGPointMake(view.center.x - length, view.center.y);
        
    } completion:completion];
    // wait for animation to finish
}

+ (void) moveRight: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait andLength:(float) length{
    __block BOOL done = wait; //wait =  YES wait to finish animation
    [UIView animateWithDuration:duration animations:^{
        view.center = CGPointMake(view.center.x + length, view.center.y);
        
    } completion:^(BOOL finished) {
        done = NO;
    }];
    // wait for animation to finish
    while (done == YES)
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
}

+ (void) moveRight: (UIView *)view andAnimationDuration: (float) duration andLength:(float) length completion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:duration animations:^{
        view.center = CGPointMake(view.center.x + length, view.center.y);
        
    } completion:completion];
}

+ (void) moveUp: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait andLength:(float) length{
    __block BOOL done = wait; //wait =  YES wait to finish animation
    [UIView animateWithDuration:duration animations:^{
        view.center = CGPointMake(view.center.x, view.center.y-length);

    } completion:^(BOOL finished) {
        done = NO;
    }];
    // wait for animation to finish
    while (done == YES)
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
}

+ (void) moveUp: (UIView *)view andAnimationDuration: (float) duration andLength:(float) length completion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:duration animations:^{
        view.center = CGPointMake(view.center.x, view.center.y-length);
        
    } completion:completion];
}

+ (void) moveDown: (UIView *)view andAnimationDuration: (float) duration andLength:(float) length completion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:duration animations:^{
        view.center = CGPointMake(view.center.x, view.center.y+length);
        
    } completion:completion];
}

+ (void) moveDown: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait andLength:(float) length{
    __block BOOL done = wait; //wait =  YES wait to finish animation
    [UIView animateWithDuration:duration animations:^{
        view.center = CGPointMake(view.center.x, view.center.y + length);
        
    } completion:^(BOOL finished) {
        done = NO;
    }];
    // wait for animation to finish
    while (done == YES)
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
}

+ (void) rotate: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait andAngle:(int) angle{
    __block BOOL done = wait; //wait =  YES wait to finish animation
    [UIView animateWithDuration:duration animations:^{
        view.transform = CGAffineTransformMakeRotation(degreesToRadians(angle));
    } completion:^(BOOL finished) {
        done = NO;
    }];
    // wait for animation to finish
    while (done == YES)
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
}

+ (void) rotate: (UIView *)view andAnimationDuration: (float) duration andAngle:(int) angle completion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:duration animations:^{
        view.transform = CGAffineTransformMakeRotation(degreesToRadians(angle));
    } completion:completion];
}

+(void)hflip:(UIView*)view andDuration:(float)duration andIsRignt:(BOOL)isright completion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:duration animations:^{
        if (isright)
        {
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:view cache:YES];
        }else
        {
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:view cache:YES];
        }
    } completion:completion];
}

+(void)vcurl:(UIView*)view andDuration:(float)duration andIsUp:(BOOL)isup completion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:duration animations:^{
        if (isup)
        {
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:view cache:NO];
        }else
        {
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:view cache:NO];
        }
    } completion:completion];
}

+ (void) frameAndShadow: (UIView *) view
//Shadow is all Over with a white frame
{
    CALayer *layer = view.layer;
    [layer setBorderColor: [[UIColor whiteColor] CGColor]]; //Frame Color
    [layer setBorderWidth:5.0f]; //Frame Border
    [layer setShadowColor: [[UIColor blackColor] CGColor]]; //Shadow Color
    [layer setShadowOpacity:0.80f];
    [layer setShadowOffset: CGSizeMake(1, 3)];
    [layer setShadowRadius:5.0];
    [view setClipsToBounds:NO];
}


+ (void) background: (UIView *) view andImageFileName: (NSString *) filename{
    //Sets the background for a UIView full filename with extension as parameter
    UIGraphicsBeginImageContext(view.frame.size);
    [[UIImage imageNamed:filename] drawInRect:view.bounds];
    UIImage *bubbleImage = UIGraphicsGetImageFromCurrentImageContext();
    view.backgroundColor = [UIColor colorWithPatternImage:bubbleImage];
}

+ (void) roundedCorners: (UIView *) view{
    view.layer.cornerRadius = 5;
    view.layer.masksToBounds = YES;
}



+ (void) shadowOnView: (UIView *) view andShadowType: (NSString *) shadowType{
    CGSize size = view.bounds.size;
    if ([shadowType isEqualToString: @"NoShadow"]){
        view.layer.shadowColor = [UIColor clearColor].CGColor;
    }
    else{
        view.layer.shadowColor = [UIColor yellowColor].CGColor;
    }

    view.layer.shadowOpacity = 0.7f;
    view.layer.shadowOffset = CGSizeMake(10.0f, 10.0f);
    view.layer.shadowRadius = 5.0f;
    view.layer.masksToBounds = NO;
 
    if ([shadowType isEqualToString: @"Trapezoidal"]){
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(size.width * 0.33f, size.height * 0.66f)];
        [path addLineToPoint:CGPointMake(size.width * 0.66f, size.height * 0.66f)];
        [path addLineToPoint:CGPointMake(size.width * 1.15f, size.height * 1.15f)];
        [path addLineToPoint:CGPointMake(size.width * -0.15f, size.height * 1.15f)];
        view.layer.shadowPath = path.CGPath;
        
    }
    else if ([shadowType isEqualToString: @"Elliptical"]){
        CGRect ovalRect = CGRectMake(0.0f, size.height + 5, size.width - 10, 15);
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:ovalRect];
        view.layer.shadowPath = path.CGPath;
    }
    //Curl is not working !!
    else if ([shadowType isEqualToString: @"Curl"]){
        CGFloat offset = 10.0;
        CGFloat curve = 5.0;
        UIBezierPath *path = [UIBezierPath bezierPath];
        
        CGRect rect = view.bounds;
        CGPoint topLeft		 = rect.origin;
        CGPoint bottomLeft	 = CGPointMake(0.0, CGRectGetHeight(rect)+offset);
        CGPoint bottomMiddle = CGPointMake(CGRectGetWidth(rect)/2, CGRectGetHeight(rect)-curve);
        CGPoint bottomRight	 = CGPointMake(CGRectGetWidth(rect), CGRectGetHeight(rect)+offset);
        CGPoint topRight	 = CGPointMake(CGRectGetWidth(rect), 0.0);
            
        [path moveToPoint:topLeft];
        [path addLineToPoint:bottomLeft];
        [path addQuadCurveToPoint:bottomRight
                         controlPoint:bottomMiddle];
        [path addLineToPoint:topRight];
        [path addLineToPoint:topLeft];
        [path closePath];
        view.layer.borderColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
        view.layer.borderWidth = 5.0;
        view.layer.shadowOffset = CGSizeMake(0, 3);
        view.layer.shadowOpacity = 0.7;
        view.layer.shouldRasterize = YES;
        view.layer.shadowPath = path.CGPath;
            
    }
        
}

+ (void) shadowOnLayer: (CALayer *) layer andShadowType: (NSString *) shadowType{
    CGSize size = layer.bounds.size;
    if ([shadowType isEqualToString: @"NoShadow"]){
        layer.shadowColor = [UIColor clearColor].CGColor;
    }
    else{
        layer.shadowColor = [UIColor blackColor].CGColor;
    }
    
    layer.shadowOpacity = 0.7f;
    layer.shadowOffset = CGSizeMake(10.0f, 10.0f);
    layer.shadowRadius = 5.0f;
    layer.masksToBounds = NO;
    
    if ([shadowType isEqualToString: @"Trapezoidal"]){
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(size.width * 0.33f, size.height * 0.66f)];
        [path addLineToPoint:CGPointMake(size.width * 0.66f, size.height * 0.66f)];
        [path addLineToPoint:CGPointMake(size.width * 1.15f, size.height * 1.15f)];
        [path addLineToPoint:CGPointMake(size.width * -0.15f, size.height * 1.15f)];
        layer.shadowPath = path.CGPath;
        
    }
    else if ([shadowType isEqualToString: @"Elliptical"]){
        CGRect ovalRect = CGRectMake(0.0f, size.height + 5, size.width - 10, 15);
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:ovalRect];
        layer.shadowPath = path.CGPath;
    }
    //Curl is not working !!
    else if ([shadowType isEqualToString: @"Curl"]){
        CGFloat offset = 10.0;
        CGFloat curve = 5.0;
        UIBezierPath *path = [UIBezierPath bezierPath];
        
        CGRect rect = layer.bounds;
        CGPoint topLeft		 = rect.origin;
        CGPoint bottomLeft	 = CGPointMake(0.0, CGRectGetHeight(rect)+offset);
        CGPoint bottomMiddle = CGPointMake(CGRectGetWidth(rect)/2, CGRectGetHeight(rect)-curve);
        CGPoint bottomRight	 = CGPointMake(CGRectGetWidth(rect), CGRectGetHeight(rect)+offset);
        CGPoint topRight	 = CGPointMake(CGRectGetWidth(rect), 0.0);
        
        [path moveToPoint:topLeft];
        [path addLineToPoint:bottomLeft];
        [path addQuadCurveToPoint:bottomRight
                     controlPoint:bottomMiddle];
        [path addLineToPoint:topRight];
        [path addLineToPoint:topLeft];
        [path closePath];
        layer.borderColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
        layer.borderWidth = 5.0;
        layer.shadowOffset = CGSizeMake(0, 3);
        layer.shadowOpacity = 0.7;
        layer.shouldRasterize = YES;
        layer.shadowPath = path.CGPath;
        
    }
    
}

+(void)transitionWithType:(NSString *)type WithSubtype:(NSString *)subtype ForView:(UIView *)view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    //设置运动时间
    animation.duration = 0.5;
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        //设置子类
        animation.subtype = subtype;
    }
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [view.layer addAnimation:animation forKey:@"animation"];
}
    
@end

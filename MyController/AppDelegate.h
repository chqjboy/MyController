//
//  AppDelegate.h
//  MyController
//
//  Created by 陈前进 on 16/3/23.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewCtrler.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController* navCtrler;
@property (strong, nonatomic) UIViewController* viewCtrler;

-(void)initRootViewCtrler;
@end

@interface Data : NSObject
@property(nonatomic, retain) NSString* key;
+(Data*)instanceWithData:(id)data;
-(NSDictionary*)getJsonDictionary;
-(Class)getArrayAnlyClassForKey:(NSString*)key;
@end

@interface OneData : Data
@property(nonatomic, retain) NSString* one;
@end

@interface TwoData : Data
@property(nonatomic, retain) NSString* two;
@property(nonatomic, retain) OneData* oneData;
@property(nonatomic, retain) NSString* pick;
@property(nonatomic, retain) NSMutableArray<OneData*>* ones;
@end
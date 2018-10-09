//
//  AppDelegate.m
//  MyController
//
//  Created by 陈前进 on 16/3/23.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "AppDelegate.h"
#import <objc/runtime.h>
#import "Navigationbar.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSDictionary* dic = @{@"key":@"123",
                          @"two":@"231",
                          @"ones":@[@{
                                        @"one":@"999"},
                                    @{
                                        @"one":@"888"}],
                          @"oneData":@{@"one":@"879"}};
    TwoData* data = (TwoData*)[TwoData instanceWithData:dic];
    NSDictionary* mdic = [data getJsonDictionary];
    
    // Override point for customization after application launch.
    for (NSString* familyName in [UIFont familyNames])
    {
        //        NSLog(@"Font FamilyName=%@", familyName);
        for (NSString* fontName in [UIFont fontNamesForFamilyName:familyName])
        {
            NSLog(@"Font:\t%@", fontName);
        }
    }
    
    [self initRootViewCtrler];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)initRootViewCtrler
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    RootViewCtrler* rootViewCtrler = [[RootViewCtrler alloc]init];
    self.navCtrler = [[UINavigationController alloc]initWithNavigationBarClass:[Navigationbar class] toolbarClass:nil];
    [self.navCtrler pushViewController:rootViewCtrler animated:YES];
    [self.window setRootViewController:self.navCtrler];
    [self.window addSubview:self.navCtrler.view];
    [self.window makeKeyAndVisible];
}
@end

@implementation Data
+(Data*)instanceWithData:(id)data
{
    if (data==nil || ![data isKindOfClass:[NSDictionary class]])
    {
        return nil;
    }
    Data* instance = [[[self class] alloc]init];
    [instance setValuesForKeysWithDictionary:data];
    return instance;
}
-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([value isKindOfClass:[NSDictionary class]])
    {
        Class cls = [self getClassFromVarName:key];
        if ([cls isSubclassOfClass:[Data class]])
        {
            value = [cls performSelector:@selector(instanceWithData:) withObject:value];
        }
    }else if ([value isKindOfClass:[NSDictionary class]])
    {
        Class cls = [self getClassFromVarName:key];
        if ([cls isSubclassOfClass:[Data class]])
        {
            value = [cls performSelector:@selector(instanceWithData:) withObject:value];
        }
    }else if ([value isKindOfClass:[NSArray class]])
    {
        NSArray* array = value;
        NSMutableArray* mArray = [[NSMutableArray alloc]init];
        Class cls = [self getArrayAnlyClassForKey:key];
        if ([cls isSubclassOfClass:[Data class]])
        {
            for (NSDictionary* dic in array)
            {
                id item = [cls performSelector:@selector(instanceWithData:) withObject:dic];
                [mArray addObject:item];
            }
        }
        value = mArray;
    }
    [super setValue:value forKey:key];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"])
    {
        self.key = value;
    }
    [super setValue:value forKey:key];
    
}
-(Class)getArrayAnlyClassForKey:(NSString*)key
{
    return [NSObject class];
}
-(Class)getClassFromVarName:(NSString*)name
{
    unsigned int numIvars; //成员变量个数
    Ivar *vars = class_copyIvarList([self class], &numIvars);
    //Ivar *vars = class_copyIvarList([UIView class], &numIvars);
    
    NSString *key=nil;
    for(int i = 0; i < numIvars; i++)
    {
        
        Ivar thisIvar = vars[i];
        key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];  //获取成员变量的名字
        if ([key rangeOfString:name].location!=NSNotFound)
        {
            free(vars);
            NSString* clsname = [NSString stringWithUTF8String:ivar_getTypeEncoding(thisIvar)];
            clsname = [clsname substringWithRange:NSMakeRange(2, clsname.length-3)];
            return objc_getClass(clsname.UTF8String);
        }
    }
    free(vars);
    return nil;
}

+(void)getPropertyNames:(NSMutableArray*)names
{
    if (names==nil)
    {
        return;
    }
    unsigned int outCount = 0;
    //获取属性数组
    objc_property_t *propertyList = class_copyPropertyList([self class], &outCount);
    //遍历数组
    for (int i = 0; i < outCount; ++i)
    {
        objc_property_t property = propertyList[i];
        //获取属性名
        const char *cName = property_getName(property);
        NSString *propertyName = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [names addObject:propertyName];
    }
    //在使用了c函数的creat, copy等函数是记得手动释放,要不然会引起内存泄露问题
    free(propertyList);
    if ([self class]==[Data class])
    {
        return;
    }
    if ([self respondsToSelector:@selector(getPropertyNames:)])
    {
        [[self superclass] performSelector:@selector(getPropertyNames:) withObject:names];
    }
}

-(NSDictionary*)getJsonDictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSMutableArray* array = [[NSMutableArray alloc]init];
    [[self class] getPropertyNames:array];
    
    for(NSString* propName in array)
    {
        id value = [self valueForKey:propName];
        
        if ([value isKindOfClass:[Data class]])
        {
            value = [value performSelector:@selector(getJsonDictionary) withObject:value];
        }else if([value isKindOfClass:[NSArray class]])
        {
            NSArray* array = value;
            NSMutableArray* mArray = [[NSMutableArray alloc]init];
            for (id item in array)
            {
                if ([item isKindOfClass:[Data class]])
                {
                    NSDictionary* itemDic = [item performSelector:@selector(getJsonDictionary) withObject:value];
                    if (itemDic!=nil)
                    {
                        [mArray addObject:itemDic];
                    }
                }
            }
            value = mArray;
        }
        if(value != nil)
        {
            [dic setObject:value forKey:propName];
        }
        
    }
    
    return dic;
}
@end

@implementation OneData

@end

@implementation TwoData
-(Class)getArrayAnlyClassForKey:(NSString*)key
{
    if ([key isEqualToString:@"ones"])
    {
        return [OneData class];
    }
    return [NSObject class];
}
@end


#import "Device.h"
#import "sys/utsname.h"
@implementation Device

+(CGFloat)getScreenHeight
{
    return [[UIApplication sharedApplication] keyWindow].frame.size.height;
}
+(CGFloat)getScreenWidth
{
    return [[UIApplication sharedApplication] keyWindow].frame.size.width;
}
+(CGFloat)getHScale
{
    return [Device getScreenWidth]/320;
    
}
+(CGFloat)getVScale
{
    return [Device getScreenHeight]/480;
}
+(NSString*)stringByDevice
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone4(GSM)";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"iPhone4(3.2)";
    if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone4(CDMA)";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone5C";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone5C";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone5S";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone5S";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone6";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone6Plus";
    if ([deviceString isEqualToString:@"iPhone10,3"])    return @"iPhoneX";
    NSLog(@"NOTE: Unknown device type: %@", deviceString);
    return deviceString;
}
@end

//
//  FZTools.m
//  lichebao-Enterprise
//
//  Created by xiehewanbang on 2018/5/23.
//  Copyright © 2018年 1. All rights reserved.
//

#import "FZTools.h"

#import "UIViewExt.h"

@implementation FZTools




+(UIView *)returnLineWith_OneDixAndColor:(UIColor *)color
{
    UIView *tempView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, 0.5)];
    tempView.backgroundColor = color;
    return tempView;
}

+(UIView *)returnLineWith_OneDixAndColor:(UIColor *)color andLeftDistance:(CGFloat)leftDistance
{
    UIView *mTempView = [FZTools returnLineWith_OneDixAndColor:color];
    mTempView.left = leftDistance;
    mTempView.backgroundColor = color;
    mTempView.width = K_SCREEN_WIDTH-leftDistance;
    
    UIView *tempViewBack = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, 0.5)];
    tempViewBack.backgroundColor = [UIColor clearColor];
    [tempViewBack addSubview:mTempView];
    return tempViewBack;
}

+(UIView *)returnLineSeperatorAndColor:(UIColor *)color andHeight:(CGFloat)height
{
    UIView *tempView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, height)];
    tempView.backgroundColor = color;
    return tempView;
}

+(long long )getCurrentTime
{
    NSDate *date= [NSDate date];
    NSString *currentTime = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    double tempTimestampval =  [currentTime doubleValue];
    long long  timestampval  = (long long)tempTimestampval;
    return timestampval;
}

+(NSString* )getCurrentStringTime
{
    NSDate *date= [NSDate date];
    NSString *currentTime = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    double tempTimestampval =  [currentTime doubleValue];
    long long  timestampval  = (long long)tempTimestampval;
    NSString *tempString = [NSString stringWithFormat:@"%lld",timestampval];
    return tempString;
    }



+(BOOL)isLeapYear:(NSString *)year
{
    if(year.length ==0){
        return NO;
    }
    NSInteger  tempYear  = [year integerValue];
    if(((tempYear % 4 )==0)&& ((tempYear %100)!=0 ))
    {
        return  year;
    }
    if(tempYear%400==0){
        return  YES;
    }
    
    return NO;
}

+(NSString *)getStamptimeWithFormatTime:(NSString *)formatTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    //时间转时间戳的方法:
    long long timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] longLongValue];
    return  [NSString stringWithFormat:@"%lld",timeSp*1000];
    
}

+(NSString *)getFormateTimeWithFormatStampTime:(NSString *)stampTime
{
    NSDateFormatter *format1=[[NSDateFormatter alloc] init];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:stampTime.longLongValue];
    [format1 setDateFormat:@"yyyy-MM-dd"];
    NSString *tempFormate =[format1 stringFromDate:date];
    return tempFormate;
}



+ (UIColor *)colorWithHexString:(NSString *)hexString_
{
    NSString *cString = [[hexString_ stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 - 8 characters
    if ([cString length] < 6) return nil;
    
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"0x"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    
    if ([cString length] != 6) return nil;
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}




@end

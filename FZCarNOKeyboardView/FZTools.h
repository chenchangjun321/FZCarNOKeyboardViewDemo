//
//  FZTools.h
//  lichebao-Enterprise
//
//  Created by xiehewanbang on 2018/5/23.
//  Copyright © 2018年 1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define K_SCREEN_WIDTH                  ([[[UIDevice currentDevice] systemVersion] intValue] >= 7 ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].applicationFrame.size.width)
#define K_SCREEN_HEIGHT                 ([[[UIDevice currentDevice] systemVersion] intValue] >= 7 ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].applicationFrame.size.height)

#define IS_IPHONE_X (K_SCREEN_HEIGHT == 812.0f) ? YES : NO              //苹果x
#define Height_NavBar           44.0f                                                                         //导航条的高度
#define Height_StatusBar  ((IS_IPHONE_X==YES)?44.0f: 20.0f)                 //状态条高度
#define Height_TabBar    ((IS_IPHONE_X==YES)?83.0f: 49.0f)                     //tabbar 高度

#define  FZ_PLACE_HOLDER_IMAGE  [UIImage imageNamed:@"占位图"]


/**
 //文字颜色
 */
#define FZ_COMMON_TEXT_COLOR   HEXTOCOLOR(0x484848)

/**
 //页面的背景色
 */
#define FZ_COMMON_BACK_COLOR  HEXTOCOLOR(0xf6f6f6)

/**
 方法说明：  16进制颜色，字符串，可以已# ，0x，0X 开头，没有前缀也可以
 */
#define HEXCOLORSTRING(string)          [FZTools colorWithHexString:(string)]


/**
 @brief 屏幕适配的宏定义
 */
#define AUTOSIZEIPHONE6(i)                 (((([UIScreen mainScreen].bounds).size.width*2) / 750) *(i)) //根据屏幕宽度调整尺寸(以iPhone6尺寸为基准 750)

//字体
#define  K_FONT(size)                     [UIFont systemFontOfSize:floorf(AUTOSIZEIPHONE6(size))]
#define  K_FONT_BOLD(size)         [UIFont boldSystemFontOfSize:floorf(AUTOSIZEIPHONE6(size))]

//手机类型
typedef NS_OPTIONS(NSUInteger, IPhoneSceenType) {
    IPhoneSceenType_4s                                                                    =1,        //4s 或者4
    IPhoneSceenType_5s                                                                 =2,         //5或者5
    IPhoneSceenType_6s                                                                  =3,        //6s或者6或者7或者8
    IPhoneSceenType_6Plus                                                           =4,        //6Plus或者7Plus或者8Plus
    IPhoneSceenType_IponeX                                                         =5,        //苹果X
};



@interface FZTools : NSObject








/**
 @brief 一条细线
 */
+(UIView *)returnLineWith_OneDixAndColor:(UIColor *)color;

/**
 @brief 左边带边距,细线
 */
+(UIView *)returnLineWith_OneDixAndColor:(UIColor *)color andLeftDistance:(CGFloat)leftDistance;

/**
 @brief 返回一个分割带
 */
+(UIView *)returnLineSeperatorAndColor:(UIColor *)color andHeight:(CGFloat)height;




/**
 方法说明：    展示登录页面
 @param  tempVc  ： 当前的Controller
 @param  isShowBackButton  ： 是否显示返回按钮
 */
+(void)showLoginVCWithVC:(UIViewController *)tempVc andIsShowBackButton:(BOOL)isShowBackButton;

/**
 方法说明：    是否是闰年
 */
+(BOOL)isLeapYear:(NSString *)year;

/**
 @brief 获取当前时间戳,返回longlong
 */
+(long long )getCurrentTime;

/**
 @brief 获取当前时间戳,返回String
 */
+(NSString* )getCurrentStringTime;


/**
 方法说明：   如（2018-09-01）时间转换成10位时间戳
 */
+(NSString *)getStamptimeWithFormatTime:(NSString *)formatTime;

/**
 方法说明：   10位时间戳根据时间转换成格式时间( 如 2018-09-01）
 */
+(NSString *)getFormateTimeWithFormatStampTime:(NSString *)stampTime;


/**
 方法说明：  获取一个对象的所有属性，和属性值
 */
+ (NSDictionary *)properties_apsWith:(NSObject*)tempObject;

/**
 方法说明：  16进制颜色，字符串，可以已# ，0x，0X 开头，不要前缀也行
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString_;



/**
 方法说明： NavigationController，去掉一个Controller
 @param  tempVCString  ： VC 的字符串
 @param  naviVC  ： 导航控制器
 */
+(void)removeVCString:(NSString *)tempVCString and:(UINavigationController *)naviVC;



@end

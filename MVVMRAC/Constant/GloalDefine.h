//
//  GloalDefine.h
//  MVVMRAC
//
//  Created by zhangguangpeng on 2018/6/27.
//  Copyright © 2018年 zhangguangpeng. All rights reserved.
//

#ifndef UtilsDefine_h
#define UtilsDefine_h

#pragma mark - 基础颜色

#define THEMECOLOR  Color(60, 77, 180, 1)
//颜色
/**
 *  直接填写小数
 */
#define DecimalColor(r, g, b, a)    [UIColor colorWithRed:r green:g blue:b alpha:a]

/**
 *  直接填写整数
 */
#define Color(r, g, b, a)    [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:a]

#pragma mark - 设备信息

#define SCREEN_WIDTH                ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT               ([UIScreen mainScreen].bounds.size.height)

#define NAV_WIDTH                   SCREEN_WIDTH
#define NAV_HEIGHT                  (44)

#define TAB_BAR_WIDTH               SCREEN_WIDTH
#define TAB_BAR_HEIGHT              (48)

#define STATUS_BAR_HEIGHT           (20)


#pragma mark - 版本检查

// 版本检查
#define IOS11_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"11.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS10_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"10.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS9_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"9.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS8_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS7_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS6_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"6.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS5_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"5.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS4_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"4.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS3_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"3.0" options:NSNumericSearch] != NSOrderedAscending )

#endif /* FKUtilsDefine_h */


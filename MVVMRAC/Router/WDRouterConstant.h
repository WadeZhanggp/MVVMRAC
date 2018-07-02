//
//  WDRouterConstant.h
//  MVVMRAC
//
//  Created by zhangguangpeng on 2018/6/27.
//  Copyright © 2018年 zhangguangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

// 路由默认控制器参数名
FOUNDATION_EXTERN NSString *const WDControllerNameRouteParam;

#pragma mark - 路由模式 Schema
/**
 模式 Native：AppSchema://url/:param
 */

// 默认路由
FOUNDATION_EXTERN NSString *const WDDefaultRouteSchema;
// 网络跳转路由模式
FOUNDATION_EXTERN NSString *const WDHTTPRouteSchema;
FOUNDATION_EXTERN NSString *const WDHTTPsRouteSchema;
// WEB交互路由跳转模式
FOUNDATION_EXTERN NSString *const WDWebHandlerRouteSchema;
// 回调通信
FOUNDATION_EXTERN NSString *const WDComponentsCallBackHandlerRouteSchema;
// 未知路由
FOUNDATION_EXTERN NSString *const WDUnknownHandlerRouteSchema;


#pragma mark - 路由表

// 导航栏 Push
FOUNDATION_EXTERN NSString *const WDNavPushRoute;

// 导航栏 Present
FOUNDATION_EXTERN NSString *const WDNavPresentRoute;

// StoryBoard Push
FOUNDATION_EXTERN NSString *const WDNavStoryBoardPushRoute;

// 组件通信回调
FOUNDATION_EXTERN NSString *const WDComponentsCallBackRoute;

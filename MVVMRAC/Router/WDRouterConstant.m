//
//  WDRouterConstant.m
//  MVVMRAC
//
//  Created by zhangguangpeng on 2018/6/27.
//  Copyright © 2018年 zhangguangpeng. All rights reserved.
//

#import "WDRouterConstant.h"


NSString *const WDControllerNameRouteParam = @"viewController";

#pragma mark - 路由模式

NSString *const WDDefaultRouteSchema = @"MVVMRAC";
NSString *const WDHTTPRouteSchema = @"http";
NSString *const WDHTTPsRouteSchema = @"https";
// ----
NSString *const WDComponentsCallBackHandlerRouteSchema = @"AppCallBack";
NSString *const WDWebHandlerRouteSchema = @"yinzhi";
NSString *const WDUnknownHandlerRouteSchema = @"UnKnown";

#pragma mark - 路由表

NSString *const WDNavPushRoute = @"/com_madao_navPush/:viewController";
NSString *const WDNavPresentRoute = @"/com_madao_navPresent/:viewController";
NSString *const WDNavStoryBoardPushRoute = @"/com_madao_navStoryboardPush/:viewController";
NSString *const WDComponentsCallBackRoute = @"/com_madao_callBack/*";

//
//  AppDelegate.m
//  MVVMRAC
//
//  Created by zhangguangpeng on 2018/6/26.
//  Copyright © 2018年 zhangguangpeng. All rights reserved.
//

#import "AppDelegate.h"
#import "GloalDefine.h"
#import <JLRoutes.h>
#import "WDRouterConstant.h"
#import "UIViewController+NonBase.h"
#import "WDLoginViewController.h"
#import "TestViewController.h"


@interface AppDelegate ()

- (void)configSVProgressHUD;
- (void)configScrollViewAdapt4IOS11;
- (void)configNetworkApiEnv;
- (void)registerNavgationRouter;
- (void)registerSchemaRouter;

/**
 登录控制器
 */
@property (nonatomic, strong) WDLoginViewController *loginController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 普通注册
    [self configSVProgressHUD];
    [self configScrollViewAdapt4IOS11];
    [self configNetworkApiEnv];
    
    // 路由注册
    [self registerNavgationRouter];
    [self registerSchemaRouter];
    
    // 配置根视图控制器
    [self setupRootController];
    return YES;
}

- (void)setupRootController {
    
    UIViewController *vc = [[WDLoginViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    //[self.window setRootViewController:self.loginController];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    // 默认的路由 跳转等等
    if ([[url scheme] isEqualToString:WDDefaultRouteSchema]) {
        
        return [[JLRoutes globalRoutes] routeURL:url];
    }
    // http
    else if ([[url scheme] isEqualToString:WDHTTPRouteSchema])
    {
        return [[JLRoutes routesForScheme:WDHTTPRouteSchema] routeURL:url];
    }
    // https
    else if ([[url scheme] isEqualToString:WDHTTPsRouteSchema])
    {
        return [[JLRoutes routesForScheme:WDHTTPsRouteSchema] routeURL:url];
    }
    // Web交互请求
    else if ([[url scheme] isEqualToString:WDWebHandlerRouteSchema])
    {
        return [[JLRoutes routesForScheme:WDWebHandlerRouteSchema] routeURL:url];
    }
    // 请求回调
    else if ([[url scheme] isEqualToString:WDComponentsCallBackHandlerRouteSchema])
    {
        return [[JLRoutes routesForScheme:WDComponentsCallBackHandlerRouteSchema] routeURL:url];
    }
    // 未知请求
    else if ([[url scheme] isEqualToString:WDUnknownHandlerRouteSchema])
    {
        return [[JLRoutes routesForScheme:WDUnknownHandlerRouteSchema] routeURL:url];
    }
    return NO;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - getters and setters
- (WDLoginViewController *)loginController {
    if (!_loginController) {
        _loginController = [[WDLoginViewController alloc] init];
    }
    return _loginController;
}

@end

#pragma mark - 初始化 SVProgressHUD 配置
@implementation AppDelegate(SVProgressHUD)

- (void)configSVProgressHUD
{
    
}

@end

#pragma mark - IOS11适配
@implementation AppDelegate(Adapt4IOS11)

- (void)configScrollViewAdapt4IOS11
{
    if (IOS11_OR_LATER) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        [UITableView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        [UIWebView appearance].scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        //[WKWebView appearance].scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        
        [UITableView appearance].estimatedRowHeight = 0;
        [UITableView appearance].estimatedSectionHeaderHeight = 0;
        [UITableView appearance].estimatedSectionFooterHeight = 0;
    }
}
@end

#pragma mark - YTKNetworking 接口地址配置
@implementation AppDelegate(NetworkApiEnv)

- (void)configNetworkApiEnv
{
    
}
@end

#pragma mark - 路由注册
@implementation AppDelegate(RouterRegister)

#pragma mark - 普通的跳转路由注册
- (void)registerNavgationRouter
{
    // push
    // 路由 /com_madao_navPush/:viewController
    [[JLRoutes globalRoutes] addRoute:WDNavPushRoute handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self _handlerSceneWithPresent:NO parameters:parameters];
            
        });
        return YES;
    }];
    
    // present
    // 路由 /com_madao_navPresent/:viewController
    [[JLRoutes globalRoutes] addRoute:WDNavPresentRoute handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self _handlerSceneWithPresent:YES parameters:parameters];
            
        });
        return YES;
    }];
    
    // sb push
    // 路由 /com_madao_navStoryboardPush/:viewController
    [[JLRoutes globalRoutes] addRoute:WDNavStoryBoardPushRoute handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        return YES;
    }];
    
}

#pragma mark - Schema 匹配
- (void)registerSchemaRouter
{
    // HTTP注册
    [[JLRoutes routesForScheme:WDHTTPRouteSchema] addRoute:@"/somethingHTTP" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        return NO;
    }];
    
    // HTTPS注册
    [[JLRoutes routesForScheme:WDHTTPsRouteSchema] addRoute:@"/somethingHTTPs" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return NO;
        
    }];
    
    // 自定义 Schema注册
    [[JLRoutes routesForScheme:WDWebHandlerRouteSchema] addRoute:@"/somethingCustom" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return NO;
        
    }];
}

#pragma mark - Private
/// 处理跳转事件
- (void)_handlerSceneWithPresent:(BOOL)isPresent parameters:(NSDictionary *)parameters
{
    // 当前控制器
    NSString *controllerName = [parameters objectForKey:WDControllerNameRouteParam];
    UIViewController *currentVC = [self _currentViewController];
    UIViewController *toVC = [[NSClassFromString(controllerName) alloc] init];
    toVC.params = parameters;
    if (currentVC && currentVC.navigationController) {
        if (isPresent) {
            [currentVC.navigationController presentViewController:toVC animated:YES completion:nil];
        }else
        {
            [currentVC.navigationController pushViewController:toVC animated:YES];
        }
    }
}

/// 获取当前控制器
- (UIViewController *)_currentViewController{
    
    UIViewController * currVC = nil;
    UIViewController * Rootvc = self.window.rootViewController ;
    do {
        if ([Rootvc isKindOfClass:[UINavigationController class]]) {
            UINavigationController * nav = (UINavigationController *)Rootvc;
            UIViewController * v = [nav.viewControllers lastObject];
            currVC = v;
            Rootvc = v.presentedViewController;
            continue;
        }else if([Rootvc isKindOfClass:[UITabBarController class]]){
            UITabBarController * tabVC = (UITabBarController *)Rootvc;
            currVC = tabVC;
            Rootvc = [tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
            continue;
        }
    } while (Rootvc!=nil);
    
    return currVC;
    

}



@end

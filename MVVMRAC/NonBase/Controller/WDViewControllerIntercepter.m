//
//  WDViewControllerIntercepter.m
//  MVVMRAC
//
//  Created by zhangguangpeng on 2018/6/27.
//  Copyright © 2018年 zhangguangpeng. All rights reserved.
//

#import "WDViewControllerIntercepter.h"
#import <UIKit/UIKit.h>
#import <Aspects.h>

@implementation WDViewControllerIntercepter : NSObject

+ (void)load {
    [super load];
    [WDViewControllerIntercepter sharedInstance];
}

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static WDViewControllerIntercepter *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[WDViewControllerIntercepter alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        /* 方法拦截 */
        
        // 拦截 viewDidLoad 方法
        [UIViewController aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo){
            
            
            [self _viewDidLoad:aspectInfo.instance];
        }  error:nil];
        
        // 拦截 viewWillAppear:
        [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated){
            
            [self _viewWillAppear:animated controller:aspectInfo.instance];
        } error:NULL];
    }
    return self;
}

#pragma mark - Hook Methods
- (void)_viewDidLoad:(UIViewController <WDViewControllerProtocol>*)controller {
    
    if ([controller conformsToProtocol:@protocol(WDViewControllerProtocol)]) {
        // 只有遵守 FKViewControllerProtocol 的 viewController 才进行 配置
        controller.edgesForExtendedLayout = UIRectEdgeAll;
        controller.extendedLayoutIncludesOpaqueBars = NO;
        controller.automaticallyAdjustsScrollViewInsets = NO;
        
        // 背景色设置为蓝色
        controller.view.backgroundColor = [UIColor blueColor];
        
        // 执行协议方法，必须执行
        [controller wd_initialDefaultsForController];
        [controller wd_bindViewModelForController];
        [controller wd_configNavigationForController];
        [controller wd_createViewForConctroller];
    }
}

- (void)_viewWillAppear:(BOOL)animated controller:(UIViewController <WDViewControllerProtocol>*)controller {
    
}

@end

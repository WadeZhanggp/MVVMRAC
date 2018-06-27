//
//  WDViewModelIntercepter.m
//  MVVMRAC
//
//  Created by zhangguangpeng on 2018/6/27.
//  Copyright © 2018年 zhangguangpeng. All rights reserved.
//

#import "WDViewModelIntercepter.h"
#import "NSObject+NonBase.h"
#import "WDViewModelProtocol.h"
#import <Aspects.h>

@implementation WDViewModelIntercepter

+ (void)load {
    [super load];
    [WDViewModelIntercepter sharedInstance];
}

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static WDViewModelIntercepter *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[WDViewModelIntercepter alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        /* 方法拦截 */
        
        [NSObject aspect_hookSelector:@selector(initWithParams:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo, NSDictionary *param){
            
            [self _initWithInstance:aspectInfo.instance params:param];
        } error:nil];
    }
    return self;
}

#pragma mark - Hook Methods
- (void)_initWithInstance:(NSObject <WDViewModelProtocol> *)viewModel {
    if ([viewModel respondsToSelector:@selector(wd_initializeForViewModel)]) {
        [viewModel wd_initializeForViewModel];
    }
}

- (void)_initWithInstance:(NSObject <WDViewModelProtocol> *)viewModel params:(NSDictionary *)param {
    if ([viewModel respondsToSelector:@selector(wd_initializeForViewModel)]) {
        [viewModel wd_initializeForViewModel];
    }
}


@end

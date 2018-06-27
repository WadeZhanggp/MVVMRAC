//
//  WDViewIntercepter.m
//  MVVMRAC
//
//  Created by zhangguangpeng on 2018/6/27.
//  Copyright © 2018年 zhangguangpeng. All rights reserved.
//

#import "WDViewIntercepter.h"
#import <UIKit/UIKit.h>

@implementation WDViewIntercepter

+ (void)load {
    [WDViewIntercepter sharedInstance];
}

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static WDViewIntercepter *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[WDViewIntercepter alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        /* 方法拦截 */
        
        // 代码方式唤起view
        [UIView aspect_hookSelector:@selector(initWithFrame:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo, CGRect frame){
            
            [self _init:aspectInfo.instance withFrame:frame];
        }  error:nil];
        
        // xib方式唤起view
        [UIView aspect_hookSelector:@selector(initWithCoder:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo, NSCoder *aDecoder){
            
            // 在此时 IBOut 中 view 都为空， 需要Hook awakeFromNib 方法
            [self _init:aspectInfo.instance withCoder:aDecoder];
        } error:nil];
        
        // xib方式唤起view
        [UIView aspect_hookSelector:@selector(awakeFromNib) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo){
            
            // 这时候可以初始化视图
            [self _awakFromNib:aspectInfo.instance];
        } error:nil];
    }
    return self;
}

#pragma mark - Hook Methods
- (void)_init:(UIView <WDViewProtocol>*)view withFrame:(CGRect)frame {
    
    if ([view respondsToSelector:@selector(wd_initializeForView)]) {
        [view wd_initializeForView];
    }
    
    if ([view respondsToSelector:@selector(wd_createViewForView)]) {
        [view wd_createViewForView];
    }
}

- (void)_init:(UIView <WDViewProtocol>*)view withCoder:(NSCoder *)aDecoder {
    if ([view respondsToSelector:@selector(wd_initializeForView)]) {
        [view wd_initializeForView];
    }
}

- (void)_awakFromNib:(UIView <WDViewProtocol>*)view {
    if ([view respondsToSelector:@selector(wd_createViewForView)]) {
        [view wd_createViewForView];
    }
}


@end

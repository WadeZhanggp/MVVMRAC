//
//  HXLoginViewModel.h
//  MVVMRAC
//
//  Created by zhangguangpeng on 2018/7/2.
//  Copyright © 2018年 zhangguangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDViewModelProtocol.h"
#import "ReactiveObjC/ReactiveObjC.h"
#import "NSObject+NonBase.h"

@interface HXLoginViewModel : NSObject<WDViewModelProtocol>

/**
 判断是否可以登录
 */
@property (nonatomic, assign) BOOL isLoginEnable;

/**
 用户名
 */
@property (nonatomic, copy) NSString *userName;

/**
 密码
 */
@property (nonatomic, copy) NSString *passwd;

#pragma mark - 命令
/**
 登录
 */
@property (nonatomic, strong) RACCommand *loginCommand;

@end

//
//  WDViewControllerProtocol.h
//  MVVMRAC
//
//  Created by zhangguangpeng on 2018/6/27.
//  Copyright © 2018年 zhangguangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WDViewControllerProtocol <NSObject>

#pragma mark - 方法绑定
@required
/// 初始化数据
- (void)wd_initialDefaultsForController;

/// 绑定 vm
- (void)wd_bindViewModelForController;

/// 创建视图
- (void)wd_createViewForConctroller;

/// 配置导航栏
- (void)wd_configNavigationForController;


@end

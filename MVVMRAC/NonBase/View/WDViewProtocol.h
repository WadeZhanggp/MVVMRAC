//
//  WDViewProtocol.h
//  MVVMRAC
//
//  Created by zhangguangpeng on 2018/6/27.
//  Copyright © 2018年 zhangguangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WDViewProtocol <NSObject>
@optional
/**
 为视图绑定 viewModel
 
 @param viewModel 要绑定的ViewModel
 @param params 额外参数
 */
- (void)bindViewModel:(id <WDViewProtocol>)viewModel withParams:(NSDictionary *)params;


@optional
/**
 初始化额外数据
 */
- (void)wd_initializeForView;
@required
/**
 初始化视图
 */
- (void)wd_createViewForView;

@end

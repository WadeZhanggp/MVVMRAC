//
//  WDViewModelProtocol.h
//  MVVMRAC
//
//  Created by zhangguangpeng on 2018/6/27.
//  Copyright © 2018年 zhangguangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WDViewModelProtocol <NSObject>

@required
/**
 viewModel 初始化属性
 */
- (void)wd_initializeForViewModel;

@end

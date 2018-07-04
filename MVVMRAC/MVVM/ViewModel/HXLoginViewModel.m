//
//  HXLoginViewModel.m
//  MVVMRAC
//
//  Created by zhangguangpeng on 2018/7/2.
//  Copyright © 2018年 zhangguangpeng. All rights reserved.
//

#import "HXLoginViewModel.h"

@implementation HXLoginViewModel

- (instancetype)initWithParams:(NSDictionary *)params {
    if (self = [super initWithParams:params]) {
        
    }
    return self;
}

- (void)wd_initializeForViewModel {
    RAC(self, isLoginEnable) = [[RACSignal combineLatest:@[RACObserve(self, userName), RACObserve(self, passwd)]] map:^id _Nullable(RACTuple * _Nullable value) {
        RACTupleUnpack(NSString *userName, NSString *passwd) = value;
        return @(userName && passwd && userName.length && passwd.length);
    }];
}

@end

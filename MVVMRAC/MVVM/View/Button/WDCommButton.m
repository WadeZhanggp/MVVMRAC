//
//  WDCommButton.m
//  MVVMRAC
//
//  Created by zhangguangpeng on 2018/6/27.
//  Copyright © 2018年 zhangguangpeng. All rights reserved.
//

#import "WDCommButton.h"

@implementation WDCommButton



- (void)wd_initializeForView {
    self.titleLabel.font =  [UIFont systemFontOfSize:17];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5.f;
    self.backgroundColor = [UIColor redColor];
    [self setTitle:@"登录" forState:UIControlStateNormal];
}

@end

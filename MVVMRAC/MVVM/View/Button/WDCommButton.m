//
//  WDCommButton.m
//  MVVMRAC
//
//  Created by zhangguangpeng on 2018/6/27.
//  Copyright © 2018年 zhangguangpeng. All rights reserved.
//

#import "WDCommButton.h"
#import "GloalDefine.h"

@implementation WDCommButton

- (void)wd_initializeForView {
    self.titleLabel.font =  [UIFont systemFontOfSize:17];
    self.layer.masksToBounds = YES;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.backgroundColor = THEMECOLOR;
    self.layer.cornerRadius = self.bounds.size.height/2;
}


@end

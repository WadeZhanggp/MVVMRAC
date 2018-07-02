//
//  WDLoginViewController.m
//  MVVMRAC
//
//  Created by zhangguangpeng on 2018/6/27.
//  Copyright © 2018年 zhangguangpeng. All rights reserved.
//

#import "WDLoginViewController.h"
#import "WDCommButton.h"
#import <Masonry.h>
#import "ReactiveObjC/ReactiveObjC.h"
#import "JLRoutes+GenerateURL.h"
#import "WDHomeViewController.h"
#import "WDRouterConstant.h"
#import "GloalDefine.h"

@interface WDLoginViewController ()

/**
 登录按钮
 */
@property (nonatomic, strong) WDCommButton *loginBtn;

@end

@implementation WDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)wd_bindViewModelForController {
    [[[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] throttle:0] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSString *router = [JLRoutes wd_generateURLWithPattern:WDNavPushRoute parameters:@[NSStringFromClass(WDHomeViewController.class)] extraParameters:nil];
        [[RACScheduler mainThreadScheduler] schedule:^{
            NSLog(@"JLRGenRouteURL=%@",JLRGenRouteURL(WDDefaultRouteSchema, router));
            [[UIApplication sharedApplication] openURL:JLRGenRouteURL(WDDefaultRouteSchema, router)];
            
        }];
    }];
}

- (void)wd_configNavigationForController {
    
}

- (void)wd_createViewForConctroller {
    
    [self.view addSubview:self.loginBtn];
}

- (void)wd_initialDefaultsForController {
    
}

#pragma mark - getters and setters

- (WDCommButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [[WDCommButton alloc] init];
        _loginBtn.frame = CGRectMake(0, 0, 100, 50);
    }
    return _loginBtn;
}

@end

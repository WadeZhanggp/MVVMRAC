//
//  TestViewController.m
//  MVVMRAC
//
//  Created by zhangguangpeng on 2018/6/29.
//  Copyright © 2018年 zhangguangpeng. All rights reserved.
//

#import "TestViewController.h"
#import "ReactiveObjC/ReactiveObjC.h"
#import "JLRoutes+GenerateURL.h"
#import "WDHomeViewController.h"
#import "WDRouterConstant.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    
    [self.view addGestureRecognizer:tapGesturRecognizer];
}

-(void)tapAction:(id)tap

{
    
    NSLog(@"点击了tapView");
    NSString *router = [JLRoutes wd_generateURLWithPattern:WDNavPushRoute parameters:@[NSStringFromClass(WDHomeViewController.class)] extraParameters:nil];
    [[UIApplication sharedApplication] openURL:JLRGenRouteURL(WDDefaultRouteSchema, router)];
}

@end

//
//  HXLoginViewController.m
//  MVVMRAC
//
//  Created by zhangguangpeng on 2018/7/2.
//  Copyright © 2018年 zhangguangpeng. All rights reserved.
//

#import "HXLoginViewController.h"
#import "HXLoginViewModel.h"

@interface HXLoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) HXLoginViewModel *viewModel;

@end

@implementation HXLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (void)wd_bindViewModelForController {
    [self setViewModel:[[HXLoginViewModel alloc] initWithParams:self.params]];
    RAC(self.viewModel, userName) = self.userNameTextField.rac_textSignal;
    RAC(self.viewModel, passwd) = self.passwdTextField.rac_textSignal;
    RAC(self.loginButton, enabled) = RACObserve(self.viewModel, isLoginEnable);
}

- (void)wd_configNavigationForController {
    
}

- (void)wd_createViewForConctroller {
    
    self.navigationController.navigationBar.hidden = YES;
    self.userNameTextField.returnKeyType = UIReturnKeyDone;
    self.passwdTextField.returnKeyType = UIReturnKeyGo;
    
}

- (void)wd_initialDefaultsForController {
    @weakify(self)
    [[self
      rac_signalForSelector:@selector(textFieldShouldReturn:)
      fromProtocol:@protocol(UITextFieldDelegate)]
     subscribeNext:^(RACTuple *tuple) {
         @strongify(self)
         if (tuple.first == self.passwdTextField){
             if (self.viewModel.isLoginEnable) {
                [JLRoutes wd_goController:@"HXHomeViewController" WithPattern:WDNavPushRoute];
             }
         }
     }];
    self.passwdTextField.delegate = self;
    [[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        if (self.viewModel.isLoginEnable) {
            [JLRoutes wd_goController:@"HXHomeViewController" WithPattern:WDNavPushRoute];
        }
    }];
}


@end

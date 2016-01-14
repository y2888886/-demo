//
//  FingerViewController.m
//  MSCDemo_UI
//
//  Created by Yallen on 16/1/14.
//
//

#import "FingerViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
@interface FingerViewController ()

@end

@implementation FingerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 实例化
    LAContext *lac = [[LAContext alloc]init];
    // 判断设备是否支持指纹识别
    BOOL isSupport = [lac canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil];
    if (!isSupport) {
        NSLog(@"不支持指纹");
        return;
    }else{
        [lac evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"出爪" reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                NSLog(@"你想弄啥");
            }
        }];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

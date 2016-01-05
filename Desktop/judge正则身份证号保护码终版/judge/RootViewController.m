//
//  RootViewController.m
//  judge
//
//  Created by Yallen on 16/1/5.
//  Copyright © 2016年 Yallen. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textfield;
- (IBAction)buttonclick:(id)sender;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.textfield.delegate = self;
    self.textfield.keyboardType = UIKeyboardTypeNumberPad;
    
}
// 正则判断手机号码地址格式
- (BOOL)isMobileNumber:(NSString *)mobileNum
{
    NSString *mobile = @"^(1([34578][0-9]))\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobile];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }

}
//正则判断身份证号是否格式正确
- (BOOL)isCardNumber:(NSString *)cardNum{
    
    NSString *card = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    NSPredicate *regextestcard = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", card];
    
    if ([regextestcard evaluateWithObject:cardNum] == YES) {
        
        return YES;
    }else{
        
        return NO;
    }
}
//判断保护码的格式是否安全
//^(?:0(?=1)|1(?=2)|2(?=3)|3(?=4)|4(?=5)|5(?=6)|6(?=7)|7(?=8)|8(?=9)){5}\\d$  6位顺增
//^(?:9(?=8)|8(?=7)|7(?=6)|6(?=5)|5(?=4)|4(?=3)|3(?=2)|2(?=1)|1(?=0)){5}\\d$  6位顺减
//"(?:(?:0(?=1)|1(?=2)|2(?=3)|3(?=4)|4(?=5)|5(?=6)|6(?=7)|7(?=8)|8(?=9)){5}|(?:9(?=8)|8(?=7)|7(?=6)|6(?=5)|5(?=4)|4(?=3)|3(?=2)|2(?=1)|1(?=0)){5})\\d" 6位顺增或顺减
//"([\\d])\\1{2,}"  3位及以上的全部重复数字
//"([\\d])\\1{1,}([\\d])\\2{2,}"  连同号“111222”类型
//"([\\d])\\1{1,}([\\d])\\2{1,}([\\d])\\3{1,}"  “112233”类型
- (BOOL)isProNumber:(NSString *)proNum{
    
    
    NSString *pro1 = @"([\\d])\\1{1,}([\\d])\\2{2,}";//连同号“111222”类型
    NSString *pro2 = @"([\\d])\\1{1,}([\\d])\\2{1,}([\\d])\\3{1,}";//“112233”类型
    NSString *pro3 = @"([\\d])\\1{2,}";//全部为相同数字
    NSString *pro4 = @"(?:(?:0(?=1)|1(?=2)|2(?=3)|3(?=4)|4(?=5)|5(?=6)|6(?=7)|7(?=8)|8(?=9)){5}|(?:9(?=8)|8(?=7)|7(?=6)|6(?=5)|5(?=4)|4(?=3)|3(?=2)|2(?=1)|1(?=0)){5})\\d";//顺增或顺减
    NSPredicate *regextestpro1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pro1];
    NSPredicate *regextestpro2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pro2];
    NSPredicate *regextestpro3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pro3];
    NSPredicate *regextestpro4 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pro4];
    if ([regextestpro1 evaluateWithObject:proNum] == YES) {
        
        return YES;
    }else if([regextestpro2 evaluateWithObject:proNum] == YES){
        
        return YES;
    }else if ([regextestpro3 evaluateWithObject:proNum] == YES){
        return YES;
    }else if ([regextestpro4 evaluateWithObject:proNum] == YES){
        return YES;
    }else{
        return NO;
    }
    
}

- (IBAction)buttonclick:(id)sender {
    
//    //手机号格式是否正确
//    if (![self isMobileNumber:self.textfield.text]) {
//        NSLog(@"输入正确手机号");
//    }else{
//        NSLog(@"号码正确");
//    }
    
//    //身份证号格式是否正确
//    if (![self isCardNumber:self.textfield.text]) {
//        NSLog(@"输入正确身份证号");
//    }else{
//        NSLog(@"身份证号正确");
//    }
    
  //保护码格式是否安全
    if (![self isProNumber:self.textfield.text]) {
        NSLog(@"保护码格式安全");
    }else{
        NSLog(@"保护码格式不安全");
    }
    
}
@end

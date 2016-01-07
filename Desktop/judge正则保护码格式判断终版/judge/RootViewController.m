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
    //self.textfield.keyboardType = UIKeyboardTypeNumberPad;
    
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
//正则判断身份证号是否格式正确^[0-9]{6}([0-9]{8})[0-9X]{4}$    ^[0-9]{6}([0-9]{6})[0-9]{3}$
- (BOOL)isCardNumber:(NSString *)cardNum{
    
    NSString *card = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X|x)$)";
    
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

//判断护照的格式是否正确
//中国护照D开头的外交护照,S开头的是公务护照,P头的是因公普通护照,G打头的是个人普通护照
- (BOOL)isPassPortNumber:(NSString *)passPortNum{
    NSString *passport = @"(^1[45][0-9]{7}|G[0-9]{8}|P[0-9]{7}|S[0-9]{7,8}|D[0-9]+$)";
    NSPredicate *regextestpassport = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passport];
    
    if ([regextestpassport evaluateWithObject:passPortNum] == YES) {
        return YES;
    }else{
        return NO;
    }
}
//NSString *entrycert2 = @"^[HMhm]{1}([0-9]{10}|[0-9]{8})$";//港澳在大陆通行证
//港澳通行证的格式是否正确
//港澳通行证之前版本是W开头8位数字，2014之后版位C开头8位数字

- (BOOL)isEntryCertNumber:(NSString *)entryCertNum{
    
    NSString *entrycert = @"^[CW]{1}[0-9]{8}$";
    
    NSPredicate *regextestentrycert = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", entrycert];
    
    if ([regextestentrycert evaluateWithObject:entryCertNum] == YES) {
        return YES;
    }else{
        return NO;
    }
}

//军官证的格式是否正确
- (BOOL)isOfficerCertNumber:(NSString *)officerCertNum{
    
    NSString *officercert = @"^南字第(\\d{8})号|北字第(\\d{8})号|沈字第(\\d{8})号|兰字第(\\d{8})号|成字第(\\d{8})号|济字第(\\d{8})号|广字第(\\d{8})号|海字第(\\d{8})号|空字第(\\d{8})号|参字第(\\d{8})号|政字第(\\d{8})号|后字第(\\d{8})号|装字第(\\d{8})号$";
    
    NSPredicate *regextestofficercert = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", officercert];
    
    if ([regextestofficercert evaluateWithObject:officerCertNum] == YES) {
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
    
//  //保护码格式是否安全
//    if (![self isProNumber:self.textfield.text]) {
//        NSLog(@"保护码格式安全");
//    }else if([self isProNumber:self.textfield.text]){
//        NSLog(@"保护码格式不安全");
//    }
    
//    //护照格式是否正确
//    if (![self isPassPortNumber:self.textfield.text]) {
//        NSLog(@"输入正确护照号");
//    }else{
//        NSLog(@"护照号正确");
//    }
    
//    //港澳通行证格式是否正确
//    if (![self isEntryCertNumber:self.textfield.text]) {
//        NSLog(@"输入正确港澳通行证号");
//    }else{
//        NSLog(@"港澳通行证号正确");
//    }
    
      //军官证格式是否正确
    if (![self isOfficerCertNumber:self.textfield.text]) {
        NSLog(@"输入正确军官证号");
    }else{
        NSLog(@"军官证号正确");
    }
    
}
@end

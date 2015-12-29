//
//  ViewController.m
//  CustomKeyboardDemo
//
//  Created by 黄诚 on 14/12/20.
//  Copyright (c) 2014年 huangcheng. All rights reserved.
//

#import "ViewController.h"
#import "HcCustomKeyboard.h"

@interface ViewController ()<HcCustomKeyboardDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[HcCustomKeyboard customKeyboard]textViewShowView:self customKeyboardDelegate:self];
    self.view.backgroundColor =[UIColor groupTableViewBackgroundColor];
}
-(void)talkBtnClick:(UITextView *)textViewGet
{
    NSLog(@"%@",textViewGet.text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 

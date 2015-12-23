//
//  ViewController.m
//  yueyuDemo
//
//  Created by Yallen on 15/12/23.
//  Copyright © 2015年 Yallen. All rights reserved.
//

#import "ViewController.h"
#import <sys/stat.h>
#import <dlfcn.h>
#import <mach-o/dyld.h>
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//步骤一：尝试使用NSFileManager判断设备是否安装了如下越狱常用工具
//    struct stat s;
//    int result = stat("/Applications/Cydia.app", &s);
//    NSLog(@"result    %d",result);
//    //（1）返回0，表示指定的文件存在
//    //（2）返回－1，表示执行失败
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Cydia.app"]){
        NSLog(@"Device is jailbroken");
    }
//步骤二：攻击者可能会改变这些工具的安装路径，躲过你的判断。那么，你可以尝试打开cydia应用注册的URL scheme：

    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://package/com.example.package"]]){
        NSLog(@"Device is jailbroken");
    }
//步骤三：但是不是所有的工具都会注册URL scheme，而且攻击者可以修改任何应用的URL scheme。那么，你可以尝试读取下应用列表，看看有无权限获取：
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/User/Applications/"]){
        NSLog(@"Device is jailbroken");
        NSArray *applist = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/User/Applications/"
                                                                               error:nil];
        NSLog(@"applist = %@",applist);
    }
    else{
        NSLog(@"未越狱");
    }
//步骤四：攻击者可能会hook NSFileManager 的方法，让你的想法不能如愿。那么，你可以回避 NSFileManager，使用stat系列函数检测Cydia等工具：
    struct stat stat_info;
        if (0 == stat("/Applications/Cydia.app", &stat_info)) {
            NSLog(@"Device is jailbroken");
        }else{
            NSLog(@"未越狱");
        }
//步骤五：攻击者可能会利用 Fishhook原理 hook了stat。那么，你可以看看stat是不是出自系统库，有没有被攻击者换掉：
 
    int ret ;
    Dl_info dylib_info;
    int (*func_stat)(const char *, struct stat *) = stat;
    if ((ret = dladdr(func_stat, &dylib_info))) {
        NSLog(@"lib :%s", dylib_info.dli_fname);
    }
    //如果结果不是 /usr/lib/system/libsystem_kernel.dylib 的话，那就100%被攻击
  
//步骤六：如果 libsystem_kernel.dylib 都是被攻击者替换掉的……那么，你可能会想，我该检索一下自己的应用程序是否被链接了异常动态库。列出所有已链接的动态库
    
    uint32_t count = _dyld_image_count();
    for (uint32_t i = 0 ; i < count; ++i) {
        NSString *name = [[NSString alloc]initWithUTF8String:_dyld_get_image_name(i)];
        NSLog(@"--%@", name);
    }
    //通常越狱机的输出结果会包含字符串： Library/MobileSubstrate/MobileSubstrate.dylib
    
//步骤七：攻击者可能会给MobileSubstrate改名，但是原理都是通过DYLD_INSERT_LIBRARIES注入动态库。那么，你可以通过检测当前程序运行的环境变量

    char *env = getenv("DYLD_INSERT_LIBRARIES");
    NSLog(@"%s", env);
    //未越狱设备返回结果是null


    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  IFlySuccessViewController.m
//  ISV
//
//  Created by cheng ping on 13-9-13.
//  Copyright (c) 2013年 IFlyTEK. All rights reserved.
//

#import "IFlySuccessViewController.h"


@implementation IFlySuccessViewController



-(void)dealloc {
    [_type release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if ([_type isEqualToString:@"help"]) {
        self.title = @"帮助";
        NSString *path = [[NSBundle mainBundle]pathForResource:@"ifly_isv_manual" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSString *textFile  = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        CGSize size = self.view.frame.size;
        UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        textView.text = textFile;
        [self.view addSubview:textView];
        [textView release];
        [textFile release];
        
    }else{
        self.title = @"识别成功";
        UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake(50, 80, 220, 20)];
        lable.text = @"识别成功";
        [self.view addSubview:lable];
        [lable release];
    }
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

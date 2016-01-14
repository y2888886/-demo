//
//  ASRDialogViewController.m
//  MSCDemo
//
//  Created by junmei on 14-1-20.
//  Copyright (c) 2014年 iflytek. All rights reserved.
//

#import "ASRDialogViewController.h"
#import "Definition.h"
#import "UIPlaceHolderTextView.h"

@interface ASRDialogViewController ()

@end

@implementation ASRDialogViewController

- (void)dealloc
{
    [_popView release];
    [_textView release];
    [_iflyRecognizerView release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
        self.navigationController.navigationBar.translucent = NO;
    }
#endif
    
    UIPlaceHolderTextView *resultView = [[UIPlaceHolderTextView alloc] initWithFrame:
                                         CGRectMake(Margin*2, Margin*2, self.view.frame.size.width-Margin*4, 300)];
    resultView.layer.cornerRadius = 8;
    resultView.layer.borderWidth = 1;
    [self.view addSubview:resultView];
    resultView.font = [UIFont systemFontOfSize:17.0f];
    resultView.placeholder = @"识别结果";
    resultView.editable = NO;
    _textView = resultView;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(Margin*2, resultView.frame.origin.y+resultView.frame.size.height+50, self.view.frame.size.width-Margin*4, 50);
    [button setTitle:@"开始识别" forState:UIControlStateNormal];
    [button setTitle:@"开始识别" forState:UIControlStateSelected];
    [button addTarget:self action:@selector(startListenning:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _popView = [[PopupView alloc] initWithFrame:CGRectMake(100, 300, 0, 0)];
    _popView.ParentView = self.view;

    //初始化语音识别控件
    NSString *initString = [NSString stringWithFormat:@"appid=%@",APPID_VALUE];
    _iflyRecognizerView = [[IFlyRecognizerView alloc] initWithCenter:self.view.center initParam:initString];
    _iflyRecognizerView.delegate = self;
    
    [_iflyRecognizerView setParameter:@"domain" value:@"iat"];
    [_iflyRecognizerView setParameter:@"asr_audio_path" value:@"asrview.pcm"];
//    [_iflyRecognizerView setParameter:@"asr_audio_path" value:nil];   当你再不需要保存音频时，请在必要的地方加上这行。
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startListenning:(id)sender
{
    [_iflyRecognizerView start];
    NSLog(@"start listenning...");
}

#pragma mark delegate
- (void)onResult:(IFlyRecognizerView *)iFlyRecognizerView theResult:(NSArray *)resultArray
{
    NSMutableString *result = [[NSMutableString alloc] init];
    NSDictionary *dic = [resultArray objectAtIndex:0];
    for (NSString *key in dic) {
        [result appendFormat:@"%@",key];
    }
    _textView.text = [NSString stringWithFormat:@"%@%@",_textView.text,result];
    [result release];
}

- (void)onEnd:(IFlyRecognizerView *)iFlyRecognizerView theError:(IFlySpeechError *)error
{
    [self.view addSubview:_popView];
    [_popView setText:[NSString stringWithFormat:@"识别结束,错误码:%d",[error errorCode]]];
    NSLog(@"errorCode:%d",[error errorCode]);
}

@end

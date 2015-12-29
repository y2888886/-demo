//
//  WebViewController.m
//  QRCodeReaderViewControllerExample
//
//  Created by Yallen on 15/12/24.
//  Copyright © 2015年 Yannick Loriot. All rights reserved.
//

#import "WebViewController.h"
#import "SVProgressHUD.h"
@interface WebViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //self.textfield.text = self.urlStr;
    self.navigationItem.title = @"wangluo";
    self.webView.delegate = self;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.webView.scalesPageToFit = YES;

    NSLog(@"跳过来了");
    
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    
//    [SVProgressHUD dismiss];
//}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //[SVProgressHUD showWithStatus:@"正在加载" maskType:SVProgressHUDMaskTypeNone];
    return YES;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //[SVProgressHUD dismiss];
    NSLog(@"加载完成");
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    NSLog(@"webViewDidStartLoad");
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
}



-(void)webView:(UIWebView*)webView  DidFailLoadWithError:(NSError*)error{
    
    NSLog(@"DidFailLoadWithError");
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
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

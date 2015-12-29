//
//  WebViewController.h
//  QRCodeReaderViewControllerExample
//
//  Created by Yallen on 15/12/24.
//  Copyright © 2015年 Yannick Loriot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>

@property (strong, nonatomic) NSString *urlStr;

@end

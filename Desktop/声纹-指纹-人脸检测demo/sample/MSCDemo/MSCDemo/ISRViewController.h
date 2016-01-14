//
//  ISRViewController.h
//  MSCDemo
//
//  Created by iflytek on 13-6-6.
//  Copyright (c) 2013年 iflytek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iflyMSC/IFlySpeechRecognizer.h"
#import "iflyMSC/IFlyDataUploader.h"
#import "PopupView.h"
#import "Login.h"
@interface ISRViewController : UIViewController<IFlySpeechRecognizerDelegate,IFlyDataUploaderDelegate>
{
    IFlySpeechRecognizer    * _iFlySpeechRecognizer;
    NSString                * _domain;
    UITextView              * _resultView ;
    PopupView               * _popUpView;
    UIButton                * _stopBtn;
    UIButton                * _cancelBtn;
    UIButton                * _startBtn;
    bool                      _isCancel;
    UIButton                * _uploadWordBtn;
    UIButton                * _uploadContactBtn;
    IFlyDataUploader        * _uploader;
    NSString                * _result;
    Login                   * _login;
}
-(void) setGrammerId:(NSString*) id;
@end

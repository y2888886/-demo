//
//  ASRDialogViewController.h
//  MSCDemo
//
//  Created by junmei on 14-1-20.
//  Copyright (c) 2014年 iflytek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iflyMSC/IFlyRecognizerView.h"
#import "iflyMSC/IFlyRecognizerViewDelegate.h"
#import "PopupView.h"

@interface ASRDialogViewController : UIViewController<IFlyRecognizerViewDelegate>
{
    IFlyRecognizerView      *_iflyRecognizerView;
    PopupView               *_popView;
    UITextView              *_textView;
}

@end

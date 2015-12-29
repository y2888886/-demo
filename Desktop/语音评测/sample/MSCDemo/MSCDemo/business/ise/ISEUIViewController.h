//
//  ISEUIViewController.h
//  MSCDemo
//
//  Created by wangdan on 15/5/21.
//
//

#import <UIKit/UIKit.h>
#import "iflyMSC/iflyMSC.h"
#import "PopupView.h"



@interface ISEUIViewController : UIViewController

@property (nonatomic, strong) IFlySpeechEvaluator *speechEveluator;


@property (weak, nonatomic) IBOutlet UITextView *srcTextView;
@property (weak, nonatomic) IBOutlet UITextView *resultTextView;



@property (weak, nonatomic) IBOutlet UIButton *startEvelutateBtn;
@property (weak, nonatomic) IBOutlet UIButton *stopEveluateBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelEveluateBtn;
@property (weak, nonatomic) IBOutlet UIButton *resultParserBtn;


@property (nonatomic, strong) NSString *resultText;


@property (nonatomic, strong) PopupView *popupView;

@property (nonatomic, assign) BOOL isSessionResultAppear;
@property (nonatomic, assign) BOOL isSessionEnd;

@property (nonatomic, assign) BOOL isValidInput;

@end

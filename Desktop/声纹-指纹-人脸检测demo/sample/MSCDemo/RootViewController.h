//
//  DiagleView.m
//  MSCDemo_UI
//
//  Created by wangdan on 14-12-22.
//
//

#import <UIKit/UIKit.h>
#import "iflyMSC/IFlySpeechUtility.h"
#import "Definition.h"
#import "PopupView.h"

@interface RootViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{ 
    //NSArray         *_functions;
    
    UITextView      *_thumbView;
    
    PopupView       * _popUpView;
}
@end

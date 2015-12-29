//
//  ISEConfigViewController.h
//  MSCDemo
//
//  Created by wangdan on 15/5/21.
//
//

#import <UIKit/UIKit.h>
#import "SAMultisectorControl.h"
#import "AKPickerView.h"
#import "iflyMSC/iflyMSC.h"

@interface ISEConfigViewController : UIViewController



@property (weak, nonatomic) IBOutlet SAMultisectorControl *roundSlider;

@property (weak, nonatomic) IBOutlet UILabel *recTimeoutLabel;
@property (weak, nonatomic) IBOutlet UILabel *bosLabel;
@property (weak, nonatomic) IBOutlet UILabel *eosLabel;


@property (weak, nonatomic) IBOutlet UISegmentedControl *languageSeg;

@property (weak, nonatomic) IBOutlet AKPickerView *questionStylePicker;
@property (weak, nonatomic) IBOutlet UIScrollView *backScrollView;


@end

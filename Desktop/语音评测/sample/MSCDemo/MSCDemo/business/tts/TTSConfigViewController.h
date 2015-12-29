//
//  TTSConfigViewController.h
//  MSCDemo_UI
//
//  Created by wangdan on 15-4-25.
//  Copyright (c) 2015年 CMCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAMultisectorControl.h"
#import "AKPickerView.h"

@interface TTSConfigViewController : UIViewController<AKPickerViewDataSource,AKPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *backScrollView;


@property (weak, nonatomic) IBOutlet SAMultisectorControl *roundSlider;

@property (weak, nonatomic) IBOutlet UILabel *volumeLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (weak, nonatomic) IBOutlet UILabel *pitchLabel;

@property (strong, nonatomic)  SAMultisectorSector *volumeSec;
@property (strong, nonatomic)  SAMultisectorSector *speedSec;
@property (strong, nonatomic)  SAMultisectorSector *pitchSec;

@property (weak, nonatomic) IBOutlet AKPickerView *vcnPicker;

@property (weak, nonatomic) IBOutlet UISegmentedControl *sampleRateSeg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *engineTypeSeg;//云端 本地

@end

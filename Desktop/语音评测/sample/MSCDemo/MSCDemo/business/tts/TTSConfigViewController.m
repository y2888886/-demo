//
//  ISRConfigViewController.m
//  MSCDemo_UI
//
//  Created by wangdan on 15-4-25.
//  Copyright (c) 2015年 CMCC. All rights reserved.
//

#import "TTSConfigViewController.h"
#import "TTSConfig.h"

@interface TTSConfigViewController ()
@property  (nonatomic,strong) TTSConfig *instance ;
@end

@implementation TTSConfigViewController



#pragma mark - 视图生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDesign];
    [self initView];
    [self setupMultisectorControl];
    [self needUpdateView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidLayoutSubviews
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    _backScrollView.contentSize = CGSizeMake(size.width ,size.height+300);
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


#pragma mark - 界面UI处理

-(void)initView
{
    _instance = [TTSConfig sharedInstance];
    _vcnPicker.delegate = self;
    _vcnPicker.dataSource = self;
    _vcnPicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    _vcnPicker.textColor = [UIColor whiteColor];
    _vcnPicker.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    _vcnPicker.highlightedFont = [UIFont fontWithName:@"HelveticaNeue" size:17];
    _vcnPicker.highlightedTextColor = [UIColor colorWithRed:0.0 green:168.0/255.0 blue:255.0/255.0 alpha:1.0];
    _vcnPicker.interitemSpacing = 20.0;
    _vcnPicker.fisheyeFactor = 0.001;
    _vcnPicker.pickerViewStyle = AKPickerViewStyle3D;
    _vcnPicker.maskDisabled = false;
    
    _backScrollView.canCancelContentTouches = YES;
    _backScrollView.delaysContentTouches = NO;//优先使用子页面的触摸事件
    
}

- (void)updateDataView{
    
    TTSConfig *instance = [TTSConfig sharedInstance];
    instance.speed = [NSString stringWithFormat:@"%d", (int)_speedSec.endValue];
    instance.volume = [NSString stringWithFormat:@"%d", (int)_volumeSec.endValue];
    instance.pitch = [NSString stringWithFormat:@"%d", (int)_pitchSec.endValue];
    
    
    _speedLabel.text = instance.speed;
    _volumeLabel.text = instance.volume;
    _pitchLabel.text = instance.pitch;
    
    _speedSec.endValue = [instance.speed integerValue];
    _volumeSec.endValue = [instance.volume integerValue];
    _pitchSec.endValue = [instance.pitch integerValue];
    
}


-(void)needUpdateView {//更新界面显示
    
    TTSConfig *instance = [TTSConfig sharedInstance];
    
    _speedLabel.text = instance.speed;//超时等时间设置
    _volumeLabel.text = instance.volume;
    _pitchLabel.text = instance.pitch;
    
    _speedSec.endValue = instance.speed.integerValue;
    _volumeSec.endValue = instance.volume.integerValue;
    _pitchSec.endValue = instance.pitch.integerValue;
    
    
    NSString *type = instance.engineType;
    if ([type isEqualToString:[IFlySpeechConstant TYPE_AUTO]]) {//引擎类型
        _engineTypeSeg.selectedSegmentIndex = 0;
        
    }else if ([type isEqualToString:[IFlySpeechConstant TYPE_CLOUD]]) {
        _engineTypeSeg.selectedSegmentIndex = 1;
        
    }else if ([type isEqualToString:[IFlySpeechConstant TYPE_LOCAL]]) {
        _engineTypeSeg.selectedSegmentIndex = 2;
    }
    
    NSString *sampleRate = instance.sampleRate;//采样率
    if ([sampleRate isEqualToString:[IFlySpeechConstant SAMPLE_RATE_16K]]) {
        _sampleRateSeg.selectedSegmentIndex = 0;
        
    }else if ([sampleRate isEqualToString:[IFlySpeechConstant SAMPLE_RATE_8K]]) {
        _sampleRateSeg.selectedSegmentIndex = 1;
        
    }
    
    for (int i = 0;i < _instance.vcnNickNameArray.count; i++) {
        if ([_instance.vcnIdentiferArray[i] isEqualToString:_instance.vcnName]) {
            [_vcnPicker selectItem:i animated:NO];
        }
    }
}

- (void)setupDesign{
    self.view.backgroundColor = [UIColor colorWithRed:26.0/255.0 green:26.0/255.0 blue:26.0/255.0 alpha:1.0];
}


- (void)setupMultisectorControl{
    
    [_roundSlider addTarget:self action:@selector(multisectorValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    UIColor *blueColor = [UIColor colorWithRed:0.0 green:168.0/255.0 blue:255.0/255.0 alpha:1.0];
    UIColor *redColor = [UIColor colorWithRed:245.0/255.0 green:76.0/255.0 blue:76.0/255.0 alpha:1.0];
    UIColor *greenColor = [UIColor colorWithRed:29.0/255.0 green:207.0/255.0 blue:0.0 alpha:1.0];
    
    _pitchSec = [SAMultisectorSector sectorWithColor:redColor maxValue:100];//前端点
    _speedSec = [SAMultisectorSector sectorWithColor:blueColor maxValue:100];//后端点
    _volumeSec = [SAMultisectorSector sectorWithColor:greenColor maxValue:100];//录音超时
    
    TTSConfig *instance = [TTSConfig sharedInstance];
    _pitchSec.endValue = instance.pitch.integerValue;
    _speedSec.endValue = instance.speed.integerValue;
    _volumeSec.endValue = instance.volume.integerValue;
    
    [_roundSlider addSector:_pitchSec];
    [_roundSlider addSector:_speedSec];
    [_roundSlider addSector:_volumeSec];//半径依次增大
    
    
}


#pragma mark - 事件处理函数


- (void)multisectorValueChanged:(id)sender{
    [self updateDataView];
}


- (IBAction)sampleSegHandler:(id)sender {
    
    TTSConfig *instance = [TTSConfig sharedInstance];
    UISegmentedControl *seg = (UISegmentedControl*) sender;
    
    if (seg.selectedSegmentIndex == 0) {
        instance.sampleRate = [IFlySpeechConstant SAMPLE_RATE_16K];
    }else if (seg.selectedSegmentIndex == 1) {
        instance.sampleRate = [IFlySpeechConstant SAMPLE_RATE_8K];
    }
}


- (IBAction)engineTypeSegHandler:(id)sender {//点击2的时候给个提示吧
    
    TTSConfig *instance = [TTSConfig sharedInstance];
    UISegmentedControl *seg = (UISegmentedControl*) sender;
    
    if (seg.selectedSegmentIndex == 0) {
        instance.engineType = [IFlySpeechConstant TYPE_AUTO];
    }else if (seg.selectedSegmentIndex == 1) {
        instance.engineType = [IFlySpeechConstant TYPE_CLOUD];
    }else if (seg.selectedSegmentIndex == 2) {
        seg.selectedSegmentIndex = 0;
        instance.engineType = [IFlySpeechConstant TYPE_AUTO];
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"温馨提示"
                                                         message:@"本Demo未集成本地合成功能，谢谢!"
                                                        delegate:self cancelButtonTitle:@"好哒^_^"
                                               otherButtonTitles:nil];
        [alert show];
    }
}




#pragma mark - 发音人选择数据源

- (NSUInteger)numberOfItemsInPickerView:(AKPickerView *)pickerView
{
    TTSConfig* instance = [TTSConfig sharedInstance];
    return instance.vcnIdentiferArray.count;
}
- (NSString *)pickerView:(AKPickerView *)pickerView titleForItem:(NSInteger)item;
{
    TTSConfig* instance = [TTSConfig sharedInstance];
    return  [instance.vcnNickNameArray objectAtIndex:item];
}


#pragma mark - 选择发音人事件回调
- (void)pickerView:(AKPickerView *)pickerView didSelectItem:(NSInteger)item
{
    TTSConfig *instance = [TTSConfig sharedInstance];
    instance.vcnName = [instance.vcnIdentiferArray objectAtIndex:item];
}


@end

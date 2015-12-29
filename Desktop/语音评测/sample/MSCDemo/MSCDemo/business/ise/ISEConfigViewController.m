//
//  ISEConfigViewController.m
//  MSCDemo
//
//  Created by wangdan on 15/5/21.
//
//

#import "ISEConfigViewController.h"
#import "ISEConfig.h"


#define SENTENCE    @""

@interface ISEConfigViewController ()<AKPickerViewDataSource,AKPickerViewDelegate>
@property (nonatomic,strong) SAMultisectorSector *bosSec;
@property (nonatomic,strong) SAMultisectorSector *eosSec;
@property (nonatomic,strong) SAMultisectorSector *recSec;
@end

@implementation ISEConfigViewController


#pragma mark - 视图生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self setupMultisectorControl];
    [self needUpdateView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 用于storyboard scrollview 可以滑动
 ****/
-(void)viewDidLayoutSubviews
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    _backScrollView.contentSize = CGSizeMake(size.width ,size.height+300);
}


#pragma mark -  界面UI处理
-(void)initView
{
    _questionStylePicker.delegate = self;
    _questionStylePicker.dataSource = self;
    _questionStylePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    _questionStylePicker.textColor = [UIColor whiteColor];
    _questionStylePicker.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    _questionStylePicker.highlightedFont = [UIFont fontWithName:@"HelveticaNeue" size:17];
    _questionStylePicker.highlightedTextColor = [UIColor colorWithRed:0.0 green:168.0/255.0 blue:255.0/255.0 alpha:1.0];
    _questionStylePicker.interitemSpacing = 20.0;
    _questionStylePicker.fisheyeFactor = 0.001;
    _questionStylePicker.pickerViewStyle = AKPickerViewStyle3D;
    _questionStylePicker.maskDisabled = false;
    
    self.view.backgroundColor = [UIColor colorWithRed:26.0/255.0 green:26.0/255.0 blue:26.0/255.0 alpha:1.0];
}


- (void)setupMultisectorControl{
    [_roundSlider addTarget:self action:@selector(multisectorValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    UIColor *blueColor = [UIColor colorWithRed:0.0 green:168.0/255.0 blue:255.0/255.0 alpha:1.0];
    UIColor *redColor = [UIColor colorWithRed:245.0/255.0 green:76.0/255.0 blue:76.0/255.0 alpha:1.0];
    UIColor *greenColor = [UIColor colorWithRed:29.0/255.0 green:207.0/255.0 blue:0.0 alpha:1.0];
    
    _bosSec = [SAMultisectorSector sectorWithColor:redColor maxValue:10000];//前端点
    _eosSec = [SAMultisectorSector sectorWithColor:blueColor maxValue:10000];//后端点
    _recSec = [SAMultisectorSector sectorWithColor:greenColor maxValue:3600];//录音超时
    
    _bosSec.endValue = (double)[ISEConfig sharedInstance].vadBos.integerValue;
    _eosSec.endValue = [ISEConfig sharedInstance].vadEos.integerValue;
    _recSec.endValue = [ISEConfig sharedInstance].speechTimeout.integerValue;
    
    [_roundSlider addSector:_bosSec];
    [_roundSlider addSector:_eosSec];
    [_roundSlider addSector:_recSec];//半径依次增大
    
    _backScrollView.canCancelContentTouches = YES;
    _backScrollView.delaysContentTouches = NO;//优先使用子页面的触摸事件
    
}


- (void)updateDataView{
    
    ISEConfig *config = [ISEConfig sharedInstance];
    config.speechTimeout =  [NSString stringWithFormat:@"%ld", (long)_recSec.endValue];
    config.vadBos =  [NSString stringWithFormat:@"%ld", (long)_bosSec.endValue];
    config.vadEos =  [NSString stringWithFormat:@"%ld", (long)_eosSec.endValue];
    
    
    _bosLabel.text = config.vadBos;
    _eosLabel.text = config.vadEos;
    _recTimeoutLabel.text = config.speechTimeout;
    
    _recSec.endValue = [config.speechTimeout integerValue];
    _bosSec.endValue = [config.vadBos integerValue];
    _eosSec.endValue = [config.vadEos integerValue];
    
}


-(void)needUpdateView {
    
    ISEConfig *instance = [ISEConfig sharedInstance];
    
    _recTimeoutLabel.text = instance.speechTimeout;//超时等时间设置
    _eosLabel.text = instance.vadEos;
    _bosLabel.text = instance.vadBos;
    
    _recSec.endValue = instance.speechTimeout.integerValue;
    _bosSec.endValue = instance.vadBos.integerValue;
    _eosSec.endValue = instance.vadEos.integerValue;
    
    
    if ([instance.language isEqualToString:@"zh_cn"]) {//语种选择
        _languageSeg.selectedSegmentIndex = 0;
    }else if ([instance.language isEqualToString:@"en_us"]) {
         _languageSeg.selectedSegmentIndex = 1;
    }
    

    if ([instance.category isEqualToString:[ISEConfig sentence]]) {
        [_questionStylePicker selectItem:0 animated:NO];
    }else if ([instance.category isEqualToString:[ISEConfig word]]) {
        [_questionStylePicker selectItem:1 animated:NO];
    }else if ([instance.category isEqualToString:[ISEConfig sentence]]) {
        [_questionStylePicker selectItem:2 animated:NO];
    }
    
}


#pragma 事件处理函数

- (void)multisectorValueChanged:(id)sender{
    [self updateDataView];
}



- (IBAction)languageSegHandler:(id)sender {
    
    UISegmentedControl *control = sender;
    if (control.selectedSegmentIndex == 0) {//粤语
        
        [ISEConfig sharedInstance].language = [IFlySpeechConstant LANGUAGE_CHINESE];
        
    }else if (control.selectedSegmentIndex == 1) {//英语
        [ISEConfig sharedInstance].language = [IFlySpeechConstant LANGUAGE_ENGLISH];
        
    }
}




#pragma mark - 识别语言选择器数据源

- (NSUInteger)numberOfItemsInPickerView:(AKPickerView *)pickerView
{
    ISEConfig* instance = [ISEConfig sharedInstance];
    return instance.questionIdentifierArray.count;
}
- (NSString *)pickerView:(AKPickerView *)pickerView titleForItem:(NSInteger)item;
{
    ISEConfig* instance = [ISEConfig sharedInstance];
    return  [instance.questionStyleArray objectAtIndex:item];
}


#pragma mark - 选择识别语言事件回调
- (void)pickerView:(AKPickerView *)pickerView didSelectItem:(NSInteger)item
{
    ISEConfig *instance = [ISEConfig sharedInstance];
    
    if (item == 0) { //粤语
        instance.category = [ISEConfig sentence];
    }else if (item == 1) {//普通话
        instance.category = [ISEConfig word];
    }else if (item == 2) {//河南话
        instance.category = [ISEConfig singleChar];
    }
    
}


@end

//
//  AFRViewController.m
//  MSCDemo_UI
//
//  Created by junmei on 14-2-24.
//
//

#import "AFRViewController.h"
#import "Definition.h"

@interface AFRViewController ()

@end

@implementation AFRViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _uploadWordBtn.hidden = YES;
    _uploadContactBtn.hidden = YES;
    UILabel *custom = (UILabel *)[self.view viewWithTag:9527];
    custom.hidden = YES;
    
    UIButton *audiobtn = [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
    [audiobtn setTitle:@"音频文件识别" forState:UIControlStateNormal];
    audiobtn.frame = CGRectMake(Padding, custom.frame.origin.y + custom.frame.size.height+10, self.view.frame.size.width-Padding*2, ButtonHeight);
    [self.view addSubview:audiobtn];
    [audiobtn addTarget:self action:@selector(audioFileRcg:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)audioFileRcg:(id)sender
{
    NSString *docdir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *path = [docdir stringByAppendingPathComponent:@"asr.pcm"];
    if (![fm fileExistsAtPath:path]) {
        [_popUpView setText:@"文件不存在"];
        [self.view addSubview:_popUpView];
        return;
    }
    NSData *data = [NSData dataWithContentsOfFile:path];
    [_iFlySpeechRecognizer setParameter:@"asr_audio_path" value:@"asr.pcm"];
    [_iFlySpeechRecognizer recognizeAudio:data];
}

- (void)onEndOfSpeech
{
    [_popUpView setText:@"读音频成功"];
    [self.view addSubview:_popUpView];
}

@end

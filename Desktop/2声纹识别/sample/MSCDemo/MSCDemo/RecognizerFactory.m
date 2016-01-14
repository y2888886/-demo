//
//  RecognizerFactory.m
//  MSCDemo
//
//  Created by iflytek on 13-6-9.
//  Copyright (c) 2013年 iflytek. All rights reserved.
//

#import "RecognizerFactory.h"
#import "iflyMSC/IFlySpeechRecognizer.h"
#import "Definition.h"
@implementation RecognizerFactory

+(id) CreateRecognizer:(id)delegate Domain:(NSString*) domain
{
    IFlySpeechRecognizer * iflySpeechRecognizer = nil;

    // 创建识别对象
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@,timeout=%@",APPID_VALUE,TIMEOUT_VALUE];
    iflySpeechRecognizer = [IFlySpeechRecognizer createRecognizer: initString delegate:delegate];
    iflySpeechRecognizer.delegate = delegate;//请不要删除这句,createRecognizer是单例方法，需要重新设置代理
    [iflySpeechRecognizer setParameter:@"domain" value:domain];
    [iflySpeechRecognizer setParameter:@"sample_rate" value:@"16000"];
    [iflySpeechRecognizer setParameter:@"plain_result" value:@"0"];
    [iflySpeechRecognizer setParameter:@"asr_audio_path" value:@"asr.pcm"];
     
    [initString release];
    return iflySpeechRecognizer;
}
@end

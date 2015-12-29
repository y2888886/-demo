//
//  ISEConfig.m
//  MSCDemo
//
//  Created by wangdan on 15/5/21.
//
//


#import "ISEConfig.h"
#import "iflyMSC/iflyMSC.h"

@implementation ISEConfig

-(id)init {
    self = [super init];
    if (self) {
        [self defaultSetting];
    }
    return self;
}

+(ISEConfig*)sharedInstance {
    static ISEConfig *instance = nil;
    static dispatch_once_t predict;
    dispatch_once(&predict, ^{
        instance = [[ISEConfig alloc] init];
    });
    return  instance;
    
}


//NSString* const KCCategorySentence=@"read_sentence";
//NSString* const KCCategoryWord=@"read_word";
//NSString* const KCCategorySyllable=@"read_syllable";

-(void)defaultSetting {
    self.language=@"zh_cn";
    self.category=@"read_sentence";
    self.rstLevel=@"complete";
    self.vadBos=@"5000";
    self.vadEos=@"1800";
    self.speechTimeout=@"-1";
    self.sampleRate = @"16000";
    
    _questionStyleArray = @[@"句子", @"词语", @"单字"];
    _questionIdentifierArray = @[@"read_sentence", @"read_word", @"read_syllable"];
    
}


+(NSString *)sentence {
    return @"read_sentence";
}

+(NSString *)word {
    return @"read_word";
}

+(NSString *)singleChar {
    return @"read_syllable";
}

-(NSString *)toString {
    
    NSString *strIseParams = [[NSString alloc] init] ;
    
    if (self.language && [self.language length] > 0) {
        strIseParams = [strIseParams stringByAppendingFormat:@",%@=%@", [IFlySpeechConstant LANGUAGE], self.language];
    }
    
    if (self.category && [self.category length] > 0) {
        strIseParams = [strIseParams stringByAppendingFormat:@",%@=%@", [IFlySpeechConstant ISE_CATEGORY], self.category];
    }
    if (self.rstLevel && [self.rstLevel length] > 0) {
        strIseParams = [strIseParams stringByAppendingFormat:@",%@=%@", [IFlySpeechConstant ISE_RESULT_LEVEL], self.rstLevel];
    }
    
    if (self.vadBos && [self.vadBos length] > 0) {
        strIseParams = [strIseParams stringByAppendingFormat:@",%@=%@", [IFlySpeechConstant VAD_BOS], self.vadBos];
    }
    
    if (self.vadEos && [self.vadEos length] > 0) {
        strIseParams = [strIseParams stringByAppendingFormat:@",%@=%@", [IFlySpeechConstant VAD_EOS], self.vadEos];
    }
    
    if (self.speechTimeout && [self.speechTimeout length] > 0) {
        strIseParams = [strIseParams stringByAppendingFormat:@",%@=%@", [IFlySpeechConstant SPEECH_TIMEOUT], self.speechTimeout];
    }
    
    return strIseParams;
    
}

@end

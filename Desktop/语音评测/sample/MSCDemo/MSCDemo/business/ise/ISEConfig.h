//
//  ISEConfig.h
//  MSCDemo
//
//  Created by wangdan on 15/5/21.
//
//

#import <Foundation/Foundation.h>

@interface ISEConfig : NSObject


+(ISEConfig*)sharedInstance;

@property (nonatomic, strong) NSString *language;//评测语言，汉语，英语
@property (nonatomic, strong) NSString *category;//评测题型，句子，词语，单字
@property (nonatomic, strong) NSString *rstLevel;//评测等级，这个不用显示
@property (nonatomic, strong) NSString *speechTimeout;
@property (nonatomic, strong) NSString *vadEos;
@property (nonatomic, strong) NSString *vadBos;
@property (nonatomic, strong) NSString *sampleRate;
@property (nonatomic, strong) NSArray *questionStyleArray;
@property (nonatomic, strong) NSArray *questionIdentifierArray;

-(void)defaultSetting;//默认设置

-(NSString *)toString;

+(NSString *)sentence;

+(NSString *)word;

+(NSString *)singleChar;

@end

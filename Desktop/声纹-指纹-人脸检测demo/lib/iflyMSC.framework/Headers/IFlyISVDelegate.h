//
//  IFlyISVDelegate.h
//  msc_UI
//
//  Created by admin on 14-9-15.
//  Copyright (c) 2014年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFlySpeechError.h"

/**
 * IFlyISVDelegate
 */

@protocol IFlyISVDelegate

/**
 * onResult
 * dic:声纹结果
 */
-(void) onResult:(NSDictionary *)dic;

/**
 * onError
 * errorCode:错误信息
 *      _errorCode:错误码，0表示正常，非0表示错误
 *      _errorType:错误类型
 */
-(void) onError:(IFlySpeechError *) errorCode;

@optional


/**
 * onRecognition
 * 结束录音，正在识别中
 */
-(void) onRecognition;


/**
 * onVolumeChanged
 * 录音音量：0-30
 */
-(void) onVolumeChanged: (int)volume;

@end
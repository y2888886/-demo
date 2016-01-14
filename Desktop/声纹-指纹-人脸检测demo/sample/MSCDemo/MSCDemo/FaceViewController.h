//
//  FaceViewController.h
//  MSCDemo_UI
//
//  Created by Yallen on 16/1/14.
//
//

#import <UIKit/UIKit.h>
#import "UIImage+fixOrientation.h"
#import <CoreImage/CoreImage.h>
#import <CoreImage/CoreImage.h>
#import <QuartzCore/QuartzCore.h>
#import <ImageIO/ImageIO.h>
#import "GPUImage.h"
@interface FaceViewController : UIViewController<AVCaptureVideoDataOutputSampleBufferDelegate>

{
    AVCaptureSession *_session;
    AVCaptureDeviceInput *_captureInput;
    AVCaptureStillImageOutput *_captureOutput;
    AVCaptureVideoPreviewLayer *_preview;
    AVCaptureDevice *_device;
    
    UIView* m_highlitView[100];
    CGAffineTransform m_transform[100];
}


@end

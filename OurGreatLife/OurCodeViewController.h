//
//  OurCodeViewController.h
//  OurGreatLife
//
//  Created by 兴哥哥 on 2016/11/21.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import "OurBaesViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface OurCodeViewController : OurBaesViewController
{
    
    int num;
    BOOL upOrdown;
    NSTimer * timer;
}
@property (strong,nonatomic)AVCaptureDevice * device;
@property (strong,nonatomic)AVCaptureDeviceInput * input;
@property (strong,nonatomic)AVCaptureMetadataOutput * output;
@property (strong,nonatomic)AVCaptureSession * session;
@property (strong,nonatomic)AVCaptureVideoPreviewLayer * preview;
@property (nonatomic, retain) UIImageView * line;

@end

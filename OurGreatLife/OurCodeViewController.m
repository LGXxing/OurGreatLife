//
//  OurCodeViewController.m
//  OurGreatLife
//
//  Created by 兴哥哥 on 2016/11/21.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import "OurCodeViewController.h"

@interface OurCodeViewController ()<AVCaptureMetadataOutputObjectsDelegate>
{
    CGRect _lineFrameAfterAutoresizing;
}


@end

@implementation OurCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"来扫我";
    self.view.backgroundColor =[UIColor clearColor];
    UIImageView *codeImage= [[UIImageView alloc]initWithFrame:CGRectMake((SCREENWIDTH-280*default_scale)/2, 120*default_scale, 280*default_scale, 280*default_scale)];
    codeImage.image =[UIImage imageNamed:@"pick_bg"];
    [self.view addSubview:codeImage];
    
    UILabel * labCode =[[UILabel alloc]initWithFrame:CGRectMake(25*default_scale, 430*default_scale, SCREENWIDTH-50*default_scale, 50*default_scale)];
    labCode.textAlignment = 1;
    labCode.text = @"将二维码/条码放入框内，即可自动扫描。";
    labCode.textColor =[UIColor whiteColor];
    labCode.font = [UIFont systemFontOfSize:14.0];
    [self.view addSubview:labCode];
    [self setUpCermar];
    upOrdown = NO;
    num =0;

    _line = [[UIImageView alloc] initWithFrame:CGRectMake((SCREENWIDTH-280*default_scale)/2, 120*default_scale, 280*default_scale, 2*default_scale)];
    _line.image = [UIImage imageNamed:@"line.png"];
    
    _line.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [self.view addSubview:_line];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(animation1) userInfo:nil repeats:YES];
    
    // Do any additional setup after loading the view.
}
- (void)setUpCermar
{
    // Device
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Input
    _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    // Output
    _output = [[AVCaptureMetadataOutput alloc]init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    CGFloat screenHeight = self.view.bounds.size.height;//[UIScreen mainScreen].bounds.size.height;
    CGFloat screenWidth = self.view.bounds.size.width;//[UIScreen mainScreen].bounds.size.width;
    
    [_output setRectOfInterest:CGRectMake(114*default_scale/screenHeight, ((self.view.bounds.size.width - 280*default_scale)/2.0f)/screenWidth, 280*default_scale/screenHeight, 280*default_scale/screenWidth)];
    
    // Session
    _session = [[AVCaptureSession alloc]init];
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:self.input])
    {
        [_session addInput:self.input];
    }
    
    if ([_session canAddOutput:self.output])
    {
        [_session addOutput:self.output];
    }
    
    // 条码类型 AVMetadataObjectTypeQRCode
    _output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode];
    
    // Preview
    _preview =[AVCaptureVideoPreviewLayer layerWithSession:self.session];
    _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _preview.frame = self.view.layer.bounds;
    [self.view.layer insertSublayer:self.preview atIndex:0];

    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    //self.navigationController.navigationBar.barTintColor = [UIColor clearColor];
    _lineFrameAfterAutoresizing = _line.frame;
    // Start
    [_session startRunning];
}

-(void)animation1
{
    if (upOrdown == NO) {
        num ++;
        _line.frame = CGRectMake((SCREENWIDTH-280*default_scale)/2, _lineFrameAfterAutoresizing.origin.y+2*num, 280*default_scale, 2);
        if (2*num == 300) {
            upOrdown = YES;
        }
    }
    else {
        num --;
        _line.frame = CGRectMake((SCREENWIDTH-280*default_scale)/2, _lineFrameAfterAutoresizing.origin.y+2*num, 280*default_scale, 2);
        if (num == 0) {
            upOrdown = NO;
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    NSString *stringValue;
    if ([metadataObjects count] >0){
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
        
        [_session stopRunning];
        
        //[self QRCodeScanSuccess:stringValue];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

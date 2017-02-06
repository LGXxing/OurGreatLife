//
//  OurMyCodeSanViewController.m
//  OurGreatLife
//
//  Created by 兴哥哥 on 2016/11/28.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import "OurMyCodeSanViewController.h"
#import "KNQRCodeView.h"
#import <AssetsLibrary/AssetsLibrary.h>
@interface OurMyCodeSanViewController ()
{
    
    UITextField *_textField;
    UIImageView *_icon;
    
    UIImage *_QRCodeImg; // 用于生出二维码的图片 ... 从相册或相机中选择
    BOOL _hasImg;
    
    KNQRCodeView *_QRCodeView;
}

@end

@implementation OurMyCodeSanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"专属二维码";
    [self initUI];
    
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(enterehzFilesVC:) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"friend_cycle_send_right_bar_press"] forState:UIControlStateNormal];
    
    [informationCardBtn sizeToFit];
    
    UIButton *informationCard = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCard addTarget:self action:@selector(enterehzFilesVC:) forControlEvents:UIControlEventTouchUpInside];
    [informationCard setImage:[UIImage imageNamed:@"friend_cycle_send_right_bar_press"] forState:UIControlStateNormal];
    
    [informationCard sizeToFit];

    
    
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    UIBarButtonItem *informationCard2Item = [[UIBarButtonItem alloc] initWithCustomView:informationCard];
    
    
    UIBarButtonItem *fixedSpaceBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpaceBarButtonItem.width = 10;
    
    
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingBtn addTarget:self action:@selector(enterTeamCard:) forControlEvents:UIControlEventTouchUpInside];
    [settingBtn setImage:[UIImage imageNamed:@"friend_cycle_send_right_bar_press"] forState:UIControlStateNormal];
    [settingBtn sizeToFit];
    UIBarButtonItem *settingBtnItem = [[UIBarButtonItem alloc] initWithCustomView:settingBtn];
    
    
    
    self.navigationItem.rightBarButtonItems  = @[informationCard2Item,fixedSpaceBarButtonItem,informationCardItem,fixedSpaceBarButtonItem,settingBtnItem];
    
    
    // Do any additional setup after loading the view.
}
- (void)initUI
{
    UITextField * textFile =[[UITextField alloc]initWithFrame:CGRectMake(50, 100, SCREENWIDTH-100, 30)];
    textFile.textColor = [UIColor redColor];
    textFile.placeholder = @" 点我生成你的专属二维码";
    textFile.layer.borderColor = [UIColor darkGrayColor].CGColor;
    textFile.layer.masksToBounds = YES;
    textFile.layer.cornerRadius = 2;
    textFile.layer.borderWidth = 0.7;
    _textField = textFile;
    [self.view addSubview:textFile];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"生成" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.layer.borderWidth = 0.8;
    button.layer.borderColor = [UIColor yellowColor].CGColor;
    [button setFrame:CGRectMake(CGRectGetMaxX(textFile.frame) - 50, CGRectGetMaxY(textFile.frame)+20, 50, 25)];
    [button addTarget:self action:@selector(codeSan) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    
    UIImageView * imageView =[UIImageView new];
    imageView.frame = CGRectMake(100, CGRectGetMaxY(textFile.frame)+80, 220, 220);
    [self.view addSubview:imageView];
    
    
}
#pragma mark 取消 键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
//    [_QRCodeView removeFromSuperview];
//    _QRCodeView = nil;
}

- (void)codeSan
{
    
    if(_textField.text.length == 0){
        return;
    }
    UIImage *img;
    
    if(_hasImg){
        img = _icon.image;
    }else{
        img = nil;
    }
    
    KNQRCodeView *qrCodeView = [KNQRCodeView QRCodeViewWithContent:_textField.text image:img frame:CGRectMake(self.view.frame.size.width * 0.5 - 150, self.view.frame.size.height * 0.5 - 150, 300, 300)];
    [qrCodeView addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(qrCodeView:)]];
    _QRCodeView = qrCodeView;
    [self.view addSubview:qrCodeView];
    
}
// 写入相册
- (void)qrCodeView:(UILongPressGestureRecognizer *)longGestureRecognizer{
    if(longGestureRecognizer.state == UIGestureRecognizerStateBegan){
        UIImageView *imageView = (UIImageView *)longGestureRecognizer.view;
        ALAssetsLibrary *asset = [[ALAssetsLibrary alloc] init];
        [asset writeImageToSavedPhotosAlbum:[imageView.image CGImage] orientation:ALAssetOrientationRight completionBlock:nil];
        
        [_QRCodeView removeFromSuperview];
        _QRCodeView = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

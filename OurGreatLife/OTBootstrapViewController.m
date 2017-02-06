//
//  OTBootstrapViewController.m
//  Opportunity
//
//  Created by 张旭东 on 16/8/31.
//  Copyright © 2016年 MyCompany. All rights reserved.
//
//开机启动图
#import "OTBootstrapViewController.h"
#import "DWScrollPictures.h"
#import "OurFirstViewController.h"
//#import "Goble.h"

@interface OTBootstrapViewController ()<DWScrollerPictureDelegate>
@property (strong, nonatomic) DWScrollPictures *features;

@end

@implementation OTBootstrapViewController

- (DWScrollPictures *)features {
    
    if (!_features) {
        
        _features = [[DWScrollPictures alloc] init];
    }
    return _features;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.features dw_SetNewFeaturesView:self.view delegate:self imageName:@[@"s1.jpg",@"s2.jpg",@"s3.jpg",@"s4.jpg"] pageImageView:^(UIView *pageImageView, int imageCount, int imageAllCount) {
        //最后一张图片，添加按钮
        if (imageCount == imageAllCount) {
            pageImageView.userInteractionEnabled = YES;
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];

            [btn setBackgroundImage:[UIImage imageNamed:@"btn_taste.png"] forState:UIControlStateNormal];
            [btn setTranslatesAutoresizingMaskIntoConstraints:NO];
            [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
            [pageImageView addSubview:btn];
            
            [pageImageView addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:pageImageView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
            
            //[pageImageView addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:pageImageView attribute:NSLayoutAttributeBottom multiplier:1 constant:-50 *default_scale]];
            
            [pageImageView addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:170]];
//            
            [pageImageView addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40]];

        }
        
    
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dw_nowPageCount:(double)pageCount imageAllCount:(NSInteger)imageAllCount{
    
    //最后一张新特性图片
    if (pageCount > imageAllCount) {
    }
    
}

- (void)click {
    
    //跳转到首页控制器
  
    
    self.mainViewCtrl.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    OurTabBarViewController *tabbar =[OurTabBarViewController new];
    
    
    [self presentViewController:tabbar animated:YES completion:nil];
    [self removeFromParentViewController];
    
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

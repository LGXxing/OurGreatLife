//
//  OurBaesViewController.m
//  OurGreatLife
//
//  Created by 兴哥哥 on 2016/11/18.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import "OurBaesViewController.h"
#import "OTNavigationViewController.h"
#import "OurFirstViewController.h"
@interface OurBaesViewController ()
{
    
    UIView *m_titleView;
}
@end

@implementation OurBaesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    indicator = [[YYAnimationIndicator alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-40, self.view.frame.size.height/2-40, 80, 80)];
    [indicator setLoadText:@"正在加载..."];
    [self.view addSubview:indicator];
    
    if(![self.navigationController.viewControllers.firstObject isEqual:self]){
        [self addBackBarItem];
        self.navigationController.interactivePopGestureRecognizer.delegate=(id)self;
    }

   
    self.navigationController.navigationBar.barTintColor =[UIColor redColor];
    
    // Do any additional setup after loading the view.
}
-(void)addBackBarItem{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"取消"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backButtonPressed)];
    
    self.navigationItem.leftBarButtonItem = backItem;
}

//导航栏
-(void)addTitleView{
    m_titleView = [[UIView alloc] init];
    [m_titleView setTranslatesAutoresizingMaskIntoConstraints:NO];
    m_titleView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:m_titleView];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|" options:kNilOptions metrics:nil views:@{@"view":m_titleView}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view(64)]" options:kNilOptions metrics:nil views:@{@"view":m_titleView}]];
    
    
    UILabel *m_titleLabel = [[UILabel alloc] init];
    [m_titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    m_titleLabel.font = [UIFont systemFontOfSize:18];
    m_titleLabel.textColor = [UIColor whiteColor];
    m_titleLabel.textAlignment = NSTextAlignmentCenter;
    m_titleLabel.text = self.title;
    [m_titleView addSubview:m_titleLabel];
    
    UIButton *m_backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [m_backBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [m_backBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [m_backBtn addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [m_titleView addSubview:m_backBtn];
    
    [m_titleView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[titleLabel]-0-|" options:kNilOptions metrics:nil views:@{@"titleLabel":m_titleLabel}]];
    
    [m_titleView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[back]-0-|" options:kNilOptions metrics:nil views:@{@"back":m_backBtn}]];
    
    [m_titleView addConstraint:[NSLayoutConstraint constraintWithItem:m_backBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50]];
    
    [m_titleView addConstraint:[NSLayoutConstraint constraintWithItem:m_titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:m_titleView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    [m_titleView addConstraint:[NSLayoutConstraint constraintWithItem:m_backBtn attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:m_titleView attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
    
}

-(void)backButtonPressed{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)hideTitleView:(BOOL)hide{
    m_titleView.hidden = hide;
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

//
//  OurTabBarViewController.m
//  OurGreatLife
//
//  Created by 兴哥哥 on 2016/11/18.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import "OurTabBarViewController.h"
#import "OurRememberViewController.h"
#import "OurYouthViewController.h"
#import "OurFirstViewController.h"
#import "OurLongViewController.h"
#import "OurCuteViewController.h"
#import "OTNavigationViewController.h"
@interface OurTabBarViewController ()<UITabBarControllerDelegate>
{
OTNavigationViewController *activityNav;//首页
OTNavigationViewController *messageNav;//消息
OTNavigationViewController *releaseNav;//路演
OTNavigationViewController *diaoYanNav;//调研
OTNavigationViewController *emptyNav;//发布需求
OTNavigationViewController *lastNav;//记录用的
OTNavigationViewController *mineNav;//我的
OTNavigationViewController *opportunityNav;//机会
}
@end

@implementation OurTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //首页
    OurFirstViewController *activityViewCtrl = [[OurFirstViewController alloc]init];
    activityNav = [[OTNavigationViewController alloc]initWithRootViewController:activityViewCtrl];
    UITabBarItem *activityItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"ic_main_normal.png"] selectedImage:[[UIImage imageNamed:@"ic_main_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    activityNav.tabBarItem = activityItem;
    activityItem.tag = 0;
    [self addAttributes:activityNav];
    //青春
    OurYouthViewController *messageViewCtrl = [[OurYouthViewController alloc] init];
    messageNav = [[OTNavigationViewController alloc] initWithRootViewController:messageViewCtrl];
    UITabBarItem *messageItem = [[UITabBarItem alloc]initWithTitle:@"青春" image:[UIImage imageNamed:@"ic_message_normal.png"] selectedImage:[[UIImage imageNamed:@"ic_message_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    messageNav.tabBarItem = messageItem;
    [self addAttributes:messageNav];
    //记忆
    OurRememberViewController *releaseViewCtrl = [[OurRememberViewController alloc] init];
    releaseNav = [[OTNavigationViewController alloc] initWithRootViewController:releaseViewCtrl];
    UITabBarItem *releaseItem = [[UITabBarItem alloc] initWithTitle:@"记忆" image:[[UIImage imageNamed:@"ic_release.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"ic_release.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    releaseNav.tabBarItem = releaseItem;
    [self addAttributes:releaseNav];
    
    
    
    //永恒
    OurLongViewController *opportunityViewCtrl = [[OurLongViewController alloc] init];
    opportunityNav = [[OTNavigationViewController alloc]initWithRootViewController:opportunityViewCtrl];
    UITabBarItem *opportunityItem = [[UITabBarItem alloc]initWithTitle:@"永恒" image:[UIImage imageNamed:@"ic_opportunity_normal.png"] selectedImage:[[UIImage imageNamed:@"ic_opportunity_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    opportunityNav.tabBarItem = opportunityItem;
    [self addAttributes:opportunityNav];
    //卖萌
    OurCuteViewController *mineViewCtrl = [[OurCuteViewController alloc] init];
    mineNav = [[OTNavigationViewController alloc] initWithRootViewController:mineViewCtrl];
    UITabBarItem *mineItem = [[UITabBarItem alloc]initWithTitle:@"卖萌" image:[UIImage imageNamed:@"ic_mine_normal.png"] selectedImage:[[UIImage imageNamed:@"ic_mine_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    mineNav.tabBarItem = mineItem;
    [self addAttributes:mineNav];
    
    
    
    self.delegate = self;
    
    self.tabBar.tintColor = [UIColor grayColor];
    //文字颜色
    [releaseItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                         [UIColor grayColor ], NSForegroundColorAttributeName,
                                         nil] forState:UIControlStateNormal];
    
    
    [releaseItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                         [UIColor redColor], NSForegroundColorAttributeName,
                                         nil] forState:UIControlStateSelected];
    
   
    
    
    lastNav = activityNav;
    //下边距
    [activityItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    [opportunityItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    [messageItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    [mineItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    [releaseItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
   
    
    
    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.translucent = NO;
    self.viewControllers = @[activityNav,messageNav,releaseNav,opportunityNav,mineNav];
    
    //隐藏分割线
    [self.tabBar setShadowImage:[[UIImage alloc] init]];
    [self.tabBar setBackgroundImage:[[UIImage alloc]init]];
    //添加阴影效果
    self.tabBar.shadowImage = [[UIImage alloc] init];
    self.tabBar.layer.shadowColor = [[UIColor redColor] CGColor];
    self.tabBar.layer.shadowOpacity = 0.2f;
    self.tabBar.layer.shadowOffset = CGSizeMake(0, -2.5f);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addAttributes:(UINavigationController *)nav{
    
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav.png"] forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
    //    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav.png"] forBarMetrics:UIBarMetricsDefault];
    nav.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName : [UIColor whiteColor]};
    nav.navigationBar.tintColor = [UIColor whiteColor];
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

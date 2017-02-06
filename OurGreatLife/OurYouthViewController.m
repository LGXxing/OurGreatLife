//
//  OurYouthViewController.m
//  OurGreatLife
//
//  Created by 兴哥哥 on 2016/11/18.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import "OurYouthViewController.h"
#import "KxMenu.h"
#import "OurBaesViewController.h"
#import "OurMoreYoungViewController.h"

@interface OurYouthViewController ()<GUITabPagerDataSource, GUITabPagerDelegate>

@property (nonatomic,assign) BOOL flag;

@end

@implementation OurYouthViewController
{
    NSArray *_dataArray;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.delegate =self;
    self.dataSource = self;
    
    
    self.title = @"青春";
    self.view.backgroundColor = [UIColor whiteColor];
    [self rightBar];
    // Do any additional setup after loading the view.
}
- (NSInteger)numberOfViewControllers {
    return 8;
}

- (UIViewController *)viewControllerForIndex:(NSInteger)index {
    OurMoreYoungViewController *vc = [OurMoreYoungViewController new];
    vc.index = index;
    return vc;
}
- (NSString *)titleForTabAtIndex:(NSInteger)index {
    
    NSArray * titltArray =@[@"神剑山庄",@"笑傲江湖",@"天龙八部",@"水浒传",@"隋唐演义",@"三国演义",@"七侠五义",@"小李飞刀"];
    
    return titltArray[index];
}

- (CGFloat)tabHeight {
    // Default: 44.0f
    return 40.0f;
}

- (UIColor *)tabColor {
    // Default: [UIColor orangeColor];
    return [UIColor redColor];
}

- (UIColor *)tabBackgroundColor {
    // Default: [UIColor colorWithWhite:0.95f alpha:1.0f];
    return [UIColor lightTextColor];
}

- (UIFont *)titleFont {
    // Default: [UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0f];
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:18.0f];
}

- (UIColor *)titleColor {
    // Default: [UIColor blackColor];
    return [UIColor blackColor];
}

#pragma mark - Tab Pager Delegate

- (void)tabPager:(GUITabPagerViewController *)tabPager willTransitionToTabAtIndex:(NSInteger)index {
   // NSLog(@"Will transition from tab %ld to %ld", [self selectedIndex], (long)index);
}

- (void)tabPager:(GUITabPagerViewController *)tabPager didTransitionToTabAtIndex:(NSInteger)index {
    NSLog(@"Did transition to tab %ld", (long)index);
}

- (void)rightBar
{
    
    UIBarButtonItem *rightButton =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"pg_serve_gray"] style:UIBarButtonItemStylePlain target:self action:@selector(moreButton:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    
    
}

- (void)moreButton:(UIButton *)sender
{
    
    
    

    
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

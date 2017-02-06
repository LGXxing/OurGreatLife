//
//  OurFansViewController.m
//  OurGreatLife
//
//  Created by 兴哥哥 on 2016/11/24.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import "OurFansViewController.h"

@interface OurFansViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchResultsUpdating,UISearchControllerDelegate>

@end

@implementation OurFansViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的粉丝团";
    self.L_fansTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.L_fansTableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.L_fansTableView.delegate = self;
    self.L_fansTableView.dataSource = self;
    [self.view addSubview:self.L_fansTableView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tableView]-0-|" options:kNilOptions metrics:nil views:@{@"tableView":self.L_fansTableView}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-64-[tableView]-0-|" options:kNilOptions metrics:nil views:@{@"tableView":self.L_fansTableView}]];
    UISearchController * searchVc =[[UISearchController alloc]initWithSearchResultsController:nil];
    searchVc.searchBar.placeholder = @"搜索";
    //searchVc.searchResultsUpdater = self;
    searchVc.dimsBackgroundDuringPresentation = NO;
    searchVc.hidesNavigationBarDuringPresentation = NO;
   
    searchVc.searchBar.delegate = self;
    searchVc.delegate = self;
    searchVc.searchBar.frame = CGRectMake(0, 0, 0, 44);
    self.L_fansTableView.tableHeaderView = searchVc.searchBar;

   
    
    // Do any additional setup after loading the view.
}
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController;
{
    
    
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar;
{
    
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 108;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 120;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"cell";
    
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    return cell;
    
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

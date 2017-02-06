//
//  OurFirstViewController.m
//  OurGreatLife
//
//  Created by 兴哥哥 on 2016/11/18.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import "OurFirstViewController.h"
#import "LBBanner.h"
#import "OurCodeViewController.h"
#import "WSShiningLabel.h"
#import "OurWebViewController.h"
#import "MJRefreshGifHeader.h"
#import "OurMainTableViewCell.h"


@interface OurFirstViewController ()<UITableViewDelegate,UITableViewDataSource,LBBannerDelegate>
{
    
    UIView * L_heardView;
     LBBanner * banner;//轮播图
    MJRefreshGifHeader * headFresh;
   
}

@end

@implementation OurFirstViewController
- (void)viewWillAppear:(BOOL)animated
{
    [self rightBar];
    [self leftBar];
   
    [super viewWillAppear:YES];
   }
- (void)viewDidLoad {
//    self.showStatusBar = NO;
//    [self.navigationController setNavigationBarHidden:YES];
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor cyanColor];
    self.L_tablerView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
     [self.L_tablerView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.L_tablerView.delegate  = self;
    self.L_tablerView.dataSource = self;
       self.L_tablerView .backgroundColor =[UIColor whiteColor];
     [self.view addSubview:_L_tablerView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tableView]-0-|" options:kNilOptions metrics:nil views:@{@"tableView":_L_tablerView}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-64-[tableView]-0-|" options:kNilOptions metrics:nil views:@{@"tableView":_L_tablerView}]];
    
    L_heardView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 220)];
    L_heardView.backgroundColor =[UIColor redColor];
    _L_tablerView.tableHeaderView = L_heardView;
    
    headFresh  = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        [self gotoSuccess];
        
    }];
//    NSArray*imageArray =[NSArray arrayWithObjects:@"personal_refresh_loading21@2x",@"personal_refresh_loading22@2x", nil];
//    //[headFresh setImages:imageArray forState:MJRefreshStateIdle];
//    [headFresh setImages:imageArray forState:MJRefreshStatePulling];
     _L_tablerView.mj_header = headFresh;
    
   
    [headFresh beginRefreshing];
   
    UIImageView* m_imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_cover_banner.png"]];
    //m_imageView.frame =CGRectMake(1, 1, 388, 200);
    [m_imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [L_heardView addSubview:m_imageView];
    
    [L_heardView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:kNilOptions metrics:nil views:@{@"image":m_imageView}]];
    
    [L_heardView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:kNilOptions metrics:nil views:@{@"image":m_imageView}]];
    NSMutableArray * L_imageArray = [NSMutableArray arrayWithObjects:@"wKgAvFRjj2yEPe4EAAAAAHSzL4k002.jpg",@"2944742723.jpeg",@"IMG_2647.jpg",@"u=3899228470,343605214&fm=23&gp=0.jpg",@"u=1336695992,2911056425&fm=23&gp=0.jpg",@"c53989abjw1e6z4ormvgpj20f007840z.jpg",@"5034ca36f1be7.jpg",nil];
    
    if(banner == nil){
        
        banner = [[LBBanner alloc] initWithImageNames:L_imageArray andFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,220)];
        //[banner showTitleWithTitles:@[@"~~~~~云台行~~~~~", @"~~~~~少林行~~~~~", @"~~~~~嵩山行~~~~~", @"~~~~~开封行~~~~~"]];
        
        banner.delegate = self;
        banner.pageTurnTime = 3;
        [L_heardView addSubview:banner];
    }else{
        
        [banner setImageNames:L_imageArray];
         [L_heardView addSubview:banner];
       
    }
    [L_heardView bringSubviewToFront:m_imageView];

    //添加监听者
    //[_L_tablerView addObserver: self forKeyPath: @"contentOffset" options: NSKeyValueObservingOptionNew context: nil];
    
    // Do any additional setup after loading the view.
}
- (void)gotoSuccess
{
     [self performSelector:@selector(fresh) withObject:nil afterDelay:1];
    
}
- (void)fresh
{
    
    [headFresh endRefreshing];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    CGFloat offset = _L_tablerView.contentOffset.y;
    CGFloat delta = offset / 180.f + 0.0f;
    delta = MAX(0, delta);
    self.navigationController.navigationBar.alpha = MIN(1, delta);
    
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
//- (BOOL)prefersStatusBarHidden
//{
//    if (self.showStatusBar ==YES) {
//        return NO;
//    }else if (self.showStatusBar ==NO){
//    return YES;
//    }return nil;
//}

#pragma mark 表的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 0.00001;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
   
   
    WSShiningLabel *lgxLab = [[WSShiningLabel alloc] init];
     lgxLab.text = @"  岁月是把杀猪刀，改变了我们模样";
    lgxLab.textColor = [UIColor cyanColor];
    lgxLab.font = [UIFont systemFontOfSize:18];
    [lgxLab startShimmer];
    lgxLab.shimmerType = ST_ShimmerAll;
    lgxLab.durationTime = 0.8;
    lgxLab.shimmerColor = [UIColor redColor];// 开启闪烁
    [self.view addSubview:lgxLab];

   
    
    return lgxLab;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 220*default_scale;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifiter = @"cell";
    OurMainTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:identifiter];
    if (!cell) {
        cell = [[OurMainTableViewCell alloc]initWithMainFirstIdentifier:identifiter];
    }
    cell.iconImage.image = [UIImage imageNamed:@"5160.jpg"];
    cell.nameLable.text = @"三少爷的剑";
    cell.instrLable.text = @"剑气纵横三万里，一剑光寒十九洲”，神剑山庄三少爷谢晓峰惊才绝艳，十年来历经上千大战未尝一败,被天下人尊为“剑神”。传奇剑客燕十）一直以谢晓峰为目标，苦修剑道，终于在生死边缘悟出惊天地泣鬼神的“绝命十三剑”。一时之间，江湖沸腾，然而，就在燕十三赶到神剑山庄下战书的时候，迎接他的，却是三少爷谢晓峰的灵柩。燕十三因痛失对手大感失望，此时神秘女子慕容秋荻出现并告知燕十三，谢晓峰并没有死，要想找到他决战，燕十三就必须要替她杀一个人";
    cell.mainImage.image = [UIImage imageNamed:@"981477617867109.jpg"];
    cell.timeLable.text = @"2017-12.12";
    cell.loveLable.text = @"❤️ 100%";
    return  cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//轮播图代理 选择哪种类型的点击事件
#pragma mark - LBBannerDelegate
-(void)banner:(LBBanner *)banner didClickViewWithIndex:(NSInteger)index{
    
    OurWebViewController * web = [OurWebViewController new];
    web.L_url = @"http://user.qzone.qq.com/546589732/4";
    web.hidesBottomBarWhenPushed =YES;
    [self.navigationController pushViewController:web animated:YES];

    
    
}
- (void)banner:(LBBanner *)banner didChangeViewWithIndex:(NSInteger)index {
   
   }
- (void)rightBar
{
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(code)];
    [rightButton setImage:[UIImage imageNamed:@"扫码"]];
    //[rightButton setImageInsets:UIEdgeInsetsMake(10, 10, -10, -10)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
}
- (void)leftBar
{
    
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(weather)];
       [leftButton setImage:[UIImage imageNamed:@"xx1"]];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    
}
- (void)code
{
    
    OurCodeViewController * codeVc =[OurCodeViewController new];
    codeVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:codeVc animated:YES];
}
- (void)weather
{
    OurWebViewController * webVc =[[OurWebViewController alloc]init];
    webVc.L_url = @"http://wx.weather.com.cn/mweather/101191101.shtml#1";
    webVc.hidesBottomBarWhenPushed = YES;
    webVc.title = @"天气";
    [self.navigationController pushViewController:webVc animated:YES];
    
    
    
    
}
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    CGFloat alpha = scrollView.contentOffset.y / 20 ;
//    if (alpha >=1) {
//         [self.navigationController setNeedsStatusBarAppearanceUpdate];
//        self.showStatusBar = YES;
//        [self.navigationController setNavigationBarHidden:NO];
//    }else{
//         [self.navigationController setNeedsStatusBarAppearanceUpdate];
//        self.showStatusBar =NO;
//        [self.navigationController setNavigationBarHidden:YES];
//    }
//   
//}

-(void)dealloc
{
   
    [_L_tablerView removeObserver:self forKeyPath:@"contentOffset" context:nil];
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

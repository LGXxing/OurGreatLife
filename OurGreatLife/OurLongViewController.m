//
//  OurLongViewController.m
//  OurGreatLife
//
//  Created by 兴哥哥 on 2016/11/18.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import "OurLongViewController.h"
#import "OurWebViewController.h"
#import "OToppCollectcell.h"
#import "CustomMenuView.h"
#import "MenuView.h"
@interface OurLongViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CustomMenuViewDelegate>
{
    
    MenuView *menuView;//右边筛选
}
@end

@implementation OurLongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"永恒";
    self.view.backgroundColor = [UIColor greenColor];
    [self setUI];
    [self leftBar];
    [self addSideMenuView];
    // Do any additional setup after loading the view.
}

- (void)leftBar
{
    UIBarButtonItem * leftBar =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"pg_serve_gray"] style:UIBarButtonItemStylePlain target:self action:@selector(menu:)];
    
    self.navigationItem.leftBarButtonItem = leftBar;
    
}
-(void)addSideMenuView{
    CustomMenuView *cView = [[CustomMenuView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height)];
    cView.delegate = self;
    menuView = [[MenuView alloc]initWithDependencyView:self.view MenuView:cView isShowCoverView:YES];
}

- (void)menu:(id)sender
{
    if(menuView){
        [menuView show];
    }

   }

-(void)screeningButtonPressed:(id)sender{
    
    }
#pragma mark - CustomMenuViewDelegate
//关闭菜单
-(void)didCloseMenu{
    if(menuView){
        [menuView hidenWithAnimation];
    }
}

//选择菜单
-(void)didSelectMenu:(NSInteger)index{
   }

- (void)setUI
{
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 5*default_scale;
    layout.scrollDirection = 0;
    UICollectionView *L_collectView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, 375*default_scale, SCREENHEIGHT-108) collectionViewLayout:layout];
    L_collectView.delegate =self;
    L_collectView.dataSource = self;
    L_collectView.backgroundColor = [UIColor whiteColor];
    [L_collectView registerClass:[OToppCollectcell class] forCellWithReuseIdentifier:@"cellid"];
    [self.view addSubview:L_collectView];
    
    
}

#pragma mark UIcollectView 代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    OToppCollectcell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    NSArray *array =[NSArray arrayWithObjects:@"1448782731_640x360.png",@"6277961675cf93e8446614c66001f8a0.jpg",@"5-17-19-2-443047402-2.jpg",@"01300000098168132125204980537.jpg",@"banner.jpg",@"25558PICPh8.jpg", nil];
    cell.instrImage.image = [UIImage imageNamed:array[indexPath.row]];
    
    
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(default_scale*375-10, 120*default_scale);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5*default_scale, 5*default_scale, 5*default_scale, 5*default_scale);
}
 - (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (indexPath.row ==0) {
        [self findNBASomething];
    }else if (indexPath.row ==1)
    {
        [self lolSomething];
    }else if (indexPath.row ==2)
    {
        [self carSomething];
        
    }else if (indexPath.row==3)
    {
        [self codeSomething];
        
    }else if (indexPath.row ==4)
    {
        
        [self movieSomething];
    }else if (indexPath.row ==5)
    {
        
        [self ticketSomething];
    }
    
    
}
- (void)carSomething
{
    OurWebViewController * webVc =[[OurWebViewController alloc]init];
    webVc.L_url = @"http://m.autohome.com.cn";
    webVc.title = @"汽车之家";
    webVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVc animated:YES];
}
- (void)movieSomething
{
    OurWebViewController * webVc =[[OurWebViewController alloc]init];
    webVc.L_url = @"http://m.yingshidaquan.cc";
    webVc.title = @"影视大全";
    webVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVc animated:YES];
}
- (void)lolSomething
{
    OurWebViewController * webVc =[[OurWebViewController alloc]init];
    webVc.L_url = @"http://lol.qq.com";
    webVc.title = @"lol";
    webVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVc animated:YES];
    
}

- (void)findNBASomething
{
    OurWebViewController * webVc =[[OurWebViewController alloc]init];
    webVc.L_url = @"http://sports.qq.com/nba/?ptag=baidu.ald.sc.nba";
    webVc.title = @"无兄弟，不篮球";
    webVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVc animated:YES];
    
}
- (void)ticketSomething
{
    OurWebViewController * webVc =[[OurWebViewController alloc]init];
    webVc.L_url = @"http://touch.lecai.com/static/event/2015/bd_aladdin/1/awardResult.html?phase=16138&agentId=5607";
    webVc.hidesBottomBarWhenPushed = YES;
     webVc.title = @"大乐透";
    [self.navigationController pushViewController:webVc animated:YES];
    
}
- (void)codeSomething
{
    OurWebViewController * webVc =[[OurWebViewController alloc]init];
    webVc.L_url = @"http://code4app.com";
    webVc.hidesBottomBarWhenPushed = YES;
    webVc.title = @"code4app";
    [self.navigationController pushViewController:webVc animated:YES];
    
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

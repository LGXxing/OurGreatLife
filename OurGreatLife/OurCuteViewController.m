//
//  OurCuteViewController.m
//  OurGreatLife
//
//  Created by 兴哥哥 on 2016/11/18.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import "OurCuteViewController.h"
#import "UIView+SDAutoLayout.h"
#import "OurFansViewController.h"
#import "OurMyCodeSanViewController.h"
#import "OurMyOwnViewController.h"
#import "OurLoveViewController.h"

@interface OurCuteViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    
    UIView * L_heardView;
    CALayer * ownlayer;
    UIButton * headBtn;
   
}


@end

@implementation OurCuteViewController
@synthesize L_tableView;
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    NSUserDefaults * userduef =[NSUserDefaults standardUserDefaults];
    NSData *data =[userduef objectForKey:@"data"];
    
    [headBtn setImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"私人定制";
    
    
    //self.navigationController.navigationBar.hidden =YES;
    self.view.backgroundColor = [UIColor whiteColor];
    self.L_tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.L_tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.L_tableView.delegate  = self;
    self.L_tableView.dataSource = self;
    self.L_tableView.backgroundColor =[UIColor clearColor];
    [self.L_tableView setContentOffset:CGPointMake(0, -270*default_scale) animated:NO];
    self.L_tableView.bouncesZoom = NO;
  
    
    self.L_tableView.contentInset = UIEdgeInsetsMake(270*default_scale, 0, 0, 0);
    L_heardView = [[UIView alloc]initWithFrame:CGRectMake(0, -270*default_scale, [UIScreen mainScreen].bounds.size.width, 270*default_scale)];
    L_heardView.tag = 101;
    L_heardView.backgroundColor =[UIColor redColor];
    UIImageView* m_imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_company_main_page.png"]];
   
    [m_imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [L_heardView addSubview:m_imageView];
    L_heardView.contentMode = UIViewContentModeScaleAspectFill;
    [L_heardView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:kNilOptions metrics:nil views:@{@"image":m_imageView}]];
    
    [L_heardView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:kNilOptions metrics:nil views:@{@"image":m_imageView}]];
    //L_tableView.tableHeaderView = L_heardView;
    [L_tableView addSubview:L_heardView];
      [self.view addSubview:L_tableView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tableView]-0-|" options:kNilOptions metrics:nil views:@{@"tableView":L_tableView}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-64-[tableView]-0-|" options:kNilOptions metrics:nil views:@{@"tableView":L_tableView}]];
    
    [self heardUi];

    // Do any additional setup after loading the view.
    
}
- (void)heardUi
{
   headBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    headBtn.layer.masksToBounds =YES;
    headBtn.layer.cornerRadius = 50*default_scale;
    headBtn.backgroundColor =[UIColor redColor];
    headBtn.layer.borderWidth = 2*default_scale;
    headBtn.layer.borderColor = Default_gray_CCCCCC.CGColor;
    NSUserDefaults * userduef =[NSUserDefaults standardUserDefaults];
    NSData *data =[userduef objectForKey:@"data"];

    [headBtn setImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
    [headBtn addTarget:self action:@selector(selectedSomething) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * nameLab =[UILabel new];
    nameLab.textColor = [UIColor whiteColor];
    nameLab.text = @"漯河一枝花";
    nameLab.textAlignment =1;
    nameLab.font = [UIFont systemFontOfSize:16*default_scale];
    
    UILabel * signLab =[UILabel new];
    signLab.textColor = [UIColor whiteColor];
    signLab.text = @"人生行乐须尽欢，岁月如风，常伴我心";
    signLab.textAlignment =1;
    signLab.font = [UIFont systemFontOfSize:16*default_scale];
    
    UIButton * friBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    friBtn.layer.masksToBounds =YES;
    friBtn.layer.cornerRadius = 5*default_scale;
    friBtn.backgroundColor =[UIColor blackColor];
    [friBtn setTitle:@"我的粉丝 >" forState:UIControlStateNormal];
    [friBtn setTitleColor:Default_gray_CCCCCC forState:UIControlStateNormal];
    friBtn.titleLabel.font = systemFontOfSize(15);
    friBtn.layer.borderWidth = 2*default_scale;
    friBtn.layer.borderColor =Default_gray_CCCCCC.CGColor;
    [friBtn addTarget:self action:@selector(findSomething) forControlEvents:UIControlEventTouchUpInside];
    [L_heardView sd_addSubviews:@[headBtn,nameLab,signLab,friBtn]];
    
    headBtn.sd_layout
    .topSpaceToView(L_heardView,20*default_scale)
    .leftSpaceToView(L_heardView,[UIScreen mainScreen].bounds.size.width/2-50*default_scale)
    .widthIs(100*default_scale)
    .heightIs(100*default_scale);
    
    nameLab.sd_layout
    .topSpaceToView(headBtn,10*default_scale)
    .centerXEqualToView(headBtn)
    .heightIs(30*default_scale)
    .widthIs(150*default_scale);
    
    signLab.sd_layout
    .topSpaceToView(nameLab,10*default_scale)
    .centerXEqualToView(nameLab)
    .heightIs(30*default_scale)
    .widthIs(320*default_scale);
    
    
    friBtn.sd_layout
    .topSpaceToView(signLab,10*default_scale)
     .centerXEqualToView(signLab)
    .widthIs(100*default_scale)
    .heightIs(30*default_scale);
    CAKeyframeAnimation *animation =[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 5;
    animation.values = @[[NSValue valueWithCGPoint:CGPointMake(60*default_scale, 90*default_scale)],[NSValue valueWithCGPoint:CGPointMake(80*default_scale, 90*default_scale)],[NSValue valueWithCGPoint:CGPointMake(80*default_scale, 120*default_scale)],[NSValue valueWithCGPoint:CGPointMake(60*default_scale, 120*default_scale)],[NSValue valueWithCGPoint:CGPointMake(60*default_scale, 90*default_scale)]];
    
    
    animation.repeatCount = FLT_MAX;
    animation.keyTimes = @[@(0),@(0.3),@(0.5),@(0.8),@(1)];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    UILabel * lab =[[UILabel alloc]initWithFrame:CGRectMake(0, 20*default_scale, 150*default_scale, 40*default_scale)];
    lab.text = @"*不怂，就是干*";
    lab.textAlignment = 1;
    lab.textColor = [UIColor whiteColor];
    lab.font = systemFontOfSize(12);
    lab.backgroundColor =[UIColor clearColor];
    [L_heardView addSubview:lab];
    
    
    
    CAKeyframeAnimation *snowaAnimation =[CAKeyframeAnimation animationWithKeyPath:@"position"];
    snowaAnimation.duration = 6;
    snowaAnimation.values = @[[NSValue valueWithCGPoint:CGPointMake((375-60)*default_scale, 90*default_scale)],[NSValue valueWithCGPoint:CGPointMake((375-80)*default_scale, 90*default_scale)],[NSValue valueWithCGPoint:CGPointMake((375-80)*default_scale, 120*default_scale)],[NSValue valueWithCGPoint:CGPointMake((375-60)*default_scale, 120*default_scale)],[NSValue valueWithCGPoint:CGPointMake((375-60)*default_scale, 90*default_scale)]];
    
    
    snowaAnimation.repeatCount = FLT_MAX;
    snowaAnimation.keyTimes = @[@(0),@(0.3),@(0.7),@(0.8),@(1)];
    snowaAnimation.removedOnCompletion = NO;
    snowaAnimation.fillMode = kCAFillModeForwards;

    
    UILabel * snowlab =[[UILabel alloc]initWithFrame:CGRectMake(200*default_scale, 20*default_scale, 150*default_scale, 40*default_scale)];
    snowlab.text = @"*人头收割机*";
    snowlab.textAlignment = 1;
    snowlab.textColor = [UIColor whiteColor];
    snowlab.font = systemFontOfSize(12);
    snowlab.backgroundColor =[UIColor clearColor];
    [L_heardView addSubview:snowlab];

    
    [lab.layer addAnimation:animation forKey:@"1"];
    [snowlab.layer addAnimation:snowaAnimation forKey:@"1"];
    
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    if (point.y < -270*default_scale) {
        CGRect rect = [self.L_tableView viewWithTag:101].frame;
        rect.origin.y = point.y;
        rect.size.height = -point.y;
        [self.L_tableView viewWithTag:101].frame = rect;
    }
}
- (void)selectedSomething
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册中选取",@"查看大图", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];

    
    
}
- (void)findSomething
{
    
    OurFansViewController *fanVc =[OurFansViewController new];
    fanVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:fanVc animated:YES];
    
}
#pragma mark 表的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section ==0) {
        return 100*default_scale;
    }else{
        return 30*default_scale;}
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 0.00001;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * bgView =[UIView new];
  
    NSArray*array =[NSArray arrayWithObjects:@"add_friend_recent_player",@"default_region",@"personal_message", nil];
    for (int i =0; i<3; i++) {
        UIButton *bgButton =[UIButton buttonWithType:UIButtonTypeCustom];
       
        [bgButton setImage:[UIImage imageNamed:array[i]] forState:UIControlStateNormal];
        bgButton.frame = CGRectMake(i*[UIScreen mainScreen].bounds.size.width/3, 15*default_scale,[UIScreen mainScreen].bounds.size.width/3, 70*default_scale);
        [bgView addSubview:bgButton];
        
    }
    
       return bgView;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 44*default_scale;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifiter = @"cell";
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:identifiter];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifiter];
    }
    NSArray * array =[NSArray arrayWithObjects:@"个人喜好",@"个人收藏",@"生成你的专属二维码",@"设置", nil];
    NSArray *imageArray =[NSArray arrayWithObjects:@"friend_cycle_send_right_bar_press",@"competition_centre_nav_right_data_normal",@"competition_centre_nav_right_subscribe_press",@"personal_setting_nor", nil];
    cell.textLabel.text =array[indexPath.row];
    cell.textLabel.textColor = [UIColor grayColor];
    cell.imageView.image = [UIImage imageNamed:imageArray[indexPath.row]];
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 2) {
        OurMyCodeSanViewController * codeSanVc =[[OurMyCodeSanViewController alloc]init];
        codeSanVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:codeSanVc animated:YES];
        }
    else if (indexPath.row == 0){
        OurLoveViewController * loveVc =[[OurLoveViewController alloc]init];
        loveVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:loveVc animated:YES];
        
        
    }
  
}
//点击查看大图
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        [self goToCamera];
    }else if (buttonIndex ==1){
        [self goToSelectNameCard];
    }else if (buttonIndex == 2){
//        //图片预览
//        OTImagePreviewViewController *previewCtrl = [[OTImagePreviewViewController alloc] init];
//        previewCtrl.m_imageUrl = [UserObject currentUser].m_acatar;
//        [self presentViewController:previewCtrl animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)goToCamera
{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }else{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"该设备不支持拍照" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
           
            [alert show];
        });
    }

    
}
- (void)goToSelectNameCard
{
    UIImagePickerController*pickVc =[[UIImagePickerController alloc]init];
    pickVc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    pickVc.delegate = self;
     pickVc.allowsEditing = YES;
    [self presentViewController:pickVc animated:YES completion:nil];
    
    
}
#pragma mark UIImagePickerControllerDelegate
//点击cancel的时候调用
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
//完成选择图片的时候调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    NSLog(@"info = %@",info);
    headBtn.imageView.image = [info objectForKey:UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self remove];
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
}


- (void)remove
{
    NSData *data = UIImageJPEGRepresentation( headBtn.imageView.image, 0.9);
    
    NSUserDefaults * userdegu =[NSUserDefaults standardUserDefaults];
    [userdegu setObject:data forKey:@"data"];
    [userdegu synchronize];
    
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

//
//  OurWebViewController.m
//  OurGreatLife
//
//  Created by 兴哥哥 on 2016/11/21.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import "OurWebViewController.h"


@interface OurWebViewController ()<UIWebViewDelegate>

@end

@implementation OurWebViewController
@synthesize L_webView;
@synthesize L_url;
- (void)viewDidLoad {
    [super viewDidLoad];
    

    L_webView =[[UIWebView alloc]init];
    L_webView.translatesAutoresizingMaskIntoConstraints = NO;
    L_webView .delegate =self;
    [L_webView setScalesPageToFit:YES];
    [self.view addSubview:L_webView];
    indicator = [[YYAnimationIndicator alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-40, self.view.frame.size.height/2-40, 80, 80)];
    [indicator setLoadText:@"正在加载..."];
    [self.view addSubview:indicator];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[webView]-0-|" options:kNilOptions metrics:nil views:@{@"webView":L_webView}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-64-[webView]-0-|" options:kNilOptions metrics:nil views:@{@"webView":L_webView}]];
    
    
    
    [L_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:L_url]]];
    
    // Do any additional setup after loading the view.
}
#pragma mark UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //判断是否是单击
    if (navigationType == UIWebViewNavigationTypeLinkClicked || navigationType==UIWebViewNavigationTypeFormSubmitted) {
        BOOL isHTTP = [request.URL.scheme isEqualToString:@"http"] || [request.URL.scheme isEqualToString:@"https"];
        if (isHTTP) {
            OurWebViewController *vc=[[OurWebViewController alloc]init];
            vc.L_url =[NSString stringWithFormat:@"%@", request.URL];
            [self.navigationController pushViewController:vc animated:YES];
            return NO;
        }
    }
    
    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
{
    
     [indicator stopAnimationWithLoadText:@"加载失败" withType:NO];//加载失败
}

- (void)webViewDidStartLoad:(UIWebView *)webView;
{
    [indicator startAnimation];
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView;
{
    [indicator stopAnimationWithLoadText:@"finish" withType:YES];//加载成功

    
}
-(void)viewWillAppear:(BOOL)animated{
    if(self.navigationController.navigationBarHidden){
        [self.navigationController setNavigationBarHidden:NO animated:YES];
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

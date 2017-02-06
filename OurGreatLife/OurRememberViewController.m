//
//  OurRememberViewController.m
//  OurGreatLife
//
//  Created by 兴哥哥 on 2016/11/18.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import "OurRememberViewController.h"
#import "PieView.h"
#import "FeatherView.h"
#import "MealModel.h"
@interface OurRememberViewController ()<CAAnimationDelegate>{
    CGFloat _roatedValue ;
}
@property (nonatomic,strong)CABasicAnimation *transformAnimation;   //旋转动画
@property (nonatomic,strong)PieView *pie;   //转盘


@end

@implementation OurRememberViewController
#pragma mark lazyload method

-(PieView *)pie{
    return _pie = _pie?:[[PieView alloc]initWithFrame:CGRectMake(10, 120, CGRectGetWidth(self.view.bounds)-20, CGRectGetWidth(self.view.bounds)-20)];
}

-(CABasicAnimation *)transformAnimation{
    if (!_transformAnimation) {
        //设置旋转动画
        _transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        _transformAnimation.delegate = self;
        _transformAnimation.fillMode = kCAFillModeForwards;
        _transformAnimation.removedOnCompletion = NO;
        _transformAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [_transformAnimation setDuration:2];
    }
    return _transformAnimation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"记忆";
    self.view.backgroundColor = [UIColor whiteColor];
     [self.view addSubview:self.pie];
    [self initDataSource];
    FeatherView *featherView = [[FeatherView alloc]initWithFrame:_pie.frame];
    __weak __typeof (&*self)weakSelf = self;
    [featherView drawFeatherViewTouchBlock:^{
        [weakSelf roate];
    }];
    [self.view addSubview:featherView];

    // Do any additional setup after loading the view.
}
#pragma mark initData
- (void)initDataSource{
    //数值代表所占比重
    NSArray *mealDicArray =@[@{@"黄焖鸡米饭":@1},@{@"四川冒菜":@1},@{@"如意混飩":@1},@{@"重庆小面":@1},@{@"麻辣烫":@1},@{@"四川盖浇饭":@1},@{@"楼下面":@1},@{@"大沙县":@1},@{@"大兰州":@1}];
    
    __block CGFloat totalRadius = 0.0;
    __block NSMutableArray *mealArrayM = [NSMutableArray arrayWithCapacity:mealDicArray.count];
    [mealDicArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        @autoreleasepool {
            MealModel *model = [[MealModel alloc]init];
            model.mealName = [dict allKeys][0];
            model.mealRadius = [[dict allValues][0] floatValue];
            [mealArrayM addObject:model];
            totalRadius +=model.mealRadius;
        }
    }];
    _pie.totalRadious = totalRadius;
    _pie.dataArrayM = mealArrayM;
}

#pragma mark animation
- (void)roate{
    _roatedValue = M_PI *(float)(arc4random()%314)/157;
    self.transformAnimation.toValue = @(6*M_PI +_roatedValue);
    [_pie.layer addAnimation:self.transformAnimation forKey:@"position"];
}

#pragma mark animation stop
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    self.transformAnimation.fromValue = @(_roatedValue);
    __block CGFloat totalValue = 0;
    __weak __typeof (&*self)weakSelf = self;
    [_pie.dataArrayM enumerateObjectsUsingBlock:^(MealModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
        totalValue += model.mealRadius;
        if (2*M_PI * totalValue/weakSelf.pie.totalRadious + _roatedValue>=2*M_PI) {
            MealModel *model = weakSelf.pie.dataArrayM[idx];
            NSLog(@"你选中了%@",model.mealName);
            
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"温馨提示" message:[NSString stringWithFormat:@"今天吃%@",model.mealName] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            
            [alert show];
            *stop = YES;
        }
    }];
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

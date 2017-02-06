//
//  MJRefreshNormalHeader.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/4/24.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "MJRefreshNormalHeader.h"
#import "NSBundle+MJRefresh.h"

@interface MJRefreshNormalHeader()
{
    __unsafe_unretained UIImageView *_arrowView;
}
@property (weak, nonatomic) UIActivityIndicatorView *loadingView;
@end

@implementation MJRefreshNormalHeader
#pragma mark - 懒加载子控件
- (UIImageView *)arrowView
{
    if (!_arrowView) {
        UIImageView *arrowView = [[UIImageView alloc] initWithImage:[NSBundle mj_arrowImage]];
        [self addSubview:_arrowView = arrowView];
    }
    return _arrowView;
}

- (UIActivityIndicatorView *)loadingView
{
    if (!_loadingView) {
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:self.activityIndicatorViewStyle];
        loadingView.hidesWhenStopped = YES;
        [self addSubview:_loadingView = loadingView];
    }
    return _loadingView;
}

//-(CustomAnimationHud *)animationHud{    }

-(void)createAnimationHud{
//    if(!_animationHud){
//        _animationHud = [[CustomAnimationHud alloc] initWithFrame:CGRectMake(0, 0, 48, 28)];
//        _animationHud.hudColor = [UIColor colorWithRed:1 green:74/255.0f blue:49/255.0f alpha:1];
//        _animationHud.hudStyle = 1;
//        _animationHud.alpha = 1;
//        [self addSubview:_animationHud];
//        
//    }
}


#pragma mark - 公共方法
- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle
{
    _activityIndicatorViewStyle = activityIndicatorViewStyle;
    
    self.loadingView = nil;
    [self setNeedsLayout];
}

#pragma mark - 重写父类的方法
- (void)prepare
{
    [super prepare];
    
    self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    //self.animationHud.center = CGPointMake(self.mj_w*0.5, self.mj_h *0.5);
    /*
    // 箭头的中心点
    CGFloat arrowCenterX = self.mj_w * 0.5;
    if (!self.stateLabel.hidden) {
        CGFloat stateWidth = self.stateLabel.mj_textWith;
        CGFloat timeWidth = 0.0;
        if (!self.lastUpdatedTimeLabel.hidden) {
            timeWidth = self.lastUpdatedTimeLabel.mj_textWith;
        }
        CGFloat textWidth = MAX(stateWidth, timeWidth);
        arrowCenterX -= textWidth / 2 + self.labelLeftInset;
    }
    CGFloat arrowCenterY = self.mj_h * 0.5;
    CGPoint arrowCenter = CGPointMake(arrowCenterX, arrowCenterY);
    
    // 箭头
    if (self.arrowView.constraints.count == 0) {
        self.arrowView.mj_size = self.arrowView.image.size;
        self.arrowView.center = arrowCenter;
    }
        
    // 圈圈
    if (self.loadingView.constraints.count == 0) {
        self.loadingView.center = arrowCenter;
    }
    
    self.arrowView.tintColor = self.stateLabel.textColor;
     */
    self.lastUpdatedTimeLabel.hidden = YES;
}

- (void)setState:(MJRefreshState)state{
    
//    if(self.animationHud == nil){
//        [self createAnimationHud];
//    }
//    MJRefreshCheckState
//    
//    // 根据状态做事情
//    if (state == MJRefreshStateIdle) {//普通状态
//        if (oldState == MJRefreshStateRefreshing) {
////            MJRefreshFastAnimationDuration
//            self.animationHud.alpha = 1;
//            if (self.state != MJRefreshStateIdle){
//                return;
//            }else{
//                [self.animationHud stopAnimation];
//              [self.animationHud removeFromSuperview];
//                self.animationHud = nil;
//            }
//
//            // 如果执行完动画发现不是idle状态，就直接返回，进入其他状态
//        } else if(oldState == MJRefreshStatePulling){
//            [self.animationHud stopAnimation];
//            [self.animationHud removeFromSuperview];
//            self.animationHud = nil;
//        }else{
//            self.animationHud.alpha = 1;
//        }
//    } else if (state == MJRefreshStatePulling) {
//        self.animationHud.alpha = 1;
//        [self.animationHud startAnimation];
//    } else if (state == MJRefreshStateRefreshing) {
//        self.animationHud.alpha = 1;
//        
//    }
}
@end

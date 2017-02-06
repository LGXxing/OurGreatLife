//
//  CustomMenuView.m
//  Opportunity
//
//  Created by 张旭东 on 16/7/26.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import "CustomMenuView.h"
#import "Goble.h"

@implementation CustomMenuView

@synthesize delegate;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        UIView *m_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 64 + 13.5f)];
        [self addSubview:m_view];
        
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(10, 20, 30, 44);
        [backBtn setImage:[UIImage imageNamed:@"ic_back.png"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [m_view addSubview:backBtn];
        
        m_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 77.5, frame.size.width, frame.size.height - 77.5f)];
        m_tableView.delegate = self;
        m_tableView.dataSource = self;
        m_tableView.backgroundColor = [UIColor clearColor];
        m_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:m_tableView];
        
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleProminent];
        
        UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
        effectview.frame = frame;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.85f];
        
        [self insertSubview:effectview atIndex:0];
        
    }
    return self;
}


-(void)backButtonPressed:(id)sender{
    if(delegate && [delegate respondsToSelector:@selector(didCloseMenu)]){
        [delegate didCloseMenu];
    }
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 54*default_scale;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentity = @"MenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentity];
        
        UIImageView *m_imageView = [[UIImageView alloc] initWithFrame:CGRectMake(17*default_scale, 19.5*default_scale, 2.5f*default_scale, 15*default_scale)];
        m_imageView.tag = 1;
        [cell.contentView addSubview:m_imageView];
        
        UILabel *m_label = [[UILabel alloc] initWithFrame:CGRectMake((17+2.5f+12)*default_scale, 0, 100, 54*default_scale)];
        m_label.tag = 2;
        m_label.textColor = defailt_gray_666666;
        m_label.highlightedTextColor = default_gray_999999;
        m_label.font = systemFontOfSize(15);
        [cell.contentView addSubview:m_label];
        
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    UIImageView *m_imageView = [cell.contentView viewWithTag:1];
    UILabel *m_label = [cell.contentView viewWithTag:2];
    m_label.highlighted = m_indexPath == indexPath;
    
    switch (indexPath.row) {
        case 0:
            m_imageView.image = [UIImage imageNamed:@"ic_menu_show.png"];
            m_label.text = @"NBA";
            break;
        case 1:
            m_imageView.image = [UIImage imageNamed:@"ic_menu_though.png"];
            m_label.text = @"汽车";
            break;
        case 2:
            m_imageView.image = [UIImage imageNamed:@"ic_menu_study.png"];
            m_label.text = @"LOL";
            break;
        case 3:
            m_imageView.image = [UIImage imageNamed:@"ic_menu_study_report.png"];
            m_label.text = @"彩票";
            break;
        default:
            break;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    m_indexPath = indexPath;
    [m_tableView reloadData];
    
    if(delegate && [delegate respondsToSelector:@selector(didCloseMenu)]){
        [delegate didCloseMenu];
    }
    
    if(delegate && [delegate respondsToSelector:@selector(didSelectMenu:)]){
        [delegate didSelectMenu:indexPath.row];
    }
}
@end

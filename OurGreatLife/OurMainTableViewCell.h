//
//  OurMainTableViewCell.h
//  OurGreatLife
//
//  Created by 兴哥哥 on 2016/11/30.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OurMainTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *iconImage;
@property(nonatomic,strong)UIImageView *mainImage;
@property(nonatomic,strong)UILabel *nameLable;
@property(nonatomic,strong)UILabel *instrLable;
@property (nonatomic,strong)UILabel *timeLable;
@property (nonatomic,strong)UILabel *loveLable;
- (instancetype)initWithMainFirstIdentifier:(NSString *)identifier;
- (instancetype)initWithBotherIdsentifier:(NSString*)identifier;
@end

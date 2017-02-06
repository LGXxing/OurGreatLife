//
//  OurMainTableViewCell.m
//  OurGreatLife
//
//  Created by 兴哥哥 on 2016/11/30.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import "OurMainTableViewCell.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "Goble.h"
@implementation OurMainTableViewCell
CGFloat maxContentLabelHeight = 0; // 根据具体font而定
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithMainFirstIdentifier:(NSString *)identifier;
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    if (self) {
        
        self.iconImage = [UIImageView new];
        self.iconImage.backgroundColor =[UIColor grayColor];
        self.iconImage.layer.masksToBounds = YES;
        self.iconImage.layer.cornerRadius = 25*default_scale;
        self.mainImage = [UIImageView new];
        self.mainImage.backgroundColor =[UIColor grayColor];
        self.timeLable = [UILabel new];
        self.instrLable = [UILabel new];
        self.nameLable = [UILabel new];
        self.nameLable.textAlignment = 0;
        self.nameLable.font = [UIFont systemFontOfSize:16*default_scale];
        self.instrLable.font = [UIFont systemFontOfSize:14*default_scale];
        if (maxContentLabelHeight==0) {
            maxContentLabelHeight = self.instrLable.font.lineHeight*7;
        }
        self.timeLable.font = [UIFont systemFontOfSize:12*default_scale];
        self.loveLable = [UILabel new];
        self.loveLable.font = [UIFont systemFontOfSize:12*default_scale];
        self.loveLable.textColor = [UIColor redColor];
        self.loveLable.textAlignment = 2;
        
        [self.contentView sd_addSubviews:@[self.iconImage,self.mainImage,self.nameLable,self.instrLable,self.timeLable,self.loveLable]];
        self.iconImage.sd_layout
        .topSpaceToView(self.contentView,10*default_scale)
        .leftSpaceToView(self.contentView,15*default_scale)
        .heightIs(50*default_scale)
        .widthIs(50*default_scale);
        
        self.mainImage.sd_layout
        .topSpaceToView(self.iconImage,(12*default_scale))
        .leftSpaceToView(self.contentView,15*default_scale)
        .widthIs(180*default_scale)
        .bottomSpaceToView(self.contentView,10*default_scale);
        
        self.nameLable.sd_layout
        .topSpaceToView(self.contentView,15*default_scale)
        .leftSpaceToView(self.iconImage,(20*default_scale))
        .rightSpaceToView(self.contentView,20*default_scale)
        .heightIs(40*default_scale);
        
        self.instrLable.sd_layout
        .topSpaceToView(self.iconImage,12*default_scale)
        .leftSpaceToView(self.mainImage,10*default_scale)
        .rightSpaceToView(self.contentView,10*default_scale)
        .autoHeightRatio(0);
        
        self.instrLable.sd_layout.maxHeightIs(maxContentLabelHeight);

        self.timeLable.sd_layout
        .leftSpaceToView(self.mainImage,10*default_scale)
        .bottomSpaceToView(self.contentView,10*default_scale)
        .widthIs(100*default_scale)
        .topSpaceToView(self.mainImage,-15*default_scale);
    
        self.loveLable.sd_layout
        .leftSpaceToView(self.timeLable,5*default_scale)
        .topSpaceToView(self.mainImage,-15*default_scale)
        .rightSpaceToView(self.contentView,5*default_scale)
        .bottomSpaceToView(self.contentView,10*default_scale);
                }
    return self;

}


- (instancetype)initWithBotherIdsentifier:(NSString*)identifier;
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    if ( self) {
        
        self.iconImage = [UIImageView new];
        self.iconImage.backgroundColor =[UIColor grayColor];
        self.iconImage.layer.masksToBounds = YES;
        self.iconImage.layer.cornerRadius = 35*default_scale;
        self.timeLable = [UILabel new];
        self.instrLable = [UILabel new];
        self.nameLable = [UILabel new];
        self.nameLable.textAlignment = 0;
        self.nameLable.textColor = default_red_FF4A31;
        self.nameLable.font = [UIFont systemFontOfSize:16*default_scale];
        self.instrLable.font = [UIFont systemFontOfSize:14*default_scale];
        self.instrLable.textColor = default_gray_999999;
        self.timeLable.font = [UIFont systemFontOfSize:12*default_scale];
        self.loveLable = [UILabel new];
        
         [self.contentView sd_addSubviews:@[self.iconImage,self.nameLable,self.instrLable]];
        
        self.iconImage.sd_layout
        .centerYEqualToView(self.contentView)
        .leftSpaceToView(self.contentView,15*default_scale)
        .heightIs(70*default_scale)
        .widthIs(70*default_scale);
        
        
        self.nameLable.sd_layout
        .topSpaceToView(self.contentView,25*default_scale)
        .leftSpaceToView(self.iconImage,(12*default_scale))
        .rightSpaceToView(self.contentView,20*default_scale)
        .heightIs(20*default_scale);
        
        self.instrLable.sd_layout
        .topSpaceToView(self.nameLable,12*default_scale)
        .leftSpaceToView(self.iconImage,10*default_scale)
        .rightSpaceToView(self.contentView,10*default_scale)
        .autoHeightRatio(0);
        
        self.instrLable.sd_layout.maxHeightIs(maxContentLabelHeight);
        
        

        
        
       

        
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

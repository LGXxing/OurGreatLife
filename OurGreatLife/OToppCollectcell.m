//
//  OToppCollectcell.m
//  Opportunity
//
//  Created by 兴哥哥 on 16/7/25.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import "OToppCollectcell.h"
#import "Goble.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
@implementation OToppCollectcell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
//        _insreName =[UILabel new];
//        _insreName.font = systemFontOfSize(16);
//        _insreName.textAlignment = 1;
//        _insreName.textColor = defailt_gray_666666;
        _instrImage =[UIImageView new];
        
      
        _instrImage.backgroundColor =[UIColor darkGrayColor];
        
        [self.contentView sd_addSubviews:@[_instrImage]];
        
        _instrImage.sd_layout
        .topSpaceToView(self.contentView,0*default_scale)
        .leftSpaceToView(self.contentView,0*default_scale)
        .rightSpaceToView(self.contentView,0*default_scale)
        .bottomSpaceToView(self.contentView,0*default_scale);
        
//        _insreName.sd_layout
//        .topSpaceToView(_instrImage,(0*default_scale))
//        .leftSpaceToView(self.contentView,10*default_scale)
//        
//        .rightSpaceToView (self.contentView,5*default_scale);
        
        //        _addLab.sd_layout
        //        .topSpaceToView(_m_headView,(5*scale))
        //        .leftSpaceToView(_m_headView,12*scale)
        //        .bottomSpaceToView (_m_headView,5*scale)
        //        .rightSpaceToView (_m_headView,12*scale);
    }
    return self;
}

@end

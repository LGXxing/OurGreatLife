//
//  CustomMenuView.h
//  Opportunity
//
//  Created by 张旭东 on 16/7/26.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  CustomMenuViewDelegate <NSObject>

@optional
-(void)didSelectMenu:(NSInteger)index;
-(void)didCloseMenu;

@end

@interface CustomMenuView : UIView<UITableViewDelegate,UITableViewDataSource>{
    UITableView *m_tableView;
    UIView *m_headView;
    NSIndexPath *m_indexPath;
}


@property (weak) id<CustomMenuViewDelegate> delegate;

@end

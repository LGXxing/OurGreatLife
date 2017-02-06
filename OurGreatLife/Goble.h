//
//  Goble.h
//  Opportunity
//
//  Created by 张旭东 on 16/7/14.
//  Copyright © 2016年 MyCompany. All rights reserved.
//
//宏定义大全
#ifndef Goble_h
#define Goble_h


//#import "UIImageView+AFNetworking.h"
//#import "UIButton+AFNetworking.h"
//([UIScreen mainScreen].bounds.size.height == 736.0f ? 1.5f: 1.0f)
//

#define default_scale  ([UIScreen mainScreen].bounds.size.width/375)

#define systemFontOfSize(x) ([UIFont systemFontOfSize:x*default_scale])
#define boldFontOfSize(x) ([UIFont boldSystemFontOfSize:x*default_scale])
#define numberSize(x) (@(x*default_scale))
#define STOREAPPID @"1160131905" //应用商店的APPID

#define default_white_FFFFFF  [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1]
#define defailtGray [UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1]
#define default_black [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1]
#define defailt_gray_666666  [UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1]
#define default_gray_999999  [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1]
#define default_gray_929292  [UIColor colorWithRed:146/255.0f green:146/255.0f blue:146/255.0f alpha:1]
#define Default_gray_CCCCCC  [UIColor colorWithRed:197/255.0f green:157/255.0f blue:84/255.0f alpha:1]
#define default_red_FF4A31   [UIColor colorWithRed:1 green:74/255.0f blue:49/255.0f alpha:1]
#define default_gray_333333  [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1]
#define default_blue_007AF3  [UIColor colorWithRed:0 green:122/255.0f blue:228/255.0f alpha:1]
#define default_green_00C765 [UIColor colorWithRed:0 green:199/255.0f blue:104/255.0f alpha:1]
#define default_gray_F8F8F8  [UIColor colorWithRed:248/255.0f green:248/255.0f blue:248/255.0f alpha:1]
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define GRAYWHITECOLOR [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1]
#define default_background_color [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1]

#define checkNull(__X__)  (__X__) == [NSNull null] || (__X__) == nil ? @"" : [NSString stringWithFormat:@"%@", (__X__)]

#define TitleFont [UIFont boldSystemFontOfSize:16]
#endif /* Goble_h */

//
//  KNQRCodeView.h
//  KNScanner
//
//  Created by LuKane on 16/2/19.
//  Copyright © 2016年 LuKane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KNQRCodeView : UIView

/**
 *  生成一张二维码
 *
 *  @param QRCodeContent 二维码的内容
 *  @param image         中间的图片
 *
 *  @return 返回一张二维码
 */
+ (KNQRCodeView *)QRCodeViewWithContent:(NSString *)QRCodeContent image:(UIImage *)image frame:(CGRect)frame;

@end

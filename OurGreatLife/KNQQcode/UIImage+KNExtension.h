//
//  UIImage+KNExtension.h
//  KNScanner
//
//  Created by LuKane on 16/3/29.
//  Copyright © 2016年 LuKane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KNExtension)

+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image size:(CGFloat)size;

+ (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2;

+ (UIImage *)makeRoundedImage:(UIImage *)image radius:(float)radius;

@end

//
//  UIImage+KNExtension.m
//  KNScanner
//
//  Created by LuKane on 16/3/29.
//  Copyright © 2016年 LuKane. All rights reserved.
//

#import "UIImage+KNExtension.h"

@implementation UIImage (KNExtension)

+ (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2{
    if([[UIScreen mainScreen] scale] == 2.0){
        UIGraphicsBeginImageContextWithOptions(image1.size,NO, 2.0);
    }else if([[UIScreen mainScreen] scale] == 3.0){
        UIGraphicsBeginImageContextWithOptions(image1.size,NO, 2.0);
    }else{
        UIGraphicsBeginImageContext(image1.size);
    }
    [image1 drawInRect:CGRectMake(0, 0, image1.size.width,image1.size.height)];
    
    CGFloat width = CGImageGetWidth(image1.CGImage) * 0.27;
    CGFloat y = (CGImageGetWidth(image1.CGImage) - width) * 0.5;
    [image2 drawInRect:CGRectMake(y, y, width, width)];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

+ (UIImage *)makeRoundedImage:(UIImage *)image radius:(float)radius{
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    imageLayer.contents = (id) image.CGImage;
    imageLayer.cornerRadius = radius;
    imageLayer.masksToBounds = YES;
    imageLayer.borderColor = [UIColor whiteColor].CGColor;
    imageLayer.borderWidth = radius * 2;
    UIGraphicsBeginImageContext(image.size);
    [imageLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *roundedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return roundedImage;
}

+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image size:(CGFloat) size{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

@end

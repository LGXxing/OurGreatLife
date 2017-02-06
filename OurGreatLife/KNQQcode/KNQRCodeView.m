//
//  KNQRCodeView.m
//  KNScanner
//
//  Created by LuKane on 16/2/19.
//  Copyright © 2016年 LuKane. All rights reserved.
//

#import "KNQRCodeView.h"
#import <CoreImage/CoreImage.h>
#import "UIImage+KNExtension.h"

@implementation KNQRCodeView

+ (KNQRCodeView *)QRCodeViewWithContent:(NSString *)QRCodeContent image:(UIImage *)image frame:(CGRect)frame{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    [filter setValue:[QRCodeContent dataUsingEncoding:NSUTF8StringEncoding] forKeyPath:@"inputMessage"];
    CGFloat width = frame.size.width;
    CIImage *outputImage = [filter outputImage];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    imageView.userInteractionEnabled = YES;
    
    UIImage *imageQR = [UIImage createNonInterpolatedUIImageFormCIImage:outputImage size:width];
    if(image){
        imageView.image = [UIImage addImage:imageQR toImage:[UIImage makeRoundedImage:image radius:10]];
    }else{
        imageView.image = imageQR;
    }
    return (KNQRCodeView *)imageView;
}

@end

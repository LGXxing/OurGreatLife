//
//  SNStyleTextView.m
//  OCTextStyle
//
//  Created by addcn on 16/12/1.
//  Copyright © 2016年 addcn. All rights reserved.
//

#import "SNStyleTextView.h"

@interface SNStyleTextView ()

@property (strong, nonatomic) NSMutableAttributedString * textStyle;


@end

@implementation SNStyleTextView

#pragma mark - 初始化样式
- (NSMutableAttributedString *)textStyle{
    
    if(!_textStyle){
        if(self.text){
            self.textStyle = [[NSMutableAttributedString alloc] initWithString:self.text];
        }else{
            NSLog(@"未设置text");
        }
    }
    return _textStyle;
}

#pragma mark - 自定义样式
- (NSMutableAttributedString *)setStyleName:(NSString *)name value:(id)value ofRange:(NSRange)range{
    
    [self.textStyle addAttribute:name value:value range:range];
    return self.textStyle;
}

#pragma mark - 设置字体大小
- (NSMutableAttributedString *)setFontSize:(NSInteger)size ofRange:(NSRange)range{
    
    return [self setStyleName:NSFontAttributeName value:[UIFont systemFontOfSize:size] ofRange:range];
}

#pragma mark - 设置字体颜色
- (NSMutableAttributedString *)setFontColor:(UIColor *)color ofRange:(NSRange)range{
    
    return [self setStyleName:NSForegroundColorAttributeName value:color ofRange:range];
}

#pragma mark - 设置背景颜色
- (NSMutableAttributedString *)setFontBackgroundColor:(UIColor *)color ofRange:(NSRange)range{
    
    return [self setStyleName:NSBackgroundColorAttributeName  value:color ofRange:range];
}

#pragma mark - 设置连字体
- (NSMutableAttributedString *)setFontLigature:(NSInteger)apart ofRange:(NSRange)range{
    
    return [self setStyleName:NSLigatureAttributeName  value:[NSNumber numberWithInteger:apart] ofRange:range];
}

#pragma mark - 设置字体间距
- (NSMutableAttributedString *)setFontKern:(NSInteger)apart ofRange:(NSRange)range{
    return [self setStyleName:NSKernAttributeName value:[NSNumber numberWithInteger:apart] ofRange:range];
}

#pragma mark - 设置删除线
- (NSMutableAttributedString *)setDeleteLine:(NSInteger)apart ofRange:(NSRange)range{
    return [self setStyleName:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:apart] ofRange:range];
}

#pragma mark - 设置删除线颜色
- (NSMutableAttributedString *)setDeleteLineColor:(UIColor *)color ofRange:(NSRange)range{
    
    return [self setStyleName:NSStrikethroughColorAttributeName value:color ofRange:range];
}

#pragma mark - 设置下划线颜色
- (NSMutableAttributedString *)setUnderline:(NSInteger)apart ofRange:(NSRange)range{
    
     return [self setStyleName:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:apart] ofRange:range];
}

#pragma mark - 设置下划线的颜色
- (NSMutableAttributedString *)setUnderlineColor:(UIColor *)color ofRange:(NSRange)range{
    
    return [self setStyleName:NSUnderlineColorAttributeName value:color ofRange:range];
}

#pragma mark - 设置描边
- (NSMutableAttributedString *)setStrokeWidth:(NSInteger)width ofRange:(NSRange)range{
    
    return [self setStyleName:NSStrokeWidthAttributeName value:[NSNumber numberWithInteger:width] ofRange:range];
}

#pragma mark - 设置描边颜色
- (NSMutableAttributedString *)setStrokeColor:(UIColor *)color ofRange:(NSRange)range{
    
    return [self setStyleName:NSStrokeColorAttributeName value:color    ofRange:range];
}

#pragma mark - 设置阴影
- (NSMutableAttributedString *)setShadow:(NSShadow *)shadow ofRange:(NSRange)range{
    return [self setStyleName:NSShadowAttributeName value:shadow ofRange:range];
}

#pragma mark - 设置凸版印刷效果
- (NSMutableAttributedString *)setEffectOfRange:(NSRange)range{
    
    return [self setStyleName:NSTextEffectAttributeName value:NSTextEffectLetterpressStyle ofRange:range];
}

#pragma mark - 设置上下偏移
- (NSMutableAttributedString *)setOffset:(NSInteger)apart ofRange:(NSRange)range{
    
    return [self setStyleName:NSBaselineOffsetAttributeName value:[NSNumber numberWithInteger:apart] ofRange:range];
}

#pragma mark - 设置文字倾斜
- (NSMutableAttributedString *)setObliqueness:(CGFloat)apart ofRange:(NSRange)range{
    
    return [self setStyleName:NSObliquenessAttributeName value:[NSNumber numberWithFloat:apart] ofRange:range];
}

#pragma makr - 设置文字左右拉伸
- (NSMutableAttributedString *)setExpansion:(CGFloat)apart ofRange:(NSRange)range{
    
    return [self setStyleName:NSExpansionAttributeName value:[NSNumber numberWithFloat:apart] ofRange:range];
}

#pragma mark - 设置文字书写方式(左-右|右-左)
- (NSMutableAttributedString *)setWritingDirection:(NSArray*)array ofRange:(NSRange)range{
    return [self setStyleName:NSWritingDirectionAttributeName value:array ofRange:range];
}

#pragma mark - 设置文字的横竖排放
- (NSMutableAttributedString *)setVerticalGlyph:(NSInteger)type ofRnage:(NSRange)range{
    
    return [self setStyleName:NSVerticalGlyphFormAttributeName value:[NSNumber numberWithInteger:type] ofRange:range];
}

#pragma mark - 设置超链接
- (NSMutableAttributedString *)setLink:(NSURL *)url ofRange:(NSRange)range{
    
    
    return [self setStyleName:NSLinkAttributeName value:url ofRange:range];
}

#pragma mark - 设置图片 图文混排
- (NSMutableAttributedString *)setPhoto:(NSTextAttachment *)achment ofPosition:(NSInteger)position{
    
    
    NSAttributedString *attr = [NSAttributedString attributedStringWithAttachment:achment];
    [self.textStyle insertAttributedString:attr atIndex:position];
    return self.textStyle;
    
}
@end

//
//  SNStyleTextView.h
//  OCTextStyle
//
//  Created by addcn on 16/12/1.
//  Copyright © 2016年 addcn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNStyleTextView : UITextView


#pragma mark - 自定义样式
- (NSMutableAttributedString *)setStyleName:(NSString *)name value:(id)value ofRange:(NSRange)range;

#pragma mark - 设置字体大小
- (NSMutableAttributedString *)setFontSize:(NSInteger)size ofRange:(NSRange)range;

#pragma mark - 设置字体颜色
- (NSMutableAttributedString *)setFontColor:(UIColor *)color ofRange:(NSRange)range;

#pragma mark - 设置背景颜色
- (NSMutableAttributedString *)setFontBackgroundColor:(UIColor *)color ofRange:(NSRange)range;

#pragma mark - 设置连字体
- (NSMutableAttributedString *)setFontLigature:(NSInteger)apart ofRange:(NSRange)range;

#pragma mark - 设置字体间距
- (NSMutableAttributedString *)setFontKern:(NSInteger)apart ofRange:(NSRange)range;

#pragma mark - 设置删除线
- (NSMutableAttributedString *)setDeleteLine:(NSInteger)apart ofRange:(NSRange)range;

#pragma mark - 设置删除线颜色
- (NSMutableAttributedString *)setDeleteLineColor:(UIColor *)color ofRange:(NSRange)range;

#pragma mark - 设置下划线颜色
- (NSMutableAttributedString *)setUnderline:(NSInteger)apart ofRange:(NSRange)range;

#pragma mark - 设置下划线的颜色
- (NSMutableAttributedString *)setUnderlineColor:(UIColor *)color ofRange:(NSRange)range;

#pragma mark - 设置描边
- (NSMutableAttributedString *)setStrokeWidth:(NSInteger)width ofRange:(NSRange)range;

#pragma mark - 设置描边颜色
- (NSMutableAttributedString *)setStrokeColor:(UIColor *)color ofRange:(NSRange)range;

#pragma mark - 设置阴影
- (NSMutableAttributedString *)setShadow:(NSShadow *)shadow ofRange:(NSRange)range;

#pragma mark - 设置凸版印刷效果
- (NSMutableAttributedString *)setEffectOfRange:(NSRange)range;

#pragma mark - 设置上下偏移
- (NSMutableAttributedString *)setOffset:(NSInteger)apart ofRange:(NSRange)range;

#pragma mark - 设置文字倾斜
- (NSMutableAttributedString *)setObliqueness:(CGFloat)apart ofRange:(NSRange)range;

#pragma makr - 设置文字左右拉伸
- (NSMutableAttributedString *)setExpansion:(CGFloat)apart ofRange:(NSRange)range;

#pragma mark - 设置文字书写方式(左-右|右-左)
- (NSMutableAttributedString *)setWritingDirection:(NSArray*)array ofRange:(NSRange)range;

#pragma mark - 设置文字的横竖排放
- (NSMutableAttributedString *)setVerticalGlyph:(NSInteger)type ofRnage:(NSRange)range;

#pragma mark - 设置超链接
- (NSMutableAttributedString *)setLink:(NSURL *)url ofRange:(NSRange)range;

#pragma mark - 设置图片 图文混排
- (NSMutableAttributedString *)setPhoto:(NSTextAttachment *)achment ofPosition:(NSInteger)position;
@end

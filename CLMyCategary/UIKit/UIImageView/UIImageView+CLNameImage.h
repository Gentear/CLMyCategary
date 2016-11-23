//
//  UIImageView+CLNameImage.h
//  CLMyCategary
//
//  Created by zyyt on 16/11/22.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (CLNameImage)
/**
 *  自动设置一个照片，类似头像中间有字母
 *
 *  @param string <#string description#>
 */
- (void)cl_setImageWithString:(NSString *)string;

/**
 *  自动设置一个照片，类似头像中间有字母，给定颜色
 *
 *  @param string <#string description#>
 */
- (void)cl_setImageWithString:(NSString *)string color:(UIColor *)color;

/**
 *  自动设置一个照片，类似头像中间有字母
 *
 *  @param string <#string description#>
 */
- (void)cl_setImageWithString:(NSString *)string color:(UIColor *)color circular:(BOOL)isCircular;

/**
 *  自动设置一个照片，类似头像中间有字母
 *
 *  @param string <#string description#>
 */
- (void)cl_setImageWithString:(NSString *)string color:(UIColor *)color circular:(BOOL)isCircular fontName:(NSString *)fontName;

/**
 *  自动设置一个照片，类似头像中间有字母
 *
 *  @param string <#string description#>
 */
- (void)cl_setImageWithString:(NSString *)string color:(UIColor *)color circular:(BOOL)isCircular textAttributes:(NSDictionary *)textAttributes;
/**
 *  图片水印
 */
- (void)cl_setImage:(UIImage *)image withWaterMark:(UIImage *)mark inRect:(CGRect)rect;
/**
 *  文字水印
 */
- (void)cl_setImage:(UIImage *)image withStringWaterMark:(NSString *)markString inRect:(CGRect)rect color:(UIColor *)color font:(UIFont *)font;
/**
 *  文字水印
 */
- (void)cl_setImage:(UIImage *)image withStringWaterMark:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font;
@end

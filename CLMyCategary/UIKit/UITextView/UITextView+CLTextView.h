//
//  UITextView+CLTextView.h
//  CLMyCategary
//
//  Created by zyyt on 16/10/10.
//  Copyright © 2016年 conglei. All rights reserved.
//

//#import <UIKit/UIKit.h>
//
//@interface UITextView (CLTextView)
//
//@end
@import UIKit;

FOUNDATION_EXPORT double UITextView_PlaceholderVersionNumber;
FOUNDATION_EXPORT const unsigned char UITextView_PlaceholderVersionString[];

@interface UITextView (CLTextView)

@property (nonatomic, readonly) UILabel *placeholderLabel;
/**
 *  提示文字
 */
@property (nonatomic, strong) IBInspectable NSString *placeholder;
@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

+ (UIColor *)defaultPlaceholderColor;

/**
 *  用于计算textview输入情况下的字符数，解决实现限制字符数时，计算不准的问题
 */
- (NSInteger)cl_getInputLengthWithText:(NSString *)text;
@end
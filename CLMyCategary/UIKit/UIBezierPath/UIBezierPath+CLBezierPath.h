//
//  UIBezierPath+CLBezierPath.h
//  myCategary
//
//  Created by zyyt on 16/9/10.
//  Copyright © 2016年 丛蕾. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBezierPath (CLBezierPath)

+ (nullable UIBezierPath *)bezierPathWithText:(NSString *)text font:(UIFont *)font;

@end
NS_ASSUME_NONNULL_END
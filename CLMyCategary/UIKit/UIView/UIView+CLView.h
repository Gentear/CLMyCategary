//
//  UIView+CLView.h
//  myCategary
//
//  Created by zyyt on 16/9/5.
//  Copyright © 2016年 丛蕾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CLView)
@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.
/**
 Returns the view's view controller (may be nil).
 */
@property (nullable, nonatomic, readonly) UIViewController *viewController;
/**
 *  移除所有view
 */
- (void)CL_removeAllSubviews;
/**
 *  得到圆形搜索框
 *
 *  @param myColor <#myColor description#>
 */
- (void)CL_getSearchImage:(UIColor *)newColor;
/**
 *  增加毛玻璃
 *
 *  @param frame 大小
 *  @param alpha 透明度
 */
- (void)CL_addGlasses:(CGRect)frame alpha:(CGFloat)alpha;

@end

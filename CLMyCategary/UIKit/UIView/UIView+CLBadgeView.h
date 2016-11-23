//
//  UIView+CLBadgeView.h
//  myCategary
//
//  Created by zyyt on 16/9/5.
//  Copyright © 2016年 丛蕾. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CLBadgeViewPosition) {
    CLBadgeViewPositionTopLeft = 0,
    CLBadgeViewPositionTopRight,
    CLBadgeViewPositionTopCenter,
    CLBadgeViewPositionBottomLeft,
    CLBadgeViewPositionBottomRight,
    CLBadgeViewPositionBottomCenter,
    CLBadgeViewPositionCenterLeft,
    CLBadgeViewPositionCenterRight
};

typedef NS_ENUM(NSUInteger, CLBadgeStyle) {
    CLBadgeStyleDot = 0,
    CLBadgeStyleNumber,
    CLBadgeStyleNew
};

typedef NS_ENUM(NSUInteger, CLBadgeAnimationType) {
    CLBadgeAnimationTypeNone = 0,
    CLBadgeAnimationTypeScale,
    CLBadgeAnimationTypeShake,
    CLBadgeAnimationTypeBreathe
};

@interface CLBadgeView : UIView

@property (assign, nonatomic) NSInteger  badgeValue; /**< 要显示的数字 */

@property (assign, nonatomic) NSInteger  maxbadgeValue; /**< 可以显示的最大数字 默认为99 大于此数字显示+ */

@property (strong, nonatomic) UIFont    *font; /**< 字体 默认[UIFont boldSystemFontOfSize:11.0] */

@property (strong, nonatomic) UIColor   *badgeColor; /**< 背景颜色 默认[UIColor redColor] */

@property (strong, nonatomic) UIColor   *textColor; /**< 文字颜色 默认[UIColor whiteColor] */

@property (strong, nonatomic) UIColor   *outlineColor; /**< 外圈颜色 默认[UIColor whiteColor] */

@property (assign, nonatomic) CGFloat    outlineWidth; /**< 外圈的宽度 默认为0 */

@property (assign, nonatomic) CGFloat    minDiameter; /**< 圆的最小直径 默认20 */

@property (assign, nonatomic) CGPoint    positionOffset; /**< 设置相对于原位置的偏移量 */

@property (assign, nonatomic) CLBadgeViewPosition position; /**< 位置 */

@property (assign, nonatomic) CLBadgeStyle badgeStyle; /**< 样式 */

@property (assign, nonatomic) CLBadgeAnimationType animationType; /**< 动画样式 */

@end


@interface UIView (CLBadgeView)

@property(strong, nonatomic, readonly) CLBadgeView *badgeView;

@property (assign, nonatomic) NSInteger badgeValue; /**< 更改显示的数字 */

/**
 *  显示方法
 *
 *  @param badgeStyle    样式
 *  @param animationType 动画样式
 *  @param badgeValue    显示的数值，当CLBadgeStyle为CLBadgeStyleNumber时生效
 */
- (void)showBadgeWithBadgeStyle:(CLBadgeStyle)badgeStyle animationType:(CLBadgeAnimationType)animationType badgeValue:(NSInteger)badgeValue;

/** 清除 显示其他样式再调用上面方法即可 如果只是更改数字则设置self.badgeValue即可 */
- (void)clearBadge;

@end

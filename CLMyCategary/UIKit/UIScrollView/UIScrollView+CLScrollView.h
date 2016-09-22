//
//  UIScrollView+CLScrollView.h
//  myCategary
//
//  Created by zyyt on 16/9/9.
//  Copyright © 2016年 丛蕾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (CLScrollView)

/**
 Scroll content to top with animation.
 */
- (void)scrollToTop;

/**
 Scroll content to bottom with animation.
 */
- (void)scrollToBottom;

/**
 Scroll content to left with animation.
 */
- (void)scrollToLeft;

/**
 Scroll content to right with animation.
 */
- (void)scrollToRight;

/**
 Scroll content to top.
 */
- (void)scrollToTopAnimated:(BOOL)animated;

/**
 Scroll content to bottom.
 */
- (void)scrollToBottomAnimated:(BOOL)animated;

/**
 Scroll content to left.
 */
- (void)scrollToLeftAnimated:(BOOL)animated;

/**
 Scroll content to right.
 */
- (void)scrollToRightAnimated:(BOOL)animated;
/**
 *  竖直方向的页数
 */
- (NSUInteger)CL_verticalPageIndex;
/**
 *  竖直方向的页数
 */
- (NSUInteger)CL_horizontalPageIndex;
/**
 *  跳转竖直方向的页数
 */
- (void)CL_scrollToVerticalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;
/**
 *  跳转水平方向的页数
 */
- (void)CL_scrollToHorizontalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;
@end

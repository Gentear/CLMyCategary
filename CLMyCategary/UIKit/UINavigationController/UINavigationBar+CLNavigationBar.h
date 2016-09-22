//
//  UINavigationBar+CLNavigationBar.h
//  myCategary
//
//  Created by zyyt on 16/9/18.
//  Copyright © 2016年 丛蕾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (CLNavigationBar)
/**
 * 导航条颜色        [self.navigationController.navigationBar CL_setBackgroundColor:[color colorWithAlphaComponent:0]];

 */
- (void)CL_setBackgroundColor:(UIColor *)backgroundColor;
/**
 *  alpha值    [self.navigationController.navigationBar CL_setElementsAlpha:(1-progress)];

 */
- (void)CL_setElementsAlpha:(CGFloat)alpha;
/**
 *      [self.navigationController.navigationBar CL_setTranslationY:(-44 * progress)];
 *
 */
- (void)CL_setTranslationY:(CGFloat)translationY;
/**
 *  viewWillDisappear    [self.navigationController.navigationBar CL_reset];

 */
- (void)CL_reset;
@end

//
//  UIWindow+CLWindow.h
//  CLMyCategary
//
//  Created by zyyt on 16/11/22.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (CLWindow)
/**
 *  当前显示的window
 *
 */
- (UIViewController*)cl_topMostController;
/**
 *  获取当前的window
 *
 */
- (UIViewController*)cl_currentViewController;
@end

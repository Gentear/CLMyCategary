//
//  UIView+KeyboardHandler.h
//  DDKeyboardHandler
//
//  Created by diaoshu on 15/4/23.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KeyboardObserver)

/**
 *  添加键盘监控
 *  please add the method in 'viewDidAppear' method
 */
- (void)cl_addKeyboardObserver;

/**
 *  移除
 *  please add the method in 'viewDidDisappear' method
 */
- (void)cl_removeKeyboardObserver;

@end

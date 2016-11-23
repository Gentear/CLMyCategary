//
//  UIViewController+CLViewController.h
//  CLMyCategary
//
//  Created by zyyt on 16/9/22.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CLViewController)
@property (nonatomic, assign) BOOL hidesNavigationBarWhenPush;
/**
 *  添加导航条title
 */
-(void)cl_setCustomNavigationTitle:(NSString *)title;
/**
 *  添加返回按钮文字
 *
 */
-(UIButton *)cl_add_navigation_back_title:(NSString *)title;
/**
 *  添加左边按钮图片
 *
 */
-(UIButton *)cl_add_navigation_left_buttonWithNormalImage:(NSString *)normalImageName highlightImage:(NSString *)highlightImageName;
/**
 *  添加返回按钮
 */
-(void)cl_add_navigation_back_button;
/**
 *  添加右边按钮
 *
 */
-(UIButton *)cl_add_navigation_right_buttonWithNormalImage:(NSString *)normalImageName highlightImage:(NSString *)highlightImageName;
/**
 *  添加返回手势
 */
-(void)cl_setPopThouch;
/**
 *  是否可见
 */
- (BOOL)cl_isVisible;

-(UIButton *)cl_add_navigation_right_button_BT:(UIButton *)rightButton;

-(UIButton *)cl_add_navigation_right_button_title:(NSString *)title;

- (void)cl_hideTabBar;

- (void)cl_showTabBar;

- (void)cl_hideTabBar:(UITabBarController *)tab;

- (void)cl_showTabBar:(UITabBarController *)tab;


-(void)cl_dismissRootVCWithAnimation:(BOOL)isAnimation;

-(void)cl_setBackGroudImage:(UIImage *)image;

-(void)cl_setnavigationTranslucent:(BOOL)flag;

-(void)cl_setTabConreollerTranslucent:(BOOL)flag;

@end


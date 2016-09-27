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
-(void)setCustomNavigationTitle:(NSString *)title;
/**
 *  添加返回按钮文字
 *
 */
-(UIButton *)add_navigation_back_title:(NSString *)title;
/**
 *  添加左边按钮图片
 *
 */
-(UIButton *)add_navigation_left_buttonWithNormalImage:(NSString *)normalImageName highlightImage:(NSString *)highlightImageName;
/**
 *  添加返回按钮
 */
-(void)add_navigation_back_button;
/**
 *  添加右边按钮
 *
 */
-(UIButton *)add_navigation_right_buttonWithNormalImage:(NSString *)normalImageName highlightImage:(NSString *)highlightImageName;
/**
 *  添加返回手势
 */
-(void)setPopThouch;

-(UIButton *)add_navigation_right_button_BT:(UIButton *)rightButton;

-(UIButton *)add_navigation_right_button_title:(NSString *)title;

- (void)hideTabBar;

- (void)showTabBar;

- (void)hideTabBar:(UITabBarController *)tab;

- (void)showTabBar:(UITabBarController *)tab;


-(void)dismissRootVCWithAnimation:(BOOL)isAnimation;

-(void)setBackGroudImage:(UIImage *)image;

-(void)setnavigationTranslucent:(BOOL)flag;

-(void)setTabConreollerTranslucent:(BOOL)flag;

@end


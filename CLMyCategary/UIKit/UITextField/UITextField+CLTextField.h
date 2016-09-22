//
//  UITextField+CLTextField.h
//  myCategary
//
//  Created by zyyt on 16/9/12.
//  Copyright © 2016年 丛蕾. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  通过添加UITextField类目，使用runtime实现，TextField被遮挡时视图上移效果，
 *  点击对应的父视图的空白地方回收键盘，不需要写一句代码，所有TextField全拥有此功能，
 *  可以控制是否开启，上移视图，
 *  可以设置距keyboard距离
 *  支持第三方键盘显示隐藏
 **/

@interface UITextField (CLTextField)

/**
 *  是否支持视图上移
 */
@property (nonatomic, assign) BOOL cl_canMove;
/**
 *  点击回收键盘、移动的视图，默认是当前控制器的view
 */
@property (nonatomic, strong) UIView *cl_moveView;
/**
 *  textfield底部距离键盘顶部的距离
 */
@property (nonatomic, assign) CGFloat cl_heightToKeyboard;
/**
 *  最大长度
 */
@property (assign, nonatomic)  NSUInteger maxLength;

/**
    选中所有的text
 */
- (void)selectAllText;

/**
    选中指定的text
 */
- (void)setSelectedRange:(NSRange)range;

@end

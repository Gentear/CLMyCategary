//
//  UIButton+LZCategory.h
//  LZButtonCategory
//
//  Created by Artron_LQQ on 16/5/5.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,CLCategoryType) {
    CLCategoryTypeLeft = 0,
    CLCategoryTypeBottom,
};
@interface UIButton (CLButton)
/**
 *  可以用这个给重复点击加间隔
 */
@property (nonatomic, assign) NSTimeInterval custom_acceptEventInterval;
/**
 *  设置按钮额外热区
 */
@property (nonatomic, assign) UIEdgeInsets cl_touchAreaInsets;
/**
 *  将按钮文字放置
 *
 *  @param clType CLCategoryTypeLeft/CLCategoryTypeBottom
 */
- (void)CL_SetbuttonType:(CLCategoryType)clType;
@end

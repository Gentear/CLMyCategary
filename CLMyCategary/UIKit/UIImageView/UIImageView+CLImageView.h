//
//  UIImageView+CLImageView.h
//  CLMyCategary
//
//  Created by zyyt on 16/9/27.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (CLImageView)
/**
*  创建圆角半径为r
*
*  @param cornerRadius   r
*  @param rectCornerType UIRectCornerAllCorners 圆角位置
*/
- (instancetype)initWithCornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;
/**
 *  创建圆角半径为r
 *
 *  @param cornerRadius   r
 *  @param rectCornerType UIRectCornerAllCorners圆角位置
 */
- (void)cl_cornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;
/**
 *  获得圆形的imageview
 *
 *  @return image
 */
- (instancetype)initWithRoundingRectImageView;
/**
 *  获得圆形的imageview
 *
 *  @return image
 */
- (void)cl_cornerRadiusRoundingRect;
/**
 *  可为UIImageView的图片附加边框
 */
- (void)cl_attachBorderWidth:(CGFloat)width color:(UIColor *)color;
@end

//
//  UIImage+CLImage.h
//  myCategary
//
//  Created by zyyt on 16/9/12.
//  Copyright © 2016年 丛蕾. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, CLAccuracy) {
    CLAccuracyLow = 0,
    CLAccuracyHigh,
};
@interface UIImage (CLImage)
/**
 *  裁剪圆形
 */
- (UIImage *)cl_getRedioImageWithImage;

/** 提供一个加载原始图片方法 */
+ (instancetype)cl_imageNamedWithOriganlMode:(NSString *)imageName;
/**
 *  获取图片颜色
 */
- (UIColor *)cl_averageColor;
/**
 *  @brief  取图片某一点的颜色
 *
 *  @param point 某一点
 *
 *  @return 颜色
 */
- (UIColor *)cl_colorAtPoint:(CGPoint )point;
/**
 *  识别脸部图片然后移到正中
 */
- (UIImage *)cl_betterFaceImageForSize:(CGSize)size
                              accuracy:(CLAccuracy)accurary;
/**
 *  @brief  根据main bundle中的文件名读取图片
 *
 *  @param name 图片名
 *
 *  @return 无缓存的图片
 */
+ (UIImage *)cl_imageWithFileName:(NSString *)name;
/**
 *  @brief  合并两个图片
 *
 *  @param firstImage  一个图片
 *  @param secondImage 二个图片
 *
 *  @return 合并后图片
 */
+ (UIImage*)cl_mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;

/**
 *  获得指定size的图片
 *
 *  @param image   原始图片
 *  @param newSize 指定的size
 *
 *  @return 调整后的图片
 */
+ (UIImage *)cl_resizeImage:(UIImage *) image withNewSize:(CGSize) newSize;
@end

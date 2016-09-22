//
//  UIImage+CLImage.m
//  myCategary
//
//  Created by zyyt on 16/9/12.
//  Copyright © 2016年 丛蕾. All rights reserved.
//

#import "UIImage+CLImage.h"

@implementation UIImage (CLImage)
- (UIImage *)CL_getRedioImageWithImage{
    
    //    UIColor *borderColor = [UIColor grayColor];
    //    CGFloat borderWidth = 0;
    // borderWidth 表示边框的宽度
    CGFloat imageW = self.size.width;
    CGFloat imageH = imageW;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    // borderColor表示边框的颜色
    CGFloat bigRadius = imageW * 0.5;
    CGFloat centerX = bigRadius;
    CGFloat centerY = bigRadius;
    CGContextAddArc(context, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(context);
    CGFloat smallRadius = bigRadius;
    CGContextAddArc(context, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    CGContextClip(context);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end

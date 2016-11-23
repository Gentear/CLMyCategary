//
//  UILabel+CLLabel.m
//  CLMyCategary
//
//  Created by zyyt on 16/9/27.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import "UILabel+CLLabel.h"
#import "UIImage+CLImage.h"

@implementation UILabel (CLLabel)

- (void) changeTextColorToUnmatchTheBG {
    if (!self.window)
        return;
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 1);
    if (!UIGraphicsGetCurrentContext())
        return;
    
    NSString* auxText = self.text;
    self.text = nil;
    CGRect frame = self.window.bounds;
    CGPoint origin = [self.window convertPoint:self.frame.origin fromView:self.superview];
    frame.origin.x = -origin.x;
    frame.origin.y = -origin.y;
    [self.window drawViewHierarchyInRect:frame afterScreenUpdates:YES];
    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIColor* newColor = [snapshot cl_averageColor];
    
    const CGFloat *componentColors = CGColorGetComponents(newColor.CGColor);
    
    CGFloat colorBrightness = ((componentColors[0] * 299) + (componentColors[1] * 587) + (componentColors[2] * 114)) / 1000;
    if (colorBrightness < 0.6) {
        newColor = [UIColor whiteColor];
    }
    else {
        newColor = [UIColor blackColor];
    }
    
    [self setTextColor:newColor];
    
    self.text = auxText;
}
@end

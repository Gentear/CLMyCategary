//
//  UIImageView+CLImageView.m
//  CLMyCategary
//
//  Created by zyyt on 16/9/27.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import "UIImageView+CLImageView.h"
#import <objc/runtime.h>

const char kProcessedImage;

@interface UIImageView ()

@property (assign, nonatomic) CGFloat clRadius;
@property (assign, nonatomic) UIRectCorner roundingCorners;
@property (assign, nonatomic) CGFloat clBorderWidth;
@property (strong, nonatomic) UIColor *clBorderColor;
@property (assign, nonatomic) BOOL clHadAddObserver;
@property (assign, nonatomic) BOOL clIsRounding;

@end





@implementation UIImageView (CornerRadius)
/**
 * @brief init the Rounding UIImageView, no off-screen-rendered
 */
- (instancetype)initWithRoundingRectImageView {
    self = [super init];
    if (self) {
        [self cl_cornerRadiusRoundingRect];
    }
    return self;
}

/**
 * @brief init the UIImageView with cornerRadius, no off-screen-rendered
 */
- (instancetype)initWithCornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType {
    self = [super init];
    if (self) {
        [self cl_cornerRadiusAdvance:cornerRadius rectCornerType:rectCornerType];
    }
    return self;
}

/**
 * @brief attach border for UIImageView with width & color
 */
- (void)cl_attachBorderWidth:(CGFloat)width color:(UIColor *)color {
    self.clBorderWidth = width;
    self.clBorderColor = color;
}

#pragma mark - Kernel
/**
 * @brief clip the cornerRadius with image, UIImageView must be setFrame before, no off-screen-rendered
 */
- (void)cl_cornerRadiusWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType {
    CGSize size = self.bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize cornerRadii = CGSizeMake(cornerRadius, cornerRadius);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    if (nil == currentContext) {
        return;
    }
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCornerType cornerRadii:cornerRadii];
    [cornerPath addClip];
    [self.layer renderInContext:currentContext];
    [self drawBorder:cornerPath];
    UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (processedImage) {
        objc_setAssociatedObject(processedImage, &kProcessedImage, @(1), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    self.image = processedImage;
}

/**
 * @brief clip the cornerRadius with image, draw the backgroundColor you want, UIImageView must be setFrame before, no off-screen-rendered, no Color Blended layers
 */
- (void)cl_cornerRadiusWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType backgroundColor:(UIColor *)backgroundColor {
    CGSize size = self.bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize cornerRadii = CGSizeMake(cornerRadius, cornerRadius);
    
    UIGraphicsBeginImageContextWithOptions(size, YES, scale);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    if (nil == currentContext) {
        return;
    }
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCornerType cornerRadii:cornerRadii];
    UIBezierPath *backgroundRect = [UIBezierPath bezierPathWithRect:self.bounds];
    [backgroundColor setFill];
    [backgroundRect fill];
    [cornerPath addClip];
    [self.layer renderInContext:currentContext];
    [self drawBorder:cornerPath];
    UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (processedImage) {
        objc_setAssociatedObject(processedImage, &kProcessedImage, @(1), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    self.image = processedImage;
}

/**
 * @brief set cornerRadius for UIImageView, no off-screen-rendered
 */
- (void)cl_cornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType {
    self.clRadius = cornerRadius;
    self.roundingCorners = rectCornerType;
    self.clIsRounding = NO;
    if (!self.clHadAddObserver) {
        [[self class] swizzleDealloc];
        [self addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
        self.clHadAddObserver = YES;
    }
    //Xcode 8 xib 删除了控件的Frame信息，需要主动创造
    [self layoutIfNeeded];
}

/**
 * @brief become Rounding UIImageView, no off-screen-rendered
 */
- (void)cl_cornerRadiusRoundingRect {
    self.clIsRounding = YES;
    if (!self.clHadAddObserver) {
        [[self class] swizzleDealloc];
        [self addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
        self.clHadAddObserver = YES;
    }
    //Xcode 8 xib 删除了控件的Frame信息，需要主动创造
    [self layoutIfNeeded];
}

#pragma mark - Private
- (void)drawBorder:(UIBezierPath *)path {
    if (0 != self.clBorderWidth && nil != self.clBorderColor) {
        [path setLineWidth:2 * self.clBorderWidth];
        [self.clBorderColor setStroke];
        [path stroke];
    }
}

- (void)cl_dealloc {
    if (self.clHadAddObserver) {
        [self removeObserver:self forKeyPath:@"image"];
    }
    [self cl_dealloc];
}

- (void)validateFrame {
    if (self.frame.size.width == 0) {
        [self.class swizzleLayoutSubviews];
    }
}

+ (void)swizzleMethod:(SEL)oneSel anotherMethod:(SEL)anotherSel {
    Method oneMethod = class_getInstanceMethod(self, oneSel);
    Method anotherMethod = class_getInstanceMethod(self, anotherSel);
    method_exchangeImplementations(oneMethod, anotherMethod);
}

+ (void)swizzleDealloc {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:NSSelectorFromString(@"dealloc") anotherMethod:@selector(cl_dealloc)];
    });
}

+ (void)swizzleLayoutSubviews {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(layoutSubviews) anotherMethod:@selector(cl_LayoutSubviews)];
    });
}

- (void)cl_LayoutSubviews {
    [self cl_LayoutSubviews];
    if (self.clIsRounding) {
        [self cl_cornerRadiusWithImage:self.image cornerRadius:self.frame.size.width/2 rectCornerType:UIRectCornerAllCorners];
    } else if (0 != self.clRadius && 0 != self.roundingCorners && nil != self.image) {
        [self cl_cornerRadiusWithImage:self.image cornerRadius:self.clRadius rectCornerType:self.roundingCorners];
    }
}

#pragma mark - KVO for .image
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"image"]) {
        UIImage *newImage = change[NSKeyValueChangeNewKey];
        if ([newImage isMemberOfClass:[NSNull class]]) {
            return;
        } else if ([objc_getAssociatedObject(newImage, &kProcessedImage) intValue] == 1) {
            return;
        }
        [self validateFrame];
        if (self.clIsRounding) {
            [self cl_cornerRadiusWithImage:newImage cornerRadius:self.frame.size.width/2 rectCornerType:UIRectCornerAllCorners];
        } else if (0 != self.clRadius && 0 != self.roundingCorners && nil != self.image) {
            [self cl_cornerRadiusWithImage:newImage cornerRadius:self.clRadius rectCornerType:self.roundingCorners];
        }
    }
}

#pragma mark property
- (CGFloat)clBorderWidth {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setClBorderWidth:(CGFloat)clBorderWidth {
    objc_setAssociatedObject(self, @selector(clBorderWidth), @(clBorderWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)clBorderColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setClBorderColor:(UIColor *)clBorderColor {
    objc_setAssociatedObject(self, @selector(clBorderColor), clBorderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)clHadAddObserver {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setClHadAddObserver:(BOOL)clHadAddObserver {
    objc_setAssociatedObject(self, @selector(clHadAddObserver), @(clHadAddObserver), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)clIsRounding {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setClIsRounding:(BOOL)clIsRounding {
    objc_setAssociatedObject(self, @selector(clIsRounding), @(clIsRounding), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIRectCorner)roundingCorners {
    return [objc_getAssociatedObject(self, _cmd) unsignedLongValue];
}

- (void)setRoundingCorners:(UIRectCorner)roundingCorners {
    objc_setAssociatedObject(self, @selector(roundingCorners), @(roundingCorners), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)clRadius {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setClRadius:(CGFloat)clRadius {
    objc_setAssociatedObject(self, @selector(clRadius), @(clRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end

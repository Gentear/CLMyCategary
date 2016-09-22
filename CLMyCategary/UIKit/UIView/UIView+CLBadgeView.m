//
//  UIView+CLBadgeView.m
//  CLBadgeViewDemo
//
//  Created by lisong on 15/12/19.
//  Copyright © 2015年 haohaozhu. All rights reserved.
//

#import "UIView+CLBadgeView.h"

#import <objc/runtime.h>

static CGFloat const dotWidth = 10.0;

static CGFloat const animationDuration = 1.0;

#define Margin 2.0 + self.outlineWidth
#define TotalMargin (Margin) * 2.0

@implementation CLBadgeView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.font            = [UIFont boldSystemFontOfSize:11.0];
        self.badgeColor      = [UIColor redColor];
        self.textColor       = [UIColor whiteColor];
        self.outlineColor    = [UIColor whiteColor];
        self.minDiameter     = 20.0;
        self.maxbadgeValue   = 99;
        self.position        = CLBadgeViewPositionTopRight;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    if (self.badgeStyle == CLBadgeStyleNumber && self.badgeValue == 0) {
        return;
    }
    
    NSString *string = [self stringToDraw];
    CGSize numberSize = [string sizeWithAttributes:@{NSFontAttributeName: self.font}];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.outlineColor set];
    CGContextFillEllipseInRect(context, rect);
    
    [self.badgeColor set];
    CGContextFillEllipseInRect(context, CGRectInset(rect, self.outlineWidth, self.outlineWidth));
    
    [self.textColor set];
    NSMutableParagraphStyle *paragrapStyle = [NSMutableParagraphStyle new];
    paragrapStyle.alignment = NSTextAlignmentCenter;
    
    CGRect lblRect = CGRectMake(rect.origin.x, (rect.size.height / 2.0) - (numberSize.height / 2.0), rect.size.width, numberSize.height);
    
    [string drawInRect:lblRect withAttributes:@{NSFontAttributeName : self.font,
                                                NSParagraphStyleAttributeName : paragrapStyle,
                                                NSForegroundColorAttributeName : self.textColor}];
}

#pragma mark - Setters

- (void)setBadgeValue:(NSInteger)badgeValue {
    if(_badgeValue != badgeValue) {
        _badgeValue = badgeValue;
        
        if(badgeValue != 0) {
            [self updateBadgeViewSize];
            self.hidden = NO;
        } else {
            self.hidden = YES;
        }
        
        [self setNeedsDisplay];
    }
}

- (void)setPosition:(CLBadgeViewPosition)position {
    if(_position != position) {
        _position = position;
        [self updateBadgeViewPosition];
    }
}

- (void)setMinDiameter:(CGFloat)minDiameter {
    if (_minDiameter != minDiameter) {
        _minDiameter = minDiameter;
        [self setNeedsDisplay];
    }
}

- (void)setBadgeColor:(UIColor *)badgeColor {
    if(_badgeColor != badgeColor) {
        _badgeColor = badgeColor;
        [self setNeedsDisplay];
    }
}

- (void)setTextColor:(UIColor *)textColor {
    if(_textColor != textColor) {
        _textColor = textColor;
        [self setNeedsDisplay];
    }
}

- (void)setOutlineColor:(UIColor *)outlineColor {
    if(_outlineColor != outlineColor) {
        _outlineColor = outlineColor;
        [self setNeedsDisplay];
    }
}

- (void)setOutlineWidth:(CGFloat)outlineWidth {
    if(_outlineWidth != outlineWidth) {
        _outlineWidth = outlineWidth;
        [self setNeedsDisplay];
    }
}

- (void)setFont:(UIFont *)font {
    if(_font != font) {
        _font = font;
        [self updateBadgeViewSize];
    }
}

- (void)setPositionOffset:(CGPoint)positionOffset {
    if (!CGPointEqualToPoint(_positionOffset, positionOffset)) {
        _positionOffset = positionOffset;
        [self updateBadgeViewPosition];
    }
}

- (void)setMaxbadgeValue:(NSInteger)maxbadgeValue {
    if (_maxbadgeValue != maxbadgeValue) {
        _maxbadgeValue = maxbadgeValue;
        [self updateBadgeViewSize];
        [self setNeedsDisplay];
    }
}

- (void)setBadgeStyle:(CLBadgeStyle)badgeStyle {
    if (_badgeStyle != badgeStyle) {
        _badgeStyle = badgeStyle;
        
        [self updateBadgeViewSize];
        [self setNeedsDisplay];
    }
}

- (void)setAnimationType:(CLBadgeAnimationType)animationType {
    if (_animationType != animationType) {
        _animationType = animationType;
        
        [self.layer removeAllAnimations];
        
        switch (animationType) {
            case CLBadgeAnimationTypeScale: {
                CABasicAnimation *animation   = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
                animation.fromValue           = @(1.4);
                animation.toValue             = @(0.6);
                animation.duration            = animationDuration;
                animation.autoreverses        = YES;
                animation.repeatCount         = INT_MAX;
                animation.removedOnCompletion = NO;
                animation.fillMode            = kCAFillModeForwards;
                [self.layer addAnimation:animation forKey:nil];
                break;
            }
            case CLBadgeAnimationTypeShake: {
                CGPoint originPos  = self.center;
                CGSize  originSize = self.bounds.size;
                CGFloat hOffset    = originSize.width / 4;
                CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
                animation.values = @[[NSValue valueWithCGPoint:CGPointMake(originPos.x, originPos.y)],
                                     [NSValue valueWithCGPoint:CGPointMake(originPos.x - hOffset, originPos.y)],
                                     [NSValue valueWithCGPoint:CGPointMake(originPos.x, originPos.y)],
                                     [NSValue valueWithCGPoint:CGPointMake(originPos.x + hOffset, originPos.y)],
                                     [NSValue valueWithCGPoint:CGPointMake(originPos.x, originPos.y)]];
                animation.repeatCount = INT_MAX;
                animation.duration    = animationDuration;
                animation.fillMode    = kCAFillModeForwards;
                [self.layer addAnimation:animation forKey:nil];
                break;
            }
            case CLBadgeAnimationTypeBreathe: {
                CABasicAnimation *animation   = [CABasicAnimation animationWithKeyPath:@"opacity"];
                animation.fromValue           = [NSNumber numberWithFloat:1.0];
                animation.toValue             = [NSNumber numberWithFloat:0.1];
                animation.autoreverses        = YES;
                animation.duration            = animationDuration;
                animation.repeatCount         = INT_MAX;
                animation.fillMode            = kCAFillModeForwards;
                animation.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
                animation.removedOnCompletion = NO;
                [self.layer addAnimation:animation forKey:nil];
                break;
            }
            case CLBadgeAnimationTypeNone: {
                break;
            }
        }
    }
}

#pragma mark - Private Methods

- (NSString *)stringToDraw {
    switch (self.badgeStyle) {
        case CLBadgeStyleDot: {
            return @"";
        }
        case CLBadgeStyleNumber: {
            if (self.badgeValue > self.maxbadgeValue) {
                return [NSString stringWithFormat:@"%ld+", (long)self.maxbadgeValue];
            }else {
                return [NSString stringWithFormat:@"%ld", (long)self.badgeValue];
            }
        }
        case CLBadgeStyleNew: {
            return @"new";
        }
    }
}

- (void)updateBadgeViewSize {
    CGSize numberSize = [[self stringToDraw] sizeWithAttributes:@{NSFontAttributeName: self.font}];
    
    float badgeHeight = MAX(TotalMargin + numberSize.height, self.minDiameter);
    float badgeWidth = MAX(badgeHeight, TotalMargin + numberSize.width);
    
    [self setBounds:CGRectMake(0, 0, badgeWidth, badgeHeight)];
    
    switch (self.badgeStyle) {
        case CLBadgeStyleDot: {
            [self setBounds:CGRectMake(0, 0, dotWidth, dotWidth)];
            break;
        }
        case CLBadgeStyleNumber: {
            [self setBounds:CGRectMake(0, 0, badgeWidth, badgeHeight)];
            break;
        }
        case CLBadgeStyleNew: {
            [self setBounds:CGRectMake(0, 0, badgeWidth, badgeHeight)];
            break;
        }
    }
}

- (void)updateBadgeViewPosition {
    CGRect superviewFrame = self.superview.frame;
    
    switch (self.position) {
        case CLBadgeViewPositionTopRight: {
            self.center = CGPointMake(self.positionOffset.x + superviewFrame.size.width,
                                      self.positionOffset.y);
            break;
        }
        case CLBadgeViewPositionTopLeft: {
            self.center = CGPointMake(self.positionOffset.x, self.positionOffset.y);
            break;
        }
        case CLBadgeViewPositionBottomRight: {
            self.center = CGPointMake(self.positionOffset.x + superviewFrame.size.width,
                                      self.positionOffset.y + superviewFrame.size.height);
            break;
        }
        case CLBadgeViewPositionBottomLeft: {
            self.center = CGPointMake(self.positionOffset.x,
                                      self.positionOffset.y + superviewFrame.size.height);
            break;
        }
        case CLBadgeViewPositionTopCenter: {
            self.center = CGPointMake(self.positionOffset.x + superviewFrame.size.width / 2,
                                      self.positionOffset.y);
            break;
        }
        case CLBadgeViewPositionBottomCenter: {
            self.center = CGPointMake(self.positionOffset.x + superviewFrame.size.width / 2,
                                      self.positionOffset.y + superviewFrame.size.height);
            break;
        }
        case CLBadgeViewPositionCenterLeft: {
            self.center = CGPointMake(self.positionOffset.x,
                                      self.positionOffset.y + superviewFrame.size.height / 2);
            break;
        }
        case CLBadgeViewPositionCenterRight: {
            self.center = CGPointMake(self.positionOffset.x + superviewFrame.size.width,
                                      self.positionOffset.y + superviewFrame.size.height / 2);
            break;
        }
    }
}

@end


@implementation UIView (CLBadgeView)

- (void)showBadgeWithBadgeStyle:(CLBadgeStyle)badgeStyle animationType:(CLBadgeAnimationType)animationType badgeValue:(NSInteger)badgeValue {
    self.badgeView.badgeStyle    = badgeStyle;
    self.badgeView.animationType = animationType;
    self.badgeView.badgeValue    = badgeValue;
    self.badgeView.hidden        = NO;
    [self.badgeView updateBadgeViewPosition];
}

- (void)clearBadge {
    self.badgeView.badgeValue = 0;
    self.badgeView.hidden     = YES;
}

#pragma mark - Getters & Setters

- (void)setBadgeView:(CLBadgeView *)badgeView {
    objc_setAssociatedObject(self, @selector(badgeView), badgeView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CLBadgeView *)badgeView {
    
    CLBadgeView *badgeView = objc_getAssociatedObject(self, @selector(badgeView));
    
    if (!badgeView) {
        self.badgeView = [[CLBadgeView alloc] initWithFrame:CGRectZero];
        badgeView = objc_getAssociatedObject(self, @selector(badgeView));
        [self addSubview:badgeView];
    }
    
    return badgeView;
}

- (NSInteger)badgeValue {
    return self.badgeView.badgeValue;
}

- (void)setBadgeValue:(NSInteger)badgeValue {
    self.badgeView.badgeValue = badgeValue;
}

@end

//
//  UIImageView+CLNameImage.m
//  CLMyCategary
//
//  Created by zyyt on 16/11/22.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import "UIImageView+CLNameImage.h"

// This multiplier sets the font size based on the view bounds
static const CGFloat cl_FontResizingProportion = 0.42f;

@interface UIImageView (CLLettersPrivate)

- (UIImage *)cl_imageSnapshotFromText:(NSString *)text backgroundColor:(UIColor *)color circular:(BOOL)isCircular textAttributes:(NSDictionary *)attributes;

@end

@implementation UIImageView (CLNameImage)

- (void)cl_setImageWithString:(NSString *)string {
    [self cl_setImageWithString:string color:nil circular:NO textAttributes:nil];
}

- (void)cl_setImageWithString:(NSString *)string color:(UIColor *)color {
    [self cl_setImageWithString:string color:color circular:NO textAttributes:nil];
}

- (void)cl_setImageWithString:(NSString *)string color:(UIColor *)color circular:(BOOL)isCircular {
    [self cl_setImageWithString:string color:color circular:isCircular textAttributes:nil];
}

- (void)cl_setImageWithString:(NSString *)string color:(UIColor *)color circular:(BOOL)isCircular fontName:(NSString *)fontName {
    [self cl_setImageWithString:string color:color circular:isCircular textAttributes:@{
                                                                                        NSFontAttributeName:[self cl_fontForFontName:fontName],
                                                                                        NSForegroundColorAttributeName: [UIColor whiteColor]
                                                                                        }];
}

- (void)cl_setImageWithString:(NSString *)string color:(UIColor *)color circular:(BOOL)isCircular textAttributes:(NSDictionary *)textAttributes {
    if (!textAttributes) {
        textAttributes = @{
                           NSFontAttributeName: [self cl_fontForFontName:nil],
                           NSForegroundColorAttributeName: [UIColor whiteColor]
                           };
    }
    
    NSMutableString *displayString = [NSMutableString stringWithString:@""];
    
    NSMutableArray *words = [[string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] mutableCopy];
    
    //
    // Get first letter of the first and last word
    //
    if ([words count]) {
        NSString *firstWord = [words firstObject];
        if ([firstWord length]) {
            // Get character range to handle emoji (emojis consist of 2 characters in sequence)
            NSRange firstLetterRange = [firstWord rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, 1)];
            [displayString appendString:[firstWord substringWithRange:firstLetterRange]];
        }
        
        if ([words count] >= 2) {
            NSString *lastWord = [words lastObject];
            
            while ([lastWord length] == 0 && [words count] >= 2) {
                [words removeLastObject];
                lastWord = [words lastObject];
            }
            
            if ([words count] > 1) {
                // Get character range to handle emoji (emojis consist of 2 characters in sequence)
                NSRange lastLetterRange = [lastWord rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, 1)];
                [displayString appendString:[lastWord substringWithRange:lastLetterRange]];
            }
        }
    }
    
    UIColor *backgroundColor = color ? color : [self cl_letter_randomColor];
    
    self.image = [self cl_imageSnapshotFromText:[displayString uppercaseString] backgroundColor:backgroundColor circular:isCircular textAttributes:textAttributes];
}

#pragma mark - Helpers

- (UIFont *)cl_fontForFontName:(NSString *)fontName {
    
    CGFloat fontSize = CGRectGetWidth(self.bounds) * cl_FontResizingProportion;
    if (fontName) {
        return [UIFont fontWithName:fontName size:fontSize];
    }
    else {
        return [UIFont systemFontOfSize:fontSize];
    }
    
}

- (UIColor *)cl_letter_randomColor {
    
    float red = 0.0;
    while (red < 0.1 || red > 0.84) {
        red = drand48();
    }
    
    float green = 0.0;
    while (green < 0.1 || green > 0.84) {
        green = drand48();
    }
    
    float blue = 0.0;
    while (blue < 0.1 || blue > 0.84) {
        blue = drand48();
    }
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

- (UIImage *)cl_imageSnapshotFromText:(NSString *)text backgroundColor:(UIColor *)color circular:(BOOL)isCircular textAttributes:(NSDictionary *)textAttributes {
    
    CGFloat scale = [UIScreen mainScreen].scale;
    
    CGSize size = self.bounds.size;
    if (self.contentMode == UIViewContentModeScaleToFill ||
        self.contentMode == UIViewContentModeScaleAspectFill ||
        self.contentMode == UIViewContentModeScaleAspectFit ||
        self.contentMode == UIViewContentModeRedraw)
    {
        size.width = floorf(size.width * scale) / scale;
        size.height = floorf(size.height * scale) / scale;
    }
    
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (isCircular) {
        //
        // Clip context to a circle
        //
        CGPathRef path = CGPathCreateWithEllipseInRect(self.bounds, NULL);
        CGContextAddPath(context, path);
        CGContextClip(context);
        CGPathRelease(path);
    }
    
    //
    // Fill background of context
    //
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    
    //
    // Draw text in the context
    //
    CGSize textSize = [text sizeWithAttributes:textAttributes];
    CGRect bounds = self.bounds;
    
    [text drawInRect:CGRectMake(bounds.size.width/2 - textSize.width/2,
                                bounds.size.height/2 - textSize.height/2,
                                textSize.width,
                                textSize.height)
      withAttributes:textAttributes];
    
    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return snapshot;
}
// 画水印
- (void)cl_setImage:(UIImage *)image withWaterMark:(UIImage *)mark inRect:(CGRect)rect
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0)
    {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0); // 0.0 for scale means "scale for device's main screen".
    }
    // CGContextRef thisctx = UIGraphicsGetCurrentContext();
    // CGAffineTransform myTr = CGAffineTransformMake(1, 0, 0, -1, 0, self.height);
    // CGContextConcatCTM(thisctx, myTr);
    //CGContextDrawImage(thisctx,CGRectMake(0,0,self.width,self.height),[image CGImage]); //原图
    //CGContextDrawImage(thisctx,rect,[mask CGImage]); //水印图
    //原图
    [image drawInRect:self.bounds];
    //水印图
    [mark drawInRect:rect];
    // NSString *s = @"dfd";
    // [[UIColor redColor] set];
    // [s drawInRect:self.bounds withFont:[UIFont systemFontOfSize:15.0]];
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.image = newPic;
}
- (void)cl_setImage:(UIImage *)image withStringWaterMark:(NSString *)markString inRect:(CGRect)rect color:(UIColor *)color font:(UIFont *)font
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0)
    {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0); // 0.0 for scale means "scale for device's main screen".
    }
    //原图
    [image drawInRect:self.bounds];
    //文字颜色
    [color set];
    // const CGFloat *colorComponents = CGColorGetComponents([color CGColor]);
    // CGContextSetRGBFillColor(context, colorComponents[0], colorComponents[1], colorComponents [2], colorComponents[3]);
    //水印文字
    if ([markString respondsToSelector:@selector(drawInRect:withAttributes:)])
    {
        [markString drawInRect:rect withAttributes:@{NSFontAttributeName:font}];
    }
    else
    {
        // pre-iOS7.0
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        [markString drawInRect:rect withFont:font];
#pragma clang diagnostic pop
    }
    
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.image = newPic;
}
- (void)cl_setImage:(UIImage *)image withStringWaterMark:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0)
    {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0); // 0.0 for scale means "scale for device's main screen".
    }
    //原图
    [image drawInRect:self.bounds];
    //文字颜色
    [color set];
    //水印文字
    
    if ([markString respondsToSelector:@selector(drawAtPoint:withAttributes:)])
    {
        [markString drawAtPoint:point withAttributes:@{NSFontAttributeName:font}];
    }
    else
    {
        // pre-iOS7.0
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        [markString drawAtPoint:point withFont:font];
#pragma clang diagnostic pop
    }
    
    
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.image = newPic;
}
@end

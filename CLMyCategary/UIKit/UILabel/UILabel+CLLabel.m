//
//  UILabel+CLLabel.m
//  CLMyCategary
//
//  Created by zyyt on 16/9/27.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import "UILabel+CLLabel.h"

@implementation UILabel (CLLabel)
+ (void)load
{
    [self swizzleSelector:@selector(addSubview:) withSwizzledSelector:@selector(addSubviewWithColor:)];
}
- (void)addSubviewWithColor:(UIView *)view{
    [self addSubviewWithColor:view];
    self.backgroundColor = view.backgroundColor;
}
@end

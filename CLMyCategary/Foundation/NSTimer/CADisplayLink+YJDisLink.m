//
//  CADisplayLink+YJDisLink.m
//  E_Jian
//
//  Created by zyyt on 16/11/9.
//  Copyright © 2016年 Justin. All rights reserved.
//

#import "CADisplayLink+YJDisLink.h"

static void(^diaplayBlock)(CADisplayLink *displayLink) = nil;

@implementation CADisplayLink (YJDisLink)

+ (instancetype)cl_displayLinkWithBlock:(void (^)(CADisplayLink *displayLink))block{
    diaplayBlock = [block copy];
    return [self displayLinkWithTarget:self selector:@selector(blockInvoke:)];
}

+ (void)blockInvoke:(CADisplayLink *)displayLink{
    if (diaplayBlock) {
        diaplayBlock(displayLink);
    }
}

@end


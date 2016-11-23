//
//  CADisplayLink+YJDisLink.h
//  E_Jian
//
//  Created by zyyt on 16/11/9.
//  Copyright © 2016年 Justin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CADisplayLink (YJDisLink)

+ (instancetype)cl_displayLinkWithBlock:(void(^)(CADisplayLink *displayLink))block;

@end

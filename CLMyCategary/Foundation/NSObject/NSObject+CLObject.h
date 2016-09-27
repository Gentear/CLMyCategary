//
//  NSObject+CLObject.h
//  myCategary
//
//  Created by zyyt on 16/9/2.
//  Copyright © 2016年 zyyt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CLObject)
/**
 *  方法交换
 *
 *  @param originalSelector 系统方法
 *  @param swizzledSelector 新方法
 */
+ (void)swizzleSelector:(SEL)originalSelector withSwizzledSelector:(SEL)swizzledSelector;
- (NSDictionary*)propertiesValues;
@end

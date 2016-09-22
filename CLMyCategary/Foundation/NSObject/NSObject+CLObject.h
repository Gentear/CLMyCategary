//
//  NSObject+CLObject.h
//  myCategary
//
//  Created by zyyt on 16/9/2.
//  Copyright © 2016年 zyyt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CLObject)

+ (void)swizzleSelector:(SEL)originalSelector withSwizzledSelector:(SEL)swizzledSelector;
- (NSDictionary*)propertiesValues;
@end

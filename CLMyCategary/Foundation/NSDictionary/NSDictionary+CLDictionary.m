
//
//  NSDictionary+CLDictionary.m
//  myCategary
//
//  Created by zyyt on 16/9/2.
//  Copyright © 2016年 丛蕾. All rights reserved.
//

#import "NSDictionary+CLDictionary.h"
#import <objc/message.h>
@implementation NSDictionary (CLDictionary)
- (NSString *)CL_JsonStringFromDictionary{
    if (self == nil) {
        return nil;
    }
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"字典转换失败 : %@", error);
        return nil;
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
- (NSMutableDictionary *)CL_copyToMutable{
    return [[NSMutableDictionary alloc]initWithDictionary:self];
}
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSPlaceholderDictionary") swizzleSelector:@selector(initWithObjects:forKeys:count:) withSwizzledSelector:@selector(safeInitWithObjects:forKeys:count:)];
    });
}

- (instancetype)safeInitWithObjects:(const id _Nonnull __unsafe_unretained *)objects forKeys:(const id _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt {
    BOOL containNilObject = NO;
    for (NSUInteger i = 0; i < cnt; i++) {
        if (objects[i] == nil) {
            containNilObject = YES;
            NSLog(@"reason: ***object cannot be nil (key: %@)", keys[i]);
        }
    }
    if (containNilObject) {
        NSUInteger nilCount = 0;
        for (NSUInteger i = 0; i < cnt; ++i) {
            if (objects[i] == nil) {
                nilCount ++;
            }
        }
        NSUInteger length = cnt - nilCount;
        if (length > 0) {
            NSUInteger index = 0;
            id __unsafe_unretained newObjects[length];
            id __unsafe_unretained newKeys[length];
            for (NSUInteger i = 0; i < cnt; ++i) {
                if (objects[i] != nil) {
                    newObjects[index] = objects[i];
                    newKeys[index] = keys[i];
                    index ++ ;
                }
            }
            NSLog(@"fixedDictionary:%@",[self safeInitWithObjects:newObjects forKeys:newKeys count:length]);
            return [self safeInitWithObjects:newObjects forKeys:newKeys count:length];
        }
    }
    return [self safeInitWithObjects:objects forKeys:keys count:cnt];
}

+ (void)swizzleSelector:(SEL)originalSelector withSwizzledSelector:(SEL)swizzledSelector {
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@end

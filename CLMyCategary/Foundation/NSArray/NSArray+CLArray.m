//
//  NSArray+CLArray.m
//  myCategary
//
//  Created by zyyt on 16/9/2.
//  Copyright © 2016年 zyyt. All rights reserved.
//

#import "NSArray+CLArray.h"
#import <objc/runtime.h>
#import "NSObject+CLObject.h"
@implementation NSArray (CLArray)
- (NSMutableArray *)CL_copyToMutable{
    return [NSMutableArray arrayWithArray:self];
}
@end
@implementation NSMutableArray (CLArray)
/**
 *  移除第一个元素
 */
- (void)CL_removeFirstObject {
    if (self.count) {
        [self removeObjectAtIndex:0];
    }
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (void)CL_removeLastObject {
    if (self.count) {
        [self removeObjectAtIndex:self.count - 1];
    }
}
- (void)CL_appendObjects:(NSArray *)objects {
    if (!objects) return;
    [self addObjectsFromArray:objects];
}
- (void)CL_insertObjects:(NSArray *)objects atIndex:(NSUInteger)index {
    NSUInteger i = index;
    for (id obj in objects) {
        [self insertObject:obj atIndex:i++];
    }
}

- (void)CL_reverse {
    NSUInteger count = self.count;
    int mid = floor(count / 2.0);
    for (NSUInteger i = 0; i < mid; i++) {
        [self exchangeObjectAtIndex:i withObjectAtIndex:(count - (i + 1))];
    }
}
-(void)CL_addBool:(BOOL)i
{
    [self addObject:@(i)];
}
-(void)CL_addInt:(int)i
{
    [self addObject:@(i)];
}
-(void)CL_addInteger:(NSInteger)i
{
    [self addObject:@(i)];
}
-(void)CL_addUnsignedInteger:(NSUInteger)i
{
    [self addObject:@(i)];
}
-(void)CL_addCGFloat:(CGFloat)f
{
    [self addObject:@(f)];
}
-(void)CL_addChar:(char)c
{
    [self addObject:@(c)];
}
-(void)CL_addFloat:(float)i
{
    [self addObject:@(i)];
}
-(void)CL_addPoint:(CGPoint)o
{
    [self addObject:NSStringFromCGPoint(o)];
}
-(void)CL_addSize:(CGSize)o
{
    [self addObject:NSStringFromCGSize(o)];
}
-(void)CL_addRect:(CGRect)o
{
    [self addObject:NSStringFromCGRect(o)];
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleSelector:@selector(removeObject:)withSwizzledSelector:@selector(safeRemoveObject:)];
        [objc_getClass("__NSArrayM") swizzleSelector:@selector(addObject:) withSwizzledSelector:@selector(safeAddObject:)];
        [objc_getClass("__NSArrayM") swizzleSelector:@selector(removeObjectAtIndex:) withSwizzledSelector:@selector(safeRemoveObjectAtIndex:)];
        [objc_getClass("__NSArrayM") swizzleSelector:@selector(insertObject:atIndex:) withSwizzledSelector:@selector(safeInsertObject:atIndex:)];
        [objc_getClass("__NSPlaceholderArray") swizzleSelector:@selector(initWithObjects:count:) withSwizzledSelector:@selector(safeInitWithObjects:count:)];
        [objc_getClass("__NSArrayM") swizzleSelector:@selector(objectAtIndex:) withSwizzledSelector:@selector(safeObjectAtIndex:)];
    });
}

- (instancetype)safeInitWithObjects:(const id  _Nonnull     __unsafe_unretained *)objects count:(NSUInteger)cnt
{
    BOOL hasNilObject = NO;
    for (NSUInteger i = 0; i < cnt; i++) {
        if ([objects[i] isKindOfClass:[NSArray class]]) {
            NSLog(@"%@", objects[i]);
        }
        if (objects[i] == nil) {
            hasNilObject = YES;
            NSLog(@"%s object at index %lu is nil, it will be     filtered", __FUNCTION__, i);
            
//            #if DEBUG
//                  // 如果可以对数组中为nil的元素信息打印出来，增加更容    易读懂的日志信息，这对于我们改bug就好定位多了
//                  NSString *errorMsg = [NSString     stringWithFormat:@"数组元素不能为nil，其index为: %lu", i];
//                  NSAssert(objects[i] != nil, errorMsg);
//            #endif
        }
    }
    
    // 因为有值为nil的元素，那么我们可以过滤掉值为nil的元素
    if (hasNilObject) {
        id __unsafe_unretained newObjects[cnt];
        NSUInteger index = 0;
        for (NSUInteger i = 0; i < cnt; ++i) {
            if (objects[i] != nil) {
                newObjects[index++] = objects[i];
            }
        }
        return [self safeInitWithObjects:newObjects count:index];
    }
    return [self safeInitWithObjects:objects count:cnt];
}

- (void)safeAddObject:(id)obj {
    if (obj == nil) {
        NSLog(@"%s can add nil object into NSMutableArray", __FUNCTION__);
    } else {
        [self safeAddObject:obj];
    }
}
- (void)safeRemoveObject:(id)obj {
    if (obj == nil) {
        NSLog(@"%s call -removeObject:, but argument obj is nil", __FUNCTION__);
        return;
    }
    [self safeRemoveObject:obj];
}

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject == nil) {
        NSLog(@"%s can't insert nil into NSMutableArray", __FUNCTION__);
    } else if (index > self.count) {
        NSLog(@"%s index is invalid", __FUNCTION__);
    } else {
        [self safeInsertObject:anObject atIndex:index];
    }
}

- (id)safeObjectAtIndex:(NSUInteger)index {
    if (self.count == 0) {
        NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
        return nil;
    }
    if (index > self.count) {
        NSLog(@"%s index out of bounds in array", __FUNCTION__);
        return nil;
    }
    return [self safeObjectAtIndex:index];
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index {
    if (self.count <= 0) {
        NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
        return;
    }
    if (index >= self.count) {
        NSLog(@"%s index out of bound", __FUNCTION__);
        return;
    }
    [self safeRemoveObjectAtIndex:index];
}
@end
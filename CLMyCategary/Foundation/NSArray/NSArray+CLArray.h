//
//  NSArray+CLArray.h
//  myCategary
//
//  Created by zyyt on 16/9/2.
//  Copyright © 2016年 zyyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSArray (CLArray)
/**
 *  可变拷贝
 */
- (NSMutableArray *)CL_copyToMutable;
@end
@interface NSMutableArray (CLArray)
/**
 *  移除第一个元素
 */
- (void)CL_removeFirstObject;
/**
 *  移除最后一个元素
 */
- (void)CL_removeLastObject;
/**
 *  添加数组
 *
 */
- (void)CL_appendObjects:(NSArray *)objects;
/**
 *  插入数组
 */
- (void)CL_insertObjects:(NSArray *)objects atIndex:(NSUInteger)index;
/**
 *  倒置元素
 */
- (void)CL_reverse;
/**
 *  加bool
 *
 */
-(void)CL_addBool:(BOOL)i;
/**
 *  加int
 *
 */
-(void)CL_addInt:(int)i;
/**
 *  加NSInergent
 *
 */
-(void)CL_addInteger:(NSInteger)i;
/**
 *  加float
 *
 */
-(void)CL_addCGFloat:(CGFloat)f;
/**
 *  加char
 *
 */
-(void)CL_addChar:(char)c;
/**
 *  加float
 *
 */
-(void)CL_addFloat:(float)i;
/**
 *  加点
 *
 */
-(void)CL_addPoint:(CGPoint)o;
/**
 *  加size
 *
 */
-(void)CL_addSize:(CGSize)o;
/**
 *  加位置
 *
 */
-(void)CL_addRect:(CGRect)o;
@end

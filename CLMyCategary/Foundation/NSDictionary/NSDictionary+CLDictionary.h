//
//  NSDictionary+CLDictionary.h
//  myCategary
//
//  Created by zyyt on 16/9/2.
//  Copyright © 2016年 丛蕾. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CLDictionary)
/**
 *  字典转json
 */
- (NSString *)CL_JsonStringFromDictionary;
/**
 * 可别拷贝
 */
- (NSMutableDictionary *)CL_copyToMutable;
@end

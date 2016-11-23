//
//  UIDevice+CLDevice.h
//  CLMyCategary
//
//  Created by zyyt on 16/11/22.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (CLDevice)

+ (NSString *)cl_platform;
+ (NSString *)cl_platformString;


+ (NSString *)cl_macAddress;

//Return the current device CPU frequency
+ (NSUInteger)cl_cpuFrequency;
// Return the current device BUS frequency
+ (NSUInteger)cl_busFrequency;
//current device RAM size
+ (NSUInteger)cl_ramSize;
//Return the current device CPU number
+ (NSUInteger)cl_cpuNumber;
//Return the current device total memory

/// 获取iOS系统的版本号
+ (NSString *)cl_systemVersion;
/// 判断当前系统是否有摄像头
+ (BOOL)cl_hasCamera;
/// 获取手机内存总量, 返回的是字节数
+ (NSUInteger)cl_totalMemoryBytes;
/// 获取手机可用内存, 返回的是字节数
+ (NSUInteger)cl_freeMemoryBytes;

/// 获取手机硬盘空闲空间, 返回的是字节数
+ (long long)cl_freeDiskSpaceBytes;
/// 获取手机硬盘总空间, 返回的是字节数
+ (long long)cl_totalDiskSpaceBytes;
@end

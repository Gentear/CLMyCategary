//
//  NSTimer+CLTimer.h
//  CLMyCategary
//
//  Created by zyyt on 16/11/23.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (CLTimer)
/**
 *  定时器 
 */
+(id)cl_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats;
+(id)cl_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats;
@end

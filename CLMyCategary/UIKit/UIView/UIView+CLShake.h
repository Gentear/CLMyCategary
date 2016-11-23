//
//  UIView+CLView.h
//  myCategary
//
//  Created by zyyt on 16/9/5.
//  Copyright © 2016年 丛蕾. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, CLShakeDirection) {
    CLShakeDirectionHorizontal = 0,
    CLShakeDirectionVertical
};

@interface UIView (CLShake)

/** Shake the UIView
 *
 * 抖动view
 */
- (void)cl_shake;

/** Shake the UIView
 *
 * 抖动view
 *
 * @param times The number of shakes
 * @param delta The width of the shake
 */
- (void)cl_shake:(int)times withDelta:(CGFloat)delta;

/** Shake the UIView
 *
 * 抖动view
 *
 * @param times The number of shakes
 * @param delta The width of the shake
 * @param handler A block object to be executed when the shake sequence ends
 */
- (void)cl_shake:(int)times withDelta:(CGFloat)delta completion:(void((^)()))handler;

/** Shake the UIView at a custom speed
 *
 * 抖动view
 *
 * @param times The number of shakes
 * @param delta The width of the shake
 * @param interval The duration of one shake
 */
- (void)cl_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval;

/** Shake the UIView at a custom speed
 *
 * 抖动view
 *
 * @param times The number of shakes
 * @param delta The width of the shake
 * @param interval The duration of one shake
 * @param handler A block object to be executed when the shake sequence ends
 */
- (void)cl_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval completion:(void((^)()))handler;

/** Shake the UIView at a custom speed
 *
 * 抖动view
 *
 * @param times The number of shakes
 * @param delta The width of the shake
 * @param interval The duration of one shake
 * @param direction of the shake
 */
- (void)cl_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(CLShakeDirection)shakeDirection;

/** Shake the UIView at a custom speed
 *
 * 抖动view
 *
 * @param times The number of shakes
 * @param delta The width of the shake
 * @param interval The duration of one shake
 * @param direction of the shake
 * @param completion to be called when the view is done shaking
 */
- (void)cl_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(CLShakeDirection)shakeDirection completion:(void(^)(void))completion;

@end
//
//  UIView+CLView.m
//  myCategary
//
//  Created by zyyt on 16/9/5.
//  Copyright © 2016年 丛蕾. All rights reserved.
//

#import "UIView+CLShake.h"

@implementation UIView (CLShake)

- (void)cl_shake {
    [self _cl_shake:10 direction:1 currentTimes:0 withDelta:5 speed:0.03 shakeDirection:CLShakeDirectionHorizontal completion:nil];
}

- (void)cl_shake:(int)times withDelta:(CGFloat)delta {
    [self _cl_shake:times direction:1 currentTimes:0 withDelta:delta speed:0.03 shakeDirection:CLShakeDirectionHorizontal completion:nil];
}

- (void)cl_shake:(int)times withDelta:(CGFloat)delta completion:(void(^)())handler {
    [self _cl_shake:times direction:1 currentTimes:0 withDelta:delta speed:0.03 shakeDirection:CLShakeDirectionHorizontal completion:handler];
}

- (void)cl_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval {
    [self _cl_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:CLShakeDirectionHorizontal completion:nil];
}

- (void)cl_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval completion:(void(^)())handler {
    [self _cl_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:CLShakeDirectionHorizontal completion:handler];
}

- (void)cl_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(CLShakeDirection)shakeDirection {
    [self _cl_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:shakeDirection completion:nil];
}

- (void)cl_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(CLShakeDirection)shakeDirection completion:(void (^)(void))completion {
    [self _cl_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:shakeDirection completion:completion];
}

- (void)_cl_shake:(int)times direction:(int)direction currentTimes:(int)current withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(CLShakeDirection)shakeDirection completion:(void (^)(void))completionHandler {
    [UIView animateWithDuration:interval animations:^{
        self.layer.affineTransform = (shakeDirection == CLShakeDirectionHorizontal) ? CGAffineTransformMakeTranslation(delta * direction, 0) : CGAffineTransformMakeTranslation(0, delta * direction);
    } completion:^(BOOL finished) {
        if(current >= times) {
            [UIView animateWithDuration:interval animations:^{
                self.layer.affineTransform = CGAffineTransformIdentity;
            } completion:^(BOOL finished){
                if (completionHandler != nil) {
                    completionHandler();
                }
            }];
            return;
        }
        [self _cl_shake:(times - 1)
           direction:direction * -1
        currentTimes:current + 1
           withDelta:delta
               speed:interval
      shakeDirection:shakeDirection
          completion:completionHandler];
    }];
}

@end

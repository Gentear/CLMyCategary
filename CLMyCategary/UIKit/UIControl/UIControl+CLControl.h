//
//  UIControl+YJCustom.h
//  E_Jian
//
//  Created by zyyt on 16/8/18.
//  Copyright © 2016年 Justin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (CLControl)
/**
 *  不同事件增加不同声音
 *
 *  @param name   The name of the file. The method looks for an image with the specified name in the application’s main bundle.
 *  @param controlEvent <#controlEvent description#>
 */
- (void)cl_setSoundNamed:(NSString *)name forControlEvent:(UIControlEvents)controlEvent;

@end

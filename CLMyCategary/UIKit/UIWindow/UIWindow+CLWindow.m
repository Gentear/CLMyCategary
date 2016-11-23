//
//  UIWindow+CLWindow.m
//  CLMyCategary
//
//  Created by zyyt on 16/11/22.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import "UIWindow+CLWindow.h"

@implementation UIWindow (CLWindow)
- (UIViewController*)cl_topMostController
{
    UIViewController *topController = [self rootViewController];
    
    //  Getting topMost ViewController
    while ([topController presentedViewController])	topController = [topController presentedViewController];
    
    //  Returning topMost ViewController
    return topController;
}

- (UIViewController*)cl_currentViewController;
{
    UIViewController *currentViewController = [self cl_topMostController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
        currentViewController = [(UINavigationController*)currentViewController topViewController];
    
    return currentViewController;
}
@end

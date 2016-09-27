//
//  UITabBarController+CLTabBarController.m
//  CLMyCategary
//
//  Created by zyyt on 16/9/22.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import "UITabBarController+CLTabBarController.h"

@implementation UITabBarController (CLTabBarController)
//为标签栏控制器添加一个界面, cls传入界面对应的类
-(id)CL_addViewControlerWithClass:(Class )cls
                         title:(NSString *)title
                         image:(NSString *)image
                   selectImage:(NSString *)selectImage
{
    //创建一个界面(包含导航)
    UIViewController *vc = [[cls alloc] init];
    vc.title = title;
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    nc.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //修改image大小
    //    nc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    //设置标签项的提示文本
    nc.tabBarItem.badgeValue = nil;
    //注意: iOS8需要加
    nc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    nc.tabBar.tintColor = [UIColor colorWithRed:0 green:0.5 blue:0 alpha:1];
    //添加到tabBar中
    NSMutableArray *marr = [[NSMutableArray alloc] initWithArray:self.viewControllers];
    [marr addObject:nc];
    self.viewControllers = marr;
    
    return vc;
}
@end

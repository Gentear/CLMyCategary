//
//  UITabBarController+CLTabBarController.h
//  CLMyCategary
//
//  Created by zyyt on 16/9/22.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (CLTabBarController)
/**
 *  为标签栏控制器添加一个界面
 *
 *  @param cls         controller
 *  @param title       标题
 *  @param image       默认图片
 *  @param selectImage 选中图
 *
 *  @return controller
 */
- (id)CL_addViewControlerWithClass:(Class )cls
                         title:(NSString *)title
                         image:(NSString *)image
                   selectImage:(NSString *)selectImage;
@end

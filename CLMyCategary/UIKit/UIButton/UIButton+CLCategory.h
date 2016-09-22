//
//  UIButton+LZCategory.h
//  LZButtonCategory
//
//  Created by Artron_LQQ on 16/5/5.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,CLCategoryType) {
    CLCategoryTypeLeft = 0,
    CLCategoryTypeBottom,
};
@interface UIButton (CLCategory)

//将按钮文字放置
- (void)CL_SetbuttonType:(CLCategoryType)clType;

@end

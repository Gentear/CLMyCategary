//
//  UIButton+LZCategory.m
//  LZButtonCategory
//
//  Created by Artron_LQQ on 16/5/5.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "UIButton+CLCategory.h"

@implementation UIButton (CLCategory)

- (void)CL_SetbuttonType:(CLCategoryType)clType {
    
    //需要在外部修改标题背景色的时候将此代码注释
//    self.titleLabel.backgroundColor = self.backgroundColor;
//    self.imageView.backgroundColor = self.backgroundColor;
    
    CGSize titleSize = self.titleLabel.bounds.size;
    CGSize imageSize = self.imageView.bounds.size;
    CGFloat interval = 1.0;
    
    if (clType == CLCategoryTypeLeft) {

        [self setImageEdgeInsets:UIEdgeInsetsMake(0,titleSize.width + interval, 0, -(titleSize.width + interval))];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -(imageSize.width + interval), 0, imageSize.width + interval)];

    } else if(clType == CLCategoryTypeBottom) {
        
        [self setImageEdgeInsets:UIEdgeInsetsMake(0,0, titleSize.height + interval, -(titleSize.width))];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(imageSize.height + interval, -(imageSize.width), 0, 0)];
    }
}
@end

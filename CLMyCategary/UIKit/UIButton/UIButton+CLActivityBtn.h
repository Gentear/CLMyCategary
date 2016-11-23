//
//  UIButton+CLActivityBtn.h
//  CLMyCategary
//
//  Created by zyyt on 16/11/22.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^CLTouchedButtonBlock)(UIButton *myButton,NSInteger tag);

@interface UIButton (CLActivityBtn)
/**
 *
 * 按钮点击后，禁用按钮并在按钮上显示ActivityIndicator，以及title
 *
 *  @param title 按钮上活动指示器类型
 */
- (void)cl_beginSubmitting:(UIActivityIndicatorViewStyle)style ;

/**
 *  恢复按钮点击前的状态
 */
- (void)cl_endSubmitting;

/**
 *  按钮是否正在提交中
 */
@property(nonatomic, readonly, getter=isCLSubmitting) NSNumber *cl_submitting;
/**
 *  按钮添加block
 *
 *  @param touchHandler <#touchHandler description#>
 */
-(void)cl_addTargeActionHandler:(CLTouchedButtonBlock)touchHandler;

@end

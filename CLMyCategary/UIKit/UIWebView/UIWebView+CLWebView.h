//
//  UIWebView+CLWebView.h
//  CLMyCategary
//
//  Created by zyyt on 16/11/23.
//  Copyright © 2016年 conglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (CLWebView)
/**
 *  右划返回上页面
 */
- (void)cl_useSwipeGesture;
#pragma mark -
#pragma mark 获取网页中的数据
/// 获取某个标签的结点个数
- (int)cl_nodeCountOfTag:(NSString *)tag;
/// 获取当前页面URL
- (NSString *)cl_getCurrentURL;
/// 获取标题
- (NSString *)cl_getTitle;
/// 获取图片
- (NSArray *)cl_getImgs;
/// 获取当前页面所有链接
- (NSArray *)cl_getOnClicks;
#pragma mark -
#pragma mark 改变网页样式和行为

/// 为所有图片添加点击事件(网页中有些图片添加无效)
- (void)cl_addClickEventOnImg;
/// 改变所有图像的宽度
- (void)cl_setImgWidth:(int)size;
/// 改变所有图像的高度
- (void)cl_setImgHeight:(int)size;
/// 改变指定标签的字体大小
- (void)cl_setFontSize:(int) size withTag:(NSString *)tagName;
@end

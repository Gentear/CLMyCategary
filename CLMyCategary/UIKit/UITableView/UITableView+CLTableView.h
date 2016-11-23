//
//  UITableView+CLTableView.h
//  myCategary
//
//  Created by zyyt on 16/9/9.
//  Copyright © 2016年 丛蕾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (CLTableView)
/**
 *  xib加载cell
 */
+ (id)CL_cellWithNibTableView:(UITableView *)tableView;
/**
 *  直接加载cell
 */
+ (id)CL_cellWithTableView:(UITableView*)tableView;
/**
 *  没有复用机制的cell
 */
+ (id)CL_cellWithNORepeatTableView:(UITableView*)tableView andIndexPath:(NSIndexPath*)indexPath;
/**
 *  没有复用机制的xib的cell
 */
+(id)CL_cellWithNibNORepeatTableView:(UITableView*)tableView andIndexPath:(NSIndexPath*)indexPath;
/**
 *执行动画
 */
- (void)updateWithBlock:(void (^)(UITableView *tableView))block;

/**
 * 滚动到制定区域
 */
- (void)scrollToRow:(NSUInteger)row inSection:(NSUInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

/**
 * 在地几行第几列插入
 */
- (void)insertRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/**
 * reload 第几行第几列
 */
- (void)reloadRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/**
 * 删除第几行第几列
 */
- (void)deleteRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/**
 * 插入到indexPath
 */
- (void)insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *reload第indexPath
 */
- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *删除indexPath
 */
- (void)deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

/**
 * 第几列插入
 */
- (void)insertSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *删除第几列
 */
- (void)deleteSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/**
 * 刷新第几列
 */
- (void)reloadSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/**
 * 取消所有选中
 */
- (void)clearSelectedRowsAnimated:(BOOL)animated;
/**
 *  ios7设置页面的UITableViewCell分组类型
 */
-(void)cl_SettingsStyleGrouping:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
@end

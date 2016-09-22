//
//  UICollectionView+CLCollectionView.h
//  myCategary
//
//  Created by zyyt on 16/9/10.
//  Copyright © 2016年 丛蕾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (CLCollectionView)
/**
 *  加载xib的cell
 */
+ (id)CL_cellWithNibcollection:(UICollectionView*)collectionView withIndex:(NSIndexPath*)index;
/**
 *  加载纯代码cell
 */
+ (id)CL_cellWithcollection:(UICollectionView*)collectionView withIndex:(NSIndexPath*)index;
/**
 *  无重用
 */
+ (id)CL_cellWithNibNoOperationcollection:(UICollectionView*)collectionView withIndex:(NSIndexPath*)index;
/**
 *  不用nib重用
 */
+ (id)CL_cellWithNoOperationcollection:(UICollectionView*)collectionView withIndex:(NSIndexPath*)index;
@end

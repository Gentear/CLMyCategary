//
//  UICollectionView+CLCollectionView.m
//  myCategary
//
//  Created by zyyt on 16/9/10.
//  Copyright © 2016年 丛蕾. All rights reserved.
//

#import "UICollectionView+CLCollectionView.h"

@implementation UICollectionView (CLCollectionView)
+ (id)CL_cellWithNibcollection:(UICollectionView*)collectionView withIndex:(NSIndexPath*)index{
    
    NSString * className = NSStringFromClass([self class]);
    
    
    UINib * nib = [UINib nibWithNibName:className bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:className];
    
    //如果有可重用的返回,如果没有可重用的创建一个新的返回
    return [collectionView dequeueReusableCellWithReuseIdentifier:className forIndexPath:index];
    
}
+ (id)CL_cellWithNibNoOperationcollection:(UICollectionView*)collectionView withIndex:(NSIndexPath*)index{
    
    NSString * className = NSStringFromClass([self class]);
    
    NSString *uid = [NSString stringWithFormat:@"%ld%ld",(long)index.row,(long)index.section];
    UINib * nib = [UINib nibWithNibName:className bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:uid];
    return [collectionView dequeueReusableCellWithReuseIdentifier:uid forIndexPath:index];
}
+ (id)CL_cellWithNoOperationcollection:(UICollectionView*)collectionView withIndex:(NSIndexPath*)index{
    
    NSString *uid = [NSString stringWithFormat:@"%ld%ld",(long)index.row,(long)index.section];
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:uid];
    
    //如果有可重用的返回,如果没有可重用的创建一个新的返回
    return [collectionView dequeueReusableCellWithReuseIdentifier:uid forIndexPath:index];
}

+ (id)CL_cellWithcollection:(UICollectionView*)collectionView withIndex:(NSIndexPath*)index{
    
    NSString * className = NSStringFromClass([self class]);
    
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:className];
    
    //如果有可重用的返回,如果没有可重用的创建一个新的返回
    return [collectionView dequeueReusableCellWithReuseIdentifier:className forIndexPath:index];
}

@end

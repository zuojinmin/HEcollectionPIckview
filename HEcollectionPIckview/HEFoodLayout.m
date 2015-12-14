//
//  HEFoodLayout.m
//  HEcollectionPIckview
//
//  Created by zuo on 15/12/14.
//  Copyright © 2015年 zuo. All rights reserved.
//

#import "HEFoodLayout.h"

@implementation HEFoodLayout


- (instancetype)init
{
    if (self = [super init]) {
        self.itemSize = CGSizeMake(30, 30);
        
        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return self;
}

/**
 *  只要显示的边界发生改变就重新布局:
 内部会重新调用prepareLayout和layoutAttributesForElementsInRect方法获得所有cell的布局属性
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}



/**
 *  一些初始化工作最好在这里实现
 */
- (void)prepareLayout
{
    [super prepareLayout];
    
    // 每个cell的尺寸
    self.itemSize = CGSizeMake(20, 20);
    
    self.sectionInset = UIEdgeInsetsMake(30, 20, 30, 20);
    // 设置水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.minimumLineSpacing = 15;
    
    // 每一个cell(item)都有自己的UICollectionViewLayoutAttributes
    // 每一个indexPath都有自己的UICollectionViewLayoutAttributes
}

/** 有效距离:当item的中间x距离屏幕的中间x在HMActiveDistance以内,才会开始放大, 其它情况都是缩小 */
static CGFloat const HMActiveDistance = 100;
/** 缩放因素: 值越大, item就会越大 */
static CGFloat const HMScaleFactor = 0.6;
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // 0.计算可见的矩形框
    CGRect visiableRect;
    visiableRect.size = self.collectionView.frame.size;
    visiableRect.origin = self.collectionView.contentOffset;
    
    // 1.取得默认的cell的UICollectionViewLayoutAttributes
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    // 计算屏幕最中间的x
    CGFloat centerX = self.collectionView.contentOffset.y + self.collectionView.frame.size.height * 0.5;
    
    // 2.遍历所有的布局属性
    for (UICollectionViewLayoutAttributes *attrs in array) {
        // 如果不在屏幕上,直接跳过
        if (!CGRectIntersectsRect(visiableRect, attrs.frame)) continue;
        
        // 每一个item的中点x
        CGFloat itemCenterX = attrs.center.y;
        
        // 差距越小, 缩放比例越大
        // 根据跟屏幕最中间的距离计算缩放比例
        CGFloat scale = 1 + HMScaleFactor * (1 - (ABS(itemCenterX - centerX) / 25));
        //        attrs.transform = CGAffineTransformMakeScale(scale*1.3, scale*1.3);
        attrs.transform3D =CATransform3DMakeScale(scale*1.2, scale*1.2, scale*1.2);
    }
    
    return array;
}


@end

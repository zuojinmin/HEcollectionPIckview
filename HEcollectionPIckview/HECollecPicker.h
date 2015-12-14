//
//  HECollecPicker.h
//  HEcollectionPIckview
//
//  Created by zuo on 15/12/14.
//  Copyright © 2015年 zuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HECollecPicker : UIView<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@end

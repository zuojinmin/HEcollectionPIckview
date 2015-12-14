//
//  HECollecPicker.m
//  HEcollectionPIckview
//
//  Created by zuo on 15/12/14.
//  Copyright © 2015年 zuo. All rights reserved.
//

#import "HECollecPicker.h"
#import "HEFoodPickCell.h"
#import "HEFoodLayout.h"


@implementation HECollecPicker

- (instancetype)initWithFrame:(CGRect)frame{

    if (self =[super initWithFrame:frame]) {
        [self view1];
    }

    return self;
}


//- (void)collectionView:(CGRect)frame{
//
//    CGFloat w = frame.size.width;
//    CGFloat h = frame.size.width;
//    CGRect rect = CGRectMake(0, 0, w, h);
//    
//    
//    
//    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:[[HEFoodLayout alloc] init]];
//    collectionView.dataSource = self;
//    collectionView.delegate = self;
//    [collectionView registerNib:[UINib nibWithNibName:@"HEFoodPickCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
//    [self addSubview:collectionView];
//    self.collectionView = collectionView;
//    
//
//}
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//
//    return 10;
//    
//}


- (void)view1 {
   
    
   
    CGRect rect = CGRectMake(0, 60, 60, 80);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:[[HEFoodLayout alloc] init]];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"HEFoodPickCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    [self addSubview:collectionView];
    self.collectionView = collectionView;
    
    self.collectionView.backgroundColor =[UIColor blackColor];
    for (UIView *view in self.collectionView.subviews) {
        view.backgroundColor =[UIColor whiteColor];
    }
    
    
}


#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HEFoodPickCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    //    cell.image = self.images[indexPath.item];
    cell.cellLabel.text =[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    cell.cellLabel.textColor =[UIColor blackColor];
    
    return cell;
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"滑动");
    
    NSLog(@"%f",scrollView.contentOffset.y);
    
    CGFloat YH  = scrollView.contentOffset.y +40;
    
    HEFoodPickCell *cell = (HEFoodPickCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:YH/40 inSection:0]];
    NSLog(@"%f",YH/40);
    
    HEFoodPickCell *cell1 = (HEFoodPickCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:scrollView.contentOffset.x/40+1 inSection:0]];
    HEFoodPickCell *cell2 = (HEFoodPickCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:scrollView.contentOffset.x/40-1 inSection:0]];
    
    NSLog(@"%@",cell.cellLabel.text);
    cell.cellLabel.textColor =[UIColor redColor];
    
    
    
    
    
    
    
}




@end

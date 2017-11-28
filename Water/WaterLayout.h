//
//  WaterLayout.h
//  WaterFall
//
//  Created by YuanGu on 2017/11/28.
//  Copyright © 2017年 YuanGu. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  实现了瀑布流功能，但是不能添加头部和底部视图，如项目中有添加头部或底部视图的需求，请慎用！！！
 */
@interface WaterLayout : UICollectionViewLayout

//总共多少列，默认是2
@property (nonatomic, assign) NSInteger columnCount;
//列间距，默认是0
@property (nonatomic, assign) NSInteger columnSpacing;
//行间距，默认是0
@property (nonatomic, assign) NSInteger rowSpacing;
//section与collectionView的间距，默认是（0，0，0，0）
@property (nonatomic, assign) UIEdgeInsets sectionInset;
//同时设置列间距，行间距，sectionInset
- (void)setColumnSpacing:(NSInteger)columnSpacing rowSpacing:(NSInteger)rowSepacing sectionInset:(UIEdgeInsets)sectionInset;
//计算item高度的block，将item的高度与indexPath传递给外界
@property (nonatomic, strong) CGFloat(^itemHeightBlock)(CGFloat itemHeight,NSIndexPath *indexPath);


#pragma mark- 构造方法

+ (instancetype)waterFallLayoutWithColumnCount:(NSInteger)columnCount;

- (instancetype)initWithColumnCount:(NSInteger)columnCount;

@end

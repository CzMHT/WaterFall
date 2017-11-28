//
//  WaterLayoutTwo.m
//  WaterFall
//
//  Created by YuanGu on 2017/11/28.
//  Copyright © 2017年 YuanGu. All rights reserved.
//

#import "WaterLayoutTwo.h"

#define ColMargin 5 //每一行之间的间距
#define ColCount  4 //一共四列

@interface WaterLayoutTwo()

@property (nonatomic ,strong) NSMutableArray *colsHeight; //数组存放每列的总高度
@property (nonatomic ,assign) CGFloat colWidth;  //单元格宽度
@end

@implementation WaterLayoutTwo

- (instancetype)initWithItemsHeightBlock:(itemHeightBlock)block{
    
    if (self = [super init]) {
        self.heightBlock = block;
    }
    return self;
}
- (void)prepareLayout{
    [super prepareLayout];
    //重置每一列的最大值
    self.colWidth = ( self.collectionView.frame.size.width - (ColCount+1)*ColMargin )/ColCount;
    self.colsHeight = nil;
}
//colletionview的内容尺寸
- (CGSize)collectionViewContentSize{
    
    NSNumber * longest = self.colsHeight[0];
    
    for (NSInteger i =0;i<self.colsHeight.count;i++) {
        
        NSNumber *rolHeight = self.colsHeight[i];
        
        if(longest.floatValue < rolHeight.floatValue){
            longest = rolHeight;
        }
    }
    return CGSizeMake(self.collectionView.frame.size.width, longest.floatValue);
}
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //找出最短那一列的 列号 和 最大Y值
    NSInteger shortCol = 0;
    
//    //找出最短的那一列
//    __block NSInteger minIndex = 0;
//    [_colsHeight enumerateObjectsUsingBlock:^(NSNumber *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSNumber *rolHeight = self.colsHeight[minIndex];
//        if (rolHeight.floatValue > obj.floatValue) {
//            minIndex = idx;
//        }
//    }];
    
    for (NSInteger i =0;i<self.colsHeight.count;i++) {
        
        NSNumber *minHeight = self.colsHeight[shortCol];
        NSNumber *rolHeight = self.colsHeight[i];
        
        if (minHeight.floatValue > rolHeight.floatValue){
            shortCol = i;
        }
    }
    CGFloat x = (shortCol+1)*ColMargin + shortCol * self.colWidth;
    CGFloat y = ((NSNumber *)self.colsHeight[shortCol]).floatValue + ColMargin;
    
    //获取cell高度
    CGFloat height=0;
    NSAssert(self.heightBlock!=nil, @"未实现计算高度的block ");
    
    if(self.heightBlock){
        height = self.heightBlock(indexPath);
    }
    
    attr.frame = CGRectMake(x, y, self.colWidth, height);
    // 更新数组中的最大Y值
    self.colsHeight[shortCol]=@(((NSNumber *)self.colsHeight[shortCol]).floatValue + ColMargin + height);
    
    return attr;
}
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray* array = [NSMutableArray array];
    
    NSInteger items = [self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0; i<items;i++) {
        
        UICollectionViewLayoutAttributes* attr = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [array addObject:attr];
    }
    return array;
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}


#pragma mark - lazy init

- (NSMutableArray *)colsHeight{
    
    if (!_colsHeight){
        
        NSMutableArray *array = [NSMutableArray array];
        
        for(int i =0;i<ColCount;i++){
            //这里可以设置初始高度
            [array addObject:@(0)];
        }
        _colsHeight = [array mutableCopy];
    }
    return _colsHeight;
}

@end

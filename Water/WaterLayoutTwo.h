//
//  WaterLayoutTwo.h
//  WaterFall
//
//  Created by YuanGu on 2017/11/28.
//  Copyright © 2017年 YuanGu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef CGFloat(^itemHeightBlock)(NSIndexPath *index);

@interface WaterLayoutTwo:UICollectionViewLayout

@property (nonatomic ,strong) itemHeightBlock heightBlock;

- (instancetype)initWithItemsHeightBlock:(itemHeightBlock)block;
@end

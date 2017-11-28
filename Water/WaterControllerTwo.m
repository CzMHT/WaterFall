//
//  WaterControllerTwo.m
//  WaterFall
//
//  Created by YuanGu on 2017/11/28.
//  Copyright © 2017年 YuanGu. All rights reserved.
//

#import "WaterControllerTwo.h"
#import "WaterLayoutTwo.h"
#import "WaterCell.h"

static NSString *identifer = @"WaterLayout";

@interface WaterControllerTwo ()<UICollectionViewDelegate ,UICollectionViewDataSource>

@property (nonatomic ,strong) UICollectionViewLayout *layout;
@property (nonatomic ,strong) UICollectionView *collectionView;
@property (nonatomic ,strong) NSArray *heightArr;
@end

@implementation WaterControllerTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:_collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - UICollectionViewDelegate ,UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    WaterCell *cell = (WaterCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifer forIndexPath:indexPath];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.heightArr.count;
}


#pragma mark - lazy

- (UICollectionView *)collectionView{
    
    if (!_collectionView){
        
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[WaterCell class] forCellWithReuseIdentifier:identifer];
    }
    return _collectionView;
}

- (UICollectionViewLayout *)layout{
    
    if (!_layout){
        
        _layout = [[WaterLayoutTwo alloc] initWithItemsHeightBlock:^CGFloat(NSIndexPath *index) {
            
            return [self.heightArr[index.item] floatValue];
        }];
    }
    return _layout;
}

- (NSArray *)heightArr{//随机生成高度
    
    if (!_heightArr){
        
        NSMutableArray *arr = [NSMutableArray array];
        
        for (int i = 0; i<100; i++) {
            [arr addObject:@(arc4random()%50+80)];
        }
        _heightArr = [arr copy];
    }
    return _heightArr;
}

@end

//
//  WaterCell.m
//  WaterFall
//
//  Created by YuanGu on 2017/11/28.
//  Copyright © 2017年 YuanGu. All rights reserved.
//

#import "WaterCell.h"
//#import <UIImageView+WebCache.h>

@implementation WaterCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.contentView.backgroundColor = [self randomColor];
    }
    return self;
}

- (UIColor *) randomColor{
    
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end

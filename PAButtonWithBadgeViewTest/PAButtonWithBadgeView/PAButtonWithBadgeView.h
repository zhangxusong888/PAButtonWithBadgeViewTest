//
//  PAButtonWithBadgeView.h
//  PAQZZ
//
//  Created by admin on 15/12/30.
//  Copyright © 2015年 平安付. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAButtonWithBadgeView : UIView

// 点击后的响应函数，整个View都是热区
@property (strong, nonatomic) void (^buttonActionBlock)(void);

// 背景色
- (void)changeContainerBackgroundColor:(UIColor *)color;

// 徽章数字
- (NSUInteger)retrieveBadgeNumber;
- (void)changeBadgeNumber:(NSUInteger)number;

// 显示徽章视图
- (void)showBadgeView:(BOOL)show;

// 图标图象
- (void)changeIconImage:(UIImage *)image;
- (void)changeBadgeImage:(UIImage *)image;

// 位置偏移量; (0,0)图标和徽章中心重合
- (void)changeBadgeImageOffset:(CGPoint)offset;

// 文字
- (void)changeBadgeLabelTextFont:(UIFont *)font;
- (void)changeBadgeLabelTextColor:(UIColor *)color;

// 代码加载函数；推荐使用Xib自动加载的用法，不用调这两个函数
- (instancetype)init;
- (instancetype)initWithFrame:(CGRect)frame;

@end

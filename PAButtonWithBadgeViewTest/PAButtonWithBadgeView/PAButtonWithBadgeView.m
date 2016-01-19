//
//  PAButtonWithBadgeView.m
//  PAQZZ
//
//  Created by admin on 15/12/30.
//  Copyright © 2015年 平安付. All rights reserved.
//

#import "PAButtonWithBadgeView.h"
#import <Masonry/Masonry.h>

@interface PAButtonWithBadgeView()

@property (strong, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UIButton *iconButton;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UIView *badgeView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *badgeViewConstraintX;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *badgeViewConstraintY;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *badgeImageView;

@property (assign, nonatomic) NSUInteger badgeNumber;

@end

@implementation PAButtonWithBadgeView

// 背景色
// self是最底层容器，会被self.containerView挡住，导致看起来代码设背景色不起作用，所以覆盖基类的函数
- (void)changeContainerBackgroundColor:(UIColor *)color {
    if (nil != color) {
        self.containerView.backgroundColor = color;
    }
}

// 徽章数字
- (NSUInteger)retrieveBadgeNumber {
    return self.badgeNumber;
}

- (void)changeBadgeNumber:(NSUInteger)number {
    self.badgeNumber = number;
    
    if (number <= 0 ) {
        self.numberLabel.text = @"";
        [self showBadgeView:NO];
    } else if (number >= 100){
        self.numberLabel.text = @"99+";
        [self showBadgeView:YES];
    } else {
        self.numberLabel.text = [NSString stringWithFormat:@"%ld", number];
        [self showBadgeView:YES];
    }
}

// 显示徽章视图
- (void)showBadgeView:(BOOL)show {
    self.badgeView.hidden = !show;
}

// 图标图象
- (void)changeIconImage:(UIImage *)image {
    if (nil != image) {
        self.iconImageView.image = image;
    }
}
- (void)changeBadgeImage:(UIImage *)image {
    if (nil != image) {
        self.badgeImageView.image = image;
    }
}

// 位置偏移量; (0,0)图标和徽章中心重合
- (void)changeBadgeImageOffset:(CGPoint)offset {
    self.badgeViewConstraintX.constant = offset.x;
    self.badgeViewConstraintY.constant = offset.y;
}

// 文字
- (void)changeBadgeLabelTextFont:(UIFont *)font {
    if (nil != font) {
        self.numberLabel.font = font;
    }
}

- (void)changeBadgeLabelTextColor:(UIColor *)color {
    if (nil != color) {
        self.numberLabel.textColor = color;
    }
}

// 代码加载函数；推荐使用Xib自动加载的用法，不用调这两个函数
- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self loadViewFromXib];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self loadViewFromXib];
    }
    
    return self;
}

// 供Xib自动加载, 不要调用
- (void)awakeFromNib {
    [self loadViewFromXib];
}

- (IBAction)iconButtonTouched:(UIButton *)sender {
    if (nil != self.buttonActionBlock) {
        self.buttonActionBlock();
    }
}

// load from xib
- (void)loadViewFromXib {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil];
    UIView *view = [views firstObject];
    
    if (nil != view) {
        UIView *superview = self;
        
        [superview addSubview:view];
        
        UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 0, 0);
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(superview).with.insets(padding);
        }];
    }
}

@end

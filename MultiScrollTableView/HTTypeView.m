//
//  HTTypeView.m
//  MultiScrollTableView
//
//  Created by hongtu on 2019/11/5.
//  Copyright © 2019 hongtukeji. All rights reserved.
//

#import "HTTypeView.h"

#import <Masonry/Masonry.h>

@implementation HTTypeView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title {
    
    if (self = [super initWithFrame:frame]) {
        
        _title = title;
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

#pragma mark - setter

- (void)setTitle:(NSString *)title {
    
    _title = _label.text = title;
}

#pragma mark - 设置界面
- (void)setupUI {
    
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.label];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self);
        make.left.equalTo(self).offset(12);
        make.right.equalTo(self).offset(-12);
    }];
    
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - 懒加载

- (UILabel *)label {
    
    if (_label == nil) {
        
        _label = [[UILabel alloc] init];
        
        _label.text = _title;
        _label.textColor = [UIColor blackColor];
        _label.font = [UIFont systemFontOfSize:14];
        
        _label.numberOfLines = 0;
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

@end

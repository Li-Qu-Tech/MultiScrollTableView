//
//  HTLeftCell.m
//  MultiScrollTableView
//
//  Created by hongtu on 2019/11/5.
//  Copyright © 2019 hongtukeji. All rights reserved.
//

#import "HTLeftCell.h"

#import "HTTypeView.h"
#import <Masonry/Masonry.h>

@interface HTLeftCell ()

@property(nonatomic,strong) HTTypeView *typeView;

@end

@implementation HTLeftCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    
    _title = title;
    
    _typeView.title = title;
}

#pragma mark - 设置界面
- (void)setupUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.typeView];
    
    [_typeView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self);
    }];
}

#pragma mark - 懒加载

- (HTTypeView *)typeView {
    
    if (_typeView == nil) {
        
        _typeView = [[HTTypeView alloc] initWithFrame:self.bounds title:@""];
    }
    return _typeView;
}

#pragma mark -
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

@end

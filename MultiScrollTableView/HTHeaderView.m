//
//  HTHeaderView.m
//  MultiScrollTableView
//
//  Created by hongtu on 2019/11/5.
//  Copyright © 2019 hongtukeji. All rights reserved.
//

#import "HTHeaderView.h"

#import "HTTypeView.h"

@implementation HTHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithTitleArr:(NSArray *)titleArr {
    
    _width = 0.0;
    NSMutableArray *tempArr = [NSMutableArray arrayWithCapacity:titleArr.count];
    
    for (NSString *title in titleArr) {
        
        HTModel *model = [HTModel new];
        
        model.title = title;
        _width += model.width;
        
        [tempArr addObject:model];
    }
    
    CGRect frame = CGRectMake(0, 0, _width, 47);
    
    if (self = [super initWithFrame:frame]) {
        
        _titleArr = tempArr.copy;
        [self setupUI];
    }
    return self;
}

#pragma mark - 设置界面
- (void)setupUI {
    
    self.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.12];
    
    CGFloat x = 0.0;
    
    for (HTModel *model in _titleArr) {
        
        CGRect frame = CGRectMake(x, 0, model.width, 47);
        
        HTTypeView *titleView = [[HTTypeView alloc] initWithFrame:frame title:model.title];
        
        x += model.width;
        
        [self addSubview:titleView];
    }
}


@end

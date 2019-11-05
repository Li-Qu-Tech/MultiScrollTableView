//
//  HTTableViewCell.m
//  MultiScrollTableView
//
//  Created by hongtu on 2019/11/5.
//  Copyright © 2019 hongtukeji. All rights reserved.
//

#import "HTRightCell.h"

#import "HTTypeView.h"
#import <Masonry/Masonry.h>

@interface HTRightCell ()

@end

@implementation HTRightCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}


#pragma mark - 设置界面
- (void)setupUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    NSArray *numArr = @[@"1",@"2",@"3",@"4",@"5",@"6"];
    NSArray *titleArr = @[@"正常(次)",@"迟到(次)",@"早退(次)",@"异常(次)",@"请假(次)",@"缺勤(次)"];
    
    CGFloat width = 0.0;
    NSMutableArray *tempArr = [NSMutableArray arrayWithCapacity:titleArr.count];
    
    for (NSString *title in titleArr) {
        
        HTModel *model = [HTModel new];
        
        model.title = title;
        model.num = numArr[[titleArr indexOfObject:title]];
        width += model.width;
        
        [tempArr addObject:model];
    }
    
    CGFloat x = 0.0;
    
    for (HTModel *model in tempArr) {
        
        CGRect frame = CGRectMake(x, 0, model.width, 47);
        
        HTTypeView *numView = [[HTTypeView alloc] initWithFrame:frame title:model.num];
        
        x += model.width;
        
        [self addSubview:numView];
        
        [numView addTarget:self action:@selector(numViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark - 点击事件

- (void)numViewClick:(HTTypeView *)sender {
    
}



#pragma mark -
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

@end

//
//  ViewController.m
//  MultiScrollTableView
//
//  Created by hongtu on 2019/11/5.
//  Copyright © 2019 hongtukeji. All rights reserved.
//

#import "ViewController.h"

#import "HTRightCell.h"
#import "HTLeftCell.h"

#import "HTHeaderView.h"
#import <Masonry/Masonry.h>

static NSString *leftCellId = @"leftCellId";
static NSString *rightCellId = @"rightCellId";

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) HTHeaderView *leftHeader;

@property(nonatomic,strong) HTHeaderView *rightHeader;

@property(nonatomic,strong) UITableView *leftTableView;

@property(nonatomic,strong) UITableView *rightTableView;

@property(nonatomic,strong) UIScrollView *scrollView;

@property(nonatomic,strong) UIView *containerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"双向滚动表格";
    
    [self loadUI];
}

#pragma mark - 设置界面

- (void)loadUI {

    //左侧UI
    [self.view addSubview:self.leftHeader];
    [self.view addSubview:self.leftTableView];
    
    [_leftHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(30);
        make.size.mas_equalTo(CGSizeMake(self.leftHeader.width, 47));
    }];
    
    [_leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.leftHeader.mas_bottom);
        make.left.right.equalTo(self.leftHeader);
        make.height.mas_equalTo(236);
    }];
    
    //右侧UI
    [self.view addSubview:self.scrollView];
    
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.leftHeader);
        make.left.equalTo(self.leftHeader.mas_right);
        make.right.equalTo(self.view).offset(-30);
        make.bottom.equalTo(self.view);
    }];
    
    [_scrollView addSubview:self.containerView];
    [_containerView addSubview:self.rightHeader];
    [_containerView addSubview:self.rightTableView];
    
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.mas_equalTo(self.rightHeader.width);
    }];
        
    [_rightHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.equalTo(self.containerView);
        make.size.mas_equalTo(CGSizeMake(self.rightHeader.width, 47));
    }];
    
    [_rightTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.rightHeader.mas_bottom);
        make.left.right.equalTo(self.rightHeader);
        make.height.mas_equalTo(236);
    }];
    
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.rightTableView.mas_bottom);
    }];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (tableView == _leftTableView) {
        
        HTLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:leftCellId forIndexPath:indexPath];
        
        cell.title = [NSString stringWithFormat:@"考勤时间%zd",indexPath.row+1];
        
        return cell;
    }
    
    HTRightCell *cell = [tableView dequeueReusableCellWithIdentifier:rightCellId forIndexPath:indexPath];
    
    return cell;
}


#pragma mark - 代理

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.isDragging || scrollView.isTracking || scrollView.isDecelerating) {
        
        if (scrollView == _leftTableView) {
            
            [_rightTableView setContentOffset:CGPointMake(_rightTableView.contentOffset.x, _leftTableView.contentOffset.y)];
        }
        
        if (scrollView == _rightTableView) {
            
            [_leftTableView setContentOffset:CGPointMake(0, _rightTableView.contentOffset.y)];
        }
    }
}


#pragma mark - 懒加载

- (UIScrollView *)scrollView {
    
    if (_scrollView == nil) {
        
        _scrollView = [[UIScrollView alloc] init];
        
        _scrollView.bounces = NO;
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (UIView *)containerView {
    
    if (_containerView == nil) {
        
        _containerView = [UIView new];
        _containerView.backgroundColor = [UIColor whiteColor];
    }
    return _containerView;
}


- (HTHeaderView *)leftHeader {
    
    if (_leftHeader == nil) {
        
        NSArray *titleArr = @[@"考勤时间段"];
    
        _leftHeader = [[HTHeaderView alloc] initWithTitleArr:titleArr];
    }
    return _leftHeader;
}

- (HTHeaderView *)rightHeader {
    
    if (_rightHeader == nil) {
        
        NSArray *titleArr = @[@"正常(次)",@"迟到(次)",@"早退(次)",@"异常(次)",@"请假(次)",@"缺勤(次)"];

        _rightHeader = [[HTHeaderView alloc] initWithTitleArr:titleArr];
    }
    return _rightHeader;
}


- (UITableView *)leftTableView {
    
    if (_leftTableView == nil) {
        
        _leftTableView = [self ht_tableViewWithStyle:UITableViewStylePlain delegate:self dataSource:self rowHeight:47];
        
        _leftTableView.bounces = NO;
        
        [_leftTableView registerClass:[HTLeftCell class] forCellReuseIdentifier:leftCellId];
    }
    return _leftTableView;
}

- (UITableView *)rightTableView {
    
    if (_rightTableView == nil) {
        
        _rightTableView = [self ht_tableViewWithStyle:UITableViewStylePlain delegate:self dataSource:self rowHeight:47];
        
        _rightTableView.bounces = NO;
        
        [_rightTableView registerClass:[HTRightCell class] forCellReuseIdentifier:rightCellId];
    }
    return _rightTableView;
}


- (UITableView *)ht_tableViewWithStyle:(UITableViewStyle)style delegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource rowHeight:(CGFloat)rowHeight {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
    
    tableView.delegate = delegate;
    tableView.dataSource = dataSource;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsVerticalScrollIndicator = NO;
    
    if (@available(iOS 11.0, *)) {
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    if (rowHeight != 0) {
        
        tableView.rowHeight = rowHeight;
    }
    
    return tableView;
}

@end

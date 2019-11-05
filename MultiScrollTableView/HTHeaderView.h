//
//  HTHeaderView.h
//  MultiScrollTableView
//
//  Created by hongtu on 2019/11/5.
//  Copyright © 2019 hongtukeji. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HTModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTHeaderView : UIView

@property(nonatomic,strong) NSArray *titleArr;

@property(nonatomic,assign) CGFloat width;

- (instancetype)initWithTitleArr:(NSArray *)titleArr;

@end

NS_ASSUME_NONNULL_END

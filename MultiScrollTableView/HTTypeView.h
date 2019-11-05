//
//  HTTypeView.h
//  MultiScrollTableView
//
//  Created by hongtu on 2019/11/5.
//  Copyright © 2019 hongtukeji. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTTypeView : UIControl

@property(nonatomic,copy) NSString *title;

@property(nonatomic,strong) UILabel *label;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END

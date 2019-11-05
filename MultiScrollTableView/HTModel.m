//
//  HTModel.m
//  MultiScrollTableView
//
//  Created by hongtu on 2019/11/5.
//  Copyright © 2019 hongtukeji. All rights reserved.
//

#import "HTModel.h"

@implementation HTModel

- (void)setTitle:(NSString *)title {
    
    _title = title;
    
    NSDictionary *dict = [NSDictionary dictionaryWithObject: [UIFont systemFontOfSize:14] forKey:NSFontAttributeName];
    
    CGRect rect = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, 47) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    _width = rect.size.width + 25;
}

@end

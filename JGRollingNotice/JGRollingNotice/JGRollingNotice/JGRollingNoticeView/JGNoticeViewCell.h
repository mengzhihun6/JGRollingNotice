//
//  JGNoticeViewCell.h
//  JGRollingNotice
//
//  Created by 郭军 on 2018/3/14.
//  Copyright © 2018年 JUN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JGNoticeViewCell : UIView

@property (nonatomic, readonly, strong) UIView *contentView;
@property (nonatomic, readonly, strong) UILabel *textLabel;
@property (nonatomic, readonly,   copy) NSString *reuseIdentifier;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;

@end

//
//  JGRollingNoticeView.h
//  JGRollingNotice
//
//  Created by 郭军 on 2018/3/14.
//  Copyright © 2018年 JUN. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JGNoticeViewCell.h"

@class JGRollingNoticeView;
@protocol JGRollingNoticeViewDataSource <NSObject>
@required
- (NSInteger)numberOfRowsForRollingNoticeView:(JGRollingNoticeView *)rollingView;
- (JGNoticeViewCell *)rollingNoticeView:(JGRollingNoticeView *)rollingView cellAtIndex:(NSUInteger)index;
@end

@protocol JGRollingNoticeViewDelegate <NSObject>
@optional
- (void)didClickRollingNoticeView:(JGRollingNoticeView *)rollingView forIndex:(NSUInteger)index;

@end


@interface JGRollingNoticeView : UIView


@property (nonatomic, assign) id<JGRollingNoticeViewDataSource> dataSource;
@property (nonatomic, assign) id<JGRollingNoticeViewDelegate> delegate;
@property (nonatomic, strong) NSTimer *timer; // 在合适的地方销毁它 you must invalidate it when not use,for example '-viewDidDismiss'
@property (nonatomic, assign) NSTimeInterval stayInterval; // 停留时间 默认2秒

- (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier;
- (__kindof JGNoticeViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;

- (void)beginScroll;


@end

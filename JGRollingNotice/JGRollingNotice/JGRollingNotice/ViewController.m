//
//  ViewController.m
//  JGRollingNotice
//
//  Created by 郭军 on 2018/3/14.
//  Copyright © 2018年 JUN. All rights reserved.
//

#import "ViewController.h"
#import "JGRollingNoticeView.h"
#import "CustomNoticeCell.h"

@interface ViewController () <JGRollingNoticeViewDataSource, JGRollingNoticeViewDelegate>
{
    NSArray *_arr0;
    NSArray *_arr1;
    
    JGRollingNoticeView *_noticeView0;
    JGRollingNoticeView *_noticeView1;
    
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    float w = [[UIScreen mainScreen] bounds].size.width;
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, w - 20, 100)];
    lab.numberOfLines = 0;
    lab.text = @"\t滚动公告、广告，支持自定义View，模仿淘宝头条等等。";
    [self.view addSubview:lab];
    
    
    
    _arr0 = @[
              @{@"arr": @[@{@"tag": @"手机", @"title": @"小米千元全面屏：抱歉，久等！625献上"}, @{@"tag": @"萌宠", @"title": @"可怜狗狗被抛弃，苦苦等候主人半年"}], @"img": @"tb_icon2"},
              @{@"arr": @[@{@"tag": @"手机", @"title": @"三星中端新机改名，全面屏火力全开"}, @{@"tag": @"围观", @"title": @"主人假装离去，狗狗直接把孩子推回去了"}], @"img": @"tb_icon3"},
              @{@"arr": @[@{@"tag": @"园艺", @"title": @"学会这些，这5种花不用去花店买了"}, @{@"tag": @"手机", @"title": @"华为nova2S发布，剧透了荣耀10？"}], @"img": @"tb_icon5"},
              @{@"arr": @[@{@"tag": @"开发", @"title": @"iOS 内购最新讲解"}, @{@"tag": @"博客", @"title": @"技术博客那些事儿"}], @"img": @"tb_icon6"},
              @{@"arr": @[@{@"tag": @"招聘", @"title": @"招聘XX高级开发工程师"}, @{@"tag": @"资讯", @"title": @"如何写一篇好的技术博客"}], @"img": @"tb_icon7"}
              ];
    _arr1 = @[@"小米千元全面屏：抱歉，久等！625献上",
              @"可怜狗狗被抛弃，苦苦等候主人半年",
              @"三星中端新机改名，全面屏火力全开",
              @"学会这些，这5种花不用去花店买了",
              @"华为nova2S发布，剧透了荣耀10？"
              ];
    
    [self creatRollingViewWithArray:_arr0 isFirst:YES];
    [self creatRollingViewWithArray:_arr1 isFirst:NO];
    
}

// 请在合适的时机 销毁timer
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [_noticeView0.timer invalidate];
    [_noticeView1.timer invalidate];
}


- (void)creatRollingViewWithArray:(NSArray *)arr isFirst:(BOOL)isFirst
{
    float w = [[UIScreen mainScreen] bounds].size.width;
    CGRect frame = CGRectMake(0, 200, w, 50);
    if (!isFirst) {
        frame = CGRectMake(0, 300, w, 30);
    }
    
    JGRollingNoticeView *noticeView = [[JGRollingNoticeView alloc]initWithFrame:frame];
    noticeView.dataSource = self;
    noticeView.delegate = self;
    [self.view addSubview:noticeView];
    noticeView.backgroundColor = [UIColor lightGrayColor];
    
    
    if (isFirst) {
        _noticeView0 = noticeView;
        [noticeView registerNib:[UINib nibWithNibName:@"CustomNoticeCell" bundle:nil] forCellReuseIdentifier:@"CustomNoticeCell"];
    }else{
        _noticeView1 = noticeView;
        [noticeView registerClass:[JGNoticeViewCell class] forCellReuseIdentifier:@"JGNoticeViewCell"];
    }
    
    [noticeView beginScroll];
}



- (NSInteger)numberOfRowsForRollingNoticeView:(JGRollingNoticeView *)rollingView
{
    if (rollingView == _noticeView0) {
        return _arr0.count;
    }
    
    if (rollingView == _noticeView1) {
        return _arr1.count;
    }
    
    return 0;
}
- (__kindof JGNoticeViewCell *)rollingNoticeView:(JGRollingNoticeView *)rollingView cellAtIndex:(NSUInteger)index
{
    if (rollingView == _noticeView0) {
        CustomNoticeCell *cell = [rollingView dequeueReusableCellWithIdentifier:@"CustomNoticeCell"];
        [cell noticeCellWithArr:_arr0 forIndex:index];
        return cell;
    }
    
    // 普通用法，只有一行label滚动显示文字
    // normal use, only one line label rolling
    if (rollingView == _noticeView1) {
        JGNoticeViewCell *cell = [rollingView dequeueReusableCellWithIdentifier:@"JGNoticeViewCell"];
        cell.textLabel.text = _arr1[index];
        cell.contentView.backgroundColor = [UIColor orangeColor];
        if (index % 2 == 0) {
            cell.contentView.backgroundColor = [UIColor greenColor];
        }
        return cell;
    }
    
    
    return nil;
}

- (void)didClickRollingNoticeView:(JGRollingNoticeView *)rollingView forIndex:(NSUInteger)index
{
    NSLog(@"点击的index: %ld", index);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  ViewController.m
//  JGRollingNotice
//
//  Created by 郭军 on 2018/3/14.
//  Copyright © 2018年 JUN. All rights reserved.
//

#import "ViewController.h"
#import "JGRollingNoticeView.h"
//#import "CustomNoticeCell.h"
#import "JGCustomNoticeCell.h"


@interface ViewController () <JGRollingNoticeViewDataSource, JGRollingNoticeViewDelegate>
{
    NSArray *_arr;
    NSMutableArray *_muArr;
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
    
    
    
    _arr = @[
              @{@"img": @"tb_icon2",@"name": @"一名", @"time": @"还差1人拼成\n剩余21:12:11:8"},
              @{@"img": @"tb_icon3",@"name": @"二名", @"time": @"还差22人拼成\n剩余21:12:11:8"},
              @{@"img": @"tb_icon2",@"name": @"三名", @"time": @"还差23人拼成\n剩余21:12:11:8"},
              @{@"img": @"tb_icon2",@"name": @"四名", @"time": @"还差14人拼成\n剩余21:12:11:8"},
              @{@"img": @"tb_icon5",@"name": @"五名", @"time": @"还差7人拼成\n剩余21:12:11:8"},
              @{@"img": @"tb_icon7",@"name": @"六名", @"time": @"还差11人拼成\n剩余21:12:11:8"},
              @{@"img": @"tb_icon2",@"name": @"七名", @"time": @"还差23人拼成\n剩余21:12:11:8"},
              @{@"img": @"tb_icon2",@"name": @"八名", @"time": @"还差14人拼成\n剩余21:12:11:8"},
              @{@"img": @"tb_icon5",@"name": @"九名", @"time": @"还差7人拼成\n剩余21:12:11:8"}
//              ,
//              @{@"img": @"tb_icon7",@"name": @"十名", @"time": @"还差11人拼成\n剩余21:12:11:8"}
              ];
    _muArr = [NSMutableArray arrayWithArray:_arr];
    if (_arr.count % 2 == 1) {
        for (NSDictionary *dict in _arr) {
            [_muArr addObject:dict];
            
        }
    }
    
    
    _arr1 = @[@"小米千元全面屏：抱歉，久等！625献上",
              @"可怜狗狗被抛弃，苦苦等候主人半年",
              @"三星中端新机改名，全面屏火力全开",
              @"学会这些，这5种花不用去花店买了",
              @"华为nova2S发布，剧透了荣耀10？"
              ];
    
    [self creatRollingViewWithArray:_muArr isFirst:YES];
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
    CGRect frame = CGRectZero;
    if (isFirst) {
        
        if (_muArr.count == 1) {
            frame = CGRectMake(0, 200, w, 60);
        }else {
            frame = CGRectMake(0, 200, w, 120);
        }
    }
    
    if (!isFirst) {
        frame = CGRectMake(0, 350, w, 30);
    }
    
    JGRollingNoticeView *noticeView = [[JGRollingNoticeView alloc]initWithFrame:frame];
    noticeView.dataSource = self;
    noticeView.delegate = self;
    [self.view addSubview:noticeView];
    noticeView.backgroundColor = [UIColor lightGrayColor];
    
    
    if (isFirst) {
        _noticeView0 = noticeView;
//        [noticeView registerNib:[UINib nibWithNibName:@"CustomNoticeCell" bundle:nil] forCellReuseIdentifier:@"CustomNoticeCell"];
        [noticeView registerClass:[JGCustomNoticeCell class] forCellReuseIdentifier:@"JGCustomNoticeCell"];
        
        
    }else{
        _noticeView1 = noticeView;
        [noticeView registerClass:[JGNoticeViewCell class] forCellReuseIdentifier:@"JGNoticeViewCell"];
    }
    
    [noticeView beginScroll];
}



- (NSInteger)numberOfRowsForRollingNoticeView:(JGRollingNoticeView *)rollingView
{
    if (rollingView == _noticeView0) {
        if (_muArr.count == 1) return 1;
        if ((_muArr.count % 2) == 1) {
            return (_muArr.count / 2) + 1;
        }
        return _muArr.count / 2;
    }
    
    if (rollingView == _noticeView1) {
        return _arr1.count;
    }
    
    return 0;
}

- (__kindof JGNoticeViewCell *)rollingNoticeView:(JGRollingNoticeView *)rollingView cellAtIndex:(NSUInteger)index
{
    if (rollingView == _noticeView0) {
        JGCustomNoticeCell *cell = [rollingView dequeueReusableCellWithIdentifier:@"JGCustomNoticeCell"];
        [cell noticeCellWithArr:_muArr forIndex:index];
        return cell;
    }
    
//     普通用法，只有一行label滚动显示文字
//     normal use, only one line label rolling
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

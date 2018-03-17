//
//  JGCustomNoticeCell.m
//  JGRollingNotice
//
//  Created by 郭军 on 2018/3/16.
//  Copyright © 2018年 JUN. All rights reserved.
//

#import "JGCustomNoticeCell.h"

@interface JGCustomNoticeCell() {
    NSArray *_arr0;
    NSUInteger _Index;
}
//用户头像
@property (nonatomic, strong) UIImageView *ImageIcon;
//用户名字
@property (nonatomic, strong) UILabel *NameLbl;
//剩余时间
@property (nonatomic, strong) UILabel *TimeLbl;
//去拼单
@property (nonatomic, strong) UIButton *GoBtn;

//用户头像
@property (nonatomic, strong) UIImageView *ImageIcon1;
//用户名字
@property (nonatomic, strong) UILabel *NameLbl1;
//剩余时间
@property (nonatomic, strong) UILabel *TimeLbl1;
//去拼单
@property (nonatomic, strong) UIButton *GoBtn1;

@end



@implementation JGCustomNoticeCell



- (void)setupInitialUI {
    
    NSLog(@"22222");
    
    _ImageIcon = [UIImageView new];
    _NameLbl = [UILabel new];
    _TimeLbl = [UILabel new];
    _GoBtn = [UIButton new];
    _ImageIcon1 = [UIImageView new];
    _NameLbl1 = [UILabel new];
    _TimeLbl1 = [UILabel new];
    _GoBtn1 = [UIButton new];
    
    _ImageIcon.backgroundColor = [UIColor redColor];
    _NameLbl.backgroundColor = [UIColor greenColor];
    _TimeLbl.backgroundColor = [UIColor cyanColor];
    _GoBtn.backgroundColor = [UIColor blueColor];
    _ImageIcon1.backgroundColor = [UIColor redColor];
    _NameLbl1.backgroundColor = [UIColor greenColor];
    _TimeLbl1.backgroundColor = [UIColor cyanColor];
    _GoBtn1.backgroundColor = [UIColor blueColor];
    
    [self addSubview:_ImageIcon];
    [self addSubview:_NameLbl];
    [self addSubview:_TimeLbl];
    [self addSubview:_GoBtn];
    [self addSubview:_ImageIcon1];
    [self addSubview:_NameLbl1];
    [self addSubview:_TimeLbl1];
    [self addSubview:_GoBtn1];
}


- (void)noticeCellWithArr:(NSArray *)arr forIndex:(NSUInteger)index {
    if (!arr.count) return;
    _arr0 = arr;
    
    NSLog(@"%ld",index);
    
    if (arr.count % 2 == 1) { //传入消息是奇数
        

//        if (arr.count == 1) { //传入一条消息
//
//        }else {
//
//        }
        
//        NSDictionary *dic = arr[index];

        
//        if (_Index < arr.count - 1) {
//            _Index = 2 * index;
//        }else {
//            _Index = 1;
//        }
        
        NSDictionary *dic = arr[index * 2];
//        NSDictionary *dic1 = arr[_Index * 2 + 1];
        
        _NameLbl.text = dic[@"name"];
//        _NameLbl1.text = dic1[@"name"];
        
        _TimeLbl.text = dic[@"time"];
//        _TimeLbl1.text = dic1[@"time"];
        
        
    }else { //传入消息是偶数
        
        NSDictionary *dic = arr[index * 2];
        NSDictionary *dic1 = arr[index * 2 + 1];

        _NameLbl.text = dic[@"name"];
        _NameLbl1.text = dic1[@"name"];
        
        _TimeLbl.text = dic[@"time"];
        _TimeLbl1.text = dic1[@"time"];
    }
    
    
    
    
    
    
//    _trailIconImgView.image = [UIImage imageNamed:dic[@"img"]];
//
//    _tagLab0.text = [dic[@"arr"] firstObject][@"tag"];
//    _titleLab0.text = [dic[@"arr"] firstObject][@"title"];
//
//    _tagLab1.text = [dic[@"arr"] lastObject][@"tag"];
//    _titleLab1.text = [dic[@"arr"] lastObject][@"title"];
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (_arr0.count == 1) {
        _ImageIcon.frame = CGRectMake(10, 10, 40, 40);
        _NameLbl.frame = CGRectMake(40, 10, 100, 40);
        _TimeLbl.frame = CGRectMake(150, 10, 100, 40);
        _GoBtn.frame = CGRectMake(300, 10, 40, 40);
        _ImageIcon1.frame = CGRectZero;
        _NameLbl1.frame = CGRectZero;
        _TimeLbl1.frame = CGRectZero;
        _GoBtn1.frame = CGRectZero;
        
    }else {
        
        _ImageIcon.frame = CGRectMake(10, 10, 40, 40);
        _NameLbl.frame = CGRectMake(60, 10, 100, 40);
        _TimeLbl.frame = CGRectMake(170, 10, 100, 40);
        _GoBtn.frame = CGRectMake(300, 10, 40, 40);
        _ImageIcon1.frame = CGRectMake(10, 70, 40, 40);
        _NameLbl1.frame = CGRectMake(60, 70, 100, 40);
        _TimeLbl1.frame = CGRectMake(170, 70, 100, 40);
        _GoBtn1.frame = CGRectMake(300, 70, 40, 40);

    }
    
}




@end

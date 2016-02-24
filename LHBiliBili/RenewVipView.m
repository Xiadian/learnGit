//
//  RenewVipView.m
//  myTalk
//
//  Created by LYoung on 15/1/14.
//  Copyright (c) 2015年 LYoung. All rights reserved.
//

#import "RenewVipView.h"

#define MonthAndMoneyLabelFont 18.0
#define SELECTEDBUTTONWIDTH 60

@interface RenewVipView()
{
    NSString *_tempMoneyCount;
    
    //button数组
    NSMutableArray *_buttonArray;
    
    UIButton *button1;
    UIButton *button2;
    UIButton *button3;
}

@end


@implementation RenewVipView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        _buttonArray = [NSMutableArray array];
        _tempMoneyCount = @"1500";
        self.backgroundColor = YColor(235, 235, 241);
        
        [self setupUI];
    }
    return self;
}

-(void)setupUI
{
    [self creatButton:@"1个月" money:@"500" index:0];
    button1 = [_buttonArray objectAtIndex:0];
    [self creatButton:@"3个月" money:@"1500" index:1];
    button2 = [_buttonArray objectAtIndex:1];
    [self creatButton:@"6个月" money:@"3000" index:2];
    button3 = [_buttonArray objectAtIndex:2];
    //默认选择1500
    button1.selected = NO;
    button2.selected = YES;
    button3.selected = NO;
    
    UILabel *commitL = [[UILabel alloc] init];
    commitL.text = @"提交续费类型,专属客服会在12个小时之内处理";
    commitL.frame = CGRectMake(10, 3*(SELECTEDBUTTONWIDTH + 10) + 10, kMainScreenWidth - 20, 20);
    commitL.font = [UIFont systemFontOfSize:13.0];
    commitL.textAlignment = NSTextAlignmentCenter;
    commitL.textColor = [UIColor lightGrayColor];
    [self addSubview:commitL];
    //提交按钮
    UIButton *commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commitBtn.layer.cornerRadius = 8;
    commitBtn.layer.masksToBounds = YES;
    commitBtn.titleLabel.font = [UIFont boldSystemFontOfSize:20.0];
    commitBtn.frame = CGRectMake(10, 50 + 3*(SELECTEDBUTTONWIDTH + 10) , kMainScreenWidth - 20, 50);
    [commitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [commitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [commitBtn setBackgroundImage:[UIImage imageNamed:@"share_buttonBg"] forState:UIControlStateNormal];
    [commitBtn addTarget:self action:@selector(commitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:commitBtn];
}
/**
 *  创建一个可选择的button
 *
 *  @param monthTitle 月份
 *  @param money      钱数
 *  @param index      索引
 */
-(void)creatButton:(NSString *)monthTitle money:(NSString *)money index:(int)index
{
    //背景
    UIView *bgView = [[UIView alloc] init];
    bgView.layer.cornerRadius = 8;
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.frame = CGRectMake(10, index * (SELECTEDBUTTONWIDTH + 10 ) + 10, kMainScreenWidth - 20, SELECTEDBUTTONWIDTH);
    [self addSubview:bgView];
    
    //几个月
    UILabel *monthL = [[UILabel alloc] init];
    monthL.text = monthTitle;
    monthL.font = [UIFont boldSystemFontOfSize:MonthAndMoneyLabelFont];
    monthL.frame = CGRectMake(kMainScreenWidth/2 - 100, 20, 100, 20);
    [bgView addSubview:monthL];
    //多少钱
    UILabel *moneyL = [[UILabel alloc] init];
    moneyL.text = [NSString stringWithFormat:@"¥ %@",money];
    moneyL.textColor = YColor(249, 142, 21);
    moneyL.font = [UIFont boldSystemFontOfSize:MonthAndMoneyLabelFont];
    moneyL.frame = CGRectMake(kMainScreenWidth/2, 20, 100, 20);
    [bgView addSubview:moneyL];

    //选择的事件
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.layer.cornerRadius = 8;
    btn.layer.masksToBounds = YES;
    btn.tag = index;
    btn.frame = CGRectMake(0, 0, kMainScreenWidth - 20, SELECTEDBUTTONWIDTH);
    [btn addTarget:self action:@selector(selectedButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor clearColor];
    [btn setImage:[UIImage imageNamed:@"commitMoney_selected"] forState:UIControlStateSelected];
    [btn setImage:[UIImage imageNamed:@"commitMoney"] forState:UIControlStateNormal];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, kMainScreenWidth - 60)];
    [bgView addSubview:btn];
    [_buttonArray addObject:btn];
}

//点击那个数目
-(void)selectedButtonClick:(UIButton *)sender
{
    //钱数
    NSString *commitMoneyCount;
    if (sender.tag == 0) {
        button1.selected = YES;
        button2.selected = NO;
        button3.selected = NO;
        commitMoneyCount = @"500";
    }else if (sender.tag == 1){
        button1.selected = NO;
        button2.selected = YES;
        button3.selected = NO;
        commitMoneyCount = @"1500";
    }else if (sender.tag == 2){
        button1.selected = NO;
        button2.selected = NO;
        button3.selected = YES;
        commitMoneyCount = @"3000";
    }
    _tempMoneyCount = commitMoneyCount;
}

//提交按钮事件
-(void)commitButtonClick:(UIButton *)sender
{
    if ([self.delelgate respondsToSelector:@selector(commitMoneyButtonClickWithMoneyCount:)]) {
        [_delelgate commitMoneyButtonClickWithMoneyCount:_tempMoneyCount];
    }
}





@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 

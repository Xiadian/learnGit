//
//  RootViewController.m
//  ChooseMoney
//
//  Created by LYoung on 15/1/14.
//  Copyright (c) 2015年 LYoung. All rights reserved.
//

#import "RootViewController.h"
#import "RenewVipView.h"



@interface RootViewController ()<CommitMoneyCountDelegate>

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupUI];
}

-(void)setupUI
{
    //1.设置标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0 , 100, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];  //设置Label背景透明
    titleLabel.font = [UIFont boldSystemFontOfSize:16.0];  //设置文本字体与大小
    titleLabel.textColor = [UIColor blackColor];  //设置文本颜色
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"续费";  //设置标题
    self.navigationItem.titleView = titleLabel;
    
    UIScrollView *bgScrollView = [[UIScrollView alloc] init];
    bgScrollView.showsVerticalScrollIndicator = NO;
    bgScrollView.frame = CGRectMake(0, 0, kMainScreenWidth , kMainScreenHeight);
    bgScrollView.contentSize = CGSizeMake(kMainScreenWidth, kMainScreenHeight );
    [self.view addSubview:bgScrollView];
    
    RenewVipView *renewVIPView = [[RenewVipView alloc] init];
    renewVIPView.frame = CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight);
    renewVIPView.delelgate = self;
    [bgScrollView addSubview:renewVIPView];
}

-(void)commitMoneyButtonClickWithMoneyCount:(NSString *)moneyCount
{
    NSString *resultString = [NSString stringWithFormat:@"您选择的金额为:%@",moneyCount];
    UIAlertView *alVC = [[UIAlertView alloc] initWithTitle:@"提示" message:resultString delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alVC show];
}


@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 

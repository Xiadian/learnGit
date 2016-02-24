//
//  RenewVipView.h
//  myTalk
//
//  Created by LYoung on 15/1/14.
//  Copyright (c) 2015年 LYoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CommitMoneyCountDelegate<NSObject>
/**
 *  提交续费按钮事件
 *
 *  @param moneyCount 钱的数目
 */
-(void)commitMoneyButtonClickWithMoneyCount:(NSString *)moneyCount;

@end

@interface RenewVipView : UIView

@property (nonatomic, assign) id<CommitMoneyCountDelegate>delelgate;

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 

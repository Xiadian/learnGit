//
//  LHHeaderView.h
//  biUp
//
//  Created by snowimba on 15/12/24.
//  Copyright © 2015年 snowimba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *numLbl;
+ (instancetype)headerView;
@property (nonatomic,copy) void(^btnClcike)();

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
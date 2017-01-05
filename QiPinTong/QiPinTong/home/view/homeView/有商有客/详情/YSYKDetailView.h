//
//  YSYKDetailView.h
//  家长界
//
//  Created by taylor on 2016/12/5.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSYKDetailView : UIView

/*评价*/
@property (strong,nonatomic) UILabel *commentLabel;

/*查看全部*/
@property (strong,nonatomic) UIButton *moreBtn;

/*图像*/
@property (strong,nonatomic) UIImageView *imgView;

/*名称*/
@property (strong,nonatomic) UILabel *titleLabel;

/*时间*/
@property (strong,nonatomic) UILabel *timeLabel;

/*详情*/
@property (strong,nonatomic) UILabel *detailLabel;


@end

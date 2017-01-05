//
//  EmployDetailView.h
//  家长界
//
//  Created by taylor on 2016/11/30.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployDetailView : UIView

/*标题*/
@property (strong,nonatomic) UILabel *titleLabel;

/*收藏按钮*/
@property (strong,nonatomic) UIButton *saveBtn;

/*分享按钮*/
@property (strong,nonatomic) UIButton *shareBtn;

/*定位*/
@property (strong,nonatomic) UILabel *addressLabel;

/*时间*/
@property (strong,nonatomic) UILabel *timeLabel;

/*图片*/
@property (strong,nonatomic) UIImageView *imgView;


@end

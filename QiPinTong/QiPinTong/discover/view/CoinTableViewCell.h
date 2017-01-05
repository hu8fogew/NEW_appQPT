//
//  CoinTableViewCell.h
//  家长界
//
//  Created by taylor on 2016/12/30.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoinTableViewCell : UITableViewCell

/*图片*/
@property (strong,nonatomic) UIImageView *imgView;

/*标题*/
@property (strong,nonatomic) UILabel *titleLabel;

/*类型*/
@property (strong,nonatomic) UILabel *typeLabel;
@property (strong,nonatomic) UILabel *kindLabel;

/*地址*/
@property (strong,nonatomic) UIImageView *addressIcon;
@property (strong,nonatomic) UILabel *addressLabel;

/*金币*/
@property (strong,nonatomic) UIView *coinView;
@property (strong,nonatomic) UIImageView *coinImgView;
@property (strong,nonatomic) UILabel *numLabel;

@end

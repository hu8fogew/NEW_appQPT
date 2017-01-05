//
//  Campus365TableViewCell.h
//  企聘通
//
//  Created by taylor on 2016/11/26.
//  Copyright © 2016年 taylorZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Campus365TableViewCell : UITableViewCell

/*图片*/
@property (nonatomic,strong) UIImageView *imgView;

/*职称*/
@property (nonatomic,strong) UILabel *titleLabel;

/*价格*/
@property (nonatomic,strong) UILabel *priceLabel;
/*日结*/
@property (nonatomic,strong) UILabel *priceTypeLabel;

/**工资*/
@property (nonatomic,strong) UILabel *salaryLabel;

/*公司名称*/
@property (nonatomic,strong) UILabel *companyLabel;
/*v图标*/
@property (nonatomic,strong) UIImageView *vIconView;

/*行业*/
@property (nonatomic,strong) UILabel *professionLabel;

/*上市*/
@property (nonatomic,strong) UILabel *statusLabel;

/*招聘*/
@property (nonatomic,strong) UIImageView *employIcon;
@property (nonatomic,strong) UILabel *employLabel;

/*招聘人数*/
@property (nonatomic,strong) UIImageView *employNoIcon;
@property (nonatomic,strong) UILabel *employNoLabel;

/*地址*/
@property (nonatomic,strong) UIImageView *addressIcon;
@property (nonatomic,strong) UILabel *addressLabel;

/*数字*/
@property (nonatomic,strong) UIImageView *numberIcon;
@property (nonatomic,strong) UILabel *numberLabel;

@end

//
//  Campus365TableViewCell.m
//  企聘通
//
//  Created by taylor on 2016/11/26.
//  Copyright © 2016年 taylorZhang. All rights reserved.
//

#import "Campus365TableViewCell.h"
#import "Masonry.h"
@implementation Campus365TableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.3)];
        vi.backgroundColor = [UIColor whiteColor];
        [self addSubview:vi];
        
        self.imgView = [UIImageView new];
        self.imgView.layer.borderWidth = 1.5;
        self.imgView.layer.borderColor = [HWColor(241, 241, 241) CGColor];
        self.imgView.layer.cornerRadius = 2;
        self.imgView.layer.masksToBounds = YES;
        [vi addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(10);
            make.centerY.equalTo(vi);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.23, SCREEN_WIDTH*0.23));
        }];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textColor = HWColor(51, 51, 51);
        [vi addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgView);
            make.left.equalTo(self.imgView.mas_right).with.offset(13);
        }];
        
        self.priceTypeLabel = [UILabel new];
        self.priceTypeLabel.font = [UIFont systemFontOfSize:13];
        self.priceTypeLabel.textColor = HWColor(31, 199, 193);
        self.priceTypeLabel.layer.borderWidth = 1;
        self.priceTypeLabel.layer.borderColor = [HWColor(31, 199, 193)CGColor];
        self.priceTypeLabel.textAlignment = NSTextAlignmentCenter;
        [vi addSubview:self.priceTypeLabel];
        [self.priceTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(vi).with.offset(-13);
            make.centerY.equalTo(self.titleLabel);
            make.size.mas_equalTo(CGSizeMake(40, 17));
        }];
        
        self.salaryLabel = [UILabel new];
        self.salaryLabel.textColor = HWColor(255, 152, 23);
        self.salaryLabel.font = [UIFont systemFontOfSize:15];
        [vi addSubview:self.salaryLabel];
        [self.salaryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(vi).with.offset(-10);
            make.centerY.equalTo(self.titleLabel);
        }];
        
        self.priceLabel = [UILabel new];
        self.priceLabel.textColor = HWColor(255, 152, 23);
        self.priceLabel.font = [UIFont systemFontOfSize:15];
        [vi addSubview:self.priceLabel];
        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.priceTypeLabel.mas_left).with.offset(-5);
            make.centerY.equalTo(self.priceTypeLabel);
        }];
        
        self.companyLabel = [UILabel new];
        self.companyLabel.font = [UIFont systemFontOfSize:13];
        self.companyLabel.textColor = HWColor(102, 102, 102);
        [vi addSubview:self.companyLabel];
        [self.companyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.2/9);
        }];
        
        self.vIconView = [UIImageView new];
        [vi addSubview:self.vIconView];
        [self.vIconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.companyLabel.mas_right).with.offset(3);
            make.centerY.equalTo(self.companyLabel);
            make.width.mas_equalTo(12);
            make.height.mas_equalTo(12);
        }];
        
        self.professionLabel = [UILabel new];
        self.professionLabel.font = [UIFont systemFontOfSize:13];
        self.professionLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.professionLabel];
        [self.professionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.vIconView.mas_right).with.offset(18);
            make.centerY.equalTo(self.vIconView);
        }];
        
        UIView *fView = [UIView new];
        fView.backgroundColor = HWColor(153, 153, 153);
        [vi addSubview:fView];
        [fView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.professionLabel.mas_right).with.offset(5);
            make.centerY.equalTo(self.professionLabel);
            make.width.mas_equalTo(1);
            make.height.mas_equalTo(12);
        }];
        
        self.statusLabel = [UILabel new];
        self.statusLabel.font = [UIFont systemFontOfSize:13];
        self.statusLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.statusLabel];
        [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.professionLabel);
            make.left.equalTo(fView.mas_right).with.offset(5);
        }];
        
        self.employIcon = [UIImageView new];
        self.employIcon.layer.masksToBounds = YES;
        self.employIcon.layer.cornerRadius = 6;
        [vi addSubview:self.employIcon];
        [self.employIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.companyLabel);
            make.top.equalTo(self.companyLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.2/8);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
        
        self.employLabel = [UILabel new];
        self.employLabel.textColor = HWColor(153, 153, 153);
        self.employLabel.font = [UIFont systemFontOfSize:12];
        [vi addSubview:self.employLabel];
        [self.employLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.employIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.employIcon);
        }];
        
        self.employNoIcon = [UIImageView new];
        self.employNoIcon.layer.masksToBounds = YES;
        self.employNoIcon.layer.cornerRadius = 6;
        [vi addSubview:self.employNoIcon];
        [self.employNoIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.employLabel);
            make.left.equalTo(self.employLabel.mas_right).with.offset(6);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
        
        self.employNoLabel = [UILabel new];
        self.employNoLabel.textColor = HWColor(153, 153, 153);
        self.employNoLabel.font = [UIFont systemFontOfSize:15];
        [vi addSubview:self.employNoLabel];
        [self.employNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.employNoIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.employNoIcon);
        }];
        
        self.addressIcon = [UIImageView new];
        self.addressIcon.layer.masksToBounds = YES;
        self.addressIcon.layer.cornerRadius = 6;
        [vi addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.employIcon);
            make.top.equalTo(self.employIcon.mas_bottom).with.offset(SCREEN_WIDTH*0.2/9);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
        
        self.addressLabel = [UILabel new];
        self.addressLabel.textColor = HWColor(153, 153, 153);
        self.addressLabel.font = [UIFont systemFontOfSize:13];
        [vi addSubview:self.addressLabel];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.addressIcon);
        }];
        
        self.numberLabel = [UILabel new];
        self.numberLabel.textColor = HWColor(153, 153, 153);
        self.numberLabel.font = [UIFont systemFontOfSize:13];
        [vi addSubview:self.numberLabel];
        [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.priceTypeLabel);
            make.centerY.equalTo(self.addressLabel);
        }];
        
        self.numberIcon = [UIImageView new];
        self.numberIcon.layer.masksToBounds = YES;
        self.numberIcon.layer.cornerRadius = 6;
        [vi addSubview:self.numberIcon];
        [self.numberIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.numberLabel.mas_left).with.offset(-2);
            make.centerY.equalTo(self.numberLabel);
            make.size.mas_equalTo(CGSizeMake(15, 10));
        }];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

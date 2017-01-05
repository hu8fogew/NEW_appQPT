//
//  YSYKShowView.m
//  家长界
//
//  Created by taylor on 2016/12/5.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YSYKShowView.h"

@implementation YSYKShowView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/2-5)];
        vi.backgroundColor = [UIColor whiteColor];
        [self addSubview:vi];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        self.titleLabel.textColor = HWColor(51, 51, 51);
        [vi addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(10);
            make.top.equalTo(vi).with.offset(15);
        }];
        
        for (int i = 0; i < 5; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(i*18+10, SCREEN_WIDTH*0.12, 16, 16);
            [button setBackgroundImage:[UIImage imageNamed:@"star_gray"] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"star_yellow"] forState:UIControlStateSelected];
            [vi addSubview:button];
        }
        
        self.commentLabel = [UILabel new];
        self.commentLabel.font = [UIFont systemFontOfSize:14];
        self.commentLabel.textColor = HWColor(253, 151, 47);
        [vi addSubview:self.commentLabel];
        [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(SCREEN_WIDTH*0.28);
            make.top.equalTo(vi).with.offset(SCREEN_WIDTH*0.12);
        }];
        
        self.averageLabel = [UILabel new];
        self.averageLabel.font = [UIFont systemFontOfSize:15];
        self.averageLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.averageLabel];
        [self.averageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(SCREEN_WIDTH*0.4);
            make.top.equalTo(vi).with.offset(SCREEN_WIDTH*0.12);
        }];
        
        self.priceLabel = [UILabel new];
        self.priceLabel.font = [UIFont systemFontOfSize:15];
        self.priceLabel.textColor = HWColor(252, 21, 32);
        [vi addSubview:self.priceLabel];
        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.averageLabel.mas_right);
            make.centerY.equalTo(self.averageLabel);
        }];
        
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.button setTitle:@"立即兑换" forState:UIControlStateNormal];
        [self.button setBackgroundColor:HWColor(253, 151, 47)];
        self.button.layer.masksToBounds = YES;
        self.button.layer.cornerRadius = 5;
        [vi addSubview:self.button];
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(vi).with.offset(SCREEN_WIDTH*0.28/4);
            make.right.equalTo(vi).with.offset(-10);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.3, SCREEN_WIDTH*0.13));
        }];
        
        self.addressLabel = [UILabel new];
        self.addressLabel.font = [UIFont systemFontOfSize:15];
        self.addressLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.addressLabel];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.button.mas_bottom);
        }];
        
        self.typeLabel = [UILabel new];
        self.typeLabel.font = [UIFont systemFontOfSize:15];
        self.typeLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.typeLabel];
        [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressLabel.mas_right).with.offset(5);
            make.centerY.equalTo(self.addressLabel);
        }];

        
        UIView *hv = [UIView new];
        hv.backgroundColor = HWColor(241, 241, 241);
        [vi addSubview:hv];
        [hv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(vi).with.offset(SCREEN_WIDTH*0.28);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 1));
        }];
        
        self.firstIcon = [UIImageView new];
        self.firstIcon.layer.masksToBounds = YES;
        self.firstIcon.layer.cornerRadius = 8;
        [vi addSubview:self.firstIcon];
        [self.firstIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(vi).with.offset(SCREEN_WIDTH*0.32);
            make.size.mas_equalTo(CGSizeMake(16, 16));
        }];
        
        self.firstLabel = [UILabel new];
        self.firstLabel.font = [UIFont systemFontOfSize:15];
        self.firstLabel.textColor = HWColor(51, 51, 51);
        [vi addSubview:self.firstLabel];
        [self.firstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.firstIcon.mas_right).with.offset(5);
            make.centerY.equalTo(self.firstIcon);
        }];
        
        self.secondIcon = [UIImageView new];
        self.secondIcon.layer.masksToBounds = YES;
        self.secondIcon.layer.cornerRadius = 8;
        [vi addSubview:self.secondIcon];
        [self.secondIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.firstIcon);
            make.top.equalTo(vi).with.offset(SCREEN_WIDTH*0.4);
            make.size.mas_equalTo(CGSizeMake(16, 16));
        }];
        
        self.secondLabel = [UILabel new];
        self.secondLabel.font = [UIFont systemFontOfSize:15];
        self.secondLabel.textColor = HWColor(51, 51, 51);
        [vi addSubview:self.secondLabel];
        [self.secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.secondIcon.mas_right).with.offset(5);
            make.centerY.equalTo(self.secondIcon);
        }];
        
        self.wifiIcon = [UIImageView new];
        [vi addSubview:self.wifiIcon];
        [self.wifiIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleLabel);
            make.left.equalTo(self.titleLabel.mas_right).with.offset(23);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        
        self.parkIcon = [UIImageView new];
        [vi addSubview:self.parkIcon];
        [self.parkIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.wifiIcon.mas_right).with.offset(5);
            make.centerY.equalTo(self.wifiIcon);
            make.size.mas_equalTo(CGSizeMake(15, 15));

        }];
        
        
    }
    return self;
}


@end

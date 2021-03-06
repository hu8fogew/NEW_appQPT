//
//  QPTHomeCollectionViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/23.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "QPTHomeCollectionViewCell.h"

@implementation QPTHomeCollectionViewCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*0.41, SCREEN_WIDTH*0.54)];
        vi.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:vi];
        
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*0.41, SCREEN_WIDTH*0.41)];
        [vi addSubview:self.imgView];
        
        UIView *vv = [UIView new];
        vv.backgroundColor = HWColor(88, 88, 88);
        vv.alpha = 0.6;
        [self.imgView addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(self.imgView);
            make.bottom.equalTo(self.imgView.mas_bottom);
            make.height.mas_equalTo(self.imgView.height/6);
        }];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = [UIColor whiteColor];
        [self.imgView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView).with.offset(5);
            make.bottom.equalTo(self.imgView.mas_bottom).with.offset(-5);
        }];
        
        self.vIcon = [UIImageView new];
        [self.imgView addSubview:self.vIcon];
        [self.vIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right);
            make.centerY.equalTo(self.titleLabel);
            make.size.mas_equalTo(CGSizeMake(13, 13));
        }];
        
        self.NoLabel = [UILabel new];
        self.NoLabel.font = [UIFont systemFontOfSize:14];
        self.NoLabel.textColor = [UIColor whiteColor];
        [self.imgView addSubview:self.NoLabel];
        [self.NoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.imgView).with.offset(-6);
            make.centerY.equalTo(self.titleLabel);
        }];
        
        self.eIcon = [UIImageView new];
        [self.imgView addSubview:self.eIcon];
        [self.eIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.NoLabel.mas_left);
            make.centerY.equalTo(self.titleLabel);
            make.size.mas_equalTo(CGSizeMake(14, 12));
        }];
        
        self.postLabel = [UILabel new];
        self.postLabel.font = [UIFont systemFontOfSize:14];
        self.postLabel.textColor = [UIColor whiteColor];
        [vi addSubview:self.postLabel];
        [self.postLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.imgView).with.offset(-5);
            make.centerY.equalTo(self.titleLabel);
        }];
     
        self.addressIcon = [UIImageView new];
        [vi addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(3);
            make.top.equalTo(self.imgView.mas_bottom).with.offset(self.imgView.height/18);
            make.size.mas_equalTo(CGSizeMake(12, 13));
        }];
        
        self.addressLabel = [UILabel new];
        self.addressLabel.font = [UIFont systemFontOfSize:12];
        self.addressLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.addressLabel];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.self.addressIcon);
        }];
        
        self.ageIcon = [UIImageView new];
        [vi addSubview:self.ageIcon];
        [self.ageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(SCREEN_WIDTH*0.4/2-15);
            make.centerY.equalTo(self.addressIcon);
            make.size.mas_equalTo(CGSizeMake(11, 11));
        }];
        
        self.ageLabel = [UILabel new];
        self.ageLabel.font = [UIFont systemFontOfSize:12];
        self.ageLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.ageLabel];
        [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ageIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.ageIcon);
        }];
        
        self.educationLabel = [UILabel new];
        self.educationLabel.font = [UIFont systemFontOfSize:12];
        self.educationLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.educationLabel];
        [self.educationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(vi).with.offset(-5);
            make.centerY.equalTo(self.ageIcon);
        }];
        
        self.educationIcon = [UIImageView new];
        [vi addSubview:self.educationIcon];
        [self.educationIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.educationLabel.mas_left).with.offset(-2);
            make.centerY.equalTo(self.educationLabel);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];

        self.infoLabel = [UILabel new];
        self.infoLabel.font = [UIFont systemFontOfSize:12];
        self.infoLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.infoLabel];
        [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(7);
            make.top.equalTo(self.addressIcon.mas_bottom).with.offset(self.imgView.height/20);
        }];

        self.contentLabel = [UILabel new];
        self.contentLabel.font = [UIFont systemFontOfSize:12];
        self.contentLabel.textColor = HWColor(65, 188, 228);
        [vi addSubview:self.contentLabel];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.infoLabel.mas_right);
            make.centerY.equalTo(self.infoLabel);
        }];

        self.contsLabel = [UILabel new];
        self.contsLabel.font = [UIFont systemFontOfSize:12]
        ;
        self.contsLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.contsLabel];
        [self.contsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentLabel.mas_right);
            make.centerY.equalTo(self.infoLabel);
        }];
        
        self.priceLabel = [UILabel new];
        self.priceLabel.textColor = HWColor(253, 148, 18);
        self.priceLabel.font = [UIFont systemFontOfSize:13];
        [vi addSubview:self.priceLabel];
        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(7);
            make.top.equalTo(self.addressIcon.mas_bottom).with.offset(self.imgView.height/20);
        }];
        
        self.numberLabel = [UILabel new];
        self.numberLabel.textColor = HWColor(153, 153, 153);
        self.numberLabel.font = [UIFont systemFontOfSize:12];
        [vi addSubview:self.numberLabel];
        [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.educationLabel);
            make.centerY.equalTo(self.priceLabel);
        }];
        
        self.numberIcon = [UIImageView new];
        [vi addSubview:self.numberIcon];
        [self.numberIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.numberLabel.mas_left).with.offset(-2);
            make.centerY.equalTo(self.numberLabel);
            make.size.mas_equalTo(CGSizeMake(14, 12));
        }];

    }
    return self;
}

@end

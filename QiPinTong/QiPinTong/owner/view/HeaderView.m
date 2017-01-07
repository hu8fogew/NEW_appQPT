//
//  MemberHeaderView.m
//  QiPinTong
//
//  Created by taylor on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.36)];
        self.backImgView.userInteractionEnabled = YES;
        [self addSubview:self.backImgView];
        
        self.imgView = [UIImageView new];
        self.imgView.layer.masksToBounds = YES;
        self.imgView.layer.cornerRadius = SCREEN_WIDTH*0.16/2;
        [self.backImgView addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.backImgView).with.offset(20);
            make.bottom.equalTo(self.backImgView.mas_bottom).with.offset(-self.backImgView.height/7);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.16, SCREEN_WIDTH*0.16));
        }];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.titleLabel.textColor = [UIColor whiteColor];
        [self.backImgView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(10);
            make.bottom.equalTo(self.imgView.mas_centerY).with.offset(-5);
        }];
        
        self.setupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.setupBtn setImage:[UIImage imageNamed:@"shezhi"] forState:UIControlStateNormal];
        [self.backImgView addSubview:self.setupBtn];
        [self.setupBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.backImgView).with.offset(-20);
            make.top.equalTo(self.backImgView).with.offset(20);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
        self.editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.editBtn setTitle:@"编辑简历" forState:UIControlStateNormal];
        self.editBtn.titleLabel.textColor = [UIColor whiteColor];
        self.editBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.backImgView addSubview:self.editBtn];
        [self.editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.backImgView).with.offset(-30);
            make.centerY.equalTo(self.imgView);
        }];
    }
    return self;
}

@end

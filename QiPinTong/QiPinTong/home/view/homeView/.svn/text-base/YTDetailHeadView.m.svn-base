//
//  YTDetailHeadView.m
//  家长界
//
//  Created by taylor on 2016/12/10.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YTDetailHeadView.h"

@implementation YTDetailHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*1.6)];
        vi.backgroundColor = [UIColor whiteColor];
        [self addSubview:vi];
        self.titleLabel = [self addLabelWithFont:20 andTextColor:HWColor(51, 51, 51) andSview:vi];
        self.titleLabel.numberOfLines = 0;
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(10);
            make.right.equalTo(vi).with.offset(-15);
            make.top.equalTo(vi).with.offset(20);
        }];
        
    
        self.subLabel = [self addLabelWithFont:16 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(15);
        }];
        
        self.timeLabel = [self addLabelWithFont:16 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.subLabel.mas_right).with.offset(15);
            make.centerY.equalTo(self.subLabel);
        }];
    
        UIView *hv = [UIView new];
        hv.backgroundColor = HWColor(241, 241, 241);
        [vi addSubview:hv];
        [hv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.subLabel);
            make.top.equalTo(self.subLabel.mas_bottom).with.offset(15);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-20, 1));
        }];
        
        self.detailLabel = [self addLabelWithFont:18 andTextColor:HWColor(51, 51, 51) andSview:vi];
        self.detailLabel.numberOfLines = 0;
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(self.titleLabel);
            make.top.equalTo(hv).with.offset(20);
            
        }];
        
        self.imgView = [UIImageView new];
        [vi addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.detailLabel.mas_bottom).with.offset(10);
            make.left.equalTo(vi).with.offset(10);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-20, SCREEN_WIDTH*0.53));
        }];
        
        self.listTitleLabel = [self addLabelWithFont:15 andTextColor:HWColor(51, 51, 51) andSview:vi];
        [self.listTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgView.mas_bottom).with.offset(20);
            make.centerX.equalTo(vi);
            make.bottom.equalTo(vi.mas_bottom).with.offset(-15);
        }];
        
        UIView *hv1 = [UIView new];
        hv1.backgroundColor = HWColor(241, 241, 241);
        [vi addSubview:hv1];
        [hv1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(10);
            make.right.equalTo(self.listTitleLabel.mas_left).with.offset(-5);
            make.height.mas_equalTo(1);
            make.centerY.equalTo(self.listTitleLabel);
        }];
        
        UIView *hv2 = [UIView new];
        hv2.backgroundColor = HWColor(241, 241, 241);
        [vi addSubview:hv2];
        [hv2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(vi).with.offset(-10);
            make.left.equalTo(self.listTitleLabel.mas_right).with.offset(5);
            make.height.mas_equalTo(1);
            make.centerY.equalTo(self.listTitleLabel);
        }];
    }
    return self;
}

-(UILabel *)addLabelWithFont:(CGFloat)font andTextColor:(UIColor *)color andSview:(UIView *)sView{
    UILabel *lab = [UILabel new];
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = color;
    [sView addSubview:lab];
    
    return lab;
}

@end

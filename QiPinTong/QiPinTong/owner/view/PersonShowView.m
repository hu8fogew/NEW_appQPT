//
//  MemberShowView.m
//  QiPinTong
//
//  Created by taylor on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PersonShowView.h"

@implementation PersonShowView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.firstView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/3, SCREEN_WIDTH*0.18)];
        [self addSubview:self.firstView];

        self.sendNoLabel = [self addLabelWithTextColor:HWColor(53, 53, 53) andFont:15 andsView:self.firstView];
        [self.sendNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.firstView.mas_centerY).with.offset(-3);
            make.centerX.equalTo(self.firstView);
        }];
        
        self.sendLabel = [self addLabelWithTextColor:HWColor(153, 153, 153) andFont:15 andsView:self.firstView];
        self.sendLabel.text = @"投递记录";
        [self.sendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.firstView.mas_centerY).with.offset(3);
            make.centerX.equalTo(self.firstView);
        }];
        
        self.secondView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3, SCREEN_WIDTH*0.18)];
        [self addSubview:self.secondView];
        
        self.faceNoLabel = [self addLabelWithTextColor:HWColor(53, 53, 53) andFont:15 andsView:self.secondView];
        [self.faceNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.secondView);
            make.centerY.equalTo(self.sendNoLabel);
        }];
        
        self.faceLabel = [self addLabelWithTextColor:HWColor(153, 153, 153) andFont:15 andsView:self.secondView];
        self.faceLabel.text = @"待面试";
        [self.faceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.secondView);
            make.centerY.equalTo(self.sendLabel);
        }];
        
        self.thirdView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3*2, 0, SCREEN_WIDTH/3, SCREEN_WIDTH*0.18)];
        [self addSubview:self.thirdView];
        
        self.saveNoLabel = [self addLabelWithTextColor:HWColor(53, 53, 53) andFont:15 andsView:self.thirdView];
        [self.saveNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.thirdView);
            make.centerY.equalTo(self.faceNoLabel);
        }];
        
        self.saveLabel = [self addLabelWithTextColor:HWColor(153, 153, 153) andFont:15 andsView:self.thirdView];
        self.saveLabel.text = @"收藏";
        [self.saveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.thirdView);
            make.centerY.equalTo(self.faceLabel);
        }];

    }
    return self;
}



-(UILabel *)addLabelWithTextColor:(UIColor *)color andFont:(CGFloat)font andsView:(UIView *)sview
{
    UILabel *lab = [UILabel new];
    lab.textColor = color;
    lab.font = [UIFont systemFontOfSize:font];
    [sview addSubview:lab];
    
    return lab;
}

@end

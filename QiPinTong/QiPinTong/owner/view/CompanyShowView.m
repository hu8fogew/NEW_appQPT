//
//  CompanyShowView.m
//  QiPinTong
//
//  Created by taylor on 2017/1/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "CompanyShowView.h"

@implementation CompanyShowView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        /********/
        self.firstView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/4, SCREEN_WIDTH*0.18)];
        [self addSubview:self.firstView];
        
        self.focusNoLabel = [self addLabelWithTextColor:HWColor(53, 53, 53) andFont:15 andsView:self.firstView];
        [self.focusNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.firstView.mas_centerY).with.offset(-3);
            make.centerX.equalTo(self.firstView);
        }];
        
        self.focusLabel = [self addLabelWithTextColor:HWColor(153, 153, 153) andFont:15 andsView:self.firstView];
        self.focusLabel.text = @"关注";
        [self.focusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.firstView.mas_centerY).with.offset(3);
            make.centerX.equalTo(self.firstView);
        }];
        
        /*********/
        self.secondView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/4, 0, SCREEN_WIDTH/4, SCREEN_WIDTH*0.18)];
        [self addSubview:self.secondView];
        self.funsNoLabel = [self addLabelWithTextColor:HWColor(53, 53, 53) andFont:15 andsView:self.secondView];
        [self.funsNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.secondView);
            make.centerY.equalTo(self.focusNoLabel);
        }];
        
        self.funsLabel = [self addLabelWithTextColor:HWColor(153, 153, 153) andFont:15 andsView:self.secondView];
        self.funsLabel.text = @"粉丝";
        [self.funsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.secondView);
            make.centerY.equalTo(self.focusLabel);
        }];
        
        /*********/
        self.thirdView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/4*2, 0, SCREEN_WIDTH/4, SCREEN_WIDTH*0.18)];
        [self addSubview:self.thirdView];
        
        self.jobNoLabel = [self addLabelWithTextColor:HWColor(53, 53, 53) andFont:15 andsView:self.thirdView];
        [self.jobNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.thirdView);
            make.centerY.equalTo(self.funsNoLabel);
        }];
        
        self.jobLabel = [self addLabelWithTextColor:HWColor(153, 153, 153) andFont:15 andsView:self.thirdView];
        self.jobLabel.text = @"发布职位";
        [self.jobLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.thirdView);
            make.centerY.equalTo(self.funsLabel);
        }];
        
        /*********/
        self.fourthView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/4*3, 0, SCREEN_WIDTH/4, SCREEN_WIDTH*0.18)];
        [self addSubview:self.fourthView];
        
        self.resumeNoLabel = [self addLabelWithTextColor:HWColor(53, 53, 53) andFont:15 andsView:self.fourthView];
        [self.resumeNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.fourthView);
            make.centerY.equalTo(self.jobNoLabel);
        }];
        
        self.resumeLabel = [self addLabelWithTextColor:HWColor(153, 153, 153) andFont:15 andsView:self.fourthView];
        self.resumeLabel.text = @"收到简历";
        [self.resumeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.fourthView);
            make.centerY.equalTo(self.jobLabel);
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

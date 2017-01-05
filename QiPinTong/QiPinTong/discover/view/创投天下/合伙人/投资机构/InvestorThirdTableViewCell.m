//
//  InvestorThirdTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/16.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "InvestorThirdTableViewCell.h"

@implementation InvestorThirdTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.54)];
        view.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:view];
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.54-5)];
        vi.backgroundColor = [UIColor whiteColor];
        [view addSubview:vi];
        
        self.titleLabel = [self createLabelWithFont:14 andTextColor:HWColor(51, 51, 51) andSview:vi];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.top.equalTo(vi).with.offset(SCREEN_WIDTH*0.54/23);
        }];
        
        self.fieldLabel = [self createLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.fieldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.54/28);
        }];
        
        self.fiDetialLabel = [self createLabelWithFont:12 andTextColor:HWColor(51, 51, 51) andSview:vi];
        [self.fiDetialLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.fieldLabel);
            make.top.equalTo(self.fieldLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.54/30);
        }];
        
        self.stageLabel = [self createLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.stageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.fiDetialLabel);
            make.top.equalTo(self.fiDetialLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.54/30);
        }];
        
        self.stDetailLabel = [self createLabelWithFont:12 andTextColor:HWColor(51, 51, 51) andSview:vi];
        [self.stDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.stageLabel);
            make.top.equalTo(self.stageLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.54/30);
        }];
        
        self.amountLabel = [self createLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.stDetailLabel);
            make.top.equalTo(self.stDetailLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.54/30);
        }];
        
        self.amDetailLabel = [self createLabelWithFont:12 andTextColor:HWColor(51, 51, 51) andSview:vi];
        [self.amDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.amountLabel);
            make.top.equalTo(self.amountLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.54/30);
        }];
        
        self.addressLabel = [self createLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.amDetailLabel);
             make.top.equalTo(self.amDetailLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.54/30);
        }];
        
        self.addDetailLabel = [self createLabelWithFont:12 andTextColor:HWColor(51, 51, 51) andSview:vi];
        [self.addDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressLabel);
            make.top.equalTo(self.addressLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.54/30);
        }];
        
    }
    
    return self;
}

-(UILabel *)createLabelWithFont:(CGFloat)font andTextColor:(UIColor *)textColor andSview:(UIView *)sView{
    
    UILabel *lab = [UILabel new];
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = textColor;
    [sView addSubview:lab];
    
    return lab;
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

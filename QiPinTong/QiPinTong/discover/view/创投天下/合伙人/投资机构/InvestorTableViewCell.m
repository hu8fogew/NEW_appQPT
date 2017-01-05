//
//  InvestorTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/15.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "InvestorTableViewCell.h"

@implementation InvestorTableViewCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.3)];
        view.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:view];
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.3-5)];
        vi.backgroundColor = [UIColor whiteColor];
        [view addSubview:vi];
        
        self.nameLabel = [self createLabelWithFont:14 andTextColor:HWColor(51, 51, 51) andSview:vi];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.top.equalTo(vi).with.offset(10);
        }];
        
        self.imgView = [UIImageView new];
        [vi addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.top.equalTo(self.nameLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.3/10);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.14, SCREEN_WIDTH*0.14));
        }];
        
        self.titleLabel = [self createLabelWithFont:14 andTextColor:HWColor(51, 51, 51) andSview:vi];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(8);
            make.top.equalTo(self.imgView);
        }];
        
        self.vIcon = [UIImageView new];
        [vi addSubview:self.vIcon];
        [self.vIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right).with.offset(2);
            make.centerY.equalTo(self.titleLabel);
            make.size.mas_equalTo(CGSizeMake(13, 13));
        }];
        
        self.fieldLabel = [self createLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.fieldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.centerY.equalTo(self.imgView);
        }];
        
        self.numberLabel = [self createLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.imgView.mas_bottom);
            make.left.equalTo(self.fieldLabel);
        }];
        
        self.arrowIcon = [UIButton buttonWithType:UIButtonTypeCustom];
        [vi addSubview:self.arrowIcon];
        [self.arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.fieldLabel);
            make.right.equalTo(vi).with.offset(-10);
            make.size.mas_equalTo(CGSizeMake(15, 15));
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

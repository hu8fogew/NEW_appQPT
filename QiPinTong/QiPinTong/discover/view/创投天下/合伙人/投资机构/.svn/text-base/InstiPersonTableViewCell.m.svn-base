//
//  InstiPersonTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/14.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "InstiPersonTableViewCell.h"

@implementation InstiPersonTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.22)];
        view.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:view];
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.22-1)];
        vi.backgroundColor = [UIColor whiteColor];
        [view addSubview:vi];
        
        self.imgView = [UIImageView new];
        [vi addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(vi);
            make.left.equalTo(vi).with.offset(10);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.14, SCREEN_WIDTH*0.14));
        }];
        
        self.nameLabel = [self createLabelWithFont:14 andTextColor:HWColor(51, 51, 51) andSview:vi];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(10);
            make.top.equalTo(self.imgView);
        }];
        
        self.vIcon = [UIImageView new];
        [vi addSubview:self.vIcon];
        [self.vIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_right).with.offset(2);
            make.centerY.equalTo(self.nameLabel);
            make.size.mas_equalTo(CGSizeMake(14, 14));
        }];
        
        self.fieldLabel = [self createLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.fieldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.top.equalTo(self.nameLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.14/12);
        }];
        
        self.stageLabel = [self createLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.stageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.bottom.equalTo(self.imgView.mas_bottom);
        }];
        
        self.titleLabel = [self createLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(vi).with.offset(-10);
            make.centerY.equalTo(self.nameLabel);
        }];
        
        self.fundLabel = [self createLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.fundLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.titleLabel.mas_left).with.offset(-2);
            make.centerY.equalTo(self.titleLabel);
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

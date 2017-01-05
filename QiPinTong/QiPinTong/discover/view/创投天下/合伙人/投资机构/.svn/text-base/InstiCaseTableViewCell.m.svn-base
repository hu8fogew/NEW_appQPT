//
//  InstiCaseTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/14.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "InstiCaseTableViewCell.h"

@implementation InstiCaseTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.14)];
        view.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:view];
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.14-1)];
        vi.backgroundColor = [UIColor whiteColor];
        [view addSubview:vi];
        
        self.dateLabel = [self createLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(10);
            make.top.equalTo(vi).with.offset(SCREEN_WIDTH*0.14/6);
        }];
        
        self.titleLabel = [self createLabelWithFont:14 andTextColor:HWColor(51, 51, 51) andSview:vi];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.dateLabel.mas_right).with.offset(10);
            make.centerY.equalTo(self.dateLabel);
        }];
        
        self.subLabel = [self createLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.dateLabel);
            make.top.equalTo(self.dateLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.14/8);
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

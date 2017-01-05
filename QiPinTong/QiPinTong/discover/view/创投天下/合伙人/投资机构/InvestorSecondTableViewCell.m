//
//  InvestorSecondTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/15.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "InvestorSecondTableViewCell.h"

@implementation InvestorSecondTableViewCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame: frame];
    if (self) {
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.23)];
        view.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:view];
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.23-5)];
        vi.backgroundColor = [UIColor whiteColor];
        [view addSubview:vi];
        
        self.titleLabel = [self createLabelWithFont:14 andTextColor:HWColor(51, 51, 51) andSview:vi];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.top.equalTo(vi).with.offset(10);
        }];
        
        self.detailLabel = [self createLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        self.detailLabel.numberOfLines = 0;
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
            make.right.and.bottom.equalTo(vi).with.offset(-10);
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

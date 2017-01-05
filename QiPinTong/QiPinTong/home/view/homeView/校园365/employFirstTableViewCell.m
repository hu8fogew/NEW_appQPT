//
//  employFirstTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/11/30.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "employFirstTableViewCell.h"

@implementation employFirstTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textColor = HWColor(51, 51, 51);
        [view addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view).with.offset(15);
            make.centerY.equalTo(view);
        }];
        
        self.detailLabel = [UILabel new];
        self.detailLabel.font = [UIFont systemFontOfSize:14];
        self.detailLabel.textColor = HWColor(153, 153, 153);
        [view addSubview:self.detailLabel];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right).with.offset(20);
            make.centerY.equalTo(self.titleLabel);
            
        }];
        
    }
    return self;
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

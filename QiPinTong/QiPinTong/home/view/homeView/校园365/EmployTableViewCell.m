//
//  EmployTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/11/28.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "EmployTableViewCell.h"

@implementation EmployTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 130)];
        view.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:view];
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        vi.backgroundColor = [UIColor whiteColor];
        [view addSubview:vi];
        
        self.imgView = [UIImageView new];
        self.imgView.image = [UIImage imageNamed:@"imageZP"];
        [vi addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(vi);
            make.left.equalTo(vi).with.offset(15);
            make.size.mas_equalTo(CGSizeMake(120, 80));
        }];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textColor = HWColor(51, 51, 51);
        [vi addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgView.mas_top);
            make.left.equalTo(self.imgView.mas_right).with.offset(10);
        }];
        
        self.timeLabel = [UILabel new];
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.timeLabel];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(15);
        }];
        
        self.addressLabel = [UILabel new];
        self.addressLabel.font = [UIFont systemFontOfSize:12];
        self.addressLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.addressLabel];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.timeLabel);
            make.top.equalTo(self.timeLabel.mas_bottom).with.offset(15);
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

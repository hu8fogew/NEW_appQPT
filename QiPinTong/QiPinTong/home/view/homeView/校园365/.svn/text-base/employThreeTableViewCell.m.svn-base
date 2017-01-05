//
//  employThreeTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/11/30.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "employThreeTableViewCell.h"

@implementation employThreeTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 130)];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        
        self.contactLabel = [UILabel new];
        self.contactLabel.font = [UIFont systemFontOfSize:15];
        self.contactLabel.textColor = HWColor(51, 51, 51);
        [view addSubview:self.contactLabel];
        [self.contactLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view).with.offset(15);
            make.top.equalTo(view).with.offset(20);
        }];
        
        self.phoneIcon = [UIImageView new];
        self.phoneIcon.image = [UIImage imageNamed:@"座机"];
        [view addSubview:self.phoneIcon];
        [self.phoneIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contactLabel);
            make.top.equalTo(self.contactLabel.mas_bottom).with.offset(10);
            make.size.mas_equalTo(CGSizeMake(18, 18));
        }];
        
        NSArray *arr = @[@"62890932",@"62738981",@"62742319",@"62842018"];
        for (int i = 0; i<arr.count; i++) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(33+5+i*(SCREEN_WIDTH/5),50, SCREEN_WIDTH/5+20, 15)];
            label.font = [UIFont systemFontOfSize:14];
            label.textColor = HWColor(153, 153, 153);
            label.text = arr[i];
            [view addSubview:label];
        }
        
        self.addressIcon = [UIImageView new];
        self.addressIcon.image = [UIImage imageNamed:@"qpt_map_image"];
        [view addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.phoneIcon);
            make.top.equalTo(self.phoneIcon.mas_bottom).with.offset(10);
            make.size.mas_equalTo(CGSizeMake(16, 18));
        }];
        
        self.addressLabel = [UILabel new];
        self.addressLabel.font = [UIFont systemFontOfSize:14];
        self.addressLabel.textColor = HWColor(153, 153, 153);
        [view addSubview:self.addressLabel];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(5);
            make.centerY.equalTo(self.addressIcon);
        }];
        
        self.naviLabel = [UILabel new];
        self.naviLabel.font = [UIFont systemFontOfSize:14];
        self.naviLabel.textColor = HWColor(153, 153, 153);
        self.naviLabel.text = @"导航";
        [view addSubview:self.naviLabel];
        [self.naviLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(view).with.offset(-10);
            make.centerY.equalTo(self.addressLabel);
        }];
        
        self.naviIcon = [UIImageView new];
        self.naviIcon.image = [UIImage imageNamed:@"导航"];
        [view addSubview:self.naviIcon];
        [self.naviIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.naviLabel.mas_left).with.offset(-5);
            make.centerY.equalTo(self.naviLabel);
            make.size.mas_equalTo(CGSizeMake(18, 18));
            make.left.greaterThanOrEqualTo(self.addressLabel.mas_right).priority(5);
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

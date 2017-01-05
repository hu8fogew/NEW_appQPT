//
//  DiscoverTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/1/4.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "DiscoverTableViewCell.h"

@implementation DiscoverTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        vi.backgroundColor = [UIColor whiteColor];
        [self addSubview:vi];
        
        self.icon = [UIImageView new];
        [vi addSubview:self.icon];
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(15);
            make.centerY.equalTo(vi);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        
        self.title = [UILabel new];
        self.title.textColor = HWColor(51, 51, 51);
        self.title.font = [UIFont systemFontOfSize:16];
        [vi addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.icon.mas_right).with.offset(10);
            make.centerY.equalTo(vi);
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

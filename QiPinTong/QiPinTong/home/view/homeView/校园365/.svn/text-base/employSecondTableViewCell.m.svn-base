//
//  employSecondTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/11/30.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "employSecondTableViewCell.h"

@implementation employSecondTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        view.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:view];
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 180)];
        vi.backgroundColor = [UIColor whiteColor];
        [view addSubview:vi];
        self.titleLabel = [UILabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textColor = HWColor(51, 51, 51);
        [vi addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(15);
            make.top.equalTo(vi).with.offset(20);
        }];
        
        self.detailLabel = [UILabel new];
        self.detailLabel.font = [UIFont systemFontOfSize:14];
        self.detailLabel.textColor = HWColor(153, 153, 153);
        self.detailLabel.numberOfLines = 0;
        [vi addSubview:self.detailLabel];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.titleLabel).with.offset(10);
            make.right.equalTo(vi).with.offset(15);
            make.bottom.greaterThanOrEqualTo(vi).with.offset(20);
            
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

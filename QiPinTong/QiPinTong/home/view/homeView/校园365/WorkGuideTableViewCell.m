//
//  WorkGuideTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/11/28.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "WorkGuideTableViewCell.h"

@implementation WorkGuideTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 128)];
        view.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:view];
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        vi.backgroundColor = [UIColor whiteColor];
        [view addSubview:vi];
        
        self.imgView = [UIImageView new];
        self.imgView.image = [UIImage imageNamed:@"image365"];
        [vi addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(view);
            make.right.equalTo(vi).with.offset(-10);
            make.size.mas_equalTo(CGSizeMake(120, 80));
        }];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textColor = HWColor(51, 51, 51);
        self.titleLabel.numberOfLines = 0;
        [vi addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view).with.offset(10);
            make.top.equalTo(self.imgView.mas_top);
            make.right.equalTo(self.imgView.mas_left).with.offset(-10);
        }];
        
        self.classLabel = [UILabel new];
        self.classLabel.font = [UIFont systemFontOfSize:12];
        self.classLabel.textColor = HWColor(61, 158, 226);
        [vi addSubview:self.classLabel];
        [self.classLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.imgView.mas_bottom);
            make.left.equalTo(self.titleLabel.mas_left);
        }];
        
        self.noLabel = [UILabel new];
        self.noLabel.font = [UIFont systemFontOfSize:12];
        self.noLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.noLabel];
        [self.noLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.classLabel.mas_right).with.offset(15);
            make.centerY.equalTo(self.classLabel);
        }];
        
        self.fromLabel = [UILabel new];
        self.fromLabel.font = [UIFont systemFontOfSize:12];
        self.fromLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.fromLabel];
        [self.fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.noLabel.mas_right).with.offset(15);
            make.centerY.equalTo(self.classLabel);
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

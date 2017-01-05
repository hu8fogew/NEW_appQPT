//
//  YSYKDetailView.m
//  家长界
//
//  Created by taylor on 2016/12/5.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YSYKDetailView.h"

@implementation YSYKDetailView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *vi1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.11)];
        vi1.backgroundColor = [UIColor whiteColor];
        [self addSubview:vi1];
        
        UIView *vi2 = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH*0.11+1, SCREEN_WIDTH, SCREEN_WIDTH*0.4)];
        vi2.backgroundColor = [UIColor whiteColor];
        [self addSubview:vi2];
        
        self.moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.moreBtn setTitle:@"查看全部" forState:UIControlStateNormal];
        [self.moreBtn setImage:[UIImage imageNamed:@"rightImage"] forState:UIControlStateNormal];
        self.moreBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        self.moreBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 20);
        self.moreBtn.imageEdgeInsets = UIEdgeInsetsMake(2, 60, 2, -60);
        [self.moreBtn setTitleColor:HWColor(153, 153, 153) forState:UIControlStateNormal];
        [vi1 addSubview:self.moreBtn];
        [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(vi1).with.offset(-10);
            make.centerY.equalTo(vi1);
        }];
        
        self.commentLabel = [UILabel new];
        self.commentLabel.font = [UIFont systemFontOfSize:15];
        self.commentLabel.textColor = HWColor(51, 51, 51);
        [vi1 addSubview:self.commentLabel];
        [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi1).with.offset(10);
            make.centerY.equalTo(self.moreBtn);
        }];
        
        self.imgView = [UIImageView new];
        self.imgView.layer.masksToBounds = YES;
        self.imgView.layer.cornerRadius = SCREEN_WIDTH*0.11/2;
        [vi2 addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi2).with.offset(10);
            make.top.equalTo(vi2).with.offset(15);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.11, SCREEN_WIDTH*0.11));
        }];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        self.titleLabel.textColor = HWColor(153, 153, 153);
        [vi2 addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(8);
            make.top.equalTo(self.imgView);
        }];
        
        self.timeLabel = [UILabel new];
        self.timeLabel.font = [UIFont systemFontOfSize:13];
        self.timeLabel.textColor = HWColor(153, 153, 153);
        [vi2 addSubview:self.timeLabel];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.bottom.mas_equalTo(self.imgView.mas_bottom);
        }];
        
        self.detailLabel = [UILabel new];
        self.detailLabel.font = [UIFont systemFontOfSize:13];
        self.detailLabel.numberOfLines = 0;
        self.detailLabel.textColor = HWColor(153, 153, 153);
        [vi2 addSubview:self.detailLabel];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView);
            make.right.and.bottom.equalTo(vi2).with.offset(-10);
            make.top.equalTo(self.imgView.mas_bottom).with.offset(10);
        }];
    }
    return self;
}


@end

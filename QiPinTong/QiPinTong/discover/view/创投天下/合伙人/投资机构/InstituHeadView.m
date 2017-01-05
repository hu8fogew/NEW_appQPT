//
//  InstituHeadView.m
//  家长界
//
//  Created by taylor on 2016/12/14.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "InstituHeadView.h"

@implementation InstituHeadView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.46)];
        vi.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:vi];
       
        self.backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.46-10)];
        [vi addSubview:self.backImageView];
        
        self.imgView = [UIImageView new];
        self.imgView.layer.masksToBounds = YES;
        self.imgView.layer.cornerRadius = SCREEN_WIDTH*0.17/2;
        [vi addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(vi).with.offset(SCREEN_WIDTH*0.17/5);
            make.centerX.equalTo(vi);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.17, SCREEN_WIDTH*0.17));
        }];
        
        self.titleLabel = [self createLabelWithFont:15 andTextColor:[UIColor whiteColor] andSview:vi];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgView.mas_bottom).with.offset(SCREEN_WIDTH*0.17/6);
            make.centerX.equalTo(self.imgView);
        }];
        
        self.subLabel = [self createLabelWithFont:13 andTextColor:[UIColor whiteColor] andSview:vi];
        [self.subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.imgView);
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.17/7);
        }];
        
        self.addressIcon = [UIImageView new];
        [vi addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(vi);
            make.top.equalTo(self.subLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.17/7);
            make.size.mas_equalTo(CGSizeMake(12, 13));
        }];
        
        self.addressLabel = [self createLabelWithFont:12 andTextColor:[UIColor whiteColor] andSview:vi];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.addressIcon);
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


@end

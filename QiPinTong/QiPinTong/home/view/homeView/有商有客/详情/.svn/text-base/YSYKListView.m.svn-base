//
//  YSYKListView.m
//  家长界
//
//  Created by taylor on 2016/12/5.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YSYKListView.h"

@implementation YSYKListView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.46-10)];
        vi.backgroundColor = [UIColor whiteColor];
        [self addSubview:vi];
        
        self.addressIcon = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.addressIcon setImage:[UIImage imageNamed:@"qpt_map_image"] forState:UIControlStateNormal];
        [vi addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(15);
            make.top.equalTo(vi).with.offset(vi.height/9);
            make.size.mas_equalTo(CGSizeMake(15, 16));
        }];
        
        self.addressLabel = [UILabel new];
        self.addressLabel.font = [UIFont systemFontOfSize:15];
        self.addressLabel.numberOfLines = 0;
        self.addressLabel.textColor = HWColor(153, 153,153);
        [vi addSubview:self.addressLabel];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(5);
            make.centerY.equalTo(self.addressIcon);
            make.width.mas_equalTo(SCREEN_WIDTH*0.7);
        }];
        
        self.naviLabel = [UILabel new];
        self.naviLabel.text = @"导航";
        self.naviLabel.textColor = HWColor(153, 153, 153);
        self.naviLabel.font = [UIFont systemFontOfSize:15];
        [vi addSubview:self.naviLabel];
        [self.naviLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(vi).with.offset(-15);
            make.centerY.equalTo(self.addressIcon);
        }];
        
        self.naviIcon = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.naviIcon setImage:[UIImage imageNamed:@"导航"] forState:UIControlStateNormal];
        [vi addSubview:self.naviIcon];
        [self.naviIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.naviLabel.mas_left).with.offset(-3);
            make.centerY.equalTo(self.naviLabel);
            make.size.mas_equalTo(CGSizeMake(16, 20));
        }];
        
        UIView *vView = [UIView new];
        vView.backgroundColor = HWColor(241, 241, 241);
        [vi addSubview:vView];
        [vView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.naviIcon.mas_left).with.offset(-10);
            make.centerY.equalTo(self.naviIcon);
            make.size.mas_equalTo(CGSizeMake(1, vi.height/3-30));
            
        }];
        
        UIView *hView1 = [UIView new];
        hView1.backgroundColor = HWColor(241, 241, 241);
        [vi addSubview:hView1];
        [hView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(vi).with.offset(vi.height/3-1);
            make.left.equalTo(vi);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 1));
        }];
        
        self.phoneIcon = [UIImageView new];
        self.phoneIcon.image = [UIImage imageNamed:@"座机"];
        [vi addSubview:self.phoneIcon];
        [self.phoneIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon);
            make.top.equalTo(vi).with.offset(vi.height/9*4);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
        self.phoneNoLabel = [UILabel new];
        self.phoneNoLabel.textColor = HWColor(153, 153, 153);
        self.phoneNoLabel.font = [UIFont systemFontOfSize:15];
        [vi addSubview:self.phoneNoLabel];
        [self.phoneNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.phoneIcon.mas_right).with.offset(5);
            make.centerY.equalTo(self.phoneIcon);
        }];
        
        UIView *hView2 = [UIView new];
        hView2.backgroundColor = HWColor(241, 241, 241);
        [vi addSubview:hView2];
        [hView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(vi).with.offset(vi.height/3*2-1);
            make.left.equalTo(vi);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 1));
        }];
        
        self.homeIcon = [UIImageView new];
        self.homeIcon.image = [UIImage imageNamed:@"home_normal"];
        [vi addSubview:self.homeIcon];
        [self.homeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(vi).with.offset(vi.height/9*7);
            make.left.equalTo(self.phoneIcon);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
        self.urlLabel = [UILabel new];
        self.urlLabel.font = [UIFont systemFontOfSize:15];
        self.urlLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.urlLabel];
        [self.urlLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.homeIcon.mas_right).with.offset(5);
            make.centerY.equalTo(self.homeIcon);
        }];
    
    }
    return self;
}


@end

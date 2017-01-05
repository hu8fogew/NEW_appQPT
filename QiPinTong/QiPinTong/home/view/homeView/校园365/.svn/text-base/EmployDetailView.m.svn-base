//
//  EmployDetailView.m
//  家长界
//
//  Created by taylor on 2016/11/30.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "EmployDetailView.h"

@implementation EmployDetailView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.65+10)];
        view.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:view];
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.23)];
        vi.backgroundColor = [UIColor whiteColor];
        [view addSubview:vi];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        self.titleLabel.textColor = HWColor(51, 51, 51);
        [vi addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(15);
            make.top.equalTo(vi).with.offset(20);
        }];
        
        self.shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.shareBtn setImage:[UIImage imageNamed:@"relaynomal"] forState:UIControlStateNormal];
        [self.shareBtn addTarget:self action:@selector(clickShareBtn) forControlEvents:UIControlEventTouchUpInside];
        [vi addSubview:self.shareBtn];
        [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(vi).with.offset(-12);
            make.centerY.equalTo(self.titleLabel);
            make.size.mas_equalTo(CGSizeMake(20, 22));
        }];
        
        self.saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.saveBtn setImage:[UIImage imageNamed:@"shoucangnomal"] forState:UIControlStateNormal];
        [self.saveBtn addTarget:self action:@selector(clickSaveBtn) forControlEvents:UIControlEventTouchUpInside];
        [vi addSubview:self.saveBtn];
        [self.saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.shareBtn.mas_left).with.offset(-8);
        make.centerY.equalTo(self.titleLabel);
        make.size.mas_equalTo(CGSizeMake(22, 22));
            
        }];
        
        self.addressLabel = [UILabel new];
        self.addressLabel.font = [UIFont systemFontOfSize:14];
        self.addressLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.addressLabel];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
        }];
        
        self.timeLabel = [UILabel new];
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        self.timeLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.timeLabel];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressLabel.mas_right).with.offset(20);
            make.centerY.equalTo(self.addressLabel);
        }];
        
        UIView *vii = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH*0.23, SCREEN_WIDTH, SCREEN_WIDTH*0.42)];
        vii.backgroundColor = [UIColor whiteColor];
        [view addSubview:vii];
        
        self.imgView = [UIImageView new];
        [vii addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(vii).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    return self;
}

-(void)clickSaveBtn{
    
}

-(void)clickShareBtn{
    
}
@end

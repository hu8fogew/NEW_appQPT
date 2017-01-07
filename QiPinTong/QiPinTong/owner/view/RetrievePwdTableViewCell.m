//
//  RetrievePwdTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "RetrievePwdTableViewCell.h"

@implementation RetrievePwdTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_HEIGHT/7-49-64)];
        vi.backgroundColor = [UIColor whiteColor];
        [self addSubview:vi];
        
        //标题label
        self.titleLabel = [self addLabelWithTextColor:HWColor(51, 51, 51) andFont:21 andsView:vi];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(vi);
            make.top.equalTo(vi).with.offset(SCREEN_WIDTH*0.13);
        }];
        
        //手机号
        self.phoneLabel = [self addLabelWithTextColor:HWColor(51, 51, 51) andFont: 16 andsView:vi];
        [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(30);
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.13);
        }];
        
        //手机号输入
        self.phoneField = [UITextField new];
        self.phoneField.textColor = HWColor(153, 153, 153);
        self.phoneField.font = [UIFont systemFontOfSize:16];
        self.phoneField.keyboardType = UIKeyboardTypeEmailAddress;
        [vi addSubview:self.phoneField];
        [self.phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.phoneLabel);
            make.left.equalTo(self.phoneLabel.mas_right).with.offset(20);
            make.width.mas_equalTo(SCREEN_WIDTH*0.6);
        }];
        
        //第一条横线
        UIView *firstView = [[UIView alloc]init];
        firstView.backgroundColor = HWColor(241, 241, 241);
        [vi addSubview:firstView];
        [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(1);
            make.top.equalTo(self.phoneLabel.mas_bottom).with.offset(15);
            make.left.equalTo(vi).with.offset(10);
            make.right.equalTo(vi).with.offset(-10);
            
        }];
        
        //验证码
        self.commitLabel = [self addLabelWithTextColor:HWColor(51, 51, 51) andFont:16 andsView:vi];
        [self.commitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(firstView.mas_bottom).with.offset(15);
            make.left.equalTo(self.phoneLabel);
            
        }];
        
        //验证码输入
        self.commitField = [[UITextField alloc]init];
        self.commitField.font = [UIFont systemFontOfSize:16];
        self.commitField.secureTextEntry = YES;
        [vi addSubview:self.commitField];
        [self.commitField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.commitLabel);
            make.left.equalTo(self.commitLabel.mas_right).with.offset(20);
        }];
        
        self.commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.commitBtn.backgroundColor = [UIColor darkGrayColor];
        self.commitBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        self.commitBtn.layer.cornerRadius = 4;
        [self.commitBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self.commitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [vi addSubview:self.commitBtn];
        [self.commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.commitLabel);
                make.right.equalTo(vi).with.offset(-10);
            make.size.mas_equalTo(CGSizeMake(70, 25));
            }];
        
        //第二条横线
        UIView *secondView = [[UIView alloc]init];
        secondView.backgroundColor = HWColor(241, 241, 241);
        [vi addSubview:secondView];
        [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(1);
            make.top.equalTo(self.commitLabel.mas_bottom).with.offset(15);
            make.left.equalTo(vi).with.offset(10);
            make.right.equalTo(vi).with.offset(-10);
            
        }];
        
        //登录按钮
        self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.nextBtn.layer.cornerRadius = 5;
        [self.nextBtn setBackgroundColor:HWColor(10, 157, 225)];
        [self.nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        self.nextBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [vi addSubview:self.nextBtn];
        [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(15);
            make.right.equalTo(vi).with.offset(-15);
            make.top.equalTo(secondView.mas_bottom).with.offset(25);
            make.height.mas_equalTo(45);
        }];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
        //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
        tapGestureRecognizer.cancelsTouchesInView = NO;
        //将触摸事件添加到view上
        [self addGestureRecognizer:tapGestureRecognizer];
        
    }
    return self;
}


-(UILabel *)addLabelWithTextColor:(UIColor *)color andFont:(CGFloat)font andsView:(UIView *)sview
{
    UILabel *lab = [UILabel new];
    lab.textColor = color;
    lab.font = [UIFont systemFontOfSize:font];
    [sview addSubview:lab];
    
    return lab;
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.phoneField resignFirstResponder];
    [self.commitField resignFirstResponder];
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

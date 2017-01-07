//
//  RegisterTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "RegisterTableViewCell.h"

@implementation RegisterTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_HEIGHT/7-SCREEN_HEIGHT/6)];
        vi.backgroundColor = [UIColor whiteColor];
        [self addSubview:vi];
        
        self.titleLabel = [self addLabelWithTextColor:HWColor(51, 51, 51) andFont:21 andsView:vi];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(vi).with.offset(SCREEN_WIDTH*0.13);
                make.centerX.equalTo(vi);
            }];
        
        self.classLabel = [self addLabelWithTextColor:HWColor(51, 51, 51) andFont:16 andsView:vi];
            [self.classLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.12);
                make.left.equalTo(vi).with.offset(25);
            }];
        
        self.classBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.classBtn.titleLabel.font = [UIFont systemFontOfSize:16];
            [self.classBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.classBtn setTitle:@"请选择" forState:UIControlStateNormal];
            [vi addSubview:self.classBtn];
            [self.classBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.classLabel.mas_right).with.offset(50);
                make.centerY.equalTo(self.classLabel);
            }];
        
        UIView *firstView = [UIView new];
            firstView.backgroundColor = HWColor(241, 241, 241);
            [vi addSubview:firstView];
        
            [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.classLabel.mas_bottom).with.offset(15);
                make.left.equalTo(vi).with.offset(10);
                make.right.equalTo(vi).with.offset(-10);
                make.height.mas_equalTo(1);
            }];
        
        self.phoneLabel = [self addLabelWithTextColor:HWColor(51, 51, 51) andFont:16 andsView:vi];
        [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(firstView.mas_bottom).with.offset(15);
                make.left.equalTo(self.classLabel);
                
            }];
        
        self.phoneField = [UITextField new];
        self.phoneField.font = [UIFont systemFontOfSize:16];
        self.phoneField.textColor = HWColor(153, 153, 153);
        self.phoneField.keyboardType = UIKeyboardTypePhonePad;
        [vi addSubview:self.phoneField];
        [self.phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.phoneLabel.mas_right).with.offset(20);
            make.centerY.equalTo(self.phoneLabel);
            make.width.mas_equalTo(SCREEN_WIDTH*0.6);
            }];
        
        UIView *secondView = [UIView new];
        secondView.backgroundColor = HWColor(241, 241, 241);
        [vi addSubview:secondView];
        [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.phoneLabel.mas_bottom).with.offset(15);
            make.left.equalTo(vi).with.offset(10);
            make.right.equalTo(vi).with.offset(-10);
            make.height.mas_equalTo(1);
            }];
        
        self.commitLabel = [self addLabelWithTextColor:HWColor(51, 51, 51) andFont:16 andsView:vi];
        [self.commitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(secondView.mas_bottom).with.offset(15);
                make.left.equalTo(self.phoneLabel);
            }];
        
        self.commitField = [UITextField new];
        self.commitField.font = [UIFont systemFontOfSize:16];
        self.commitField.textColor = HWColor(153, 153, 153);
        self.commitField.keyboardType = UIKeyboardTypePhonePad;
        [vi addSubview:self.commitField];
        [self.commitField mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.commitLabel);
                make.left.equalTo(self.commitLabel.mas_right).with.offset(20);
            make.width.mas_equalTo(SCREEN_WIDTH*0.4);
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
                make.right.equalTo(vi).with.offset(-20);
                make.size.mas_equalTo(CGSizeMake(70, 25));
            }];
        
        UIView *thirdView = [UIView new];
            thirdView.backgroundColor = HWColor(241, 241, 241);
            [vi addSubview:thirdView];
            [thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.commitLabel.mas_bottom).with.offset(15);
                make.left.equalTo(vi).with.offset(10);
                make.right.equalTo(vi).with.offset(-10);
                make.height.mas_equalTo(1);
            }];
        
        self.pwdLabel = [self addLabelWithTextColor:HWColor(51, 51, 51) andFont:16 andsView:vi];
        [self.pwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(thirdView.mas_bottom).with.offset(15);
                make.left.equalTo(self.commitLabel);
            }];


        UITextField *pwdField = [UITextField new];
        pwdField.font = [UIFont systemFontOfSize:16];
        self.pwdField.textColor = HWColor(153, 153, 153);
        [vi addSubview:pwdField];
        [pwdField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.pwdLabel.mas_right).with.offset(20);
            make.centerY.equalTo(self.pwdLabel);
            make.width.mas_equalTo(SCREEN_WIDTH*0.6);
            
        }];
        
        UIView *fourthView = [UIView new];
        fourthView.backgroundColor = HWColor(241, 241, 241);
        [vi addSubview:fourthView];
        [fourthView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.pwdLabel.mas_bottom).with.offset(15);
                make.left.equalTo(vi).with.offset(10);
                make.right.equalTo(vi).with.offset(-10);
                make.height.mas_equalTo(1);
            }];

        self.resetLabel = [self addLabelWithTextColor:HWColor(51, 51, 51) andFont:16 andsView:vi];
        [self.resetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(fourthView.mas_bottom).with.offset(15);
                make.left.equalTo(self.pwdLabel);
            }];
        
        self.resetField = [UITextField new];
        self.resetField.font = [UIFont systemFontOfSize:16];
        self.resetField.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.resetField];
        [self.resetField mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.resetLabel.mas_right).with.offset(20);
                make.centerY.equalTo(self.resetLabel);
            make.width.mas_equalTo(SCREEN_WIDTH*0.6);
            
            }];
        
        UIView *fifthView = [UIView new];
        fifthView.backgroundColor = HWColor(241, 241, 241);
        [vi addSubview:fifthView];
        [fifthView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.resetLabel.mas_bottom).with.offset(15);
                make.left.equalTo(vi).with.offset(10);
                make.right.equalTo(vi).with.offset(10);
                make.height.mas_equalTo(1);
            }];
        
        self.registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.registerBtn.backgroundColor = HWColor(10, 157, 225);
        self.registerBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        self.registerBtn.layer.cornerRadius = 4;
        [self.registerBtn setTitle:@"注  册" forState:UIControlStateNormal];
        [self.registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [vi addSubview:self.registerBtn];
        [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(fifthView.mas_bottom).with.offset(15);
            make.right.equalTo(vi).with.offset(-20);
            make.left.equalTo(vi).with.offset(20);
            make.height.mas_equalTo(45);
            }];
            


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


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

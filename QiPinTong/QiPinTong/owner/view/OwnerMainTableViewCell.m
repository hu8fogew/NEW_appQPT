//
//  OwnerMainTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "OwnerMainTableViewCell.h"

@implementation OwnerMainTableViewCell

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
        
        //账号
        self.accoutLabel = [self addLabelWithTextColor:HWColor(51, 51, 51) andFont: 16 andsView:vi];
        [self.accoutLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.titleLabel.mas_left).with.offset(-10);
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.13);
        }];
        
        //账号输入
        self.accoutField = [UITextField new];
        self.accoutField.textColor = HWColor(153, 153, 153);
        self.accoutField.font = [UIFont systemFontOfSize:16];
        self.accoutField.keyboardType = UIKeyboardTypeEmailAddress;
        [vi addSubview:self.accoutField];
        [self.accoutField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.accoutLabel);
            make.left.equalTo(self.accoutLabel.mas_right).with.offset(20);
            make.width.mas_equalTo(SCREEN_WIDTH*0.6);
        }];
        
         //第一条横线
        UIView *firstView = [[UIView alloc]init];
        firstView.backgroundColor = HWColor(241, 241, 241);
        [vi addSubview:firstView];
        [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(1);
            make.top.equalTo(self.accoutLabel.mas_bottom).with.offset(15);
            make.left.equalTo(vi).with.offset(10);
            make.right.equalTo(vi).with.offset(-10);
                
            }];
        
            //密码
            self.pwdLabel = [self addLabelWithTextColor:HWColor(51, 51, 51) andFont:16 andsView:vi];
            [self.pwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(firstView.mas_bottom).with.offset(15);
                make.centerX.equalTo(self.accoutLabel);
                
            }];
        
           //密码输入
            self.pwdField = [[UITextField alloc]init];
            self.pwdField.font = [UIFont systemFontOfSize:16];
            self.pwdField.secureTextEntry = YES;
            [vi addSubview:self.pwdField];
            [self.pwdField mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.pwdLabel);
                make.left.equalTo(self.pwdLabel.mas_right).with.offset(20);
                make.width.mas_equalTo(SCREEN_WIDTH*0.6);
            }];
        
           //第二条横线
            UIView *secondView = [[UIView alloc]init];
            secondView.backgroundColor = HWColor(241, 241, 241);
            [vi addSubview:secondView];
            [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(1);
                make.top.equalTo(self.pwdLabel.mas_bottom).with.offset(15);
                make.left.equalTo(vi).with.offset(10);
                make.right.equalTo(vi).with.offset(-10);
                
            }];
        
           //登录按钮
            self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            self.loginBtn.layer.cornerRadius = 5;
            [self.loginBtn setBackgroundColor:HWColor(10, 157, 225)];
            [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.loginBtn setTitle:@"登     录" forState:UIControlStateNormal];
            self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
            [vi addSubview:self.loginBtn];
            [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(vi).with.offset(15);
                make.right.equalTo(vi).with.offset(-15);
                make.top.equalTo(secondView.mas_bottom).with.offset(25);
                make.height.mas_equalTo(45);
            }];
        
          UIView *vieww = [UIView new];
          vieww.backgroundColor = [UIColor clearColor];
         [vi addSubview:vieww];
         [vieww mas_makeConstraints:^(MASConstraintMaker *make) {
             make.centerX.equalTo(vi);
             make.top.equalTo(self.loginBtn.mas_bottom);
             make.size.mas_equalTo(CGSizeMake(1, 10));
         }];
        
            //找回密码
            self.retrievePwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.retrievePwdBtn setTitle:@"找回密码" forState:UIControlStateNormal];
            [self.retrievePwdBtn setTitleColor:HWColor(91, 85, 132) forState:UIControlStateNormal];
            [self.retrievePwdBtn setBackgroundColor:[UIColor clearColor]];
            self.retrievePwdBtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [vi addSubview:self.retrievePwdBtn];
            [self.retrievePwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.loginBtn.mas_bottom).with.offset(15);
                make.right.equalTo(vieww.mas_left).with.offset(-10);
            }];
        
            //用户注册
            self.registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.registerBtn setTitle:@"用户注册" forState:UIControlStateNormal];
            [self.registerBtn setTitleColor:HWColor(91, 85, 132) forState:UIControlStateNormal];
            self.registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [self.registerBtn setBackgroundColor:[UIColor clearColor]];
            [vi addSubview:self.registerBtn];
            [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.loginBtn.mas_bottom).with.offset(15);
                make.left.equalTo(vieww.mas_right).with.offset(10);
                
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
    [self.accoutField resignFirstResponder];
    [self.pwdField resignFirstResponder];
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

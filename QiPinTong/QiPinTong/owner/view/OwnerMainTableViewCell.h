//
//  OwnerMainTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OwnerMainTableViewCell : UITableViewCell

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *accoutLabel;
@property (strong,nonatomic) UITextField *accoutField;

@property (strong,nonatomic) UILabel *pwdLabel;
@property (strong,nonatomic) UITextField *pwdField;

@property (strong,nonatomic) UIButton *loginBtn;

@property (strong,nonatomic) UIButton *retrievePwdBtn;
@property (strong,nonatomic) UIButton *registerBtn;

@end

//
//  RegisterTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterTableViewCell : UITableViewCell

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *classLabel;
@property (strong,nonatomic) UIButton *classBtn;

@property (strong,nonatomic) UILabel *phoneLabel;
@property (strong,nonatomic) UITextField *phoneField;

@property (strong,nonatomic) UILabel *commitLabel;
@property (strong,nonatomic) UITextField *commitField;
@property (strong,nonatomic) UIButton *commitBtn;

@property (strong,nonatomic) UILabel *pwdLabel;
@property (strong,nonatomic) UITextField *pwdField;

@property (strong,nonatomic) UILabel *resetLabel;
@property (strong,nonatomic) UITextField *resetField;

@property (strong,nonatomic) UIButton *registerBtn;

@end

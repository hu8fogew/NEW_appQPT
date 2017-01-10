//
//  SendLifeController.h
//  家长界
//
//  Created by mac on 2016/12/29.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LQPhotoPickerViewController.h"

@interface SendLifeController :LQPhotoPickerViewController

@property(nonatomic,copy)NSString *editingType;

@property(nonatomic,strong) UIView *noteTextBackgroudView;
//备注
@property(nonatomic,strong) UITextView *noteTextView;

//文字个数提示label
@property(nonatomic,strong) UILabel *textNumberLabel;

//文字说明
@property(nonatomic,strong) UILabel *explainLabel;

//提交按钮
@property(nonatomic,strong) UIButton *submitBtn;


@end

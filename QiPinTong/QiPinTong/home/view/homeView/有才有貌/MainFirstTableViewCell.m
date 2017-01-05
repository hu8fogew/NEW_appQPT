//
//  MainFirstTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "MainFirstTableViewCell.h"

@interface MainFirstTableViewCell()

@property(nonatomic,strong)LWAsyncDisplayView *asycView;
@property(nonatomic,strong)UIButton *chectButton;
@end


@implementation MainFirstTableViewCell

/*

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.26);
        self.backgroundColor = HWColor(241, 241, 241);
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.26-10)];
        vi.backgroundColor = [UIColor whiteColor];
        [self addSubview:vi];
        
        self.titleLabel = [self addLabelWithFont:14 andTextColor:HWColor(51, 51, 51) andSview:vi];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(10);
            make.top.equalTo(vi).with.offset(vi.height/6);
        }];
        
        self.subLabel = [self addLabelWithFont:12 andTextColor:HWColor(253, 155, 54) andSview:vi];
        [self.subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right).with.offset(3);
            make.centerY.equalTo(self.titleLabel);
        }];
        
        self.phoneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.phoneBtn setTitle:@"查看电话" forState:UIControlStateNormal];
        [self.phoneBtn  setTitleColor:HWColor(80, 188, 229) forState:UIControlStateNormal];
        self.phoneBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [vi addSubview:self.phoneBtn];
        [self.phoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(vi).with.offset(-10);
            make.centerY.equalTo(self.titleLabel);
        }];
        
        self.addressIcon = [UIImageView new];
        [vi addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(vi.height/8);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
        
        self.addressLabel = [self addLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.addressIcon);
        }];
        
        self.ageIcon = [UIImageView new];
        [vi addSubview:self.ageIcon];
        [self.ageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressLabel.mas_right).with.offset(15);
            make.centerY.equalTo(self.addressLabel);
            make.size.mas_equalTo(CGSizeMake(11, 11));
        }];
        
        self.ageLabel = [self addLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ageIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.ageIcon);
        }];
        
        self.eduIcon = [UIImageView new];
        [vi addSubview:self.eduIcon];
        [self.eduIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ageLabel.mas_right).with.offset(15);
            make.centerY.equalTo(self.ageLabel);
            make.size.mas_equalTo(CGSizeMake(12, 14));

        }];
        
        self.eduLabel = [self addLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.eduLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.eduIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.eduIcon);
        }];
        
        self.detailLabel = [self addLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.addressIcon.mas_bottom).with.offset(vi.height/8);
        }];
        
        self.statusLabel = [self addLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.detailLabel.mas_right).with.offset(10);
            make.centerY.equalTo(self.detailLabel);
        }];
    }
    return self;
}

-(UILabel *)addLabelWithFont:(CGFloat)font andTextColor:(UIColor *)color andSview:(UIView *)sView{
    UILabel *lab = [UILabel new];
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = color;
    [sView addSubview:lab];
    
    return lab;
}
*/


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.asycView];
        [self.contentView addSubview:self.chectButton];
    }
    return self;
}

-(void)layoutSubviews
{
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.perDescLayout.descViewHeight);
    //主线程runloop空闲时执行
    LWTransaction* layerAsyncTransaction = self.layer.lw_asyncTransaction;
    [layerAsyncTransaction
     addAsyncOperationWithTarget:self
     selector:@selector(_layouSubViews)
     object:nil
     completion:^(BOOL canceled) {}];
}

- (void)_layouSubViews {
   
    self.chectButton.frame = self.perDescLayout.chectButton;
    
}

-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        
        _asycView.backgroundColor = [UIColor whiteColor];
    }
    return _asycView;
}


-(PersonalLayout *)perDescLayout
{
    if (!_perDescLayout) {
        _perDescLayout = [[PersonalLayout alloc]initPersonalOfWorkKind];
        
        self.asycView.layout = self.perDescLayout;
    }
    return _perDescLayout;
}

-(UIButton *)chectButton
{
    if (!_chectButton) {
        _chectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _chectButton.titleLabel.textAlignment = NSTextAlignmentRight;
        _chectButton.backgroundColor = [UIColor whiteColor];
        [_chectButton setTitle:@"查看电话" forState:UIControlStateNormal];
        [_chectButton setTitleColor:HWColor(120, 179, 226) forState:UIControlStateNormal];
        _chectButton.titleLabel.font = [UIFont systemFontOfSize:mainTitleSize-1];
        [_chectButton addTarget:self action:@selector(clickChectBtn:) forControlEvents:UIControlEventTouchUpInside];
        _chectButton.frame = CGRectZero;
    }
    return _chectButton;
}

-(void)clickChectBtn:(UIButton *)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(onChectOutInCell:)]) {
        [_delegate onChectOutInCell:self];
    }
    
    HWLog(@"查看电话");
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

//
//  PersonalCell.m
//  QiPinTong
//
//  Created by mac on 2017/1/10.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PersonalCell.h"
@interface PersonalCell()
@property(nonatomic,strong)LWAsyncDisplayView *asycView;
@end


@implementation PersonalCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = HWColor(244, 244, 244);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.asycView];
    }
    return self;
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.ownLayout.ownMessageHeight);
}


-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        _asycView.backgroundColor = HWColor(244, 244, 244);
    }
    return _asycView;
}


-(MessageLayout *)ownLayout
{
    if (!_ownLayout) {
        _ownLayout = [[MessageLayout alloc]initOwnMessageCell];
        
        self.asycView.layout = self.ownLayout;
    }
    return _ownLayout;
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

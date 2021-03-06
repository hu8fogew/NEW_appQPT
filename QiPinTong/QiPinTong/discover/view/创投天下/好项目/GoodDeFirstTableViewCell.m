//
//  GoodDeFirstTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/14.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "GoodDeFirstTableViewCell.h"
@interface GoodDeFirstTableViewCell()


@property(nonatomic,strong)LWAsyncDisplayView *asycView;

@end



@implementation GoodDeFirstTableViewCell
/*
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.52)];
        view.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:view];
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.52-5)];
        vi.backgroundColor = [UIColor whiteColor];
        [view addSubview:vi];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = HWColor(51, 51, 51);
        [vi addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.top.equalTo(vi).with.offset(10);
        }];
        
        self.detailLabel = [UILabel new];
        self.detailLabel.font = [UIFont systemFontOfSize:12];
        self.detailLabel.numberOfLines = 0;
        self.detailLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.detailLabel];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
            make.bottom.and.right.equalTo(vi).with.offset(-10);
        }];
    }
    return self;
}
*/


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.asycView];
        
    }
    return self;
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.projectLayout.projectCellHeight);
}



-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        
    }
    
    return _asycView;
}


-(GoodProjectLayout *)projectLayout
{
    if (!_projectLayout) {
        _projectLayout = [[GoodProjectLayout alloc]initWellProjectCell];
        self.asycView.layout = self.projectLayout;
    }
    return _projectLayout;
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

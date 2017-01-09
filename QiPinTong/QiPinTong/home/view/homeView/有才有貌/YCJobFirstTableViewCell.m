//
//  YCJobFirstTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YCJobFirstTableViewCell.h"

@interface YCJobFirstTableViewCell()<LWAsyncDisplayViewDelegate>

@property(nonatomic,strong)LWAsyncDisplayView *asycView;

@end


@implementation YCJobFirstTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.asycView];
    }
    return self;
}

-(void)lwAsyncDisplayView:(LWAsyncDisplayView *)asyncDisplayView didCilickedTextStorage:(LWTextStorage *)textStorage linkdata:(id)data
{
    HWLog(@"%@",data);
}



-(void)layoutSubviews
{
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.jobLayout.jobDetialHeight);
    
}

-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        _asycView.delegate = self;
    }
    return _asycView;
}

-(JobDetialLayout *)jobLayout
{
    if (!_jobLayout) {
        _jobLayout = [[JobDetialLayout alloc]initJobDetialCell];
        self.asycView.layout = self.jobLayout;
    }
    return _jobLayout;
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

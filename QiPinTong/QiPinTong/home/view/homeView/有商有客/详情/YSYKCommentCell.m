//
//  YSYKCommentCell.m
//  QiPinTong
//
//  Created by mac on 2017/1/9.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "YSYKCommentCell.h"

@interface YSYKCommentCell()

@property(nonatomic,strong)LWAsyncDisplayView *asycView;

@end

@implementation YSYKCommentCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = whiteC;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.asycView];
        
        
    }
    return self;
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.commentCellLayout.ysykCommentCellHeight);
}


-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
    }
    return _asycView;
}

-(YSYKLayout *)commentCellLayout
{
    if (!_commentCellLayout) {
        _commentCellLayout = [[YSYKLayout alloc]initYSYKCommentCell];
        self.asycView.layout = self.commentCellLayout;
    }
    return _commentCellLayout;
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

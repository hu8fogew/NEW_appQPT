//
//  YSYKDetailView.m
//  家长界
//
//  Created by taylor on 2016/12/5.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YSYKDetailView.h"

@interface YSYKDetailView()<LWAsyncDisplayViewDelegate>

@property(nonatomic,strong)LWAsyncDisplayView  *asycView;
@end


@implementation YSYKDetailView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.asycView];
    }
    return self;
}

-(void)lwAsyncDisplayView:(LWAsyncDisplayView *)asyncDisplayView didCilickedTextStorage:(LWTextStorage *)textStorage linkdata:(id)data
{
    
    if ([data isEqualToString:@"查看评论"]) {
        
        
        if (_delegate && [_delegate respondsToSelector:@selector(moreCommentOfView)]) {
            [_delegate moreCommentOfView];
        }
    }
    
    HWLog(@"%@",data);
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.ysykLayout.commentViewHeight);
}


-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        _asycView.delegate = self;
    }
    return _asycView;
}

-(YSYKLayout *)ysykLayout
{
    if (!_ysykLayout) {
        _ysykLayout = [[YSYKLayout alloc]initCommentView];
        self.asycView.layout = self.ysykLayout;
    }
    return _ysykLayout;
}




@end

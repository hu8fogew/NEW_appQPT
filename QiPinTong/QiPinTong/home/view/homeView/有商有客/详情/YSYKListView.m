//
//  YSYKListView.m
//  家长界
//
//  Created by taylor on 2016/12/5.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YSYKListView.h"

@interface YSYKListView ()<LWAsyncDisplayViewDelegate>

@property(nonatomic,strong)LWAsyncDisplayView *asycView;

@end


@implementation YSYKListView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
       
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.asycView];
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.listViewLayout.listViewHeight);
    
}


//点击LWTextStorage
- (void)lwAsyncDisplayView:(LWAsyncDisplayView *)asyncDisplayView
    didCilickedTextStorage:(LWTextStorage *)textStorage
                  linkdata:(id)data {
    //回复评论
    HWLog(@"%@",data);
}


//初始化
-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        _asycView.delegate = self;
    }
    return _asycView;
}


-(YSYKLayout *)listViewLayout
{
    if (!_listViewLayout) {
        _listViewLayout = [[YSYKLayout alloc] initListViewDetialView];
        self.asycView.layout = self.listViewLayout;
    }
    return _listViewLayout;
}



@end

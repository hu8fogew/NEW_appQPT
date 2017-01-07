//
//  AdView.m
//  QiPinTong
//
//  Created by mac on 2017/1/4.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "AdView.h"

@interface AdView()
//主标题
@property(nonatomic,strong)UILabel *mainQues;
//评论
@property(nonatomic,strong)UILabel *numComment;

@end


@implementation AdView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.width = SCREEN_WIDTH-50;
        self.height = (SCREEN_WIDTH*0.12)-20;
        [self createView];
    }
    return self;
}

//创建视图
-(void)createView
{
    //主标题
    _mainQues = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.width-60, self.height) andTextColor:HWColor(53, 53, 53) andTextFont:15];
    
    //线
    UIView *line = [UIView new];
    line.backgroundColor = HWColor(222, 222, 222);
    line.frame = CGRectMake(_mainQues.right, 3, 1.5, _mainQues.height-6);
    
    //评论
    _numComment = [[UILabel alloc]initWithFrame:CGRectMake(line.right, _mainQues.top, self.width-line.right, _mainQues.height) andTextColor:HWColor(153, 153, 153) andTextFont:15];
    _numComment.textAlignment = NSTextAlignmentRight;
    
    [self addSubview:_mainQues];
    [self addSubview:line];
    [self addSubview:_numComment];
}





//赋值
-(void)setMainQues:(NSString *)detial andComment:(NSString *)comment
{
    //标题
    self.mainQues.text = detial;
    //评论
    self.numComment.text = comment;
}



@end

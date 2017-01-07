//
//  PersonalLayout.m
//  QiPinTong
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PersonalLayout.h"

@implementation PersonalLayout
-(id)copyWithZone:(NSZone *)zone
{
    PersonalLayout *one = [[PersonalLayout alloc]init];
    one.descCellHeight = self.descCellHeight;
    one.descViewHeight = self.descViewHeight;
    one.chectButton = self.chectButton;
    return one;
}
//个人求职类型视图的介绍

-(id)initPersonalOfWorkKind
{
    self = [super init];
    if (self) {
        //职位
        LWTextStorage *jobKind = [self createTextWithFrame:CGRectMake(10, 15, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        jobKind.text = @"高级UI设计师";
        //职位类型（全职、薪资）
        LWTextStorage *jobSalary = [self createTextWithFrame:CGRectMake(jobKind.right+4, 16, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:HWColor(218, 149, 62) andTextFont:mainTitleSize-1];
        jobSalary.text = @"(全职  5-8k)";
        
        //查看电话按钮
        CGRect buttonShare = CGRectMake(SCREEN_WIDTH-80, jobKind.top, 70, jobKind.height);
        
        //地区图片
        LWImageStorage *mapImg = [[LWImageStorage alloc]init];
        mapImg.frame = CGRectMake(jobKind.left, jobKind.bottom+8, 15, 15);
        mapImg.contents = [UIImage imageNamed:@"qpt_map_image"];
        //区域
        LWTextStorage *mapText = [self createTextWithFrame:CGRectMake(mapImg.right+3, jobKind.bottom+8, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        mapText.text = @"乌鲁木齐";
        
        //工龄图片
        LWImageStorage *timeImage = [[LWImageStorage alloc]init];
        timeImage.contents = [UIImage imageNamed:@"time_image"];
        timeImage.frame = CGRectMake(mapText.right+15, mapImg.top, mapImg.width, mapImg.height);
        //工龄
        LWTextStorage *workTime = [self createTextWithFrame:CGRectMake(timeImage.right+4, mapText.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        workTime.text = @"3年";
        
        //学历照片
        LWImageStorage *eduImg =[[LWImageStorage alloc]init];
        eduImg.frame = CGRectMake(workTime.right+15, mapImg.top, mapImg.width, mapImg.height);
        eduImg.contents = [UIImage imageNamed:@"acaImgae"];
        
        //学历
        LWTextStorage *eduText =[self createTextWithFrame:CGRectMake(eduImg.right+4, mapText.top+1, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        eduText.text = @"硕士";
        
        //期望行业
        LWTextStorage *wantKind = [self createTextWithFrame:CGRectMake(jobKind.left, mapImg.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        wantKind.text = @"期望行业：互联网/电子商务";
        //求职状态
        LWTextStorage *stateWork = [self createTextWithFrame:CGRectMake(wantKind.right+10, wantKind.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        stateWork.text = @"求职状态：离职-随时到岗";
        
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.contents = [UIImage imageNamed:@"line_icon_image"];
        line.frame = CGRectMake(0, stateWork.bottom+10, SCREEN_WIDTH, DistanceForCell);
        
        
        [self addStorage:line];
        self.chectButton = buttonShare;
        [self addStorage:mapImg];
        [self addStorage:eduImg];
        [self addStorage:timeImage];
        self.descViewHeight = [self suggestHeightWithBottomMargin:0];
    }
    return self;
}






//个人经历介绍的cell（标题、介绍两个内容）
-(id)initDescPersonCell
{
    self = [super init];
    if (self) {
        //主标题
        LWTextStorage *mainTitle = [self createTextWithFrame:CGRectMake(10, 15, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        mainTitle.text = @"我的优势";
        //我的介绍
        LWTextStorage *descTitle = [self createTextWithFrame:CGRectMake(mainTitle.left, mainTitle.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        descTitle.text = @"我品学兼优、有超强的个人素质和信仰，有超强的这方面的经验，我能快速的融入到这个团队中";
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.contents = [UIImage imageNamed:@"line_icon_image"];
        line.frame = CGRectMake(0, descTitle.bottom+10, SCREEN_WIDTH, 6);
        [self addStorage:line];
        self.descCellHeight = [self suggestHeightWithBottomMargin:0];
    }
    return self;
}



-(LWTextStorage *)createTextWithFrame:(CGRect)frame andTextColor:(UIColor *)color andTextFont:(CGFloat)size
{
    LWTextStorage *text = [[LWTextStorage alloc]init];
    text.frame = frame;
    text.textColor = color;
    text.backgroundColor = [UIColor whiteColor];
    text.textAlignment = NSTextAlignmentLeft;
    text.font = [UIFont systemFontOfSize:size];
    text.linespacing = 7.0f;
    [self addStorage:text];
    return text;
}



@end

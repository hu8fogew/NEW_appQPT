//
//  JobDetialLayout.m
//  QiPinTong
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "JobDetialLayout.h"

@implementation JobDetialLayout

-(id)copyWithZone:(NSZone *)zone
{
    JobDetialLayout *one = [[JobDetialLayout alloc]init];
    one.jobDetialHeight = self.jobDetialHeight;
    
    return one;
}



//job详情的cell

-(id)initJobDetialCell
{
    self = [super init];
    if (self) {
        //职位
        LWTextStorage *jobKind = [self createTextWithFrame:CGRectMake(10, 15, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        jobKind.text = @"高级UI设计师";
        //职位类型（全职、薪资）
        LWTextStorage *jobSalary = [self createTextWithFrame:CGRectMake(jobKind.right+4, 16, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:HWColor(218, 149, 62) andTextFont:mainTitleSize-1];
        jobSalary.text = @"(全职  5-8k)";
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
        //线
        LWImageStorage *lineF = [[LWImageStorage alloc]init];
        lineF.contents = [UIImage imageNamed:@"line_icon_image"];
        lineF.frame = CGRectMake(0, eduText.bottom+10, SCREEN_WIDTH, DistanceForCell);
        
        //主标题
        LWTextStorage *mainTitle = [self createTextWithFrame:CGRectMake(jobKind.left, lineF.bottom+15, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        mainTitle.text = @"职位描述";
        NSString *str1 = @"1、我品学兼优、有超强的个人素质和信仰，有超强的这方面的经验，我能快速的融入到这个团队中";
        NSString *str2 = @"2、我品学兼优、有超强的个人素质和信仰，有超强的这方面的经验，我能快速的融入到这个团队中";
        NSString *str3 = @"1、我品学兼优、有超强的个人素质和信仰，有超强的这方面的经验，我能快速的融入到这个团队中";
        str1 = [str1 stringByAppendingFormat:@"\n%@",str2];
        
        str3 =[str3 stringByAppendingFormat:@"\n%@",str1];
        //我的介绍
        LWTextStorage *descTitle = [self createTextWithFrame:CGRectMake(mainTitle.left, mainTitle.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        descTitle.text = str3;
        
        //线
        LWImageStorage *lineS = [[LWImageStorage alloc]init];
        lineS.contents = [UIImage imageNamed:@"line_icon_image"];
        lineS.frame = CGRectMake(0, descTitle.bottom+10, SCREEN_WIDTH, 7);
        
        //主标题
        LWTextStorage *mainTitleS = [self createTextWithFrame:CGRectMake(jobKind.left, lineS.bottom+15, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        mainTitleS.text = @"任职资格";
        //我的介绍
        LWTextStorage *descTitleS = [self createTextWithFrame:CGRectMake(mainTitle.left, mainTitleS.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        
        descTitleS.text = str3;
        LWImageStorage *lineT = [[LWImageStorage alloc]init];
        lineT.contents = [UIImage imageNamed:@"line_icon_image"];
        lineT.frame = CGRectMake(0, descTitleS.bottom+10, SCREEN_WIDTH, 7);
        
        LWImageStorage *netImage = [[LWImageStorage alloc]init];
        netImage.contents = [UIImage imageNamed:@"网络"];
        netImage.frame = CGRectMake(jobKind.left, lineT.bottom+15, 20, 20);
        //连接
        LWTextStorage *netText = [self createTextWithFrame:CGRectMake(netImage.right+3, netImage.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:mainTitleSize-1];
        netText.text = @"www.baidu.com";
        [netText lw_addLinkWithData:netText.text range:NSMakeRange(0, netText.text.length) linkColor:SecondTitleColor highLightColor:clearC];
        //线
        LWImageStorage *lineFo = [[LWImageStorage alloc]init];
        lineFo.contents = [UIImage imageNamed:@"line_icon_image"];
        lineFo.frame = CGRectMake(0, netText.bottom+10, SCREEN_WIDTH, 1.5);
        
        //大楼
        LWImageStorage *hoseImage = [[LWImageStorage alloc]init];
        hoseImage.contents = [UIImage imageNamed:@"公司"];
        hoseImage.frame = CGRectMake(jobKind.left, lineFo.bottom+15, 20, 20);
        
        //办公楼名称
        LWTextStorage *workNameText = [self createTextWithFrame:CGRectMake(hoseImage.right+3, hoseImage.top+2, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        workNameText.text = @"西安市雁塔区永松路2号紫薇花园";
        [workNameText lw_addLinkWithData:workNameText.text range:NSMakeRange(0, workNameText.text.length) linkColor:SecondTitleColor highLightColor:clearC];
        //线
        LWImageStorage *lineFv = [[LWImageStorage alloc]init];
        lineFv.contents = [UIImage imageNamed:@"line_icon_image"];
        lineFv.frame = CGRectMake(0, workNameText.bottom+10, SCREEN_WIDTH, 1.5);
        
        //地图
        LWImageStorage *mapDetailImage = [[LWImageStorage alloc]init];
        mapDetailImage.contents = [UIImage imageNamed:@"地址"];
        mapDetailImage.frame = CGRectMake(jobKind.left, lineFv.bottom+15, 20, 20);
        
        //区域
        LWTextStorage *earaText = [self createTextWithFrame:CGRectMake(mapDetailImage.right+3, mapDetailImage.top+2, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        
        earaText.text = @"西安市雁塔区吉祥路76号永兴大厦2号楼";
        [earaText lw_addLinkWithData:earaText.text range:NSMakeRange(0, earaText.text.length) linkColor:SecondTitleColor highLightColor:clearC];
        
        //线
        LWImageStorage *lineSx = [[LWImageStorage alloc]init];
        lineSx.contents = [UIImage imageNamed:@"line_icon_image"];
        lineSx.frame = CGRectMake(0, earaText.bottom+10, SCREEN_WIDTH, 7);
        
        [self addStorage:mapImg];
        [self addStorage:timeImage];
        [self addStorage:eduImg];
        [self addStorage:lineF];
        [self addStorage:lineS];
        [self addStorage:lineT];
        [self addStorage:netImage];
        [self addStorage:lineFo];
        [self addStorage:hoseImage];
        [self addStorage:lineFv];
        [self addStorage:mapDetailImage];
        [self addStorage:lineSx];
        self.jobDetialHeight = [self suggestHeightWithBottomMargin:10];
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

-(LWImageStorage *)createImageWithFrame:(CGRect)frame andImage:(NSString *)imageStr
{
    LWImageStorage *image = [[LWImageStorage alloc]init];
    image.frame = frame;
    image.contents = [UIImage imageNamed:imageStr];
    [self addStorage:image];
    return image;
}


@end

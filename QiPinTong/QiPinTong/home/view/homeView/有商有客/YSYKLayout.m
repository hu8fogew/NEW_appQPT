//
//  YSYKLayout.m
//  QiPinTong
//
//  Created by mac on 2017/1/9.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "YSYKLayout.h"

@implementation YSYKLayout


-(id)copyWithZone:(NSZone *)zone
{
    YSYKLayout *one = [[YSYKLayout alloc]init];
    one.listViewHeight = self.listViewHeight;
    one.commentViewHeight = self.commentViewHeight;
    one.ysykCommentCellHeight = self.ysykCommentCellHeight;
    return one;
}

//初始化商家详情的list view的详情
-(id)initListViewDetialView
{
    self = [super init];
    if (self) {
        //地图图标
        LWImageStorage *areaImage = [[LWImageStorage alloc]init];
        areaImage.frame = CGRectMake(10, 15, 20, 20);
        areaImage.contents = [UIImage imageNamed:@""];
        //地点
        LWTextStorage *areaText = [self createTextWithFrame:CGRectMake(areaImage.right+5, areaImage.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        areaText.text = @"西安市南三环i都会";
    
        NSString *str = @"导航";
        CGSize strSize = [str sizeWithFont:[UIFont systemFontOfSize:descTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        //导航文字的位置
        LWTextStorage *navigationText = [self createTextWithFrame:CGRectMake(SCREEN_WIDTH-10-strSize.width, areaText.top, strSize.width, strSize.height) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        navigationText.text = str;
        [navigationText lw_addLinkWithData:str range:NSMakeRange(0, str.length) linkColor:SecondTitleColor highLightColor:[UIColor clearColor]];
        
        
        //导航图片
        LWImageStorage *navImage = [[LWImageStorage alloc]init];
        navImage.frame = CGRectMake(SCREEN_WIDTH-10-strSize.width-20, areaImage.top, areaImage.width, areaImage.height);
        navImage.contents = [UIImage imageNamed:@""];
        //line
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.contents = [UIImage imageNamed:@"line_icon_image"];
        line.frame = CGRectMake(SCREEN_WIDTH-31-strSize.width, 10, 1.0, 30);
        
        
        LWImageStorage *lineF = [[LWImageStorage alloc]init];
        lineF.contents = [UIImage imageNamed:@"line_icon_image"];
        lineF.frame = CGRectMake(0, areaImage.bottom+10, SCREEN_WIDTH, 1.5);
        
        //电话图片
        LWImageStorage *telephoneImage = [[LWImageStorage alloc]init];
        telephoneImage.frame = CGRectMake(areaImage.left, lineF.bottom+15, areaImage.width, areaImage.height);
        telephoneImage.contents = [UIImage imageNamed:@""];
        
        //电话号码
        LWTextStorage *numberText = [self createTextWithFrame:CGRectMake(telephoneImage.right+5, telephoneImage.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        numberText.text = @"029-89688888";
        
        [numberText lw_addLinkWithData:numberText.text range:NSMakeRange(0, numberText.text.length) linkColor:SecondTitleColor highLightColor:[UIColor clearColor]];
        
        
        //线二
        LWImageStorage *lineS = [[LWImageStorage alloc]init];
        lineS.contents = [UIImage imageNamed:@"line_icon_image"];
        lineS.frame = CGRectMake(0, telephoneImage.bottom+10, SCREEN_WIDTH, 1.5);
        
        //网址图片
        LWImageStorage *netImage = [[LWImageStorage alloc]init];
        netImage.contents = [UIImage imageNamed:@""];
        netImage.frame = CGRectMake(telephoneImage.left, lineS.bottom+15, areaImage.width, areaImage.height);
        //网址
        LWTextStorage *netText = [self createTextWithFrame:CGRectMake(netImage.right+5, netImage.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        netText.text = @"www.taobao.com";
        [netText lw_addLinkWithData:netText.text range:NSMakeRange(0, netText.text.length) linkColor:SecondTitleColor highLightColor:[UIColor clearColor]];
        //线3
        LWImageStorage *lineT = [[LWImageStorage alloc]init];
        lineT.contents = [UIImage imageNamed:@"line_icon_image"];
        lineT.frame = CGRectMake(0, netImage.bottom+10, SCREEN_WIDTH, 8);
        
        
        [self addStorage:lineT];
        [self addStorage:line];
        [self addStorage:lineS];
        [self addStorage:lineF];
        [self addStorage:areaImage];
        [self addStorage:telephoneImage];
        [self addStorage:navImage];
        [self addStorage:netImage];
        self.listViewHeight = [self suggestHeightWithBottomMargin:0];
    }
    return self;
}




-(id)initCommentView
{
    self = [super init];
    if (self) {
        
        //全部评论的个数
        LWTextStorage *numOfComent = [self createTextWithFrame:CGRectMake(10, 15, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        numOfComent.text = @"全部评论(60)";
        
        //查看全部评论
        NSString *str = @"查看评论";
        CGSize strSize = [str sizeWithFont:[UIFont systemFontOfSize:mainTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        LWTextStorage *seeToComment = [self createTextWithFrame:CGRectMake(SCREEN_WIDTH-30-strSize.width, numOfComent.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:mainTitleSize];
        seeToComment.text = str;
        
        [seeToComment lw_addLinkWithData:str range:NSMakeRange(0, str.length) linkColor:SecondTitleColor highLightColor:[UIColor clearColor]];
        
        //右箭头
        LWImageStorage *pointImage = [[LWImageStorage alloc]init];
        pointImage.contents = [UIImage imageNamed:@""];
        pointImage.frame = CGRectMake(seeToComment.right+5, seeToComment.top, 15, seeToComment.height);
        
        //line
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.contents = [UIImage imageNamed:@"line_icon_image"];
        line.frame = CGRectMake(0, numOfComent.bottom+10, SCREEN_WIDTH, 1.5);
        //头像
        LWImageStorage *image = [[LWImageStorage alloc]init];
        image.frame = CGRectMake(leftToMargin, line.bottom+topToMargin, imageWH, imageWH);
        image.cornerRadius = imageWH/2;
        image.cornerBackgroundColor = [UIColor whiteColor];
        image.backgroundColor = [UIColor whiteColor];
        image.cornerBorderWidth = 1.5f;
        image.cornerBorderColor = HWColor(222, 222, 222);
        image.contents = [UIImage imageNamed:@"teacherImage"];
        
        //用户名
        LWTextStorage *name = [self createTextWithFrame:CGRectMake(image.right + 5, image.top+5, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        name.text = @"老司机上路";
        
        //日期
        LWTextStorage *date = [self createTextWithFrame:CGRectMake(name.left, name.bottom+3, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        date.text = @"2016-08-29 11:30";
        //评论
        LWTextStorage *comment = [self createTextWithFrame:CGRectMake(image.left, image.bottom+10, SCREEN_WIDTH-leftToMargin*2, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        comment.text = @"这个老师讲的好，对于问题的分析非常的透彻，一下子让人们的眉头轻松了许多，对于孩子的教育方式、以及教育习惯有了眉目，很感谢老师的讲解，让我能够在教育孩子当中或多这么多的新解。";        
        
        //line
        LWImageStorage *lineF = [[LWImageStorage alloc]init];
        lineF.contents = [UIImage imageNamed:@"line_icon_image"];
        lineF.frame = CGRectMake(0, comment.bottom+10, SCREEN_WIDTH, DistanceForCell);
        
        
        [self addStorage:image];
        [self addStorage:pointImage];
        [self addStorage:line];
        [self addStorage:lineF];
        self.commentViewHeight = [self suggestHeightWithBottomMargin:10.0f];
    }
    return self;
}

-(id)initYSYKCommentCell
{
    self = [super init];
    if (self) {
        
        //头像
        LWImageStorage *image = [[LWImageStorage alloc]init];
        image.frame = CGRectMake(leftToMargin,topToMargin, imageWH, imageWH);
        image.cornerRadius = imageWH/2;
        image.cornerBackgroundColor = [UIColor whiteColor];
        image.backgroundColor = [UIColor whiteColor];
        image.cornerBorderWidth = 1.5f;
        image.cornerBorderColor = HWColor(222, 222, 222);
        image.contents = [UIImage imageNamed:@"teacherImage"];
        
        //用户名
        LWTextStorage *name = [self createTextWithFrame:CGRectMake(image.right + 5, image.top+5, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        name.text = @"老司机上路";
        
        //日期
        LWTextStorage *date = [self createTextWithFrame:CGRectMake(name.left, name.bottom+3, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        date.text = @"2016-08-29 11:30";
        //评论
        LWTextStorage *comment = [self createTextWithFrame:CGRectMake(image.left, image.bottom+10, SCREEN_WIDTH-leftToMargin*2, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        comment.text = @"这个老师讲的好，对于问题的分析非常的透彻，一下子让人们的眉头轻松了许多，对于孩子的教育方式、以及教育习惯有了眉目，很感谢老师的讲解，让我能够在教育孩子当中或多这么多的新解。";
        
        //line
        LWImageStorage *lineF = [[LWImageStorage alloc]init];
        lineF.contents = [UIImage imageNamed:@"line_icon_image"];
        lineF.frame = CGRectMake(0, comment.bottom+10, SCREEN_WIDTH, 1.5);
        
        [self addStorage:image];
        [self addStorage:lineF];
        self.ysykCommentCellHeight = [self suggestHeightWithBottomMargin:0];
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

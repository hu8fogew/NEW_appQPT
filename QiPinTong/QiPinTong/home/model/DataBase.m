//
//  DataBase.m
//  家长界
//
//  Created by mac on 16/11/4.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "DataBase.h"

@implementation DataBase

+(NSMutableArray *)addArray
{
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<3; i ++) {
        NSString *str = [NSString stringWithFormat:@"%zd",i];
        
        [array addObject:str];
        
    }
    
    return [array copy];
}

+(NSMutableArray *)addSelecteArray
{
    NSMutableArray *arr = [NSMutableArray array];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"4",@"slecteImg",
                          @"家长课堂",@"labTitle",
                          @"1",@"lunboImg",
                          nil];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"5",@"slecteImg",
                          @"有问有答",@"labTitle",
                          @"2",@"lunboImg",
                          nil];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"6",@"slecteImg",
                          @"亲子天地",@"labTitle",
                          @"3",@"lunboImg",
                          nil];
    [arr addObject:dic1];
    [arr addObject:dic2];
    [arr addObject:dic3];
    return [arr copy];
    
}


+(NSMutableArray *)addQptSeleBarArray
{
    NSMutableArray *arr = [NSMutableArray array];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"ycym_image",@"slecteImg",
                          @"有才有貌",@"labTitle",
                          nil];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"xy365_image",@"slecteImg",
                          @"校园365",@"labTitle",
                          nil];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"ysyk_image",@"slecteImg",
                          @"有商有客",@"labTitle",
                          nil];

    [arr addObject:dic1];
    [arr addObject:dic2];
    [arr addObject:dic3];
    
    return [arr copy];
    
}


+(NSMutableArray *)addCampusSelectBarArray{
    NSMutableArray *arr = [NSMutableArray array];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"xsjz_image",@"slecteImg",
                          @"学生兼职",@"labTitle",
                          nil];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"wysx_image",@"slecteImg",
                          @"我要实习",@"labTitle",
                          nil];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"jyzn_image",@"slecteImg",
                          @"就业指南",@"labTitle",
                          nil];
    
    [arr addObject:dic1];
    [arr addObject:dic2];
    [arr addObject:dic3];
    
    return [arr copy];
}


+(NSMutableArray *)addYSYKSelectBarArr{
    NSMutableArray *arr = [NSMutableArray array];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"mstd_image",@"slecteImg",
                          @"美食天地",@"labTitle",
                          
                          nil];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"xxyl_image",@"slecteImg",
                          @"休闲娱乐",@"labTitle",
                          
                          nil];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"lrq_image",@"slecteImg",
                          @"丽人圈",@"labTitle",
                          
                          nil];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"jdyd_image",@"slecteImg",
                          @"酒店预订",@"labTitle",
                          
                          nil];

    [arr addObject:dic1];
    [arr addObject:dic2];
    [arr addObject:dic3];
    [arr addObject:dic4];

       return [arr copy];
}

+(NSMutableArray *)addCTTXSelectBarArr{
    NSMutableArray *arr = [NSMutableArray array];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"xsjz_image",@"slecteImg",
                          @"好项目",@"labTitle",
                          
                          nil];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"wysx_image",@"slecteImg",
                          @"合伙人",@"labTitle",
                          
                          nil];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"fhy_image",@"slecteImg",
                          @"投资机构",@"labTitle",
                          
                          nil];
    
    [arr addObject:dic1];
    [arr addObject:dic2];
    [arr addObject:dic3];
  
    
    return [arr copy];
}

+(NSMutableArray *)addAdverArray
{
    NSMutableArray *arr = [NSMutableArray array];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"孩子不听话怎么办？",@"mainTitle",
                          @"百度知道",@"smallTitle",
                          @"0评",@"commentTitle",
                          nil];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"为什么孩子吃饭不香，看起来木有胃口？",@"mainTitle",
                          @"快使用江中牌健胃消食片",@"smallTitle",
                          @"1评",@"commentTitle",
                          
                          nil];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"孩子为什么考不上终点学校？",@"mainTitle",
                          @"快来咨询课堂吧！",@"smallTitle",
                          @"2评",@"commentTitle",
                          
                          nil];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"学习方式有问题怎么办？",@"mainTitle",
                          @"天天矫正，有个良好的生活习惯",@"smallTitle",
                          @"3评",@"commentTitle",
                          
                          nil];
    NSDictionary *dic5 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"生活不检点怎么办？",@"mainTitle",
                          @"张医生为您答疑解惑",@"smallTitle",
                          @"4评",@"commentTitle",
                          
                          nil];
    NSDictionary *dic6 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"孩子早恋如何对待？",@"mainTitle",
                          @"关于孩子早恋快来腾讯课堂",@"smallTitle",
                          @"5评",@"commentTitle",
                          
                          nil];
    [arr addObject:dic1];
    [arr addObject:dic2];
    [arr addObject:dic3];
    [arr addObject:dic4];
    [arr addObject:dic5];
    [arr addObject:dic6];
    return [arr copy];
    
}
@end

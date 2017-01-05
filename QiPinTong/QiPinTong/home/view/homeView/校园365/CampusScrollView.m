//
//  CampusScrollView.m
//  家长界
//
//  Created by taylor on 2016/12/12.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "CampusScrollView.h"

@implementation CampusScrollView
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.54)];
        view.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:view];
        self.vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.54-10)];
        self.vi.backgroundColor = [UIColor whiteColor];
        [view addSubview:self.vi];
        
        [self createUIScrollView];
        [self createUIPageControl];
        
}
    return self;
}

#pragma mark 定义滚动视图
-(void)createUIScrollView{
    
    //定义滚动视图
    self.myScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.54-10)];
    self.myScroll.backgroundColor = [UIColor whiteColor];
    self.myScroll.showsHorizontalScrollIndicator = NO;
    self.myScroll.tag = 10;
    self.myScroll.delegate = self;
    [self.vi addSubview:self.myScroll];
    
    NSArray *imgViews = @[@"1",@"2",@"3",@"9"];
    for (int i=0; i<imgViews.count; i++) {
        UIImageView *imgView = [[UIImageView alloc]init];
        imgView.frame = CGRectMake(10+i*(SCREEN_WIDTH-20), 0, SCREEN_WIDTH-20, SCREEN_WIDTH*0.25);
        
        imgView.image = [UIImage imageNamed:imgViews[i]];
        [self.myScroll addSubview:imgView];
        
    }
    
    //设置属性
    //显示内容的大小
    self.myScroll.contentSize = CGSizeMake(4*(SCREEN_WIDTH-20), SCREEN_WIDTH*0.54-10);
    //显示内容的偏移量
    self.myScroll.contentOffset = CGPointMake(0, 0);
    //按页进行滑动
    self.myScroll.pagingEnabled = YES;
    
}

#pragma mark 定义翻页控件
-(void)createUIPageControl{
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH*0.42, SCREEN_WIDTH, 20)];
    
    //设置背景色
    self.pageControl.backgroundColor = [UIColor orangeColor];
    
    //添加父视图
    [self.vi addSubview:self.pageControl];
    
    //翻页 个数
    self.pageControl.numberOfPages = 4;
    //当前页
    self.pageControl.currentPage = 0;
    
    //点颜色
    self.pageControl.pageIndicatorTintColor = HWColor(153, 153, 153);
    //当前页的颜色
    self.pageControl.currentPageIndicatorTintColor = HWColor(67, 159, 223);
    
    //重新设置背景色
    self.pageControl.backgroundColor = [UIColor clearColor];
    
    
    //添加事件
    [self.pageControl addTarget:self action:@selector(onChange:) forControlEvents:UIControlEventValueChanged];
    
    //设置标识值
    self.pageControl.tag = 11;
    
    
}
//翻页控件出发方法
-(void)onChange:(UIPageControl *)page{
    HWLog(@"翻页控件响应");
    
    UIScrollView *myScroll = (id)[self.vi viewWithTag:10];
    
    //设置偏移量   根据翻页控件的当前页 计算获取偏移量
    myScroll.contentOffset = CGPointMake(page.currentPage*SCREEN_WIDTH, 0);
    
}

//滚动视图已经完成滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSLog(@"滚动视图完成滚动");
    //  scrollView.contentOffset.x/width
    
    UIPageControl *page = (id)[self.vi viewWithTag:11];
    
    //设置翻页控件的当前页  通过偏移量进行计算
    page.currentPage = scrollView.contentOffset.x/SCREEN_WIDTH;
    
}


@end

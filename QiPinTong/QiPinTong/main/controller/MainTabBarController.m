//
//  MainTabBarController.m
//  家长界
//
//  Created by mac on 16/11/6.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    //初始化子控制器并添加到tabbar上面
    QPTViewController *homeVc = [[QPTViewController alloc]init];
    [self addChildVc:homeVc title:@"首页" image:@"homeN" selectedImage:@"homeS"];
    
    MessageViewController *messageVc = [[MessageViewController alloc]init];
    [self addChildVc:messageVc title:@"消息" image:@"messageN" selectedImage:@"messageS"];
    
    DiscoverViewController *discoverVc = [[DiscoverViewController alloc]init];
    
    [self addChildVc:discoverVc title:@"发现" image:@"discoveryN" selectedImage:@"discoveryS"];
    
    OwnerViewController *ownerVc = [[OwnerViewController alloc]init];
    [self addChildVc:ownerVc title:@"我" image:@"mineN" selectedImage:@"mineS"];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  添加一个子控制器
 
 @param childVc  子控制器
 @param title  标题
 @param image 图片
 @param selectedImage 选中的图片
 
 */

-(void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    //设置子控制器的文字
    childVc.title = title;
    
    //设置子控制器的图片
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//防止渲染
    
    //设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = HWColor(53, 53, 53);
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = HWColor(29, 150, 211);
    
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    //先给外边传进来的小控制器包装一个导航控制器
    MainNavigationController *nav = [[MainNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
}


@end

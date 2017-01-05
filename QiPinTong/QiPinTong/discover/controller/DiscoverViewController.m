//
//  DiscoverViewController.m
//  家长界
//
//  Created by 张波 on 2016/11/7.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "DiscoverViewController.h"


@interface DiscoverViewController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>

@property (strong,nonatomic) UITableView *tableView;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createTableView];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController.viewControllers.count == 1) {
        return NO;
    }
    else{
        return YES;
    }
}

-(void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Kwidth, Kheight) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //返回行数
    NSInteger rows =0;
    
    //根据不同分组 返回不同行数
    switch (section) {
        case 0:
            rows = 1;
            break;
        case 1:
            rows = 3;
            break;
        case 2:
            rows = 3;
            break;
        default:
            rows = 1;
            break;
    }
    
    return rows;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    DiscoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (cell == nil) {
        cell = [[DiscoverTableViewCell alloc]initWithFrame:cell.bounds];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = NO;
       }

    if (section == 0) {
        cell.icon.image = [UIImage imageNamed:@"friend_image"];
        cell.title.text = @"朋友动态";
    }
    else if (section == 1) {
        if (row == 0) {
            cell.icon.image = [UIImage imageNamed:@"sk_image"];
            cell.title.text = @"有商有客";
        }
        else if (row == 1) {
            cell.icon.image = [UIImage imageNamed:@"icon_image"];
            cell.title.text = @"抢通币";
        }
        else{
            cell.icon.image = [UIImage imageNamed:@"venture_image"];
            cell.title.text = @"创投地带";
        }
       
    }
    else if (section == 2) {
        if (indexPath.row == 0) {
            cell.icon.image = [UIImage imageNamed:@"jzj_image"];
            cell.title.text = @"家长界";
            
        }
        else if (row == 1) {
            cell.icon.image = [UIImage imageNamed:@"soldier_image"];
            cell.title.text = @"军人本色";
            
        }
        else{
            cell.icon.image = [UIImage imageNamed:@"hr_image"];
            cell.title.text = @"HR Home";
        }
       
    }
    else if (section == 3) {
        cell.icon.image = [UIImage imageNamed:@"book_image"];
        cell.title.text = @"通讯录";
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    YSYKViewController *ysykVC = [YSYKViewController new];
    
    RobCoinViewController *coinVC = [RobCoinViewController new];
    
    HR_HomeViewController *hrVC = [HR_HomeViewController new];
    
    VentureWorldViewController *ventureVC = [VentureWorldViewController new];
    
    //朋友圈
    MomentsViewController *circleVc = [MomentsViewController new];
    
    switch (section) {
            //朋友圈
        case 0:
        {
            [self.navigationController pushViewController:circleVc animated:YES];
        }
            break;
        case 1:
            switch (row) {
               case 0:
                    [self.navigationController pushViewController:ysykVC animated:YES];
                    break;
               case 1:
                    [self.navigationController pushViewController:coinVC animated:YES];
                    break;
                default:
                    [self.navigationController pushViewController:ventureVC animated:YES];
                    break;
            }
            break;
        case 2:
            switch (row) {
                case 0:
                    
                    break;
                 case 1:
                    break;
                
                default:
                    [self.navigationController pushViewController:hrVC animated:YES];
                    break;
            }
        default:
            
            break;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

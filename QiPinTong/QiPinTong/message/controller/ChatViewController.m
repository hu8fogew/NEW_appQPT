//
//  ChatViewController.m
//  QiPinTong
//
//  Created by mac on 2017/1/10.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ChatViewController.h"
#import "OtherCell.h"
#import "PersonalCell.h"
@interface ChatViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *messageTable;
@end
@implementation ChatViewController


-(UITableView *)messageTable
{
    if (!_messageTable) {
        _messageTable = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _messageTable.delegate = self;
        _messageTable.dataSource = self;
        _messageTable.backgroundColor = HWColor(244, 244, 244);
        _messageTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _messageTable;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"香格里拉郎";
    self.view.backgroundColor = whiteC;
    
    [self.view addSubview:self.messageTable];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id cell = nil;
    OtherCell *oCell = [[OtherCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"otherCell"];
    PersonalCell *pCell = [[PersonalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"personalCell"];
    
    
    if (indexPath.row == 0) {
        cell = oCell;
    }
    else if (indexPath.row == 1) {
        cell = pCell;
    }
    else if (indexPath.row == 2) {
        cell = pCell;
    }
    else if (indexPath.row == 3) {
        cell = oCell;
    }
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellHeight = 0.0f;
    MessageLayout *olay = [[MessageLayout alloc]initOtherMessageCell];
    MessageLayout *play = [[MessageLayout alloc]initOwnMessageCell];
    switch (indexPath.row) {
        case 0:
        {
            cellHeight = olay.otherMessageHeight;
        }
            break;
        case 1:
        {
            cellHeight = play.ownMessageHeight;
        }
            break;
        case 2:
        {
            cellHeight = play.ownMessageHeight;
        }
            break;
        case 3:
        {
            cellHeight = olay.otherMessageHeight;
        }
            break;
        default:
            break;
    }
    
    return cellHeight;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end

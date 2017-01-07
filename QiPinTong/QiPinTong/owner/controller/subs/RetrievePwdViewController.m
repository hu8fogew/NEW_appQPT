//
//  RetrievePwdViewController.m
//  家长界
//
//  Created by 张波 on 2016/11/14.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "RetrievePwdViewController.h"

@interface RetrievePwdViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@end

@implementation RetrievePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
   
    
    //[self setupFrame];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT-64;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RetrievePwdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ce"];
    if (cell == nil) {
        cell = [[RetrievePwdTableViewCell alloc]initWithFrame:cell.bounds];
        cell.selectionStyle = NO;
        cell.titleLabel.text = @"找回密码";
        cell.phoneLabel.text = @"手机号";
        cell.phoneField.placeholder = @"请输入手机号";
        cell.commitLabel.text = @"验证码";
        cell.commitField.placeholder = @"请输入验证码";
        [cell.commitBtn addTarget:self action:@selector(clickCommitBtn) forControlEvents:UIControlEventTouchUpInside];
        [cell.nextBtn addTarget:self action:@selector(clickNextBtn) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return cell;
}

-(void)clickCommitBtn{
    HWLog(@"验证码");
}

-(void)clickNextBtn{
    HWLog(@"next");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

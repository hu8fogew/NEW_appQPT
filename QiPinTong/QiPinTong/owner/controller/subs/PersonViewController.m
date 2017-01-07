//
//  MemberCenterViewController.m
//  家长界
//
//  Created by 张波 on 2016/11/11.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "PersonViewController.h"

@interface PersonViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *headerView;

@property (strong,nonatomic) UIView *showView;

@property (strong,nonatomic) UIView *selectBtnView;

@property (strong,nonatomic) NSMutableArray *seleArr;

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"会员中心";
    
    [self.view addSubview:self.tableView];
    
    [self.headerView addSubview:self.showView];
    [self.headerView addSubview:self.selectBtnView];
    
    
}

#pragma mark /**-----懒加载-----**/

/*选择按钮*/
-(NSMutableArray *)seleArr
{
    if (!_seleArr) {
        _seleArr = [DataBase addPersonSelectBarArr];
    }
    
    return _seleArr;
}

/*headerView*/
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.36)];
        _headerView.backgroundColor = HWColor(235, 241, 247);
        HeaderView *vi = [[HeaderView alloc]initWithFrame:_headerView.bounds];
        [_headerView addSubview:vi];
        vi.backImgView.image = [UIImage imageNamed:@"bg"];
        vi.imgView.image = [UIImage imageNamed:@"mq_image.jpeg"];
        vi.titleLabel.text = @"企聘通";
        [vi.setupBtn addTarget:self action:@selector(setupBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [vi.editBtn addTarget:self action:@selector(editBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _headerView;
}

-(void)setupBtnClick{
    HWLog(@"setup");
}

-(void)editBtnClick{
    HWLog(@"edit");
}

/**/
-(UIView *)showView{
    if (!_showView) {
        _showView = [[UIView alloc]initWithFrame:CGRectMake(0, self.headerView.y+self.headerView.height, SCREEN_WIDTH, SCREEN_WIDTH*0.18)];
        _showView.backgroundColor = [UIColor whiteColor];
        PersonShowView *vi = [[PersonShowView alloc]initWithFrame:_showView.bounds];
        vi.sendNoLabel.text = @"10";
        vi.faceNoLabel.text = @"50";
        vi.saveNoLabel.text = @"20";
        UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(firstViewClick)];
        [vi.firstView addGestureRecognizer:tapGesture1];
        
        UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(secondViewClick)];
        [vi.secondView addGestureRecognizer:tapGesture2];
        
        UITapGestureRecognizer *tapGesture3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(thirdViewClick)];
        [vi.thirdView addGestureRecognizer:tapGesture3];
        
        [_showView addSubview:vi];
    }
    return _showView;
}

-(void)firstViewClick{
    HWLog(@"1");
}

-(void)secondViewClick{
    HWLog(@"2");
}

-(void)thirdViewClick{
    HWLog(@"3");
}

/*按钮视图*/
-(UIView *)selectBtnView{
    if (!_selectBtnView) {
        _selectBtnView = [[UIView alloc]initWithFrame:CGRectMake(0, self.showView.y+self.showView.height+10, SCREEN_WIDTH, SCREEN_WIDTH*0.44+8)];
    
        [self createSelecteActivityWithArr:self.seleArr];
    }
    return _selectBtnView;
}

#pragma mark /------选择按钮的创建------/
/*创建选择按钮*/
-(void)createSelecteActivityWithArr:(NSArray *)source
{
    int i = 0;
    for (NSDictionary *dic in source) {
        UIView *vi = [[UIView alloc]init];
        if (i<3) {
            vi.frame = CGRectMake((SCREEN_WIDTH/3-1)*i+i*1, 0, SCREEN_WIDTH/3-1, SCREEN_WIDTH*0.44/2-1);
        }
        if (i>=3) {
            vi.frame = CGRectMake((SCREEN_WIDTH/3-1)*(i-3)+(i-3)*1, SCREEN_WIDTH*0.44/2, SCREEN_WIDTH/3-1, SCREEN_WIDTH*0.44/2);
        }
        vi.backgroundColor = [UIColor whiteColor];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake((SCREEN_WIDTH-20)/8, (SCREEN_WIDTH-20)/23, (SCREEN_WIDTH-20)/12, (SCREEN_WIDTH-20)/12)];
        [button setBackgroundImage:[UIImage imageNamed:dic[@"slecteImg"]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickSeleceAction:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.cornerRadius = button.width/2;
        button.backgroundColor = [UIColor grayColor];
        button.tag = i;
        [vi addSubview:button];
        //添加文字
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, (SCREEN_WIDTH-20)*5/35, (SCREEN_WIDTH-20)/3, 20)];
        label.text = dic[@"labTitle"];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = HWColor(51, 51, 51);
        label.textAlignment = NSTextAlignmentCenter;
        [vi addSubview:label];
        [self.selectBtnView addSubview:vi];
        i++;
    }
}
/*选择器添加的手势实现方法*/
-(void)clickSeleceAction:(UIButton *)sender
{
    if (sender.tag == 0) {
        HWLog(@"0");
        
//        YCYMViewController *vc = [[YCYMViewController alloc]init];
//        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
    else if (sender.tag == 1) {
        HWLog(@"1");
//        Campus365ViewController *vc = [Campus365ViewController new];
//        [self.navigationController pushViewController:vc animated:YES];
    }
    
    else if (sender.tag == 2) {
        HWLog(@"2");
        //        Campus365ViewController *vc = [Campus365ViewController new];
        //        [self.navigationController pushViewController:vc animated:YES];
    }
    
    else if (sender.tag == 3) {
        HWLog(@"3");
        //        Campus365ViewController *vc = [Campus365ViewController new];
        //        [self.navigationController pushViewController:vc animated:YES];
    }
    
    else if (sender.tag == 4) {
        HWLog(@"4");
        //        Campus365ViewController *vc = [Campus365ViewController new];
        //        [self.navigationController pushViewController:vc animated:YES];
    }
    
    else {
        HWLog(@"5");
//        YSYKViewController *vc = [YSYKViewController new];
//        [self.navigationController pushViewController:vc animated:YES];
    }
    
    HWLog(@"%zd",sender.tag);
    
}

#pragma mark /**++++++++tableview及方法++++++++**/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Kwidth, Kheight) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        _tableView.backgroundColor =  HWColor(235, 241, 247);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.selectBtnView.y + self.selectBtnView.height;
    }
    return _tableView;
}

//返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //返回行数
    NSInteger rows = 0;
    
    //根据不同分组 返回不同行数
    switch (section) {
        case 0:
            rows = 2;
            break;
        default:
            rows = 2;
            break;
    }
    
    return rows;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    DiscoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ce"];
    if (cell == nil) {
        cell = [[DiscoverTableViewCell alloc]initWithFrame:cell.bounds];
    }
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.icon.image = [UIImage imageNamed:@"icon_image"];
            cell.title.text = @"收益(元)";
        }
        else{
            cell.icon.image = [UIImage imageNamed:@""];
            cell.title.text = @"通币";
        }
    }
    
    else{
        if (indexPath.row == 0) {
            cell.icon.image = [UIImage imageNamed:@""];
            cell.title.text = @"通讯录";
        }
        else{
            cell.icon.image = [UIImage imageNamed:@""];
            cell.title.text = @"相册";
        }
    }
    return cell;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

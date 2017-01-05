//
//  YCJobDeViewController.m
//  家长界
//
//  Created by taylor on 2016/12/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YCJobDeViewController.h"

@interface YCJobDeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *headView;

@property (strong,nonatomic) UIView *bottomView;

@end

@implementation YCJobDeViewController
id jobCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
}

#pragma mark ------懒加载------
-(UIView *)headView{
    if (!_headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.46)];
        YCYMDeHeadView *vi = [[YCYMDeHeadView alloc]initWithFrame:_headView.bounds];
        vi.backgroundColor = HWColor(241, 241, 241);
        vi.backImageView.image = [UIImage imageNamed:@"backImage.jpg"];
        vi.imgView.image = [UIImage imageNamed:@"icon"];
        vi.nameLabel.text = @"康威通信国际";
        vi.attentionLabel.text = @"关注 45";
        vi.fansLabel.text = @"粉丝 88";
        vi.infoLabel.text = @"企业信息 : 互联网电子商务";
        vi.statusLabel.text = @"已上市";
        vi.addressLabel.text = @"1000人以上";
        
        [_headView addSubview:vi];
    }
    return _headView;
}

-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-60, SCREEN_HEIGHT, 60)];
        _bottomView.backgroundColor = [UIColor whiteColor];
        NSArray *icon = @[@"关注",@"好友",@"咨询"];
        NSArray *title = @[@"加关注",@"加好友",@"立即咨询"];
        NSArray *color = @[@"blue",@"green",@"orange"];
        for (int i = 0; i < 3; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(10+i*(SCREEN_WIDTH-40)/3+i*10, 15, (SCREEN_WIDTH-40)/3, 30);
            btn.layer.masksToBounds = YES;
            btn.layer.cornerRadius = 3;
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            btn.imageView.size = CGSizeMake(16, 16);
            [btn setTitle:title[i] forState:UIControlStateNormal];
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, -3, 0, 3);
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, -3);
            [btn setImage:[UIImage imageNamed:icon[i]] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:color[i]] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            [_bottomView addSubview:btn];
        }
        
    }
    return _bottomView;
}


-(void)clickBtn:(UIButton *)sender{
    if (sender.tag == 0) {
        HWLog(@"66666666");
    }
    else if (sender.tag == 1){
        
    }
    else{
        
    }
}

#pragma mark ------tableview及方法---------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-60)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headView;
        _tableView.tableHeaderView.height = self.headView.height;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.allowsSelection = NO;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    JobDetialLayout *lay = [[JobDetialLayout alloc]initJobDetialCell];
    
    return lay.jobDetialHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YCJobFirstTableViewCell *cell = [[YCJobFirstTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"jobDesc"];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

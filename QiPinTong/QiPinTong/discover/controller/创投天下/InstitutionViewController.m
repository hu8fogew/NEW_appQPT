//
//  InstitutionViewController.m
//  家长界
//
//  Created by taylor on 2016/12/13.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "InstitutionViewController.h"

@interface InstitutionViewController ()<UITableViewDelegate,UITableViewDataSource,WYAutoCaruselDelegate,SGSegmentedControlDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIView *headerView;

/*轮播数组*/
@property(nonatomic,strong)NSMutableArray *arrLunBo;

/*搜索栏*/
@property (nonatomic,strong) UIView *searchView;
@property (nonatomic,strong) UISearchBar *searchBar;

/**页面切换视图*/
@property (strong,nonatomic) UIView *seleBarView;
@property (strong,nonatomic) SGSegmentedControl *segment;
@property (strong,nonatomic) NSString *segStr;
@property (strong,nonatomic) NSArray *seleBarArr;

/**筛选栏*/
@property (nonatomic,strong) UIView *siftView;

@property (strong,nonatomic) UIButton *btn1;
@property (strong,nonatomic) UIButton *btn2;
@property (strong,nonatomic) UIButton *btn3;
@property (strong,nonatomic) UIButton *btn4;

/*筛选按钮数组*/
@property (strong,nonatomic) NSMutableArray *buttonArray;

@end

@implementation InstitutionViewController

id venCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    [self.headerView addSubview:self.searchView];
    [self.headerView addSubview:self.seleBarView];
    [self.headerView addSubview:self.siftView];
    
    [self createAdsPageWithArr:self.arrLunBo];
    
    self.seleBarArr = @[@"投资人",@"投资机构"];
    
    [self createSeleBarView];
    
    self.segStr = @"投资人";
}

#pragma mark -----懒加载-------

/*轮播*/
-(NSMutableArray *)arrLunBo
{
    if (!_arrLunBo) {
        _arrLunBo = [DataBase addSelecteArray];
        
    }
    return _arrLunBo;
}

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight)];
        _headerView.backgroundColor = HWColor(241, 241, 241);
        
        [_headerView addSubview:self.searchView];
    }
    return _headerView;
}

/**搜搜框*/
-(UIView *)searchView{
    if (!_searchView) {
        _searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        _searchView.backgroundColor = [UIColor whiteColor];
        
        self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(70, 5, SCREEN_WIDTH-80, 40)];
        self.searchBar.placeholder = @"请输入类别或关键字";
        self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
        
        [_searchView addSubview:self.searchBar];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"西安" forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"icon_down"] forState:UIControlStateNormal];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5);
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 45, 0, -45);
        [btn setTitleColor:HWColor(53, 53, 53) forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, SCREEN_WIDTH/6, self.searchView.height);
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_searchView addSubview:btn];
        
    }
    return _searchView;
}


/*页面切换视图*/
-(UIView *)seleBarView{
    if (!_seleBarView) {
        _seleBarView = [[UIView alloc]initWithFrame:CGRectMake(0, lunBoheight+50, SCREEN_WIDTH, siftHeight)];
        _seleBarView.backgroundColor = HWColor(241, 241, 241);
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight-1)];
        view.backgroundColor = [UIColor whiteColor];
        [_seleBarView addSubview:view];
        
    }
    return _seleBarView;
}

-(UIView *)siftView{
    if (!_siftView) {
        _siftView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 40)];
        _siftView.backgroundColor = [UIColor whiteColor];
        
        NSArray *titleArray = @[@"区域",@"领域",@"方式",@"额度"];
        _buttonArray = [NSMutableArray array];
        for (int i = 0; i<titleArray.count; i++) {
            
            UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
            bt.frame = CGRectMake(SCREEN_WIDTH/titleArray.count*i,0,SCREEN_WIDTH/titleArray.count-1, 40-1);
            bt.titleLabel.font = [UIFont systemFontOfSize:16];
            [bt setTitle:titleArray[i] forState:UIControlStateNormal];
            [bt setTitleEdgeInsets: UIEdgeInsetsMake(0,-12 , 0, 12)];
            [bt setImageEdgeInsets:UIEdgeInsetsMake(0, 38, 0, -38)];
            [bt setImage:[UIImage imageNamed:@"icon_down"] forState:UIControlStateNormal];
            [bt setImage:[UIImage imageNamed:@"icon_up"] forState:UIControlStateSelected];
            [bt setTitleColor:HWColor(153, 153, 153) forState:UIControlStateNormal];
            [bt setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
            bt.selected = NO;
            bt.tag = i;
            [bt addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [_buttonArray addObject:bt];
            
            if (bt.tag == 0) {
                self.btn1 = bt;
            }
            else if (bt.tag == 1){
                self.btn2 = bt;
            }
            else if (bt.tag == 2){
                self.btn3 = bt;
            }
            else{
                self.btn4 = bt;
            }
            
            for (int j = 1; j < 4; j++) {
                UIView *view = [UIView new];
                view.frame = CGRectMake(j*(SCREEN_WIDTH/titleArray.count-1), 8, 1, 24);
                view.backgroundColor = HWColor(241, 241, 241);
                
                [_siftView addSubview:view];
            }
            
            [_siftView addSubview:bt];
        }

        
    }
    return _siftView;
}

/*添加选项栏*/
-(void)createSeleBarView
{
    _segment = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight-1) delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:self.seleBarArr];
    _segment.titleColorStateSelected = HWColor(96, 136, 186);
    _segment.indicatorColor = HWColor(96, 136, 186);
    [self.seleBarView addSubview:_segment];
}


-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index{
    
    if (index == 0) {
        self.segStr = @"投资人";
        [self.tableView reloadData];
    }
    else{
        self.segStr = @"投资机构";
        [self.tableView reloadData];
    }
}

#pragma mark /*********轮播图的实现*******/
-(void)createAdsPageWithArr:(NSMutableArray *)source
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in source) {
        [arr addObject:[dic objectForKey:@"slecteImg"]];
    }
    //封装的轮播view实现
    WYAutoCarusel *aut = [[WYAutoCarusel alloc]init];
    [aut createCaruselWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, lunBoheight) WithSuperView:self.headerView WithImageUrlArr:arr WithPlaceholderImageName:@"vent" WithInterval:2];
    
    [aut createPageControlWithFrame:CGRectMake(SCREEN_WIDTH-60, 50+lunBoheight-30, 30, 20) WithSuperView:self.headerView WithPageNum:arr.count WithCurrentColor:HWColor(153, 153, 153) WithTintColor:[UIColor whiteColor]];
    
    aut.delegate = self;
}
/*轮播图跳转代理*/
-(void)pushViewController:(NSInteger)tag
{
    
    HWLog(@"laniahao ");
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = self.tableView.contentOffset.y;
    if ([self.segStr isEqualToString:@"投资机构"]) {
        if (offset >lunBoheight) {
            HWLog(@"开始显示");
            [UIView animateWithDuration:0.1 animations:^{
                [self.view addSubview:self.siftView];
                
            }];
        }
        else{
            [UIView animateWithDuration:0.1 animations:^{
                [self.siftView removeFromSuperview];
            }];
        }
    }
    else{
        
    }
    
}


-(void)buttonAction:(UIButton *)sender{
    sender.selected = !sender.selected;
    switch (sender.tag) {
        case 0:
            self.btn2.selected = NO;
            self.btn3.selected = NO;
            self.btn4.selected = NO;
            break;
        case 1:
            self.btn1.selected = NO;
            self.btn3.selected = NO;
            self.btn4.selected = NO;
            break;
        case 2:
            self.btn1.selected = NO;
            self.btn2.selected = NO;
            self.btn4.selected = NO;
            break;
        default:
            self.btn1.selected = NO;
            self.btn2.selected = NO;
            self.btn3.selected = NO;
            break;
    }
}

#pragma mark ------tableview及方法------

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height+self.searchView.height+self.seleBarView.height;
    }
    
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.segStr isEqualToString:@"投资人"]) {
        return SCREEN_WIDTH*0.4;
    }
    else{
        return SCREEN_WIDTH*0.27;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"identifier";
    if ([self.segStr isEqualToString:@"投资人"]) {
        PartnerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[PartnerTableViewCell alloc]initWithFrame:cell.bounds];
            venCell = cell;
            cell.imgView.image = [UIImage imageNamed:@"mq_image.jpeg"];
            cell.nameLabel.text = @"胡歌";
            cell.vIcon.image = [UIImage imageNamed:@"vip"];
            cell.ageLabel.text = @"年龄 : 23岁";
            cell.industryLabel.text = @"互联网";
            cell.professionLabel.text = @"软件";
            cell.wantLabel.text = @"寻求加盟";
            cell.venNoLabel.text = @"50W";
            cell.ventureLabel.text = @"投资额 : ";
            cell.addressIcon.image = [UIImage imageNamed:@"qpt_map_image"];
            cell.addressLabel.text = @"雁塔区";
            cell.numberLabel.text = @"2323";
            cell.numberIcon.image = [UIImage imageNamed:@"eyeImage"];
            cell.detailLabel.text = @"合伙期望：8年的销售经验，沟通能力强、口齿伶俐、思维敏捷、管理组织能力强";
            
        }
        
        return cell;
    }
    
    if ([self.segStr isEqualToString:@"投资机构"]) {
        GoodItemsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[GoodItemsTableViewCell alloc]initWithFrame:cell.bounds];
            venCell = cell;
            cell.imgView.image = [UIImage imageNamed:@"venture"];
            cell.titleLabel.text = @"中国银江投资集团";
            cell.vIcon.image = [UIImage imageNamed:@"vip"];
            cell.amountLabel.text = @"成功投资:234个";
            cell.amountLabel.textColor = HWColor(153, 153, 153);
            cell.subLabel.text = @"领域 : 社交、电子商务、媒体分类";
            cell.addressIcon.image = [UIImage imageNamed:@"qpt_map_image"];
            cell.addressLabel.text = @"西安";
            cell.praiseLabel.text = @"2323";
            cell.praiseIcon.image = [UIImage imageNamed:@"eyeImage"];
            
        }
        
        return cell;
    }
    
    return venCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self.segStr isEqualToString:@"投资人"]){
        InvestorViewController *vc = [InvestorViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([self.segStr isEqualToString:@"投资机构"]){
        InstiDetailViewController *vc = [InstiDetailViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
   
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self.searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

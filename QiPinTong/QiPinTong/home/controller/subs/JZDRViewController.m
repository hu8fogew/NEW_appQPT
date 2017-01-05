//
//  YCYMViewController.m
//  家长界
//
//  Created by mac on 2016/11/27.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "JZDRViewController.h"

@interface JZDRViewController ()<UITableViewDelegate,UITableViewDataSource,WYAutoCaruselDelegate,SGSegmentedControlDelegate>

/*tableView的创建*/
@property(nonatomic,strong)UITableView *tableView;

/*headerView的创建*/
@property(nonatomic,strong)UIView *headerView;

/*搜索条目*/
@property(nonatomic,strong)UIView *searchView;
@property (nonatomic,strong)UISearchBar *searchBar;

/*选择条*/
@property(nonatomic,strong)UIView *selectButtonView;

/*创建筛选按钮*/

@property(nonatomic,strong)UIView *ycymSiftView;
@property(nonatomic,strong)SiftView *si;
@property(nonatomic,strong)UIView *backgroundSiftView;

/*轮播图的数组*/
@property(nonatomic,strong)NSMutableArray *lunboArr;

@property(nonatomic,strong)SGSegmentedControl *segment;

@property(nonatomic,copy)NSString *switchString;

@end

@implementation JZDRViewController
id jzdrCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"兼职达人";
    self.navigationController.navigationBar.backgroundColor = HWColor(241, 241, 241);
    
    [self.view addSubview:self.tableView];
    
    [self.headerView addSubview:self.searchView];
    [self.headerView addSubview:self.selectButtonView];
    
    [self createAdsPageWithArr:self.lunboArr];
    
    NSArray *arr = @[@"达人帮",@"推荐兼职"];
    [self createSeleBarViewWithArr:arr];
    
    self.switchString = @"达人帮";
    
}

#pragma mark /**********懒加载************/

//轮播图数组
-(NSMutableArray *)lunboArr
{
    if (!_lunboArr) {
        _lunboArr = [DataBase addSelecteArray];
    }
    return _lunboArr;
}

//头部视图
-(UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight)];
        _headerView.backgroundColor = HWColor(241, 241, 241);
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


/*切换按钮*/
-(UIView *)selectButtonView
{
    if (!_selectButtonView) {
        _selectButtonView = [[UIView alloc]initWithFrame:CGRectMake(0, self.searchView.height+lunBoheight+5, SCREEN_WIDTH, 50)];
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        vi.backgroundColor = [UIColor whiteColor];
        [_selectButtonView addSubview:vi];
        
    }
    return _selectButtonView;
}

#pragma mark /-----选择条目列表------/
-(void)createSeleBarViewWithArr:(NSArray *)arrTitle
{
    self.segment = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49) delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:arrTitle];
    self.segment.titleColorStateNormal = HWColor(102, 102, 102);
    self.segment.titleColorStateSelected = HWColor(51, 51, 51);
    self.segment.indicatorColor = HWColor(51, 51, 51);
    [self.selectButtonView addSubview:self.segment];
}

-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index
{
    if (index == 0) {
        HWLog(@"0");
        self.switchString = @"达人帮";
        [self.tableView reloadData];
        
    }
    
    else {
        HWLog(@"1");
        self.switchString = @"推荐兼职";
        [self.tableView reloadData];
    }
}




#pragma mark  /-----筛选栏-----/

-(UIView *)backgroundSiftView
{
    if (!_backgroundSiftView) {
        _backgroundSiftView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, siftHeight)];
    }
    return _backgroundSiftView;
}


//筛选按钮的添加
-(UIView *)ycymSiftView
{
    if (!_ycymSiftView) {
        _ycymSiftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight)];
        NSArray *arr = @[@"区域",@"业务类型",@"成交数量"];
        self.si = [[SiftView alloc]initWithFrame:_ycymSiftView.bounds andArr:arr andAction:@selector(siftBtnClick:) andTaget:self];
        
        [_ycymSiftView addSubview:self.si];
        
    }
    
    return _ycymSiftView;
}

/*------筛选选择------*/
-(void)siftBtnClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.tag == 0) {
        
        self.si.btnS.selected = NO;
        self.si.btnT.selected = NO;
        
        
    }
    
    if (sender.tag == 1) {
        self.si.btnF.selected = NO;
        self.si.btnT.selected = NO;
        
        
    }
    
    if (sender.tag == 2) {
        self.si.btnF.selected = NO;
        self.si.btnS.selected = NO;
        
        
    }
    
}


#pragma mark ------滚动显示筛选条------
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = self.tableView.contentOffset.y;
    
    if (offset > 260-64-self.ycymSiftView.height ) {
        HWLog(@"开始显示");
        [UIView animateWithDuration:0.1 animations:^{
            [self.view addSubview:self.backgroundSiftView];
            self.backgroundSiftView.backgroundColor = [UIColor grayColor];
            [self.backgroundSiftView addSubview:self.ycymSiftView];
        }];
    }
    if (0<=offset && offset <260-64-self.ycymSiftView.height) {
        [UIView animateWithDuration:0.1 animations:^{
            
            [self.backgroundSiftView removeFromSuperview];
        }];
        
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
    [aut createCaruselWithFrame:CGRectMake(0, self.searchView.height, SCREEN_WIDTH, lunBoheight) WithSuperView:self.headerView WithImageUrlArr:arr WithPlaceholderImageName:@"365" WithInterval:2];
    
    [aut createPageControlWithFrame:CGRectMake(SCREEN_WIDTH-60, 50+lunBoheight-30, 30, 20) WithSuperView:self.headerView WithPageNum:arr.count WithCurrentColor:HWColor(153, 153, 153) WithTintColor:[UIColor whiteColor]];
    
    aut.delegate = self;
}
/*轮播图跳转代理*/
-(void)pushViewController:(NSInteger)tag
{
    
    HWLog(@"laniahao ");
    
}



#pragma mark /++++++tableView的代理协议++++++/
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.selectButtonView.y+self.selectButtonView.height;
        
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    
    if ([self.switchString isEqualToString:@"达人帮"]) {
        
        CMDSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[CMDSTableViewCell alloc]initWithFrame:cell.bounds];
            jzdrCell = cell;
            cell.imgView.image = [UIImage imageNamed:@"ycymHeaderImage"];
            
            cell.nameLabel.text = @"甄瑞芳";
            cell.vipIcon.image = [UIImage imageNamed:@"vip"];
            cell.salaryLabel.text = @"5-8K";
            cell.jobLabel.text = @"UI设计师";
            cell.academicIcon.image = [UIImage imageNamed:@"education"];
            cell.academicLabel.text = @"本科";
            cell.ageIcon.image = [UIImage imageNamed:@"time_image"];
            cell.ageLabel.text = @"西安";
            cell.addressIcon.image = [UIImage imageNamed:@"qpt_map_image"];
            cell.addressLabel.text = @"西安高新区i都会";
            cell.eyeIcon.image = [UIImage imageNamed:@"eyeImage"];
            cell.numLabel.text = @"3288";
            cell.detailLabel.text = @"我的优势 : 8年的下海经验，沟通能力强，口齿伶俐，思维敏捷，管理组织能力强";
        }
    }
    
    else {
        
        JZDRTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[JZDRTableViewCell alloc]initWithFrame:cell.bounds];
            jzdrCell = cell;
            cell.hMainImage.image = [UIImage imageNamed:@"qptHeader"];
            cell.payOfwaytext.text = @"日结";
            cell.zwKindText.text = @"中级UI设计师";
            cell.salaryText.text = @"80元/天";
            cell.companyText.text = @"西部家联教育有限公司";
            cell.vipImage.image = [UIImage imageNamed:@"vip"];
            cell.academicImage.image = [UIImage imageNamed:@"time_image"];
            cell.hyText.text = @"IT软件";
            cell.bigCompanyText.text =@"已上市";
            cell.academicText.text = @"长期招聘";
            cell.timeImageView.image = [UIImage imageNamed:@"time_image"];
            cell.timeText.text = @"3-5年";
            cell.mapImageView.image = [UIImage imageNamed:@"qpt_map_image"];
            cell.earaText.text = @"西安高新产业园逸翠园i都会";
            cell.eyeImage.image = [UIImage imageNamed:@"eyeImage"];
            cell.numText.text = @"3288";
            
        }
        
    }
    return jzdrCell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([self.switchString isEqualToString:@"达人帮"]) {
        
        return SCREEN_WIDTH*0.45;
    }
    
   else
        {
            return SCREEN_WIDTH*0.32;
    }
    
}


//点击cell的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HWLog(@"%zd",@(indexPath.row).intValue);
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self.searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

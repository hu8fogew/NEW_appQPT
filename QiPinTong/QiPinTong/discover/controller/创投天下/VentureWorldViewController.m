//
//  VentureWorldViewController.m
//  家长界
//
//  Created by taylor on 2016/12/12.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "VentureWorldViewController.h"

@interface VentureWorldViewController ()<UITableViewDelegate,UITableViewDataSource,WYAutoCaruselDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIView *headerView;

/*轮播数组*/
@property(nonatomic,strong)NSMutableArray *arrLunBo;

/*搜索栏*/
@property (nonatomic,strong) UIView *searchView;
@property (nonatomic,strong) UISearchBar *searchBar;

/**选择按钮视图*/
@property (nonatomic,strong) UIView *selectBtnView;
@property (nonatomic,strong) NSMutableArray *seleArr;

/**推荐视图*/
@property (nonatomic,strong) UIView *commendView;

/**列表标题视图*/
@property (nonatomic,strong) UIView *listView;

/**滚动视图*/
@property (nonatomic,strong) UIView *scrollView;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,assign)UIEdgeInsets sets;


@end

@implementation VentureWorldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    [self.headerView addSubview:self.searchView];
    [self.headerView addSubview:self.selectBtnView];
    [self.headerView addSubview:self.commendView];
    [self.headerView addSubview:self.scrollView];
    [self.headerView addSubview:self.listView];
    
    [self createAdsPageWithArr:self.arrLunBo];
    [self createUIPageControl];
    self.sets = UIEdgeInsetsMake(-20, 10, 10, 10);
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

/**选择按钮*/
-(NSMutableArray *)seleArr{
    if (!_seleArr) {
        _seleArr = [DataBase addCTTXSelectBarArr];
    }
    return _seleArr;
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


/*选择按钮视图*/
-(UIView *)selectBtnView
{
    if (!_selectBtnView) {
        _selectBtnView = [[UIView alloc]initWithFrame:CGRectMake(0,lunBoheight+50, SCREEN_WIDTH, SCREEN_WIDTH*0.22)];
        _selectBtnView.backgroundColor = [UIColor whiteColor];
        [self createSelecteActivityWithArr:self.seleArr];
    }
    return _selectBtnView;
}

#pragma mark /*****选择按钮的创建******/
/*创建选择按钮*/
-(void)createSelecteActivityWithArr:(NSArray *)source
{
    int i = 0;
    for (NSDictionary *dic in source) {
        UIView *vi = [UIView new];
        if (i<3) {
            vi.frame = CGRectMake((SCREEN_WIDTH/3)*i, 0, SCREEN_WIDTH/3, SCREEN_WIDTH*0.22);
        }
    
        vi.backgroundColor = [UIColor whiteColor];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(SCREEN_WIDTH/9, vi.height/8, SCREEN_WIDTH/10, SCREEN_WIDTH/10)];
        [button setBackgroundImage:[UIImage imageNamed:dic[@"slecteImg"]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickSeleceAction:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.cornerRadius = button.width/2;
        button.backgroundColor = [UIColor grayColor];
        button.tag = i;
        [vi addSubview:button];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, vi.height*0.7, (SCREEN_WIDTH-20)/3, 20)];
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
        GoodItemsViewController *goodVC = [GoodItemsViewController new];
        [self.navigationController pushViewController:goodVC animated:YES];
    }
    
    if (sender.tag == 1) {
        HWLog(@"1");
        PartnerViewController *parVC = [PartnerViewController new];
        [self.navigationController pushViewController:parVC animated:YES];
    }
    
    if (sender.tag == 2) {
        HWLog(@"2");
        InstitutionViewController *insVC = [InstitutionViewController new];
        [self.navigationController pushViewController:insVC animated:YES];
    }
    
    HWLog(@"%zd",sender.tag);
    
}

/*推荐视图*/
-(UIView *)commendView{
    if (!_commendView) {
        _commendView = [[UIView alloc]initWithFrame:CGRectMake(0, self.selectBtnView.y+self.selectBtnView.height, SCREEN_WIDTH, 80)];
        _commendView.backgroundColor = HWColor(241, 241, 241);
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 70)];
        view.backgroundColor = [UIColor whiteColor];
        [_commendView addSubview:view];
        
        UILabel *commendLabel = [UILabel new];
        commendLabel.font = [UIFont systemFontOfSize:18];
        commendLabel.textColor = HWColor(51, 51, 51);
        commendLabel.text = @"项目推荐";
        [self.commendView addSubview:commendLabel];
        [commendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.commendView);
        }];
        
        UIView *hView = [UIView new];
        hView.backgroundColor = HWColor(51, 51, 51);
        [self.commendView addSubview:hView];
        [hView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(commendLabel.mas_bottom).with.offset(13);
            make.centerX.equalTo(commendLabel);
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(1);
        }];
        
        UIButton *arrowBtn = [UIButton new];
        [arrowBtn setImage:[UIImage imageNamed:@"rightImage"] forState:UIControlStateNormal];
        [arrowBtn addTarget:self action:@selector(commendArrowBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.commendView addSubview:arrowBtn];
        [arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(commendLabel);
            make.right.equalTo(self.commendView).with.offset(-10);
            make.width.mas_equalTo(15);
            make.height.mas_equalTo(15);
        }];
    }
    return _commendView;
}

/**滚动视图*/
-(UIView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIView alloc]initWithFrame:CGRectMake(0, self.commendView.y+self.commendView.height, SCREEN_WIDTH, SCREEN_WIDTH*0.76)];
        _scrollView.backgroundColor = HWColor(241, 241, 241);
        
        [_scrollView addSubview:self.collectionView];
    }
    return _scrollView;
}


-(void)commendArrowBtnClick{
    HWLog(@"where");
}

-(UIView *)listView{
    if (!_listView) {
        _listView = [[UIView alloc]initWithFrame:CGRectMake(0, self.scrollView.y+self.scrollView.height, SCREEN_WIDTH, 80)];
        _listView.backgroundColor = HWColor(241, 241, 241);
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 70)];
        view.backgroundColor = [UIColor whiteColor];
        [_listView addSubview:view];
        
        UILabel *listLabel = [UILabel new];
        listLabel.font = [UIFont systemFontOfSize:18];
        listLabel.textColor = HWColor(51, 51, 51);
        listLabel.text = @"同城路演";
        [_listView addSubview:listLabel];
        [listLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_listView);
        }];
        
        UIView *hView = [UIView new];
        hView.backgroundColor = HWColor(51, 51, 51);
        [_listView addSubview:hView];
        [hView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(listLabel.mas_bottom).with.offset(13);
            make.centerX.equalTo(listLabel);
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(1);
        }];
        
        UIButton *arrowBtn = [UIButton new];
        [arrowBtn setImage:[UIImage imageNamed:@"rightImage"] forState:UIControlStateNormal];
        [arrowBtn addTarget:self action:@selector(listArrowBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_listView addSubview:arrowBtn];
        [arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(listLabel);
            make.right.equalTo(_listView).with.offset(-10);
            make.width.mas_equalTo(15);
            make.height.mas_equalTo(15);
        }];
    }
    return _listView;
}

-(void)listArrowBtnClick{
    HWLog(@"njdnfjkdj");
}

#pragma mark /*****轮播图的实现*****/
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

#pragma mark///////////////---start---/////////////////
#pragma mark ------创建collectionview--------
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        //1.初始化layout
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //该方法也可以设置itemSize
        layout.itemSize =CGSizeMake(SCREEN_WIDTH*0.46, SCREEN_WIDTH*0.6);
        //2.初始化collectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.76) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        //3.注册collectionViewCell
        [_collectionView registerClass:[ComOnlineCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        _collectionView.pagingEnabled = YES;
        _collectionView.tag = 10;
        
        //4.设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

#pragma mark /========定义翻页控件========/
-(void)createUIPageControl{
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH*0.67, SCREEN_WIDTH, 20)];
    [self.scrollView addSubview:self.pageControl];
    self.pageControl.numberOfPages = 4;
    self.pageControl.currentPage = 0;
    //点颜色
    self.pageControl.pageIndicatorTintColor = HWColor(153, 153, 153);
    //当前页的颜色
    self.pageControl.currentPageIndicatorTintColor = HWColor(67, 159, 223);
    [self.pageControl addTarget:self action:@selector(onChange:) forControlEvents:UIControlEventValueChanged];
    self.pageControl.tag = 11;
    
    self.pageControl.userInteractionEnabled = NO;
    
}

//翻页控件出发方法
-(void)onChange:(UIPageControl *)page{
    HWLog(@"翻页控件响应");
    
    self.collectionView = (id)[self.scrollView viewWithTag:10];
    
    //设置偏移量   根据翻页控件的当前页 计算获取偏移量
    self.collectionView.contentOffset = CGPointMake(page.currentPage*SCREEN_WIDTH, 0);
}

//滚动视图已经完成滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    HWLog(@"滚动视图完成滚动");
    
    //CGFloat verX = self.collectionView.contentOffset.x;
//    
//    if (verX < SCREEN_WIDTH && 0 <= verX) {
//        self.sets = UIEdgeInsetsMake(-20, 10, 10, 10);
//    }
//    if (verX <= SCREEN_WIDTH && verX > 0) {
//        self.sets = UIEdgeInsetsMake(-20, 20, 10, 10);
//    }
//    if (verX <= SCREEN_WIDTH*2 && verX > SCREEN_WIDTH) {
//        self.sets = UIEdgeInsetsMake(-20, 30, 10, 20);
//    }
//    if (verX <= SCREEN_WIDTH*3 && verX > SCREEN_WIDTH*2) {
//        self.sets = UIEdgeInsetsMake(-20, 30, 10, 10);
//    }
    
    UIPageControl *page = (id)[self.scrollView viewWithTag:11];
    
    //设置翻页控件的当前页  通过偏移量进行计算
    
    for (int i = 0; i<4; i++) {
        page.currentPage = (scrollView.contentOffset.x+i*10)/SCREEN_WIDTH;
    }
}

#pragma mark - /++++++++UICollectionView方法++++++/
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 8;
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return self.sets;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    ComOnlineCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.imgView.image = [UIImage imageNamed:@"mq_image.jpeg"];
    cell.titleLabel.text = @"琅琊榜胡歌";
    cell.NoLabel.text = @"3228";
    cell.proLabel.text = @"IT软件";
    cell.typeLabel.text = @"已上市";
    cell.addressLabel.text = @"西安";
    cell.infoLabel.text = @"热招：";
    cell.contentLabel.text = @"ios程序猿";
    cell.contsLabel.text = @"等18个职位";
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];

    ComOnlineViewController *vc = [ComOnlineViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark //////////////---end---////////////////


#pragma mark -----tableview及方法------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height+self.searchView.height+self.selectBtnView.height+self.commendView.height+self.scrollView.height+self.listView.height;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return SCREEN_WIDTH*0.36;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    VentureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[VentureTableViewCell alloc]initWithFrame:cell.bounds];
        cell.imgView.image = [UIImage imageNamed:@"leader"];
        cell.titleLabel.text = @"奋斗大讲堂之中信出版卢俊义：匠人精神月商业社会";
        cell.addressIcon.image = [UIImage imageNamed:@"qpt_map_image"];
        cell.addressLabel.text = @"西安";
        cell.dateIcon.image = [UIImage imageNamed:@"time_image"];
        cell.dateLabel.text = @"12月12日";
        cell.numberLabel.text = @"已报名30项目";
        cell.detailLabel.text = @"主办方：华为企业云、赛富互联网金融孵化器、Opark创业中国";
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self.searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

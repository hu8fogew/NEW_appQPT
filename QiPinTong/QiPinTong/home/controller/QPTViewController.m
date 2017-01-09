//
//  QPTViewController.m
//  家长界
//
//  Created by mac on 2016/11/26.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "QPTViewController.h"

@interface QPTViewController ()<UITableViewDelegate,UITableViewDataSource,WYAutoCaruselDelegate,SGSegmentedControlDelegate,UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIGestureRecognizerDelegate>

/*tableview*/
@property (nonatomic,strong) UITableView *QptTable;

/*HeaderView*/
@property (nonatomic,strong) UIView *qptHeaderView;

/**搜索框*/
@property (nonatomic,strong) UIView *searchView;
@property (nonatomic,strong) UISearchBar *searchBar;

/*选择按钮视图*/
@property (nonatomic,strong) UIView *selectBtnView;

/*抢通币视图*/
@property (nonatomic,strong) UIView *tbView;

/**每日必读*/
@property (nonatomic,strong) UIView *newsView;
@property (nonatomic,nullable,strong)NSArray *adArr;
@property (nonatomic,strong) CCPScrollView *ccp;
/**滚动视图*/
@property (nonatomic,strong) UIView *scrollView;
@property (nonatomic,strong) UIScrollView *myScroll;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) UIImageView *imgView;

/**名企在线视图*/
@property (nonatomic,strong) UIView *mqzxView;
@property (nonatomic,strong) UICollectionView *mqzxCollection;

/**有才有貌视图*/
@property (nonatomic,strong) UIView *ycymView;
@property (nonatomic,strong) UICollectionView *ycymCollection;

/*页面切换视图*/
@property (nonatomic,strong) UIView *siftView;

/*轮播数组*/
@property (nonatomic,strong) NSMutableArray *arrLunBo;

/*选择按钮数组*/
@property (nonatomic,strong) NSMutableArray *seleArr;

@property (nonatomic,copy) NSString *segStr;

/*选择条目*/
@property (nonatomic,strong) SGSegmentedControl *segment;

/*bottomView*/
@property (nonatomic,strong) UIView *qptBottomView;
@property (nonatomic,strong) UILabel *moreLabel;
@property (nonatomic,strong) UILabel *blueLabel;

@end

@implementation QPTViewController

-(NSArray *)adArr
{
    if (!_adArr) {
        _adArr = [DataBase addAdverArray];
    }
    return _adArr;
}


id qptCell = nil;
id collectCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"企聘通";
    NSString *str = [UIDevice devicePlatForm];
    HWLog(@"%@",str);
    
    
    HWLog(@"========%f",MTitleSize);
    [self.view addSubview:self.QptTable];
    [self.qptHeaderView addSubview:self.searchView];
    [self.qptHeaderView addSubview:self.selectBtnView];
    [self.qptHeaderView addSubview:self.tbView];
    [self.qptHeaderView addSubview:self.newsView];
    [self.qptHeaderView addSubview:self.scrollView];
    [self.qptHeaderView addSubview:self.mqzxView];
    [self.qptHeaderView addSubview:self.ycymView];
    [self.qptHeaderView addSubview:self.siftView];
    
    [self.mqzxView addSubview:self.mqzxCollection];
    [self.ycymView addSubview:self.ycymCollection];

    [self createAdsPageWithArr:self.arrLunBo];
    
    [self createUIScrollView];
    [self createUIPageControl];
    
    [self addBottomView];
    
    NSArray *arr = @[@"全职速聘",@"高薪兼职"];
    
    [self createSeleBarViewWithArr:arr];
    
    self.segStr = @"全职速聘";
    [self adViewAction];
}

#pragma mark -----------每日必读时间响应
-(void)adViewAction
{
    [self.ccp clickTitleLabel:^(NSInteger index, NSString *titleString) {
       
        HWLog(@"---------====%zd",index);
        HWLog(@"++++_____++++_+%@",titleString);
    }];
}


#pragma mark /*************懒加载**************/

/*轮播*/
-(NSMutableArray *)arrLunBo
{
    if (!_arrLunBo) {
        _arrLunBo = [DataBase addSelecteArray];
        
    }
    return _arrLunBo;
}

/*选择按钮*/
-(NSMutableArray *)seleArr
{
    if (!_seleArr) {
        _seleArr = [DataBase addQptSeleBarArray];
    }
    
    return _seleArr;
}

/*headerView*/
-(UIView *)qptHeaderView
{
    if (!_qptHeaderView) {
        _qptHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight)];
        _qptHeaderView.backgroundColor = HWColor(241, 241, 241);
        
    }
    return _qptHeaderView;
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
        _selectBtnView = [[UIView alloc]initWithFrame:CGRectMake(0, self.qptHeaderView.y+self.qptHeaderView.height+50, SCREEN_WIDTH, SCREEN_WIDTH*0.28)];
        _selectBtnView.backgroundColor = [UIColor whiteColor];
        [self createSelecteActivityWithArr:self.seleArr];
    }
    return _selectBtnView;
}

/**抢通币*/
-(UIView *)tbView{
    if (!_tbView) {
        _tbView = [[UIView alloc]initWithFrame:CGRectMake(0, self.selectBtnView.y+self.selectBtnView.height+7, SCREEN_WIDTH, SCREEN_WIDTH*0.2)];
        _tbView.backgroundColor = [UIColor whiteColor];
        
        UIImageView *tbImage = [UIImageView new];
        tbImage.image = [UIImage imageNamed:@"tbImage"];
        [_tbView addSubview:tbImage];
        [tbImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_tbView).with.offset(10);
            make.centerY.equalTo(_tbView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.15, SCREEN_WIDTH*0.15));
        }];
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
        titleLabel.text = @"抢通币";
        titleLabel.textColor = [UIColor blackColor];
        [_tbView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(tbImage).with.offset(5);
            make.left.equalTo(tbImage.mas_right).with.offset(45);
        }];
        
        UILabel *subLabel = [UILabel new];
        subLabel.font = [UIFont systemFontOfSize:16];
        subLabel.text = @"免费兑换,可提现";
        subLabel.textColor = HWColor(153, 153, 153);
        [_tbView addSubview:subLabel];
        [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(titleLabel);
            make.top.equalTo(titleLabel.mas_bottom).with.offset(5);
        }];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"抢取" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.layer.backgroundColor = [HWColor(222, 26, 45)CGColor];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 2;
        [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        [_tbView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_tbView).with.offset(-10);
            make.centerY.equalTo(_tbView);
            make.size.mas_equalTo(CGSizeMake(60, 30));
        }];
        
    }
    return _tbView;
}

-(void)buttonClick{
    HWLog(@"66666");
    RobCoinViewController *vc = [RobCoinViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

/**每日必读*/
-(UIView *)newsView{
    if (!_newsView) {
        _newsView = [[UIView alloc]initWithFrame:CGRectMake(0, self.tbView.y+self.tbView.height+7, SCREEN_WIDTH, SCREEN_WIDTH*0.12)];
        _newsView.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(10, _newsView.height/4, _newsView.height/2, _newsView.height/2)];
        
        imageV.image = [UIImage imageNamed:@"易通学院"];
        [_newsView addSubview:imageV];
        
        CCPScrollView *ccp = [[CCPScrollView alloc]initWithFrame:CGRectMake(40, 10, SCREEN_WIDTH-50, _newsView.height-20)];
        
        ccp.titleArray = self.adArr;
        self.ccp = ccp;
        [_newsView addSubview:ccp];
    }
    return _newsView;
}

/**滚动视图*/
-(UIView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIView alloc]initWithFrame:CGRectMake(0, self.newsView.y+self.newsView.height+1, SCREEN_WIDTH, SCREEN_WIDTH*0.43)];
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}

/**名企在线*/
-(UIView *)mqzxView{
    if (!_mqzxView) {
        _mqzxView = [[UIView alloc]initWithFrame:CGRectMake(0, self.scrollView.y+self.scrollView.height+10, SCREEN_WIDTH, SCREEN_WIDTH*0.9)];
        _mqzxView.backgroundColor = [UIColor whiteColor];
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
        titleLabel.text = @"名企在线";
        titleLabel.textColor = [UIColor blackColor];
        [_mqzxView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_mqzxView).with.offset(20);
            make.centerX.equalTo(_mqzxView);
        }];
        
        UILabel *subLabel = [UILabel new];
        subLabel.font = [UIFont systemFontOfSize:15];
        subLabel.text = @"年薪百万不是梦,高薪职位等你来";
        subLabel.textColor = HWColor(153, 153, 153);
        [_mqzxView addSubview:subLabel];
        [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(titleLabel);
            make.top.equalTo(titleLabel.mas_bottom).with.offset(8);
        }];
        
        UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [moreBtn setTitle:@"查看更多" forState:UIControlStateNormal];
        moreBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [moreBtn setTitleColor:HWColor(153, 153, 153) forState:UIControlStateNormal];
        [moreBtn setImage:[UIImage imageNamed:@"rightImage"] forState:UIControlStateNormal];
        moreBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
        moreBtn.imageEdgeInsets = UIEdgeInsetsMake(17, 75, 17, -75);
        [moreBtn addTarget:self action:@selector(mqzxMoreBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_mqzxView addSubview:moreBtn];
        [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_mqzxView);
            make.bottom.equalTo(_mqzxView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(100, 50));
        }];
        
    }
    return _mqzxView;
}

-(void)mqzxMoreBtnClick{
    
    HWLog(@"mqzx");
    
    ComOnlineViewController *vc = [ComOnlineViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

/**有才有貌**/
-(UIView *)ycymView{
    if (!_ycymView) {
        _ycymView = [[UIView alloc]initWithFrame:CGRectMake(0, self.mqzxView.y+self.mqzxView.height+10, SCREEN_WIDTH, SCREEN_WIDTH*0.9)];
        _ycymView.backgroundColor = [UIColor whiteColor];
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
        titleLabel.text = @"有才有貌";
        titleLabel.textColor = [UIColor blackColor];
        [_ycymView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_ycymView).with.offset(20);
            make.centerX.equalTo(_ycymView);
        }];
        
        UILabel *subLabel = [UILabel new];
        subLabel.font = [UIFont systemFontOfSize:15];
        subLabel.text = @"有才又有貌,才貌双全让我们的人生更加精彩";
        subLabel.textColor = HWColor(153, 153, 153);
        [_ycymView addSubview:subLabel];
        [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(titleLabel);
            make.top.equalTo(titleLabel.mas_bottom).with.offset(8);
        }];
        
        UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [moreBtn setTitle:@"查看更多" forState:UIControlStateNormal];
        moreBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [moreBtn setTitleColor:HWColor(153, 153, 153) forState:UIControlStateNormal];
        [moreBtn setImage:[UIImage imageNamed:@"rightImage"] forState:UIControlStateNormal];
        moreBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
        moreBtn.imageEdgeInsets = UIEdgeInsetsMake(17, 75, 17, -75);
        [moreBtn addTarget:self action:@selector(ycymMoreBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_ycymView addSubview:moreBtn];
        [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_ycymView);
            make.bottom.equalTo(_ycymView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(100, 50));
        }];
    }
    return _ycymView;
}

-(void)ycymMoreBtnClick{
    HWLog(@"ycym");
    YCYMViewController *vc = [YCYMViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

/*页面切换*/
-(UIView *)siftView{
    if (!_siftView) {
        _siftView = [[UIView alloc]initWithFrame:CGRectMake(0, self.ycymView.y+self.ycymView.height+10, SCREEN_WIDTH, 50)];
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        vi.backgroundColor = [UIColor whiteColor];
        [_siftView addSubview:vi];
    }
    return _siftView;
}

/*bottomView*/
-(UIView *)qptBottomView
{
    if (!_qptBottomView) {
        _qptBottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.17)];
     
        _qptBottomView.backgroundColor = HWColor(241, 241, 241);
    }
    return _qptBottomView;
}

#pragma mark  /------创建底部视图-----/
-(void)addBottomView
{
    UIView *vio = [[UIView alloc]initWithFrame:CGRectMake(10, SCREEN_WIDTH*0.1*0.2, SCREEN_WIDTH-20, SCREEN_WIDTH*0.1)];
    vio.backgroundColor = [UIColor whiteColor];
    vio.layer.cornerRadius = 4;
    [self.qptBottomView addSubview:vio];
    
    self.moreLabel = [UILabel new];
    self.moreLabel.font = [UIFont systemFontOfSize:16];
    self.moreLabel.textColor = HWColor(153, 153, 153);
    self.moreLabel.textAlignment = NSTextAlignmentRight;
    [vio addSubview:self.moreLabel];
    [self.moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(vio);
        make.left.equalTo(vio).with.offset(SCREEN_WIDTH/4);
    }];
    
    self.blueLabel = [UILabel new];
    self.blueLabel.font = [UIFont systemFontOfSize:16];
    self.blueLabel.textColor = HWColor(61, 158, 226);
    [vio addSubview:self.blueLabel];
    self.blueLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapgest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(qzspClick)];
    [self.blueLabel addGestureRecognizer:tapgest];
    [self.blueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.moreLabel.mas_right);
        make.centerY.equalTo(self.moreLabel);
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:HWColor(61, 158, 226) forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"rightImage"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(qzspClick) forControlEvents:UIControlEventTouchUpInside];
    [vio addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.blueLabel.mas_right).with.offset(2);
        make.centerY.equalTo(self.blueLabel);
        make.size.mas_equalTo(CGSizeMake(16, 16));
    }];
    
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH*0.16, SCREEN_WIDTH, SCREEN_WIDTH*0.11)];
    vi.backgroundColor = [UIColor whiteColor];
    
    [self.qptBottomView addSubview:vi];
    
}

//进入全职速聘
-(void)qzspClick
{
    if ([self.segStr isEqualToString:@"全职速聘"]){
        HWLog(@"全职速聘");
        QZSPViewController *vc = [QZSPViewController new];
        [self.navigationController pushViewController:vc animated:YES];

    }
    
    else{
        
        HWLog(@"兼职达人");
        JZDRViewController *vc = [JZDRViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


#pragma mark /-----轮播图的实现------/
-(void)createAdsPageWithArr:(NSMutableArray *)source
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in source) {
        [arr addObject:[dic objectForKey:@"slecteImg"]];
    }
    //封装的轮播view实现
    WYAutoCarusel *aut = [[WYAutoCarusel alloc]init];
    [aut createCaruselWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, lunBoheight) WithSuperView:self.qptHeaderView WithImageUrlArr:arr WithPlaceholderImageName:@"lunbo1" WithInterval:2];
    
    [aut createPageControlWithFrame:CGRectMake(SCREEN_WIDTH-60, lunBoheight+20, 30, 20) WithSuperView:self.qptHeaderView WithPageNum:arr.count WithCurrentColor:HWColor(248, 114, 1) WithTintColor:[UIColor whiteColor]];
    
    aut.delegate = self;
}
/*轮播图跳转代理*/
-(void)pushViewController:(NSInteger)tag
{
    
    HWLog(@"laniahao ");
    
}

#pragma mark /-----选择条目列表------/
-(void)createSeleBarViewWithArr:(NSArray *)arrTitle
{
    self.segment = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49) delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:arrTitle];
    self.segment.titleColorStateNormal = HWColor(102, 102, 102);
    self.segment.titleColorStateSelected = HWColor(51, 51, 51);
    self.segment.indicatorColor = HWColor(51, 51, 51);
    [self.siftView addSubview:self.segment];
}

-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index
{
    if (index == 0) {
        HWLog(@"0");
        self.segStr = @"全职速聘";
        [self.QptTable reloadData];
        
    }
    
    else {
        HWLog(@"1");
        self.segStr = @"高薪兼职";
        [self.QptTable reloadData];
    }
}


#pragma mark /------选择按钮的创建------/
/*创建选择按钮*/
-(void)createSelecteActivityWithArr:(NSArray *)source
{
    int i = 0;
    for (NSDictionary *dic in source) {
        UIView *vi = [[UIView alloc]init];
        if (i<3) {
             vi.frame = CGRectMake(((SCREEN_WIDTH-20)/3)*i+10, 0, (SCREEN_WIDTH-20)/3, (SCREEN_WIDTH-80)/3);
        }
        
        vi.backgroundColor = [UIColor whiteColor];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake((SCREEN_WIDTH-20)/9, (SCREEN_WIDTH-20)/18, (SCREEN_WIDTH-20)/9, (SCREEN_WIDTH-20)/9)];
        [button setBackgroundImage:[UIImage imageNamed:dic[@"slecteImg"]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickSeleceAction:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.cornerRadius = button.width/2;
//        button.layer.masksToBounds =YES;
        button.backgroundColor = [UIColor grayColor];
        button.tag = i;
        [vi addSubview:button];
        //添加文字
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, (SCREEN_WIDTH-20)*5/25, (SCREEN_WIDTH-20)/3, 20)];
        label.text = dic[@"labTitle"];
        label.font = [UIFont systemFontOfSize:16];
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
        
        YCYMViewController *vc = [[YCYMViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
   
    else if (sender.tag == 1) {
        HWLog(@"1");
        Campus365ViewController *vc = [Campus365ViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    else {
        HWLog(@"2");
        YSYKViewController *vc = [YSYKViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    HWLog(@"%zd",sender.tag);
    
}

////////////////////////////////////////
#pragma mark /-----定义滚动视图------/
-(void)createUIScrollView{
    //定义滚动视图
    self.myScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, SCREEN_WIDTH*0.43-20)];
    self.myScroll.backgroundColor = [UIColor whiteColor];
    self.myScroll.showsHorizontalScrollIndicator = NO;
    self.myScroll.tag = 10;
    self.myScroll.delegate = self;
    [self.scrollView addSubview:self.myScroll];
    
    NSArray *imgViews = @[@"scroll1.jpg",@"scroll2.jpg",@"scroll3.jpg",@"scroll2.jpg"];
    for (int i=0; i<imgViews.count; i++) {
        self.imgView = [[UIImageView alloc]init];
        self.imgView.frame = CGRectMake(10*(i+1)+i*(SCREEN_WIDTH-10), 0, SCREEN_WIDTH-20, SCREEN_WIDTH*0.3);
        
        self.imgView.image = [UIImage imageNamed:imgViews[i]];
        [self.myScroll addSubview:self.imgView];
        
    }
    
    //设置属性
    //显示内容的大小
    self.myScroll.contentSize = CGSizeMake(4*SCREEN_WIDTH, 0);
    //显示内容的偏移量
    self.myScroll.contentOffset = CGPointMake(0, 0);
    //按页进行滑动
    self.myScroll.pagingEnabled = YES;
    
}

#pragma mark /------定义翻页控件-------/
-(void)createUIPageControl{
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH*0.35, SCREEN_WIDTH, 20)];
    [self.scrollView addSubview:self.pageControl];
    //翻页 个数
    self.pageControl.numberOfPages = 4;
    //当前页
    self.pageControl.currentPage = 0;
    //点颜色
    self.pageControl.pageIndicatorTintColor = HWColor(153, 153, 153);
    //当前页的颜色
    self.pageControl.currentPageIndicatorTintColor = HWColor(67, 159, 223);
    //添加事件
    [self.pageControl addTarget:self action:@selector(onChange:) forControlEvents:UIControlEventValueChanged];
    self.pageControl.tag = 11;
    
}

//翻页控件出发方法
-(void)onChange:(UIPageControl *)page{
    HWLog(@"翻页控件响应");
    
    UIScrollView *myScroll = (id)[self.scrollView viewWithTag:10];
    
    //设置偏移量   根据翻页控件的当前页 计算获取偏移量
    myScroll.contentOffset = CGPointMake(page.currentPage*SCREEN_WIDTH, 0);
}

//滚动视图已经完成滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    UIPageControl *page = (id)[self.scrollView viewWithTag:11];
    
    //设置翻页控件的当前页  通过偏移量进行计算
    page.currentPage = scrollView.contentOffset.x/SCREEN_WIDTH;
    
}

////////////////////////////////////////////////

#pragma mark /------创建名企在线collectionview-------/
-(UICollectionView *)mqzxCollection{
    if (!_mqzxCollection) {
        
        //1.初始化layout
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //该方法也可以设置itemSize
        layout.itemSize =CGSizeMake(SCREEN_WIDTH*0.41, SCREEN_WIDTH*0.54);
        layout.minimumInteritemSpacing = 10;
        
        //2.初始化collectionView
        _mqzxCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(10, SCREEN_WIDTH*0.22, SCREEN_WIDTH-20, SCREEN_WIDTH*0.54) collectionViewLayout:layout];
        [self.mqzxView addSubview:_mqzxCollection];
        _mqzxCollection.backgroundColor = [UIColor whiteColor];
        _mqzxCollection.showsHorizontalScrollIndicator = NO;
        
        //3.注册collectionViewCell
        [_mqzxCollection registerClass:[QPTHomeCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        //4.设置代理
        _mqzxCollection.delegate = self;
        _mqzxCollection.dataSource = self;
    }
    return _mqzxCollection;
}

#pragma mark /------创建有才有貌collectionview-------/
-(UICollectionView *)ycymCollection{
    if (!_ycymCollection) {
        
        //1.初始化layout
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //该方法也可以设置itemSize
        layout.itemSize =CGSizeMake(SCREEN_WIDTH*0.41, SCREEN_WIDTH*0.54);
        layout.minimumInteritemSpacing = 10;
        
        //2.初始化collectionView
        _ycymCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(10, SCREEN_WIDTH*0.22, SCREEN_WIDTH-20, SCREEN_WIDTH*0.54) collectionViewLayout:layout];
        [self.ycymView addSubview:_ycymCollection];
        _ycymCollection.backgroundColor = [UIColor whiteColor];
        _ycymCollection.showsHorizontalScrollIndicator = NO;
        
        //3.注册collectionViewCell
        [_ycymCollection registerClass:[QPTHomeCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        //4.设置代理
        _ycymCollection.delegate = self;
        _ycymCollection.dataSource = self;
    }
    return _ycymCollection;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    QPTHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if ([collectionView isEqual:self.mqzxCollection]) {
        collectCell = cell;
        cell.imgView.image = [UIImage imageNamed:@"venture"];
        cell.titleLabel.text = @"苗仔";
        cell.vIcon.image = [UIImage imageNamed:@"vip"];
        cell.eIcon.image = [UIImage imageNamed:@"eyeImage"];
        cell.NoLabel.text = @"3228";
        cell.addressIcon.image = [UIImage imageNamed:@"qpt_map_image"];
        cell.addressLabel.text = @"西安";
        cell.ageIcon.image = [UIImage imageNamed:@"time_image"];
        cell.ageLabel.text = @"3年";
        cell.educationLabel.text = @"本科";
        cell.educationIcon.image = [UIImage imageNamed:@"education"];
        cell.infoLabel.text = @"热招:";
        cell.contentLabel.text = @"销售代表";
        cell.contsLabel.text = @"等18个职位";
        
    }
    else{
        collectCell = cell;
        cell.imgView.image = [UIImage imageNamed:@"mq_image.jpeg"];
        cell.titleLabel.text = @"苗仔";
        cell.vIcon.image = [UIImage imageNamed:@"vip"];
        cell.postLabel.text = @"UI设计师";
        cell.addressIcon.image = [UIImage imageNamed:@"qpt_map_image"];
        cell.addressLabel.text = @"西安";
        cell.ageIcon.image = [UIImage imageNamed:@"time_image"];
        cell.ageLabel.text = @"3年";
        cell.educationLabel.text = @"本科";
        cell.educationIcon.image = [UIImage imageNamed:@"education"];
        cell.priceLabel.text = @"5-8K";
        cell.numberLabel.text = @"3228";
        cell.numberIcon.image = [UIImage imageNamed:@"eyeImage"];
    }
    
    return collectCell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    HWLog(@"66666600004");
    if ([collectionView isEqual:self.mqzxCollection]) {
        YCComDeViewController *vc = [YCComDeViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        YCPersonDeViewController *vc = [YCPersonDeViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark  /++++++tableView及方法++++++/

-(UITableView *)QptTable
{
    if (!_QptTable) {
        _QptTable = [[UITableView alloc]initWithFrame:self.view.bounds];
        _QptTable.delegate = self;
        _QptTable.dataSource = self;
        _QptTable.tableHeaderView = self.qptHeaderView;
        _QptTable.tableHeaderView.height =self.siftView.y+self.siftView.height;
        
        _QptTable.tableFooterView = self.qptBottomView;
        _QptTable.tableFooterView.height = self.qptBottomView.height;
        
        _QptTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _QptTable;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    
    if ([self.segStr isEqualToString:@"全职速聘"]) {
        
        self.moreLabel.text = @"更多职位,进入";
        self.blueLabel.text = @"全职速聘";
        
        HotZWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[HotZWTableViewCell alloc]initWithFrame:cell.bounds];
            qptCell = cell;
            cell.hMainImage.image = [UIImage imageNamed:@"qptHeader"];
            cell.zwKindText.text = @"中级UI设计师";
            cell.salaryText.text = @"5-8k";
            cell.companyText.text = @"西部家联教育有限公司";
            cell.vipImage.image = [UIImage imageNamed:@"vip"];
            cell.academicImage.image = [UIImage imageNamed:@"acaImgae"];
            cell.hyText.text = @"IT软件";
            cell.bigCompanyText.text =@"已上市";
            cell.academicText.text = @"本科";
            cell.timeImageView.image = [UIImage imageNamed:@"time_image"];
            cell.timeText.text = @"3-5年";
            cell.mapImageView.image = [UIImage imageNamed:@"qpt_map_image"];
            cell.earaText.text = @"西安高新产业园逸翠园i都会";
            cell.eyeImage.image = [UIImage imageNamed:@"eyeImage"];
            cell.numText.text = @"3288";
            
        }
 
    }
    
    else{
        
        self.moreLabel.text = @"更多兼职,进入";
        self.blueLabel.text = @"兼职达人";
        
        JZDRTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[JZDRTableViewCell alloc]initWithFrame:cell.bounds];
                qptCell = cell;
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
                cell.timeImageView.image = [UIImage imageNamed:@"人数"];
                cell.timeText.text = @"招聘人数 : 20";
                cell.mapImageView.image = [UIImage imageNamed:@"qpt_map_image"];
                cell.earaText.text = @"西安高新产业园逸翠园i都会";
                cell.eyeImage.image = [UIImage imageNamed:@"eyeImage"];
                cell.numText.text = @"3288";
                
            }
            
        }
    
    return qptCell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        return SCREEN_WIDTH*0.32;

}

//tableView的代理方法
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

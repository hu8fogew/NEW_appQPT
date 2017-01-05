//
//  Campus365ViewController.m
//  企聘通
//
//  Created by taylor on 2016/11/26.
//  Copyright © 2016年 taylorZhang. All rights reserved.
//

#import "Campus365ViewController.h"
#import "Campus365TableViewCell.h"
@interface Campus365ViewController ()<UITableViewDelegate,UITableViewDataSource,SGSegmentedControlDelegate,WYAutoCaruselDelegate,UIScrollViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

/*tableView的headerView*/
@property (nonatomic,strong) UIView *headerView;

/**校聘通*/
@property (nonatomic,strong) UIView *activityView;

/*校招专场view*/
@property (nonatomic,strong) UIView *campusView;

/*页面切换视图*/
@property (nonatomic,strong) UIView *seleBarView;

/*按钮数组*/
@property (nonatomic,strong) NSArray *seleBarArr;

@property (nonatomic,strong) SGSegmentedControl *segment;

@property (nonatomic,strong) NSString *segStr;

/*轮播数组*/
@property(nonatomic,strong)NSMutableArray *arrLunBo;

/*选择按钮视图*/
@property (nonatomic,strong) UIView *selectBtnView;

/*选择按钮数组*/
@property (nonatomic,strong) NSMutableArray *seleArr;

/**滚动视图*/
@property (nonatomic,strong) UIView *scrollView;
@property (nonatomic,strong) UIScrollView *myScroll;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) UIImageView *imgView;

@end

@implementation Campus365ViewController

id campusCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"校园365";
    
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self createAdsPageWithArr:self.arrLunBo];
    
    self.seleBarArr = @[@"热门兼职",@"最新职位"];
    [self createSeleBarView];
    
    [self.headerView addSubview:self.activityView];
    [self.headerView addSubview:self.selectBtnView];
    [self.headerView addSubview:self.campusView];
    [self.headerView addSubview:self.seleBarView];
    [self.headerView addSubview:self.scrollView];
    
    [self createUIScrollView];
    [self createUIPageControl];
}

#pragma mark ----懒加载----

/*轮播*/
-(NSMutableArray *)arrLunBo
{
    if (!_arrLunBo) {
        _arrLunBo = [DataBase addSelecteArray];
        
    }
    return _arrLunBo;
}

/*选择*/
-(NSMutableArray *)seleArr{
    if (!_seleArr) {
        _seleArr = [DataBase addCampusSelectBarArray];
    }
    return _seleArr;
}


/*tableView的headerView*/
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight+50)];
        _headerView.backgroundColor = HWColor(241, 241, 241);
    }
    return _headerView;
}

/**校聘通，一键领取**/
-(UIView *)activityView{
    if (!_activityView) {
        _activityView = [[UIView alloc]initWithFrame:CGRectMake(0, lunBoheight, SCREEN_WIDTH, 50)];
        _activityView.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imgView = [UIImageView new];
        imgView.image = [UIImage imageNamed:@"ycym_image"];
        [_activityView addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_activityView).with.offset(15);
            make.centerY.equalTo(_activityView);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        
        UILabel *lab = [UILabel new];;
        lab.font = [UIFont systemFontOfSize:16];
        lab.textColor = HWColor(102, 102, 102);
        lab.text = @"校聘通 , 兼职无忧";
        [_activityView addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imgView.mas_right).with.offset(5);
            make.centerY.equalTo(imgView);
        }];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"一键领取" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.layer.borderWidth = 1;
        button.layer.borderColor = [HWColor(135, 173, 148)CGColor];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 15;
        [button setTitleColor:HWColor(135, 173, 148) forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
        [_activityView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_activityView).with.offset(-15);
            make.centerY.equalTo(imgView);
            make.size.mas_equalTo(CGSizeMake(90, 30));
        }];
    }
    return _activityView;
}

-(void)clickBtn{
    
    HWLog(@"66666");
}

/*选择按钮视图*/
-(UIView *)selectBtnView
{
    if (!_selectBtnView) {
        _selectBtnView = [[UIView alloc]initWithFrame:CGRectMake(0,self.activityView.y+self.activityView.height+7, SCREEN_WIDTH, SCREEN_WIDTH*0.28)];
        _selectBtnView.backgroundColor = [UIColor whiteColor];
        [self createSelecteActivityWithArr:self.seleArr];
    }
    return _selectBtnView;
}

/*校招专场view*/
-(UIView *)campusView{
    if (!_campusView) {
        _campusView = [[UIView alloc]initWithFrame:CGRectMake(0, self.selectBtnView.y+self.selectBtnView.height, SCREEN_WIDTH, 80)];
        _campusView.backgroundColor = HWColor(241, 241, 241);
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 70)];
        view.backgroundColor = [UIColor whiteColor];
        [_campusView addSubview:view];
        
        UILabel *campusLabel = [UILabel new];
        campusLabel.font = [UIFont systemFontOfSize:18];
        campusLabel.textColor = HWColor(51, 51, 51);
        campusLabel.text = @"校招专场";
        [self.campusView addSubview:campusLabel];
        [campusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.campusView);
        }];
        
        UIView *hView = [UIView new];
        hView.backgroundColor = HWColor(51, 51, 51);
        [self.campusView addSubview:hView];
        [hView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(campusLabel.mas_bottom).with.offset(13);
            make.centerX.equalTo(campusLabel);
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(1);
        }];
        
    }
    return _campusView;
}

/**滚动视图*/
-(UIView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIView alloc]initWithFrame:CGRectMake(0, self.campusView.y+self.campusView.height, SCREEN_WIDTH, SCREEN_WIDTH*0.4)];
       
    }
    return _scrollView;
}

/*页面切换视图*/
-(UIView *)seleBarView{
    if (!_seleBarView) {
        _seleBarView = [[UIView alloc]initWithFrame:CGRectMake(0, self.scrollView.y+self.scrollView.height+10, SCREEN_WIDTH, siftHeight)];
        _seleBarView.backgroundColor = HWColor(241, 241, 241);
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight-1)];
        view.backgroundColor = [UIColor whiteColor];
        [_seleBarView addSubview:view];
        
    }
    return _seleBarView;
}


#pragma mark /***********选择按钮的创建***********/
/*创建选择按钮*/
-(void)createSelecteActivityWithArr:(NSArray *)source
{
    int i = 0;
    for (NSDictionary *dic in source) {
        UIView *vi = [UIView new];
        if (i<3) {
            vi.frame = CGRectMake(((SCREEN_WIDTH-20)/3)*i+10, 0, (SCREEN_WIDTH-20)/3, (SCREEN_WIDTH-80)/3);
        
        }
        vi.backgroundColor = [UIColor whiteColor];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake((SCREEN_WIDTH-20)/9, (SCREEN_WIDTH-20)/20, (SCREEN_WIDTH-20)/9, (SCREEN_WIDTH-20)/9)];
        [button setBackgroundImage:[UIImage imageNamed:dic[@"slecteImg"]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickSeleceAction:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.cornerRadius = button.width/2;
        button.backgroundColor = [UIColor grayColor];
        button.tag = i;
        [vi addSubview:button];
       
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, (SCREEN_WIDTH-20)*5/26, (SCREEN_WIDTH-20)/3, 20)];
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
        StudentJobViewController *stuVC = [StudentJobViewController new];
        [self.navigationController pushViewController:stuVC animated:YES];
    }
    
    else if (sender.tag == 1) {
        HWLog(@"1");
        PracticeViewController *praVC = [PracticeViewController new];
        [self.navigationController pushViewController:praVC animated:YES];
    }
    
    else {
        HWLog(@"2");
        WorkGuideViewController *workVC = [WorkGuideViewController new];
        [self.navigationController pushViewController:workVC animated:YES];
    }
    
    HWLog(@"%zd",sender.tag);
    
}


////////////////////////////////////////
#pragma mark /-------定义滚动视图-------/
-(void)createUIScrollView{
    //定义滚动视图
    self.myScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.4)];
    self.myScroll.backgroundColor = [UIColor whiteColor];
    self.myScroll.showsHorizontalScrollIndicator = NO;
    self.myScroll.tag = 10;
    self.myScroll.delegate = self;
    [self.scrollView addSubview:self.myScroll];
    
    NSArray *imgViews = @[@"1",@"2",@"3",@"9"];
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

#pragma mark /------定义翻页控件------/
-(void)createUIPageControl{
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH*0.33, SCREEN_WIDTH, 20)];
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
    
    NSLog(@"滚动视图完成滚动");
    
    UIPageControl *page = (id)[self.scrollView viewWithTag:11];
    
    //设置翻页控件的当前页  通过偏移量进行计算
    page.currentPage = scrollView.contentOffset.x/SCREEN_WIDTH;
    
}

////////////////////////////////////////////////

#pragma mark /*-----添加选项栏-----*/
-(void)createSeleBarView
{
    _segment = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight-1) delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:self.seleBarArr];
    _segment.titleColorStateSelected = HWColor(51, 51, 51);
    _segment.titleColorStateNormal = HWColor(102, 102, 102);
    _segment.indicatorColor = HWColor(51, 51, 51);
    [self.seleBarView addSubview:_segment];
}

/**跳转**/
-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index{
    
    if (index == 0) {
        self.segStr = @"热门兼职";
        [self.tableView reloadData];
    }
    else{
        self.segStr = @"最新职位";
        [self.tableView reloadData];
    }
    
}

#pragma mark /*********轮播图的实现*******/
-(void)createAdsPageWithArr:(NSMutableArray *)source
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in source) {
        [arr addObject:[dic objectForKey:@"lunboImg"]];
    }
    //封装的轮播view实现
    WYAutoCarusel *aut = [[WYAutoCarusel alloc]init];
    [aut createCaruselWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight) WithSuperView:self.headerView WithImageUrlArr:arr WithPlaceholderImageName:@"365" WithInterval:2];
    
    [aut createPageControlWithFrame:CGRectMake(SCREEN_WIDTH-60, lunBoheight-30, 30, 20) WithSuperView:self.headerView WithPageNum:arr.count WithCurrentColor:HWColor(153, 153, 153) WithTintColor:[UIColor whiteColor]];
    
    aut.delegate = self;
}

/*轮播图跳转代理*/
-(void)pushViewController:(NSInteger)tag
{
    
    HWLog(@"laniahao ");
    
}

#pragma mark /+++++++ tableView +++++++/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height =self.seleBarView.y+self.seleBarView.height;
        
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return SCREEN_WIDTH*0.32;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"identifier";
    if ([self.segStr isEqualToString:@"热门兼职"]) {
        Campus365TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[Campus365TableViewCell alloc]initWithFrame:cell.bounds];
            cell.backgroundColor = HWColor(241, 241, 241);
            campusCell = cell;
            cell.imgView.image = [UIImage imageNamed:@"qptHeader"];
            cell.titleLabel.text = @"中级UI设计师";
            cell.priceTypeLabel.text = @"日结";
            cell.priceLabel.text = @"80元/天";
            cell.companyLabel.text = @"西安交通大学";
            cell.vIconView.image = [UIImage imageNamed:@"时间"];
            cell.employLabel.text = @"长期招聘";
            cell.vIconView.image = [UIImage imageNamed:@"vip"];
            cell.professionLabel.text = @"IT软件";
            cell.statusLabel.text = @"已上市";
            cell.employNoLabel.text = @"招聘人数：20";
            cell.employIcon.image = [UIImage imageNamed:@"时间"];
            cell.employNoIcon.image = [UIImage imageNamed:@"人数"];
            cell.addressIcon.image = [UIImage imageNamed:@"qpt_map_image"];
            cell.numberIcon.image = [UIImage imageNamed:@"eyeImage"];
            cell.addressLabel.text = @"高新区i都会";
            cell.numberLabel.text = @"3228";
        }
         
    }
    else{
        
        HotZWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[HotZWTableViewCell alloc]initWithFrame:cell.bounds];
            cell.hMainImage.image = [UIImage imageNamed:@"qptHeader"];
            campusCell = cell;
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

    return campusCell;
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
